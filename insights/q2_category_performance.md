Problem: Which product categories drives the most revenue and which ones have the worst satisfaction scores. 

Approach: Cretaed a query that ranks the top 20 revenue generating product categories and their respectinve average customer satisfaction rating.

Output: 
| category              | total_revenue | avg_review_score |
| --------------------- | ------------- | ---------------- |
| health_beauty         | 1,237,439.95  | 4.19             |
| watches_gifts         | 1,167,246.63  | 4.07             |
| bed_bath_table        | 1,037,177.69  | 3.92             |
| sports_leisure        | 960,189.09    | 4.17             |
| computers_accessories | 896,243.28    | 3.98             |
| furniture_decor       | 718,344.78    | 3.95             |
| housewares            | 617,836.73    | 4.11             |
| cool_stuff            | 612,071.86    | 4.19             |
| auto                  | 580,263.44    | 4.12             |
| toys                  | 472,109.78    | 4.21             |
| garden_tools          | 471,671.27    | 4.08             |
| baby                  | 400,774.42    | 4.08             |
| perfumery             | 391,175.73    | 4.22             |
| telephony             | 310,004.11    | 4.00             |
| office_furniture      | 269,418.10    | 3.52             |
| stationery            | 224,145.67    | 4.24             |
| computers             | 218,684.14    | 4.22             |
| pet_shop              | 211,971.64    | 4.22             |
| musical_instruments   | 184,340.64    | 4.22             |
| small_appliances      | 183,677.02    | 4.23             |


Findings: Among the top 20 revenue generating categories, four recorded average satisfaction scores below 4.0: office_furniture (3.52), bed_bath_table (3.92), furniture_decor (3.95), and computers_accessories (3.98). Notably office_furniture has the lowest satisfaction score in the entire top 20 by a significant margin. The highest revenue category, health_beauty at R$1.23M, maintains a healthy rating of 4.19. All four underperforming categories share a common characteristic as they are large or bulky items, suggesting delivery handling may be a contributing factor. This hypothesis will be tested in Q3 through delivery time vs satisfaction analysis.

![Category revenue vs satisfaction](../assets/q2_category_chart.png)

Data note: 610 products with no category name (1.85% of total products) and 13 products across 2 untranslated categories (pc_gamer and portateis_cozinha_e_preparacao_de_alimentos) were excluded via INNER JOIN on the translation table. Combined exclusion rate is under 2% and does not materially affect findings. Analysis is filtered to delivered orders only, consistent with project methodology.
