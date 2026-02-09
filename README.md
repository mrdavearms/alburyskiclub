# Albury Ski Club Member Knowledge Base

Ski Club membership FAQs, policy interpretations, and situational guidance.

**Website:** [https://mrdavearms.github.io/alburyskiclub/](https://mrdavearms.github.io/alburyskiclub/)

## Data Verbosity & Philosophy

This repository prioritizes **verbose data delivery**. We believe that providing granular, situational, and detailed policy information is essential for ensuring all members fully understand their duties and club protocols. This approach powers both the manual FAQ sections and the Experimental AI Assistant, aiming to eliminate ambiguity in complex membership scenarios.

## Technical Status

### 🤖 AI Policy Assistant (Disabled)

The "Albury Ski Club Secretary" AI engine is currently **offline**.

- **Status:** Disabled (API Access Removed).
- **Note:** The AI Assistant is under review and its direct API access has been removed for security.

### 📊 Google Analytics 4 (GA4)

The site is instrumented with Google Analytics 4 to track member engagement and policy query trends.

- **Measurement ID:** `G-YJF8H9VZ3C`
- **Implementation:** Global Site Tag (`gtag.js`) injected into the `<head>` of `index.html`.
- **Purpose:** To understand which FAQs are most visited and refine the AI's knowledge base.

### 🛡️ GCloud Session Isolation

To ensure security and prevent cross-project contamination, this repository uses a **strict session isolation** protocol.

- **Mechanism:** `scripts/init-session.ps1` (Windows) / `scripts/init-session.sh` (Mac/Linux)
- **Behavior:**
  1.  Reads local configuration from `.env` (gitignored).
  2.  Sets the `CLOUDSDK_ACTIVE_CONFIG_NAME` environment variable to `asc-faq` for the _current terminal process only_.
  3.  Ensures `gcloud` commands in this workspace never accidentally affect other GCP projects.
- **Automation:**
  - VS Code is configured via `.vscode/tasks.json` to **automatically run these scripts** when the folder is opened.
  - Look for the "🔐 ALBURY SKI CLUB: Signing in..." message in your terminal.

### 📚 Member Knowledge Base

The manual FAQ section is fully operational and serves as the primary source of truth for members. It covers:

- **Fees & Joining**: Application fees, annual subs, and timelines.
- **Bookings & Cancellations**: Refund tiers, voucher rules, and priority windows.
- **Club Rules**: The 2026 Code of Conduct and Lodge etiquette.

## Contact & Support

If you have questions, require clarification on policies, or wish to report issues or errors in this knowledge base, please contact the Club Secretary.

**Email:** [secretary@alburyskiclub.au](mailto:secretary@alburyskiclub.au)

---

## 🛠️ Restoration Guide

### Restoring the AI Assistant
If you wish to re-enable the AI Policy Assistant in the future, follow these steps:

1.  **Obtain a Gemini API Key**: Get an API key from [Google AI Studio](https://aistudio.google.com/).
2.  **Add GitHub Secret**:
    - Go to your repository on GitHub.
    - Navigate to **Settings > Secrets and variables > Actions**.
    - Click **New repository secret**.
    - Name: `GEMINI_API_KEY`
    - Value: [Paste your API key here]
3.  **Update Deployment Workflow**:
    - Open `.github/workflows/deploy.yml`.
    - Uncomment the "Inject API Key" step (lines 19-30).
    - Commit and push the changes.
4.  **Verify**: The site will automatically redeploy. The "Maintenance Note" in `index.html` can be removed or modified to re-enable the UI input field (remove the `disabled` attributes).

---

_Note: This is a digital supplement. Decisions and official standing are governed by the Albury Ski Club Constitution and the Committee._
