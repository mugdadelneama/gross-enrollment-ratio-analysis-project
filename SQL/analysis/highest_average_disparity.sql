-- • The highest average disparity for all education levels 
WITH education_disparities AS (
    -- Primary Education Disparity
    SELECT 
        'Primary' as Education_Level,
        ROUND(AVG(ABS(1 - (Primary_Boys / NULLIF(Primary_Girls, 0)))) * 100, 2) as Avg_Disparity_Percent
    FROM gross_enrollment 
    WHERE Primary_Boys > 0 AND Primary_Girls > 0
    
    UNION ALL
    
    -- Upper Primary Education Disparity
    SELECT 
        'Upper Primary' as Education_Level,
        ROUND(AVG(ABS(1 - (Upper_Primary_Boys / NULLIF(Upper_Primary_Girls, 0)))) * 100, 2) as Avg_Disparity_Percent
    FROM gross_enrollment 
    WHERE Upper_Primary_Boys > 0 AND Upper_Primary_Girls > 0
    
    UNION ALL
    
    -- Secondary Education Disparity
    SELECT 
        'Secondary' as Education_Level,
        ROUND(AVG(ABS(1 - (Secondary_Boys / NULLIF(Secondary_Girls, 0)))) * 100, 2) as Avg_Disparity_Percent
    FROM gross_enrollment 
    WHERE Secondary_Boys > 0 AND Secondary_Girls > 0
    UNION ALL
    
    -- Higher Secondary Education Disparity
    SELECT 
        'Higher Secondary' as Education_Level,
        ROUND(AVG(ABS(1 - (Higher_Secondary_Boys / NULLIF(Higher_Secondary_Girls, 0)))) * 100, 2) as Avg_Disparity_Percent
    FROM gross_enrollment 
    WHERE Higher_Secondary_Boys > 0 AND Higher_Secondary_Girls > 0
)
SELECT 
    Education_Level,
    Avg_Disparity_Percent
FROM education_disparities
ORDER BY Avg_Disparity_Percent DESC;
 select* from gross_enrollment;