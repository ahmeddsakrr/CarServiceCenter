DELIMITER //

CREATE TRIGGER increment_employee
AFTER INSERT ON `employee`
FOR EACH ROW
BEGIN
	UPDATE `service_center`
	SET `NO_of_Employees` = `NO_of_Employees` + 1
	WHERE `service_center`.`Center_ID` = NEW.`Center_ID`;
END//

CREATE TRIGGER update_employee_change_center
AFTER UPDATE ON `employee`
FOR EACH ROW
BEGIN
	IF OLD.Center_ID <> NEW.Center_ID THEN
		UPDATE `service_center`
	    SET `NO_of_Employees` = `NO_of_Employees` - 1
		WHERE `service_center`.`Center_ID` = OLD.`Center_ID`;
		
		UPDATE `service_center`
	    SET `NO_of_Employees` = `NO_of_Employees` + 1
		WHERE `service_center`.`Center_ID` = NEW.`Center_ID`;
	END IF;
    IF (SELECT `NO_of_Employees`
		FROM `service_center`
        WHERE `Center_ID` = OLD.`Center_ID`) = 0
	THEN
		DELETE FROM `service_center` 
        WHERE `Center_ID` = OLD.`Center_ID`;
	END IF;
    
END//

CREATE TRIGGER decrement_employee
AFTER DELETE ON `employee`
FOR EACH ROW
BEGIN
	UPDATE `service_center`
	SET `NO_of_Employees` = `NO_of_Employees` - 1
	WHERE `service_center`.`Center_ID` = OLD.`Center_ID`;
    
    IF (SELECT `NO_of_Employees`
		FROM `service_center`
        WHERE `Center_ID` = OLD.`Center_ID`) = 0
	THEN
		DELETE FROM `service_center` 
        WHERE `Center_ID` = OLD.`Center_ID`;
	END IF;
END//



DELIMITER ;	
