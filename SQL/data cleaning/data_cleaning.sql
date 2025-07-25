select * from gross_enrollment_2013_2016;
-- Duplicates data 
-- Null Values 
-- Standradize Data 
-- Remove unnecessary coulmns or rows

select * from gross_enrollment 
order by 1 
;   -- New Table 

--  I made a copy of the old table to work on it and all the data has inserted to the new table.
INSERT INTO gross_enrollment 
SELECT * FROM gross_enrollment_ratio_2013_2016;

-- Duplicates data  
with check_duplicates as 
(
select*, 
row_number() over (partition by trim(State_UT), `Year`,Primary_Total , Upper_Primary_Total, Secondary_Total, Higher_Secondary_Total ) as row_num
 from gross_enrollment 
)
select * from check_duplicates
 ;
-- No Duplicates Data