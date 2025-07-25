--  • Calculating gender parity index for each state and education level
SELECT 
State_UT,
 CAST(SUBSTRING(`Year`, 1, 4) AS SIGNED) as `Year`,
        -- Show the actual numbers too
Primary_Girls, Primary_Boys,
Upper_Primary_Girls, Upper_Primary_Boys,
Secondary_Girls, Secondary_Boys,
Higher_Secondary_Girls, Higher_Secondary_Boys,

    ROUND(Primary_Girls / Primary_Boys, 2) AS Primary_GPI,
    ROUND(Upper_Primary_Girls / Upper_Primary_Boys, 2) AS Upper_Primary_GPI,
    ROUND(Secondary_Girls / Secondary_Boys, 2) AS Secondary_GPI,
    ROUND(Higher_Secondary_Girls / Higher_Secondary_Boys, 2) AS Higher_Secondary_GPI
FROM gross_enrollment
ORDER BY State_UT;