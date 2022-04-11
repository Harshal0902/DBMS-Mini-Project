CREATE SCHEMA cms;

DROP TABLE if exists department;

create table department
(
    id             INT         NOT NULL AUTO_INCREMENT,
    departmentName varchar(30) NULL,
    primary key (id)
);

DROP TABLE if EXISTS faculty;

CREATE TABLE faculty
(
    id        INT         NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(30) NOT NULL,
    lastname  VARCHAR(50) NOT NULL,
    deptid    INT         NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE if EXISTS student;

CREATE TABLE student
(
    id           INT         NOT NULL AUTO_INCREMENT,
    firstname    VARCHAR(30) NULL,
    lastname     VARCHAR(50) NULL,
    street       VARCHAR(50) NULL,
    streetDetail VARCHAR(30) NOT NULL,
    city         VARCHAR(30) NOT NULL,
    state        VARCHAR(30) NOT NULL,
    postalCode   CHAR(5)     NOT NULL,
    majorid      INT         NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE if EXISTS course;

CREATE TABLE course
(
    id         INT         NOT NULL AUTO_INCREMENT,
    courseName VARCHAR(50) NULL,
    deptid     INT         NULL,
    PRIMARY KEY (id)
);

DROP TABLE if EXISTS studentCourse;

CREATE TABLE studentCourse
(
    studentid INT  NULL,
    courseid  INT  NULL,
    progress  INT  NULL,
    startDate DATE NULL,
    FOREIGN KEY (studentid) REFERENCES student (id),
    FOREIGN KEY (courseid) REFERENCES course (id)
);

DROP TABLE if EXISTS facultyCourse;

CREATE TABLE facultyCourse
(
    facultyid INT NULL,
    courseid  INT NULL,
    FOREIGN KEY (facultyid) REFERENCES faculty (id),
    FOREIGN KEY (courseid) REFERENCES course (id)
);