DELIMITER //
CREATE FUNCTION sayhello(name char(40))
RETURNS char(100)
DETERMINISTIC
BEGIN
return CONCAT('hello', ' ', name);
END //
DELIMITER;
SELECT sayhello("tarik")