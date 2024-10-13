-- By: zSpunky_RiP
-- Limitacion 1 - Anti 2.2 Levels - 

DELIMITER //
CREATE TRIGGER Anti22Levels (Can be changed)
BEFORE INSERT ON `levels`
FOR EACH ROW
BEGIN
    IF NEW.gameVersion = 22 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = '2.2 Level Upload Disabled (U can change NEW.gameVersion = 22 to NEW.gameVersion = 21 for blocking 2.1)';
    END IF;
END //
DELIMITER ;

-- Limitacion 2 - Anti 2.2 Update Stats - 

DELIMITER //
CREATE TRIGGER Anti22Users (Can be changed)
AFTER UPDATE ON `users`
BEGIN
    IF NEW.gameVersion = 22 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = '2.2 User Value Update Disabled (U can change NEW.gameVersion = 22 to NEW.gameVersion = 21 for blocking 2.1)';
    END IF;
END
DELIMITER ;
