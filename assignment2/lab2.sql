--1
ALTER TABLE
       students
ADD
       column `gender` enum('m', 'f');

--2
ALTER TABLE
       students
add
       column dob date;

--3
ALTER TABLE
       students DROP student_name;

ALTER TABLE
       students
add
       column first_name varchar(20);

ALTER TABLE
       students
add
       column last_name varchar(20);
-- we skipped 4

--5
ALTER TABLE
       students_phones
add
       constraint students_phones_ibfk foreign key (student_email) references students(student_email) ON
DELETE cascade;

--6
UPDATE
       studetns
SET
       gender = "m",
       dob = "1995-04-14",
       first_name = "tarik",
       last_name = "waleed",
       student_email = "tarikwaleed@gmail.com",
       student_address = "assuit"
WHERE
       first_name = "tarik";

--7
SELECT
       *
FROM
       students;

--8
SELECT
       *
FROM
       students
WHERE
       gender = "m";

--9
SELECT
       COUNT(*)
FROM
       students
WHERE
       gender = "f";

--10
SELECT
       *
FROM
       students
WHERE
       dob < "1992-10-01";

--11
SELECT
       *
FROM
       students
WHERE
       dob < "1991-10-01"
       AND gender = "m";

--12
SELECT
       course_name,
       max_score
FROM
       courses
ORDER BY
       max_score;

--13
SELECT
       course_name
FROM
       courses
WHERE
       max_score = (
              SELECT
                     MAX(max_score)
              FROM
                     courses
       );

--14
SELECT
       first_name
FROM
       students
WHERE
       first_name like 'A%';

--15
SELECT
       COUNT(*)
FROM
       students
WHERE
       first_name = "Mohammed";

--16
SELECT
       gender,
       COUNT(*)
FROM
       students
WHERE
       gender = "m"
UNION
SELECT
       gender,
       COUNT(first_name)
FROM
       students
WHERE
       gender = "f";

--17
SELECT
       first_name
FROM
       students
GROUP BY
       first_name
HAVING
       COUNT(first_name) >= 2;

--18
SELECT
       first_name,
       exam_result,
       course_name
FROM
       students s
       INNER JOIN exam_in e ON (s.student_id = e.student_id)
       INNER JOIN courses c ON (e.course_code = c.course_code);

--19
DELETE FROM
       students
WHERE
       student_id IN (
              SELECT
                     student_id
              FROM
                     exam_in
              WHERE
                     exam_result < 50
       );

