1 begin;

INSERT INTO
    `students`
VALUES
    (
        50,
        'abdo',
        'abdo@gmail.com',
        'assiut',
        'm',
        "1995-04-14"
    );

commit;

begin;

INSERT INTO
    `enrolled`
VALUES
    (20, 301);

commit;