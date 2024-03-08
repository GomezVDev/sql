--https://leetcode.com/problems/percentage-of-users-attended-a-contest/?envType=study-plan-v2&envId=top-sql-50
-- Write your MySQL query statement below
SELECT r.contest_id, ROUND((COUNT(user_id)/(SELECT COUNT(DISTINCT user_id) FROM Users)*100),2) as percentage
FROM Register r   -- Esto de arriba esta bueno, como extraigo de otra tabla, un dato, a partir del SELECT. 
GROUP BY r.contest_id
ORDER BY percentage DESC,r.contest_id -- Si hay un empate, pasa al siguiente parametro