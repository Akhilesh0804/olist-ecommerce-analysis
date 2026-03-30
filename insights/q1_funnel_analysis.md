Problem: Where does the Olist purchase funnel break and what is the conversion rate between each stage?

Approach: Built a 5-stage funnel using a CTE in PostgreSQL. Counted orders at each stage using conditional filters. Calculated conversion rates using the LAG window function. Filtered Stage 5 to delivered orders only to maintain funnel consistency.

Output: 
| Stage | Order count | Conversion rate |
|---|---|---|
| Stage 1 — order placed | 99,441 | — |
| Stage 2 — payment approved | 99,281 | 99.84% |
| Stage 3 — shipped to carrier | 97,899 | 98.61% |
| Stage 4 — delivered to customer | 96,470 | 98.54% |
| Stage 5 — review left | 95,647 | 99.15% |

Findings: The Olist purchase funnel demonstrates consistently strong conversion rates across all five stages, reflecting a operationally healthy marketplace. Conversion rates across the first four stages range from 98.54% to 99.84%, suggesting that payment processing, carrier handoff, and delivery are all performing well with minimal drop-off. The most notable finding is the Stage 4 to Stage 5 conversion, where 99.15% of delivered customers left a review, which is surprisingly high for an e-commerce platform and indicates strong post-purchase engagement. However, the funnel analysis reveals that volume drop-off is not Olist's primary challenge. With 95,647 reviews collected from delivered orders, the more critical question becomes the quality of those reviews rather than their quantity. This shifts the focus of the analysis toward satisfaction score drivers, which will be investigated further through product category performance in Q2 and delivery time impact in Q3.

![Olist purchase funnel](../assets/q1_funnel_chart.png)

Data note: Stage 5 filtered to delivered orders only. Reviews on non-delivered orders excluded here but retained for seller quality analysis
