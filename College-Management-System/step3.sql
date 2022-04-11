/*

list the names of all courses

where

# of faculty assigned to those courses is zero

output

alphabetical order by course name

*/

/* you can include

WHERE facultycourse.courseid = 0
ORDER BY 'course name' ASC;

and the table will be empty

*/

SELECT course.courseName
                              AS 'course name',
       facultycourse.courseid AS '# of Faculty'
FROM facultycourse
         JOIN course
ORDER BY 'course name' ASC;

SELECT faculty.deptid,
       course.courseName
           AS 'course name',
       course.deptid
FROM faculty
         JOIN course
ORDER BY 'course name' ASC;

/*

write a query to list the course names
# of students in those courses --- for all courses

where --- there are no assigned faculty

output ordered --- first by # of students descending

then by course name ascending

*/

SELECT course.courseName, student.majorid AS '# of Students'
FROM student
         JOIN course
ORDER BY course.courseName ASC, '# of Students' DESC;

/*

list students’
First Name, Last Name, and Number of Courses
--- they are taking in their major department ---

output

sorted first in desc number of courses

then by student last name

*/

SELECT student.firstname, student.lastname, student.majorid
FROM student
ORDER BY student.majorid DESC, student.lastname DESC;

/*

 lists the total # of students
 enrolled in classes during each school year

 first column --  header “Students”
 second column showing the enrollment -- “Year”

 */

SELECT studentcourse.studentid 'Students', studentcourse.startDate AS 'Year'
FROM studentcourse
ORDER BY studentcourse.startDate ASC, studentcourse.studentid DESC;

/*

  lists the Start Date and # of Students
  who enrolled in classes in August of each year

  output
  ordered by start date ascending

 */

SELECT COUNT(DISTINCT studentCourse.studentid) AS 'Students who enrolled in classes in August'
FROM studentcourse
WHERE MONTH(studentcourse.startDate) = 8
ORDER BY studentcourse.startDate ASC;

/*

 two courses must be from the department of their major
 list students ---
 First Name, Last Name, and Number of Courses
 they are taking in their major department

 output should be sorted first in increasing order of the number of courses,
 then by student last name.

 */

SELECT student.firstname, student.lastname, COUNT(course.courseName)
FROM student
         JOIN course
ORDER BY student.MajorId ASC, student.lastname ASC;

/*

 list
 First Name, Last Name and AVG Progress
 --- of all students average of less than 50% ---

 average progress should be rounded to one decimal place.
 Sort the output by average progress descending.

 help from:
 https://www.w3resource.com/sql/aggregate-functions/avg-decimal-places-using-cast-within-avg.php

 */

SELECT student.firstname,
       student.lastname,
       CAST(AVG(studentCourse.progress) AS DECIMAL (50)) AS 'Average Progress'
FROM student
         JOIN studentCourse
ORDER BY studentCourse.progress DESC;

/*

list each Course Name, Average Progress of students

sorted descending by average progress.

 */

SELECT course.courseName, AVG(studentCourse.progress) AS 'Progress'
FROM course, studentCourse
ORDER BY 'Progress' DESC;

/*

 select maximum value of average progress
 reported by the previous query.

 */

Select course.courseName, MAX(studentcourse.Progress)
FROM course, studentcourse;

/*

  outputs faculty First Name, Last Name,
  and average of the progress (“Avg. Progress”)
  made over all of their courses.

 */

SELECT faculty.firstname, faculty.lastname, AVG(studentCourse.progress) AS 'Avg. Progress'
FROM faculty, studentCourse;

/*

 Write a query just like #3, but where only those faculty where average progress in their
 courses is 90% or more of the maximum observed in #2.

 */

SELECT faculty.firstname, faculty.lastname, AVG(studentCourse.progress > 90)
FROM faculty, studentCourse;

/*

    query that displays each student’s First Name, Last Name, Min Grade

    based on minimum progress,
    and Max Grade based on maximum progress.

 */

SELECT student.firstname, student.lastname,
       MIN(studentCourse.progress) AS 'Minimum Progress',
       MAX(studentCourse.progress) AS 'Maximum Progress'
FROM student, studentCourse;