SELECT id, name
FROM students
WHERE cohort_id = 1
ORDER BY name;

SELECT count(id)
FROM students
WHERE cohort_id < 4;

SELECT id, name
FROM students
WHERE email IS NULL
OR phone IS NULL;

SELECT *
FROM students
WHERE email NOT LIKE '%gmail.com'
AND phone IS NULL;

SELECT id, name, cohort_id
FROM students
WHERE end_date IS NULL;

SELECT name, email, phone
FROM students
WHERE github IS NULL
AND end_date IS NOT NULL;