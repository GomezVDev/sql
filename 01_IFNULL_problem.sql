--https://leetcode.com/problems/second-highest-salary/description/
--Write a solution to find the second highest salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).

SELECT IFNULL(
    (SELECT DISTINCT salary
     FROM Employee
     ORDER BY salary DESC
     LIMIT 1 OFFSET 1),
    NULL
) AS SecondHighestSalary;