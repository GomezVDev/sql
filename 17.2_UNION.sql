--https://leetcode.com/problems/primary-department-for-each-employee/?envType=study-plan-v2&envId=top-sql-50
SELECT employee_id, department_id
FROM Employee 
WHERE primary_flag = 'Y'
UNION
SELECT employee_id, department_id
FROM Employee 
GROUP BY employee_id
HAVING COUNT(employee_id) = 1
ORDER BY employee_id;

--Explicación : https://leetcode.com/problems/primary-department-for-each-employee/solutions/4557623/easy-solution-using-union-with-where-and-group-by/?envType=study-plan-v2&envId=top-sql-50