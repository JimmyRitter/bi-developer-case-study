/*
    Description:
    Query for generating a report which summarises the performance of each action group.
*/

SELECT
    a.action_group
    ,COUNT(a.user_id) as players_targeted
    ,COUNT(distinct d.user_id)  as conversions
    ,COUNT(distinct d.user_id) / COUNT(distinct a.user_id) as conversion_rate
    ,AVG(distinct d.amount) as average_first_deposit_amount
    ,SUM(d.deposit_count) / COUNT(distinct d.user_id) as deposit_count_conversion
    ,SUM(d.deposit_amount) / COUNT(distinct d.user_id)  as deposit_amount_conversion
    ,MAX(distinct d.single_biggest_deposit) as single_biggest_deposit
FROM
    activities_sent a
JOIN user_details ud on a.user_id = ud.user_id
LEFT JOIN (
    SELECT
        user_details.user_Id
        ,COUNT(amount) as deposit_count
        ,SUM(amount) as deposit_amount
        ,MAX(amount) as single_biggest_deposit
        ,amount
    FROM 
        user_details
    JOIN deposits on user_details.user_id = deposits.user_id
    WHERE 
        user_details.country IN ('United Kingdom', 'Norway', 'Finland', 'Sweden')
        AND deposits.timestamp > "2020-03-06 16:00:00" 
        AND deposits.timestamp <= ADDTIME("2020-03-06 16:00:00", "12:00:00") 
    GROUP BY user_id
) d ON d.user_id = a.user_id
WHERE 
    a.activity_id = 156
    AND UD.country IN ('United Kingdom', 'Norway', 'Finland', 'Sweden')
GROUP BY
    a.action_group