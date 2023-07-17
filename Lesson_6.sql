DROP DATABASE IF EXISTS lesson_6;
CREATE DATABASE IF NOT EXISTS lesson_6;
USE lesson_6;

-- Задание 1
-- Создайте процедуру, которая принимает кол-во сек и формат их в кол-во дней часов.
DELIMITER //
CREATE PROCEDURE seconds_to_DD_HH_MM_SS(secs INT)
BEGIN
	DECLARE days INT DEFAULT 0;
	DECLARE hours INT DEFAULT 0;
	DECLARE minutes INT DEFAULT 0;
	DECLARE seconds INT DEFAULT 0;
	DECLARE in_secs INT DEFAULT 0;

	SET in_secs = secs;
	SET days = floor(in_secs/(60*60*24));
	SET in_secs = in_secs - days*(60*60*24);
	SET hours = floor(in_secs/(60*60));
	SET in_secs = in_secs - hours*(60*60);
	SET minutes = floor(in_secs/(60));
	SET in_secs = in_secs - minutes*(60);
	SELECT CONCAT(secs, ' секунд это: ', days,' дней ', hours,' часов ', minutes,' минут ', in_secs,' секунд') AS 'Перевод секунд в дни, часы, минуты и секунды';
END //
DELIMITER ;

call seconds_to_DD_HH_MM_SS(1132507);

-- Задание 2
-- Выведите только четные числа от 1 до 10 (Через цикл)
DELIMITER //
CREATE FUNCTION even_numbers_up_to_10()
RETURNS VARCHAR(250)
DETERMINISTIC
BEGIN	
    DECLARE i INT DEFAULT 1;
    DECLARE only_one BOOLEAN DEFAULT TRUE;
    DECLARE result VARCHAR(250) DEFAULT '';
	
    WHILE (i <= 10) DO
		IF (i % 2) = 0 THEN
			IF only_one THEN
				SET result = CONCAT(result,i);
                SET only_one = FALSE;
            ELSE
				SET result = CONCAT(result,',',i);
            END IF;
        END IF;
		SET i = i + 1;
    END WHILE;
    
	RETURN result;
END //
DELIMITER ;

SELECT even_numbers_up_to_10() AS 'Четные числа от 1 до 10:';
