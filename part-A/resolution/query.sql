SELECT
    a.action_group
    ,COUNT(a.user_id) as PlayersTargeted
    ,COUNT(distinct d.user_id)  as Conversions
    ,COUNT(distinct d.user_id) / COUNT(distinct a.user_id) as ConversionRate
    ,AVG(distinct d.amount) as AverageFirstDepositAmount
    ,SUM(d.depositCount) / COUNT(distinct d.user_id)  as DepositCountConversion
    ,SUM(d.depositAmount) / COUNT(distinct d.user_id)  as DepositAmountConversion
    ,MAX(distinct d.SingleBiggestDeposit) as SingleBiggestDeposit
FROM
    activities_sent a
JOIN user_details ud on a.user_id = ud.user_id
LEFT JOIN (
    SELECT
        user_details.user_Id
        ,COUNT(amount) as DepositCount
        ,SUM(amount) as DepositAmount
        ,MAX(amount) as SingleBiggestDeposit
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