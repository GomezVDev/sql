--https://leetcode.com/problems/game-play-analysis-iv/?envType=study-plan-v2&envId=top-sql-50
-- Write your MySQL query statement below
SELECT 
    ROUND(COUNT(DISTINCT player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) as fraction
FROM 
    Activity
WHERE 
    (player_id, DATE_SUB(event_date, INTERVAL 1 DAY)) --Resta lo que le paso como INTERVAL
    IN --Para seguir aclando: Las row que cumplan esto, es decir, que luego de procesarlas(resta un día por ej) y ver si matchean con la SQ, seran las seleccionadas.
    (
        -- Subquery: Players and their first login date
        SELECT 
            player_id,
            MIN(event_date) AS first_login
        FROM 
            Activity
        GROUP BY 
            player_id
    );

--Explicacion : https://leetcode.com/problems/game-play-analysis-iv/solutions/4471076/beats-90-easiest-explanation-why-date-before-first-login/?envType=study-plan-v2&envId=top-sql-50