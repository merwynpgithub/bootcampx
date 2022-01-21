SELECT count(assistance_requests.*) AS total_assistances, teachers.name
FROM assistance_requests
JOIN teachers ON teacher_id = teachers.id
WHERE teachers.name IN ('Waylon Boehm')
GROUP BY teachers.name;

SELECT count(assistance_requests.*) AS total_assistances,students.name
FROM assistance_requests
JOIN students ON students.id = student_id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;