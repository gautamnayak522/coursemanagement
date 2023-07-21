USE CourseManagement
/*

--Create Database

CREATE DATABASE CourseManagement

-- Create Tables

CREATE TABLE Departments
(
	deptID INT PRIMARY KEY IDENTITY(1,1),
	deptName VARCHAR(50) NOT NULL
)

CREATE TABLE Employees
(
	empID INT PRIMARY KEY IDENTITY(1,1),
	firstName VARCHAR(50) NOT NULL,
	lastName VARCHAR(50) NOT NULL,
	emailAddress VARCHAR(50),
	mobileNo NUMERIC(10),
	deptID INT,
	CONSTRAINT FK_emp_deptid FOREIGN KEY(deptid) REFERENCES Departments(deptID)
)

CREATE TABLE Courses 
(
	courseID INT PRIMARY KEY IDENTITY(1,1),
	courseName VARCHAR(50),
	deptID INT,
	timeDuration INT,
	CONSTRAINT FK_course_deptID FOREIGN KEY(deptID) REFERENCES Departments(deptID)
)

CREATE TABLE CourseEnrollment
(
	enrollID INT PRIMARY KEY IDENTITY(1,1),
	empID INT,
	courseID INT,
	emrollDate date DEFAULT GETDATE(),
	CONSTRAINT FK_enroll_empID FOREIGN KEY(empID) REFERENCES Employees(empID),
	CONSTRAINT FK_enroll_courseID FOREIGN KEY(courseID) REFERENCES Courses(courseID)
)


-- Adding Data

INSERT INTO Departments VALUES ('.Net');
INSERT INTO Departments VALUES ('PHP');
INSERT INTO Departments VALUES ('QA Testing');

INSERT INTO Courses VALUES ('Angular',1,60)
INSERT INTO Courses VALUES ('SQL',1,80)
INSERT INTO Courses VALUES ('MVC',1,120)
INSERT INTO Courses VALUES ('mySQL',2,60)
INSERT INTO Courses VALUES ('Laravel',2,180)
INSERT INTO Courses VALUES ('Manual Testing',3,60)
INSERT INTO Courses VALUES ('Automation Testing',3,60)

INSERT INTO Employees VALUES ('Gautam','Nayak','g@g.com','7623075610',1);
INSERT INTO Employees VALUES ('Abhishek','Agrawal','abhi@gmail.com','9090909090',2);
INSERT INTO Employees VALUES ('Shreyal','Shah','shrey@gmail.com','8080808080',3);

INSERT INTO CourseEnrollment (empID,courseID) VALUES (1,5)
INSERT INTO CourseEnrollment (empID,courseID) VALUES (1,6)
INSERT INTO CourseEnrollment (empID,courseID) VALUES (3,1)
INSERT INTO CourseEnrollment (empID,courseID) VALUES (3,3)


EXEC sp_rename 'CourseEnrollment.emrollDate', 'enrollDate';

*/
GO


SELECT * FROM Departments
SELECT * FROM Employees
SELECT * FROM Courses
SELECT * FROM CourseEnrollment




