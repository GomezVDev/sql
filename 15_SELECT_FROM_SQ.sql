--https://leetcode.com/problems/biggest-single-number/?envType=study-plan-v2&envId=top-sql-50
-- Write your MySQL query statement below
SELECT IFNULL(
    (  
        SELECT MAX(num)
        FROM (
            SELECT num
            FROM MyNumbers
            GROUP BY num
            HAVING COUNT(num) = 1
        ) AS unique_nums
    ),null) AS num