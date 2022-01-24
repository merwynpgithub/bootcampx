const pool = require('./index');

const queryString = `
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1
GROUP BY cohorts.name, teachers.name
`;

const cohortName = process.argv[2] || 'JUL02';
// const limit = process.argv[3] || 5;
// Store all potentially malicious values in an array.
const values = [`%${cohortName}%`];

pool.query(queryString, values)
  .then(res => {
    console.log(res.rows);
    //  res.rows.forEach(user => {
    //   console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
    // })
  })
  .catch(err => console.error('query error', err.stack));