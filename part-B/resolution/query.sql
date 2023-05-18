
/*
  Description:
  Query used to calculate the number of new, retained, reactivated and lost players per month, considering only from June to December of 2021.
*/

CREATE TEMPORARY TABLE temp_months (
  month_number INT,
  month_name VARCHAR(20),
  first_day DATE,
  last_day DATE
);

INSERT INTO temp_months
  (month_number, month_name, first_day, last_day)
VALUES
  (6, 'June', STR_TO_DATE('01/06/2021', '%d/%m/%Y'), LAST_DAY(STR_TO_DATE('01/06/2021', '%d/%m/%Y'))),
  (7, 'July',  STR_TO_DATE('01/07/2021', '%d/%m/%Y'), LAST_DAY(STR_TO_DATE('01/07/2021', '%d/%m/%Y'))),
  (8, 'August',  STR_TO_DATE('01/08/2021', '%d/%m/%Y'), LAST_DAY(STR_TO_DATE('01/08/2021', '%d/%m/%Y'))),
  (9, 'September',  STR_TO_DATE('01/09/2021', '%d/%m/%Y'), LAST_DAY(STR_TO_DATE('01/09/2021', '%d/%m/%Y'))),
  (10, 'October',  STR_TO_DATE('01/10/2021', '%d/%m/%Y'), LAST_DAY(STR_TO_DATE('01/10/2021', '%d/%m/%Y'))),
  (11, 'November', STR_TO_DATE('01/11/2021', '%d/%m/%Y'), LAST_DAY(STR_TO_DATE('01/11/2021', '%d/%m/%Y'))),
  (12, 'December', STR_TO_DATE('01/12/2021', '%d/%m/%Y'), LAST_DAY(STR_TO_DATE('01/12/2021', '%d/%m/%Y')));

SELECT
    DATE_FORMAT(tmp.first_day, '%b-%Y') as period,
    COUNT(CASE
            WHEN mov.new_state = 'new'
          THEN 1 END
          ) AS new_players,
    COUNT(CASE 
            WHEN mov.new_state IN ('active', 'new') 
              AND (mov.timestamp BETWEEN tmp.first_day AND tmp.last_day)
              AND (mov.previous_state IN ('active', 'new')
              OR mov.previous_state IS NULL) 
            THEN 1 END
          ) AS retained_players,
    COUNT(CASE 
            WHEN mov.new_state = 'active'
            AND mov.previous_state = 'inactive' 
          THEN 1 END
          ) AS reactivated_players,
    COUNT(CASE
            WHEN mov.new_state = 'inactive'
              AND mov.previous_state IN ('active', 'new')
            THEN 1 END
          ) AS lost_players
FROM temp_months tmp
LEFT JOIN (
        SELECT
            t.user_id,
            t.timestamp,
            t.previous_state,
            t.new_state
        FROM 
            movements t
        JOIN (
            SELECT
                user_id
                ,MONTH(timestamp) as month
                ,YEAR(timestamp) as year
                ,MAX(timestamp) as last_movement
            FROM
                movements
            group by
                user_id
                ,MONTH(timestamp)
                ,YEAR(timestamp)
            order by 
                YEAR(timestamp)
                ,MONTH(timestamp)
                ,user_id
        ) AS user_last_movement -- users might have more than 1 action on same month, so we pick the latest one
        ON t.timestamp = user_last_movement.last_movement
    ) mov on MONTH(mov.timestamp) = tmp.month_number
GROUP BY DATE_FORMAT(tmp.first_day, '%b-%Y')