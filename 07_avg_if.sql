--https://leetcode.com/problems/confirmation-rate/?envType=study-plan-v2&envId=top-sql-50
-- Write your MySQL query statement below
SELECT DISTINCT s.user_id,round(avg(if(c.action="confirmed",1,0)),2) as confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c 
    ON s.user_id = c.user_id
GROUP BY s.user_id