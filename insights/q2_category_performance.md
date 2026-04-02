## Problem
Which product categories drive the most revenue on the Olist platform, 
and are the highest revenue generating categories also the ones with 
the worst customer satisfaction scores?

## Approach
A query joining orders, order_items, products, 
product_category_name_translation, and order_reviews was used to 
calculate total revenue and average review score per product category. 
Results were ranked by total revenue and limited to the top 20 categories. 
An INNER JOIN on the translation table was used to return English category 
names and simultaneously exclude products with missing or untranslated 
category names.

## Output

| Category | Total revenue | Avg review score |
|---|---|---|
| health_beauty | R$1,237,439.95 | 4.19 |
| watches_gifts | R$1,167,246.63 | 4.07 |
| bed_bath_table | R$1,037,177.69 | 3.92 |
| sports_leisure | R$960,189.09 | 4.17 |
| computers_accessories | R$896,243.28 | 3.98 |
| furniture_decor | R$718,344.78 | 3.95 |
| housewares | R$617,836.73 | 4.11 |
| cool_stuff | R$612,071.86 | 4.19 |
| auto | R$580,263.44 | 4.12 |
| toys | R$472,109.78 | 4.21 |
| garden_tools | R$471,671.27 | 4.08 |
| baby | R$400,774.42 | 4.08 |
| perfumery | R$391,175.73 | 4.22 |
| telephony | R$310,004.11 | 4.00 |
| office_furniture | R$269,418.10 | 3.52 |
| stationery | R$224,145.67 | 4.24 |
| computers | R$218,684.14 | 4.22 |
| pet_shop | R$211,971.64 | 4.22 |
| musical_instruments | R$184,340.64 | 4.22 |
| small_appliances | R$183,677.02 | 4.23 |

## Findings
Among the top 20 revenue generating categories, four recorded average 
satisfaction scores below 4.0, representing a meaningful gap against 
the platform average of approximately 4.1.

**office_furniture** stands out as the most concerning category, 
generating R$269,418 in revenue while recording the lowest satisfaction 
score in the top 20 at 3.52, a full 0.67 points below the next lowest 
performer. This gap is significant on a 5 point scale.

**bed_bath_table** presents the highest revenue risk, the third largest 
revenue generator at R$1.04M with a satisfaction score of only 3.92. 
A large, high revenue category with below average satisfaction represents 
a direct threat to repeat purchase rates and long term platform growth.

**furniture_decor and computers_accessories** round out the underperforming 
group at 3.95 and 3.98 respectively. All four underperforming categories 
share a common characteristic, they involve large, bulky, or technically 
complex items that are inherently more difficult to handle and ship. This 
suggests delivery handling and transit time may be primary drivers of 
dissatisfaction, a hypothesis that is tested and confirmed in Q3.

The highest revenue category, health_beauty at R$1.23M, maintains a 
healthy rating of 4.19, demonstrating that strong revenue and strong 
satisfaction are not mutually exclusive on the platform.

## Chart
![Category revenue vs satisfaction](../assets/q2_category_chart.png)

## Data note
610 products with no category name (1.85% of total products) and 13 
products across 2 untranslated categories (pc_gamer and 
portateis_cozinha_e_preparacao_de_alimentos) were excluded via INNER 
JOIN on the translation table. Combined exclusion rate is under 2% and 
does not materially affect findings. TOP 20 was selected over TOP 10 as 
categories ranked 11 to 20 contain significant revenue generators 
warranting inclusion in the analysis. Analysis is filtered to delivered 
orders only, consistent with project methodology.
