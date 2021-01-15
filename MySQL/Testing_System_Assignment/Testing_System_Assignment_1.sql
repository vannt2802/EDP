-- create database 
DROP DATABASE IF EXISTS Practice_code;
CREATE TABLE Practice_code;
USE Practice_code;

-- create table: Department
DROP DATABASE IF EXISTS Department;
CREATE TABLE Department(
DepartmentID   INT,
DepartmentName VARCHAR(100)
);

-- create table: Position
DROP DATABASE IF EXISTS Position;
CREATE TABLE Position (
PositionID   INT,
PositionName VARCHAR(50)
);

-- create table: group
DROP DATABASE IF EXISTS `Group`;
CREATE TABLE `Group`(
GroupID    INT,
GroupName  VARCHAR(100),
CreateDate Date
);

-- create table: GroupAccount
DROP DATABASE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
GroupID   INT,
AccountID INT,
JoinDate  DATE
);

-- create table: TypeQuestion
DROP DATABASE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
TypeID     INT,
TypeName   VARCHAR(100)
);

-- create table: CategoryQuestion
DROP DATABASE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
CategoryID     INT,
CategoryName   VARCHAR(100)
);

-- create table: Question
DROP DATABASE IF EXISTS Question;
CREATE TABLE Question(
QuestionID INT,
CategoryID INT,
TypeID     INT,
CreatorID  INT,
CreateDate DATE,
Content    VARCHAR(100)
);

-- create table: Answer
DROP DATABASE IF EXISTS Answer;
CREATE TABLE Answer(
AnswerID   INT,
Content    VARCHAR(100),
QuestionID INT,
isCorrect  VARCHAR(10)
);

-- create table: Exam
DROP DATABASE IF EXISTS Exam;
CREATE TABLE Exam(
ExamID       INT,
`Code`       VARCHAR(50),
Title        VARCHAR(100),
CategoryID   INT,
Duration     INT,
CreatorID    INT,
CreateDate   DATE
);

-- create table: ExamQuestion
DROP DATABASE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
ExamID       INT,
QuestionID   INT
);