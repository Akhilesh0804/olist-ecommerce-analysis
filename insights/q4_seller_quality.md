Problem:
Which sellers are consistently underperforming on customer satisfaction, 
and what patterns do they share in terms of location, order volume, 
and delivery performance?

Approach:
A CTE was used to calculate delivery duration per order by joining 
sellers, order_items, orders, and order_reviews via their respective 
keys. The outer query aggregated the data by seller, calculating total 
order count, average delivery days, and average review score per seller. 
Results were filtered using a HAVING clause to retain only sellers with 
a minimum of 10 delivered orders and an average review score below 3.5, 
ensuring the analysis reflects sustained underperformance rather than 
isolated incidents.

Output:
Top 10 underperforming sellers by average review score. 
Full list contains 78 sellers meeting the threshold criteria.

| Seller ID | City | State | Total orders | Avg delivery days | Avg review score |
|---|---|---|---|---|---|
| b1b3948701c5c72445495bd161b83a4c | Sao Paulo | SP | 14 | 23.4 | 1.93 |
| 1ca7077d890b907f89be8c954a02686a | Santana de Parnaiba | SP | 108 | 15.0 | 2.27 |
| 5bc55dbe2f12b6af6d83ed46023e0dc8 | Coronel Fabriciano | MG | 17 | 13.0 | 2.33 |
| 40db9e9aa57f7bb151bcda6b0f9bdbb7 | Recife | PE | 12 | 14.8 | 2.36 |
| ecccfa2bb93b34a3bf033cc5d1dcdc69 | Curitiba | PR | 12 | 35.1 | 2.50 |
| 2709af9587499e95e803a6498a5a56e9 | Sao Paulo | SP | 25 | 12.7 | 2.60 |
| c6a7539d424a8402232c2228d7a03c5e | Sao Paulo | SP | 10 | 13.8 | 2.60 |
| bb135baca94c82fcb731335ad5b04a03 | Sao Paulo | SP | 18 | 8.0 | 2.66 |
| 02d35243ea2e497335cd0f076b45675d | Natal | RN | 14 | 25.8 | 2.69 |
| c26a2be5b53b7db6b276280da212a779 | Nova Friburgo | RJ | 13 | 13.6 | 2.72 |

Findings:
78 sellers with a minimum of 10 delivered orders were identified with 
an average review score below 3.5, representing a subset of the seller 
base with sustained underperformance patterns.

São Paulo has the highest concentration of underperforming sellers, 
which is expected given it has the largest seller base on the platform. 
However the density of poor performers warrants targeted intervention 
in this state specifically.

Three distinct underperformer profiles emerged from the data:

**Delivery driven underperformers** — several of the worst rated sellers 
have average delivery times exceeding 20 days, directly consistent with 
the Q3 finding that orders beyond 20 days experience a sharp satisfaction 
drop. Seller ecccfa2bb93b34a3bf033cc5d1dcdc69 (Curitiba, PR) averages 
35.1 delivery days with a score of 2.50, and seller 
cb41bfbcbda0aea354a834ab222f9a59 (Sao Paulo, SP) averages 37.6 days 
with a score of 3.27.

**High volume underperformers** — seller 7c67e1448b00f6e969d365cea6b010ab 
(Itaquaquecetuba, SP) has processed 973 orders with an average score of 
3.35. This seller represents the highest reputational risk to the platform 
given the scale of affected customers.

**Non delivery underperformers** — seller bb135baca94c82fcb731335ad5b04a03 
(Sao Paulo, SP) averages only 8.0 delivery days yet scores 2.66, 
indicating the root cause is product quality or customer service rather 
than logistics. These sellers require a different intervention strategy 
than delivery driven underperformers.

Data note:
Analysis was restricted to delivered orders only (order_status = 
'delivered') for consistency with project methodology. A minimum 
threshold of 10 orders and an average review score below 3.5 was applied 
via HAVING clause to ensure findings reflect sustained underperformance 
rather than isolated negative experiences. Sellers with fewer than 10 
orders were excluded as insufficient order volume does not provide 
statistically reliable satisfaction signals.
