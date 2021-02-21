CREATE DATABASE Department;
USE Department;
CREATE TABLE Department(
 DepartmentID 		INT,
 DepartmentName 	VARCHAR(100)
);

CREATE DATABASE Position;
USE Position;
CREATE TABLE Position (
	PositionID 		INT,
    PositionName 	VARCHAR(100)
);

CREATE DATABASE `Account`;
USE `Account`;
CREATE TABLE `Account`(
	AccountID 		INT,
	Email 			VARCHAR(50),
    Username 		VARCHAR(50),
    FullName 		VARCHAR(50),
    DepartmentID	INT,
    PositionID 		INT,
    CreateDate 		DATE
);

CREATE DATABASE `Group`;
USE `Group`;
CREATE TABLE `Group` (
	GroupID 		INT,
	GroupName 		VARCHAR(100),
	CreateID 		INT,
    CreateDate		DATE
);

CREATE DATABASE GroupAccount;
USE GroupAccount;
CREATE TABLE GroupAccount (
GroupID 	INT,
AccountID 	INT,
JoinDate 	DATE
);

CREATE DATABASE TypeQuestion;
USE TypeQuestion;
CREATE TABLE TypeQuestion (
TypeID 		INT,
TypeName 	VARCHAR(50)
);

CREATE DATABASE CategoryQuestion;
USE CategoryQuestion;
CREATE TABLE CategoryQuestion (
	CategoryID 		INT,
    CategoryName 	VARCHAR(100)
);

CREATE DATABASE Question;
USE Question;
CREATE TABLE Question (
	QuestionID 		INT,
    Content 		VARCHAR(100),
    CategoryID 		INT,
    CreatorID 		INT,
    CreateDate 		DATE
);

CREATE DATABASE Answer;
USE Answer;
CREATE TABLE Answer (
	AnswerID 		INT,
    Content 		VARCHAR(100),
    QuestionID 		INT,
	isCorrect 		VARCHAR(10)
);

CREATE DATABASE Exam;
USE Exam;
CREATE TABLE Exam (
	ExamID 		INT,
	`Code` 		INT,
    Title 		VARCHAR(100),
    CategoryID 	VARCHAR(100),
    Duration 	INT,
    CreatorID 	INT,
    CreateDate 	DATE
);

CREATE DATABASE ExamQuestion;
USE ExamQuestion;
CREATE TABLE ExamQuestion (
ExamID 		INT,
QuestionID 	INT
);