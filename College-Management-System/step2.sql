

/*

provide a query which lists each department
and the number of courses offered by that department

The two columns should have headers;
1) “Department Name”
2) “# Courses”

- output should be sorted by “# Courses” in each department (ascending).

*/

SELECT departmentName 'Department Name', deptid '# Courses'
FROM department
         JOIN course
ORDER BY '# Courses' ASC;

