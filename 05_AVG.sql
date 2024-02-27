--https://leetcode.com/problems/average-time-of-process-per-machine/?envType=study-plan-v2&envId=top-sql-50
-- Write your MySQL query statement below
SELECT a1.machine_id, round(avg(a2.timestamp-a1.timestamp), 3) as processing_time 
FROM Activity a1,Activity a2
WHERE a1.process_id = a2.process_id and a1.machine_id=a2.machine_id and a1.activity_type='start' and a2.activity_type='end'
GROUP BY a1.machine_id;