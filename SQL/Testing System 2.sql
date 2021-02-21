-- create database
DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem; 

CREATE TABLE Department(
 DepartmentID 		TINYINT UNSIGNED PRIMARY KEY,
 DepartmentName 	VARCHAR(100) UNIQUE KEY
);

CREATE TABLE Position (
	PositionID 		TINYINT UNSIGNED PRIMARY KEY,
    PositionName	ENUM ('Dev' , 'Test' , 'Scrum Master' , 'PM')
);

CREATE TABLE `Account`(
	AccountID 		TINYINT UNSIGNED PRIMARY KEY,
	Email 			VARCHAR(50) UNIQUE KEY,
    Username 		VARCHAR(50) UNIQUE KEY,
    FullName 		VARCHAR(50),
    DepartmentID	TINYINT UNSIGNED,
    PositionID 		TINYINT UNSIGNED,
    CreateDate 		DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE `Group` (
	GroupID 		TINYINT UNSIGNED PRIMARY KEY,
	GroupName 		VARCHAR(100),
	CreatorID 		TINYINT UNSIGNED,
    CreateDate		DATE,
    FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID)
);

CREATE TABLE GroupAccount (
	GroupID 	TINYINT UNSIGNED PRIMARY KEY,
	AccountID 	TINYINT UNSIGNED UNIQUE KEY,
	JoinDate 	DATE,
FOREIGN KEY (GroupID) REFERENCES `Group` (GroupID)
);

CREATE TABLE TypeQuestion (
TypeID 		TINYINT UNSIGNED PRIMARY KEY,
TypeName 	ENUM ('Essay', 'Multiple-Choice')
);

CREATE TABLE CategoryQuestion (
	CategoryID 		INT UNSIGNED PRIMARY KEY,
    CategoryName 	VARCHAR(50)
);

CREATE TABLE Question (
	QuestionID 		INT UNSIGNED PRIMARY KEY,
    Content 		VARCHAR(100),
    CategoryID 		INT UNSIGNED,
    CreatorID 		TINYINT UNSIGNED,
    CreateDate 		DATE,
FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID)
);

CREATE TABLE Answer (
	AnswerID 		INT UNSIGNED PRIMARY KEY,
    Content 		VARCHAR(100),
    QuestionID 		INT UNSIGNED UNIQUE KEY,
	isCorrect 		ENUM ('true' , 'fall'),
FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);

CREATE TABLE Exam (
	ExamID 		TINYINT UNSIGNED PRIMARY KEY,
	`Code` 		INT UNSIGNED,
    Title 		VARCHAR(100),
    CategoryID 	INT UNSIGNED,
    Duration 	INT UNSIGNED,
    CreatorID 	TINYINT UNSIGNED,
    CreateDate 	DATE,
FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID)
);

CREATE TABLE ExamQuestion (
	ExamID 		TINYINT UNSIGNED PRIMARY KEY,
	QuestionID	INT UNSIGNED UNIQUE KEY,
FOREIGN KEY (ExamID) REFERENCES Exam (ExamID)
);