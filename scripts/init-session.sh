#!/bin/bash
# scripts/init-session.sh
# Initializes a strictly isolated GCloud session for this workspace.

set -e

# 1. Load Environment Variables from .env
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_PATH="$SCRIPT_DIR/../.env"

if [ -f "$ENV_PATH" ]; then
    # Load variables, ignoring comments and empty lines
    while IFS='=' read -r key value || [ -n "$key" ]; do
        # Skip comments
        [[ "$key" =~ ^#.*$ ]] && continue
        # Skip empty keys
        [[ -z "$key" ]] && continue
        
        # Trim whitespace (basic)
        key=$(echo "$key" | xargs)
        value=$(echo "$value" | xargs)
        
        export "$key=$value"
        echo "Loaded: $key"
    done < "$ENV_PATH"
else
    echo "Error: .env file not found. Copy .env.template to .env and configure."
    exit 1
fi

CONFIG_NAME="$CLOUDSDK_ACTIVE_CONFIG_NAME"
if [ -z "$CONFIG_NAME" ]; then
    echo "Error: CLOUDSDK_ACTIVE_CONFIG_NAME is not set in .env"
    exit 1
fi

echo -e "\033[0;36m🔐 ALBURY SKI CLUB: Signing in as $GCP_ACCOUNT_EMAIL...\033[0m"
echo -e "\033[0;90mTarget Project: $GCP_PROJECT_ID\033[0m"
echo -e "\033[0;32mInitializing Isolated Session: [$CONFIG_NAME]\033[0m"

# 2. Ensure the Configuration Profile Exists (Idempotent)
CONFIG_EXISTS=$(gcloud config configurations list --format='value(name)' --filter="name=$CONFIG_NAME" 2>/dev/null || true)

if [ -z "$CONFIG_EXISTS" ]; then
    echo "Creating missing configuration profile '$CONFIG_NAME'..."
    gcloud config configurations create "$CONFIG_NAME" --no-activate
    
    # Hydrate it with defaults from .env if available
    if [ -n "$GCP_ACCOUNT_EMAIL" ]; then
        gcloud config set account "$GCP_ACCOUNT_EMAIL" --configuration="$CONFIG_NAME"
    fi
    if [ -n "$GCP_PROJECT_ID" ]; then
        gcloud config set project "$GCP_PROJECT_ID" --configuration="$CONFIG_NAME"
    fi
fi

# 3. Verify Isolation
echo ""
echo "--- VERIFICATION ---"
ACTIVE_GLOBAL=$(gcloud config configurations list --filter='is_active:true' --format='value(name)')
echo "Global Active Config: $ACTIVE_GLOBAL"
echo "Session Active Config: $CLOUDSDK_ACTIVE_CONFIG_NAME"
# Use 2>/dev/null to suppress error if project/account not set yet
echo "Active Project:        $(gcloud config get-value project 2>/dev/null || echo 'Not Set')"
echo "Active Account:        $(gcloud config get-value account 2>/dev/null || echo 'Not Set')"
echo "--------------------"
echo ""
echo "Session Ready. All gcloud commands in this terminal are now isolated to '$CONFIG_NAME'."
