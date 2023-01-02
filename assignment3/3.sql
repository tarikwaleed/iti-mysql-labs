select
    student_name,
    YEAR(now()) - YEAR(dob) as Age
from
    students;