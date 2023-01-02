drop FUNCTION if exists failed_students_count;
DELIMITER //
CREATE FUNCTION failed_students_count(course_code int)
   RETURNS int
   DETERMINISTIC
   BEGIN
   declare students_count int;
   SELECT count(student_id) into students_count 
   from exam_in where exam_in.course_code=course_code and exam_result<50;
   return students_count;
        
   END // DELIMITER ;
select failed_students_count(201);