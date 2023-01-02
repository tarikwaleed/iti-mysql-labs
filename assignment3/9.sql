drop FUNCTION if exists get_student_score;
DELIMITER //
CREATE FUNCTION get_student_score(student_id int,course_code int)
   RETURNS int
   DETERMINISTIC
   BEGIN
   declare score int;
   SELECT exam_result into score from exam_in where exam_in.student_id=student_id and exam_in.course_code=course_code;
   return score;
        
   END // DELIMITER ;
SELECT get_student_score(10,201);