SELECT
    round(exam_result, 2),
    student_name
from
    exam_in,
    students
where
    exam_in.student_id = students.student_id