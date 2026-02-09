# scripts/init-session.ps1
# Initializes a strictly isolated GCloud session for this workspace.

$ErrorActionPreference = "Stop"

# 1. Load Environment Variables from .env
$envPath = Join-Path $PSScriptRoot "..\.env"
if (Test-Path $envPath) {
    Get-Content $envPath | ForEach-Object {
        if ($_ -match '^([^#=]+)=(.*)$') {
            [Environment]::SetEnvironmentVariable($matches[1], $matches[2], "Process")
            Write-Host "Loaded: $($matches[1])"
        }
    }
}
else {
    Write-Warning ".env file not found. Copy .env.template to .env and configure."
    exit 1
}

$configName = $env:CLOUDSDK_ACTIVE_CONFIG_NAME
if ([string]::IsNullOrWhiteSpace($configName)) {
    Write-Error "CLOUDSDK_ACTIVE_CONFIG_NAME is not set in .env"
    exit 1
}

Write-Host "🔐 ALBURY SKI CLUB: Signing in as $env:GCP_ACCOUNT_EMAIL..." -ForegroundColor Cyan
Write-Host "Target Project: $env:GCP_PROJECT_ID" -ForegroundColor DarkGray
Write-Host "Initializing Isolated Session: [$configName]" -ForegroundColor Green

# 2. Ensure the Configuration Profile Exists (Idempotent)
# We don't activate it globally, we just make sure it exists so the env var works.
$configExists = cmd /c "gcloud config configurations list --format='value(name)' --filter='name=$configName'"
if (-not $configExists) {
    Write-Host "Creating missing configuration profile '$configName'..."
    cmd /c "gcloud config configurations create $configName --no-activate"
    
    # Hydrate it with defaults from .env if available
    if ($env:GCP_ACCOUNT_EMAIL) {
        cmd /c "gcloud config set account $env:GCP_ACCOUNT_EMAIL --configuration=$configName"
    }
    if ($env:GCP_PROJECT_ID) {
        cmd /c "gcloud config set project $env:GCP_PROJECT_ID --configuration=$configName"
    }
}

# 3. Verify Isolation
Write-Host "`n--- VERIFICATION ---"
Write-Host "Global Active Config: $(cmd /c 'gcloud config configurations list --filter=is_active:true --format=value(name)')"
Write-Host "Session Active Config: $env:CLOUDSDK_ACTIVE_CONFIG_NAME"
Write-Host "Active Project:        $(cmd /c 'gcloud config get-value project 2>NUL')"
Write-Host "Active Account:        $(cmd /c 'gcloud config get-value account 2>NUL')"
Write-Host "--------------------`n"
Write-Host "Session Ready. All gcloud commands in this terminal are now isolated to '$configName'."
