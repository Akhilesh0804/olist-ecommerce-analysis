# Olist E-commerce Funnel and Satisfaction Analysis

## Problem statement
Olist is a Brazilian e-commerce marketplace connecting independent 
sellers to customers across Brazil. Despite healthy order volumes, 
a significant portion of customers report low satisfaction scores. 
This analysis investigates which operational factors most strongly 
drive poor customer satisfaction. Specifically it examines delivery 
speed, seller reliability, product category performance, and regional 
logistics as potential drivers of customer dissatisfaction.

## Dataset
Brazilian E-Commerce Public Dataset by Olist, available on Kaggle.
9 relational tables, approximately 100,000 orders from 2016 to 2018.
[Download the dataset here](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

## Tools used
- PostgreSQL — data storage, cleaning, and analysis
- Excel — data visualisation and chart creation
- Tableau Public — interactive dashboard (link below)
- GitHub — version control and portfolio documentation

## Methodology
All analysis is filtered to delivered orders only 
(order_status = 'delivered') unless explicitly stated otherwise. 
This ensures consistency across all five questions and prevents 
undelivered or cancelled orders from distorting satisfaction metrics. 
Bucket thresholds in Q3 were determined using percentile distribution 
analysis rather than arbitrary values. Seller underperformance in Q4 
was defined using a minimum order threshold of 10 to ensure findings 
reflect sustained patterns rather than isolated incidents.

## Questions answered
- Q1: Where does the purchase funnel break and what are the conversion rates between stages?
- Q2: Which product categories drive the most revenue and which have the worst satisfaction scores?
- Q3: Does delivery time affect customer satisfaction and at what threshold does it drop significantly?
- Q4: Which sellers are consistently underperforming and what do they have in common?
- Q5: Does geography predict poor customer experience and is the root cause infrastructure or seller concentration?

## Key findings

**Q1 — Funnel performance is strong across all stages.**
The Olist purchase funnel demonstrates consistently strong conversion 
rates across all five stages, ranging from 98.54% to 99.84%, reflecting 
an operationally healthy marketplace. Volume drop-off is not Olist's 
primary challenge — satisfaction quality is.

**Q2 — High revenue categories carry hidden satisfaction risk.**
Four of the top 20 revenue generating categories score below 4.0 — 
office_furniture (3.52), bed_bath_table (3.92), furniture_decor (3.95), 
and computers_accessories (3.98). All four involve large, bulky, or 
technically complex items, suggesting delivery handling and transit time 
are primary drivers of dissatisfaction. bed_bath_table at R$1.04M 
revenue with a 3.92 score represents the highest financial risk to 
the platform.

**Q3 — Delivery time beyond 20 days causes a sharp satisfaction collapse.**
Delivery time has a clear and consistent negative impact on customer 
satisfaction. Fast deliveries averaging 4.62 days score 4.42, while 
Very slow deliveries averaging 30.70 days score only 3.13 — a drop of 
1.29 points on a 5 point scale. The decline is non linear, with 
satisfaction remaining stable up to 20 days before collapsing sharply, 
identifying 20 days as the critical intervention threshold.

**Q4 — 78 sellers show sustained underperformance patterns.**
78 sellers with a minimum of 10 delivered orders were identified with 
average review scores below 3.5. Three distinct profiles emerged — 
delivery driven underperformers with avg delivery times exceeding 20 
days, high volume underperformers affecting customers at scale, and 
non delivery underperformers where fast delivery still produces poor 
scores, indicating product or service quality issues. São Paulo has 
the highest concentration of underperforming sellers, warranting 
targeted intervention.

**Q5 — Poor experience in remote states is an infrastructure problem, not a seller quality problem.**
Geographic location is a strong predictor of delivery time and 
satisfaction. Northern and Northeastern states are significantly 
underserved — Roraima averages 29.4 days and Alagoas scores only 3.8. 
Q5b reveals that 64 to 80% of orders reaching these regions are 
fulfilled by São Paulo based sellers, confirming the root cause is 
seller concentration rather than seller quality. States with meaningful 
local seller presence such as Minas Gerais and Paraná consistently 
achieve delivery times under 12 days.

**Overall conclusion.**
Olist's operational funnel is healthy but its customer satisfaction 
challenges are driven by three interconnected factors — long delivery 
times in remote regions caused by SP seller concentration, specific 
high revenue categories that are inherently harder to ship, and a small 
number of high volume underperforming sellers. The highest impact 
interventions are targeted seller recruitment in Northern and 
Northeastern states and a seller performance program focused on the 
78 identified underperformers, particularly those with delivery times 
exceeding 20 days.

## Repository structure
