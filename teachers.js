const pool = require('./index');

pool.query(`
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = '${process.argv[2] || 'JUL02'}'
GROUP BY cohorts.name, teachers.name;
`)
.then(res => {
  // res.rows.forEach(user => {
  //   console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_id} cohort`);
  // })
  console.log(res.rows);
  //  res.rows.forEach(user => {
  //   console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
  // })
})
.catch(err => console.error('query error', err.stack));