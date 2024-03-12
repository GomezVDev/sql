-- https://leetcode.com/problems/queries-quality-and-percentage/?envType=study-plan-v2&envId=top-sql-50
-- Write your MySQL query statement below
SELECT  query_name,ROUND(AVG(rating/position),2) as quality, ROUND((SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS poor_query_percentage
FROM Queries                                                        -- El sum actua sobre las filas del group by, igual que el count(*)                     
WHERE query_name IS NOT NULL
GROUP BY query_name