SELECT day, count(*) as total_assignments 
FROM assignments
GROUP BY day
ORDER BY day;

SELECT day, count(*) as total_assignments 
FROM assignments
GROUP BY day
HAVING count(*) >= 10
ORDER BY day;

SELECT cohorts.name AS cohort_name, count(cohort_id) AS student_count 
FROM students
JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohorts.name
HAVING count(cohort_id) >= 18
ORDER BY count(cohort_id);

SELECT cohorts.name AS cohort, count(assignment_submissions.*) AS total_submissions
FROM cohorts
JOIN students ON cohort_id = cohorts.id
JOIN assignment_submissions ON student_id = students.id
GROUP BY cohorts.name
ORDER BY count(assignment_submissions.*) DESC;

SELECT students.name AS student , avg(assignment_submissions.duration) AS average_assignment_duration 
FROM students
JOIN assignment_submissions ON student_id = students.id
WHERE end_date IS NULL
GROUP BY students.name
ORDER BY avg(assignment_submissions.duration) DESC;

SELECT students.name AS student , avg(assignment_submissions.duration) AS average_assignment_duration, avg(assignments.duration) AS average_estimated_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN assignments ON assignment_id = assignments.id
WHERE end_date IS NULL 
GROUP BY students.name
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY avg(assignment_submissions.duration);