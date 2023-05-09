UPDATE `Engineer`
SET `Specialization` = 'Mechanical'
WHERE `E_SSN` = '96012101300120';

UPDATE `Engineer`
SET `Specialization` = 'Civil'
WHERE `E_SSN` = '91020901100485';

UPDATE `Engineer`
SET `Specialization` = 'Electrical'
WHERE `E_SSN` = '98031201500319';

UPDATE `Engineer`
SET `Specialization` = 'Software'
WHERE `E_SSN` = '90052301300185';

-- ------------------------------------------------------------------------------
UPDATE `Sales_Man` SET `Sales_Made` = 100 WHERE `SM_SSN` = '93071701200417';
UPDATE `Sales_Man` SET `Sales_Made` = 200 WHERE `SM_SSN` = '88112501100176';
UPDATE `Sales_Man` SET `Sales_Made` = 150 WHERE `SM_SSN` = '94060901200185';
UPDATE `Sales_Man` SET `Sales_Made` = 75 WHERE `SM_SSN` = '95022501200146';

-- ------------------------------------------------------------------------------
UPDATE `Body`
SET `Chassis_Type` = CASE 
                        WHEN `Model` = 'A123' THEN 'Sedan'
                        WHEN `Model` = 'A456' THEN 'SUV'
                        WHEN `Model` = 'A789' THEN 'Hatchback'
                     END
WHERE `Model` IN ('A123', 'A456', 'A789');

-- --------------------------------------------------------------------------------

UPDATE `Employee`
SET `Salary` = CASE 
					WHEN `Role` = 'Engineer' THEN `Salary` * 1.1 
					WHEN `Role` = 'Sales Man' THEN `Salary` * 0.95  
			   END
WHERE `Center_ID` IN (
    SELECT `Center_ID` 
    FROM `Service_Center` 
    WHERE `City` = 'Alexandria'
);