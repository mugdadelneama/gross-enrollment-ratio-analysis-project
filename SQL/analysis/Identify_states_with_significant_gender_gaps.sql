--  •	Identify states with significant gender gaps (>10% difference)
SELECT 
    State_UT,
    CAST(SUBSTRING(`Year`, 1, 4) AS SIGNED) as `Year`,
    -- Round to 1 decimal place instead of showing long decimals
    ROUND(ABS(Primary_Girls - Primary_Boys), 1) AS Primary_Gap,
    ROUND(ABS(Upper_Primary_Girls - Upper_Primary_Boys), 1) AS Upper_Primary_Gap,
    ROUND(ABS(Secondary_Girls - Secondary_Boys), 1) AS Secondary_Gap,
    ROUND(ABS(Higher_Secondary_Girls - Higher_Secondary_Boys), 1) AS Higher_Secondary_Gap,
    
 -- Show which gender has advantage
    CASE 
        WHEN Primary_Girls > Primary_Boys THEN 'Girls Lead'
        ELSE 'Boys Lead'
    END AS Primary_Advantage
    
FROM gross_enrollment
WHERE ABS(Primary_Girls - Primary_Boys) > 10 
   OR ABS(Upper_Primary_Girls - Upper_Primary_Boys) > 10
   OR ABS(Secondary_Girls - Secondary_Boys) > 10
   OR ABS(Higher_Secondary_Girls - Higher_Secondary_Boys) > 10
ORDER BY Primary_Gap DESC;  

select * from gross_enrollment;