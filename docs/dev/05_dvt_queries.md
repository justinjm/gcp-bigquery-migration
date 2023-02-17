## DVT Queries


scratch area for custom queries 

```sql
SELECT 
grade,
COUNT(DISTINCT(id)) AS id_count
FROM `demos-vertex-ai.dvt_demo.loan_201`
GROUP BY 1


```