drop FUNCTION if exists multiply;
DELIMITER //
CREATE FUNCTION multiply(x int,y int)
   RETURNS char(100)
   DETERMINISTIC
   BEGIN
        
      return x*y;
   END 
   //
   DELIMITER ;
select multiply(5,5);