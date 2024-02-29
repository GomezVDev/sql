--https://leetcode.com/problems/students-and-examinations/?envType=study-plan-v2&envId=top-sql-50
--Write your MySQL query statement below
SELECT s.student_id,s.student_name,sub.subject_name,COUNT(e.subject_name) as attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
    ON sub.subject_name = e.subject_name AND s.student_id = e.student_id
GROUP BY sub.subject_name,s.student_name
ORDER BY s.student_id,sub.subject_name
