--https://leetcode.com/problems/primary-department-for-each-employee/?envType=study-plan-v2&envId=top-sql-50
--# Write your MySQL query statement below
SELECT employee_id, department_id
FROM (
    SELECT employee_id,
           CASE WHEN COUNT(primary_flag) = 1 THEN department_id
                ELSE (SELECT department_id FROM Employee WHERE employee_id = e.employee_id AND primary_flag = 'Y')
           END AS department_id
    FROM Employee e
    GROUP BY employee_id
) AS subquery
WHERE department_id IS NOT NULL;