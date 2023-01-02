drop FUNCTION if exists get_avg_subject_score;
DELIMITER //
CREATE FUNCTION get_avg_subject_score(course_name varchar(10))
   RETURNS int
   DETERMINISTIC
   BEGIN
   declare avg_subject_score int;
   select avg(exam_result)  into avg_subject_score from exam_in where  exam_in.course_code =(
   SELECT course_code from courses WHERE courses.course_name=course_name);
   return avg_subject_score;
        
   END // DELIMITER ;
select get_avg_subject_score("html")