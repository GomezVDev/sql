--https://leetcode.com/problems/immediate-food-delivery-ii/?envType=study-plan-v2&envId=top-sql-50
-- Write your MySQL query statement below
SELECT 
    ROUND(SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT customer_id), 2) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (-- Aca verifica si el par(valor1,valor2) es igual al par que me devolvera la subconsulta
    SELECT customer_id, MIN(order_date) AS first_order_date-- Esto es lo que compara
    FROM Delivery
    GROUP BY customer_id
);