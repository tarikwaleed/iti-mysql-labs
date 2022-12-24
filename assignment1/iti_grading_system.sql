DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
    `student_id` int NOT NULL,
    `student_name` varchar(45) NOT NULL,
    `email` varchar(45) NOT NULL,
    `address` varchar(45) NOT NULL,
    PRIMARY KEY (`student_id`),
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

INSERT INTO
    `students`
VALUES
    (
        10,
        'tarik waleed',
        'tarikwaleed@gmail.com',
        'assiut'
    ),
    (
        20,
        'ahmed ali',
        'ahmedali@gmail.com',
        'cairo'
    ),
    (
        30,
        'mohammed kamel',
        'mohammedkamel@gmail.com',
        'alex'
    ),
    (
        40,
        'ali ebraheem',
        'aliebraheem@gmail.com',
        'assiut'
    );

DROP TABLE IF EXISTS `students_phones`;

CREATE TABLE `students_phones` (
    `student_id` int NOT NULL,
    `phone_number` varchar(11) NOT NULL,
    PRIMARY KEY (`student_id`, `phone_number`),
    CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

INSERT INTO
    `students_phones`
VALUES
    (10, `01068894786`),
    (10, `01064895755`),
    (20, `01164444186`),
    (20, `01243494580`),
    (30, `01108804006`),
    (30, `01568894786`);

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
    `course_code` int NOT NULL,
    `course_name` varchar(10) NOT NULL,
    `description` varchar(45) NOT NULL,
    `max_score` int NOT NULL,
    PRIMARY KEY (`course_code`),
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

INSERT INTO
    `courses`
VALUES
    (
        101,
        'c',
        'introduction to programming using c',
        100
    ),
    (
        102,
        'cpp',
        'introduction to programming using cpp',
        100
    ),
    (201, 'html', 'web design basics', 100),
    (301, 'css', 'advanced web design', 100),
    (402, 'js', 'web programming fundamentals', 100);

DROP TABLE IF EXISTS `enrolled`;

CREATE TABLE `enrolled` (
    `student_id` int NOT NULL,
    `course_code` varchar(10) NOT NULL,
    PRIMARY KEY (`student_id`, `course_code`),
    CONSTRAINT `enrolled_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
    CONSTRAINT `enrolled_ibfk_2` FOREIGN KEY (`course_code`) REFERENCES `courses` (`course_code`),
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

INSERT INTO
    `enrolled`
VALUES
    (10, 201),
    (20, 201),
    (30, 201),
    (30, 402),
    (30, 301),
    (40, 201),
    (40, 402),
    (40, 301),
    (30, 402),
    (30, 301);

DROP TABLE IF EXISTS `exam_in`;

CREATE TABLE `exam_in` (
    `student_id` int NOT NULL,
    `course_code` varchar(10) NOT NULL,
    `exam_date` date NOT NULL,
    `exam_result` int NOT NULL,
    PRIMARY KEY (`student_id`, `course_code`),
    CONSTRAINT `exam_in_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
    CONSTRAINT `exam_in_ibfk_2` FOREIGN KEY (`course_code`) REFERENCES `courses` (`course_code`),
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

INSERT INTO
    `exam_in`
VALUES
    (10, 201, '2020-09-12', 90),
    (20, 201, '2020-02-14', 80),
    (30, 201, '2020-08-19', 80),
    (30, 402, '2020-07-22', 70),
    (30, 301, '2020-08-21', 60),
    (40, 201, '2020-01-12', 90),