# Albury Ski Club Member Knowledge Base

Ski Club membership FAQs, policy interpretations, and situational guidance.

**Website:** [https://mrdavearms.github.io/alburyskiclub/](https://mrdavearms.github.io/alburyskiclub/)

## Data Verbosity & Philosophy

This repository prioritizes **verbose data delivery**. We believe that providing granular, situational, and detailed policy information is essential for ensuring all members fully understand their duties and club protocols. This approach powers both the manual FAQ sections and the Experimental AI Assistant, aiming to eliminate ambiguity in complex membership scenarios.

## Technical Status

### 🤖 AI Policy Assistant (Maintenance Mode)

The "Albury Ski Club Secretary" AI engine is currently **hidden from public view** in `index.html`.

- **Status:** Development / Regional Migration.
- **Why:** Transitioning from Google AI Studio keys to full Google Cloud Platform (GCP) keys to resolve regional provisioning blocks (403/Forbidden errors).
- **Architecture:** The logic remains in `index.html` featuring a "Waterfall Resilience Engine" that cycles through Gemini 3.0, 2.5, 2.0, and 1.5 models.
- **To Reactivate:** Remove `style="display: none !important;"` from the `#section-ai` element and update the API key in the GitHub Secrets (`GEMINI_API_KEY`).

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
