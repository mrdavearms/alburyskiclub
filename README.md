# Albury Ski Club Member Knowledge Base

Ski Club membership FAQs, policy interpretations, and situational guidance.

**Website:** [https://mrdavearms.github.io/alburyskiclub/](https://mrdavearms.github.io/alburyskiclub/)

## Data Verbosity & Philosophy

This repository prioritizes **verbose data delivery**. We believe that providing granular, situational, and detailed policy information is essential for ensuring all members fully understand their duties and club protocols. This approach powers both the manual FAQ sections and the Experimental AI Assistant, aiming to eliminate ambiguity in complex membership scenarios.

## Technical Status

### 🤖 AI Policy Assistant (Active)

The "Albury Ski Club Secretary" AI engine is **live and available** to answer member queries.

- **Status:** Operational (Gemini 2.0 Flash).
- **Architecture:** Client-side RAG interacting with the Google Gemini API.
- **Resilience:** Locked to `gemini-1.5-flash` for maximum stability.

### 📊 Google Analytics 4 (GA4)

The site is instrumented with Google Analytics 4 to track member engagement and policy query trends.

- **Measurement ID:** `G-YJF8H9VZ3C`
- **Implementation:** Global Site Tag (`gtag.js`) injected into the `<head>` of `index.html`.
- **Purpose:** To understand which FAQs are most visited and refine the AI's knowledge base.

### 🛡️ GCloud Session Isolation

To ensure security and prevent cross-project contamination, this repository uses a **strict session isolation** protocol.

- **Mechanism:** `scripts/init-session.ps1`
- **Behavior:**
  1.  Reads local configuration from `.env` (gitignored).
  2.  Sets the `CLOUDSDK_ACTIVE_CONFIG_NAME` environment variable to `asc-faq` for the _current terminal process only_.
  3.  Ensures `gcloud` commands in this workspace never accidentally affect other GCP projects.
- **Automation:**
  - VS Code is configured via `.vscode/tasks.json` to **automatically run this script** when the folder is opened.
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

_Note: This is a digital supplement. Decisions and official standing are governed by the Albury Ski Club Constitution and the Committee._
