/**
 * Albury Ski Club Policy Library
 * Structured data for RAG-lite AI Assistant searching.
 * Updated: 2026-02-08
 */

const ASC_POLICY_LIBRARY = [
    {
        id: "membership-fees-2026",
        title: "2026 Membership Fees",
        category: "Finance",
        keywords: ["fees", "cost", "membership", "dues", "annual", "pricing", "subscriptions", "invoice"],
        content: `Standard Membership Fees for 2026:
- Adult (24+): $425
- Young Adult (18-23): $255 (60% of adult rate)
- Junior (under 18): $127
- Associate: $100

Fees are set each September. Subscriptions are due on 1 December. Unpaid fees after 2 months lead to 'Unfinancial' status.`
    },
    {
        id: "winter-bookings",
        title: "Winter Booking Protocols",
        category: "Bookings",
        keywords: ["winter", "booking", "open", "dates", "units", "falls creek", "thredbo"],
        content: `Winter bookings open:
- Financial Members: 1 October (00:01 am)
- Associates: 1 February (00:01 am)
Minimum occupancy of 2 adults applies to Falls Creek units in winter. American Express is NOT accepted.`
    },
    {
        id: "refund-policy",
        title: "Refund & Cancellation Policy",
        category: "Finance",
        keywords: ["refund", "cancellation", "money back", "withdraw", "booking", "medical"],
        content: `Refund Tiers for Winter Lodge Bookings:
- 28+ Days Notice: 100% Refund
- 10-28 Days Notice: 50% Refund
- <10 Days Notice: 0-50% (Committee decision)
- Medical Reasons: 100% with certificate.
Refunds to bank accounts incur a 3% admin fee; refunds to Member Wallet are free.`
    },
    {
        id: "unfinancial-members",
        title: "Unfinancial Membership & Reinstatement",
        category: "Rules",
        keywords: ["unfinancial", "reinstatement", "late payment", "voting", "authority"],
        content: `Unfinancial members lose all booking and voting authority. 
To reinstate: Pay all outstanding fees OR the current adult joining fee ($3,750), whichever is lower. 
If staying as a guest while unfinancial, associate rates apply.`
    },
    {
        id: "residential-condition",
        title: "Residential Condition",
        category: "Rules",
        keywords: ["reside", "address", "location", "albury", "radius", "constitution"],
        content: `Members must reside within an 80km radius of the Albury Post Office. 
Exceptions exist for members who move away after joining or immediate family of qualified members.`
    },
    {
        id: "lodge-rules",
        title: "Lodge Rules & Code of Conduct",
        category: "Operations",
        keywords: ["rules", "conduct", "smoking", "pets", "lodge", "cleaning", "lockers", "ski storage"],
        content: `Lodge Rules:
1. No smoking inside club premises.
2. No pets allowed.
3. Quiet hours: 10:00 PM - 7:00 AM.
4. Shared cleaning duties are mandatory.
5. Vacate by 1:00 PM on departure day.
6. Skis must be in storage rooms, not tunnels.`
    },
    {
        id: "membership-status",
        title: "Membership Status & Resignation",
        category: "Rules",
        keywords: ["resign", "cancel", "status", "inactive", "expel", "terminate"],
        content: `Resignations must be in writing to the Secretary. 
The Committee may suspend or expel members for persistent rule violations or prejudicial behavior (requires 2/3 majority resolution).`
    }
];