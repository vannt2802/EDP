-- create database
DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1; 

CREATE TABLE Department(
 DepartmentID 		TINYINT UNSIGNED PRIMARY KEY,
 DepartmentName 	NVARCHAR(100) UNIQUE 
);

CREATE TABLE Position (
	PositionID 		TINYINT UNSIGNED PRIMARY KEY,
    PositionName	ENUM ('Dev' , 'Test' , 'Scrum Master' , 'PM')
);

CREATE TABLE `Account`(
	AccountID 		TINYINT UNSIGNED PRIMARY KEY,
	Email 			VARCHAR(50) UNIQUE KEY,
    Username 		VARCHAR(50) UNIQUE KEY NOT NULL CHECK (length( Username) >=5),
    FullName 		VARCHAR(50) NOT NULL CHECK (length(FullName) >=5),
    DepartmentID	TINYINT UNSIGNED DEFAULT(1),
    PositionID 		TINYINT UNSIGNED DEFAULT(1),
    CreateDate 		DATETIME DEFAULT NOW(),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE `Group` (
	GroupID 		TINYINT UNSIGNED PRIMARY KEY,
	GroupName 		VARCHAR(100),
	CreatorID 		TINYINT UNSIGNED,
    CreateDate		DATETIME DEFAULT NOW(),
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
    TypeID			INT UNSIGNED,
    CreatorID 		TINYINT UNSIGNED,
    CreateDate 		DATETIME DEFAULT NOW(),
FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID)
);

CREATE TABLE Answer (
	AnswerID 		INT UNSIGNED PRIMARY KEY,
    Content 		VARCHAR(100),
    QuestionID 		INT UNSIGNED UNIQUE KEY,
	isCorrect 		ENUM ('true' , 'false'),
FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);

CREATE TABLE Exam (
	ExamID 		TINYINT UNSIGNED PRIMARY KEY,
	`Code` 		INT UNSIGNED NOT NULL CHECK (length(`Code`) >=2),
    Title 		VARCHAR(100),
    CategoryID 	INT UNSIGNED,
    Duration 	INT UNSIGNED,
    CreatorID 	TINYINT UNSIGNED,
    CreateDate 	DATETIME DEFAULT NOW(),
FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID)
);

CREATE TABLE ExamQuestion (
	ExamID 		TINYINT UNSIGNED PRIMARY KEY,
	QuestionID	INT UNSIGNED UNIQUE KEY,
FOREIGN KEY (ExamID) REFERENCES Exam (ExamID)
);

-- Add data Deparment
INSERT INTO Department(DepartmentID,DepartmentName)
VALUE 
			(1, N'Marketing'	),
            (2, N'Sale'			),
            (3, N'Security'		),
            (4, N'Nhân sự'		),
            (5, N'Kỹ thuật'		),
            (6, N'Tài chính'	),
            (7, N'Phó giám đốc'	),
            (8, N'CEO'			),
            (9, N'Thư kí'		),		
            (10, N'Bán hàng'	);

INSERT INTO Position (PositionID,PositionName)
VALUE 
			(1,'Dev'			),
            (2,'Test'			),
            (3,'Scrum Master'	),
            (4,'PM'				);

		
INSERT INTO `Account` (AccountID,Email						,Username,FullName,DepartmentID,PositionID,CreateDate)
VALUE 
			(1,		 		'vannthe151384@fpt.edu.vn'	,'nguyenthevan'	  	,N'Nguyễn Thế Văn'	,10,2,'2021/02/22 12:00:57'	),
            (2, 			'anhtthe151380@fpt.edu.vn'	,'trananhthaibinh'	,N'Trần Tuấn Anh'	,9,3 ,'2021/02/22 13:10:32'	),
            (3, 			'duynt001@gmail.com'		,'trongduy01'		,N'Nguyễn Trọng Duy',8,4 ,'2021/02/23 14:20:43'	),
            (4, 			'duynn03@gmail.com'			,'duynn03'			,N'Nguyễn Ngọc Duy'	,7,6 ,'2021/02/23 15:30:36' ),
            (5, 			'lanvu262003@gmail.com'		,'vumailan'			,N'Vũ Mai Lan'		,6,5 ,'2021/02/24 16:40:18'  ),
            (6,			 	'thanhhoahoalac@gmail.com'	,'thanhhoa'			,N'Nguyễn Thanh Hóa',5,7 ,'2021/02/24 17:50:00'	),
            (7, 			'phamdat001@gmail.com'		,'datgirl'			,N'Phạm Tuấn Đạt'	,4,8 ,'2021/02/25 18:00:05'	),
            (8, 			'huytq02@gmail.com'			,'huytran'			,N'Trần Quang Huy'	,3,1 ,'2021/02/25 19:10:21'	),
            (9, 			'hieuhoang123@gmail.com'	,'hieucute'			,N'Hoàng Trọng Hiếu',2,10,'2021/02/26 20:20:34'	),
            (10,			'tieptiton001@gmail.com'	,'tiepminer'		,N'Nguyễn Minh Tiệp',1,19,'2021/02/26 21:30:54'	);
	
    INSERT INTO `Group` (GroupID,GroupName,CreatorID,CreateDate)
    VALUE
			(1, N'Nhóm 10'	,1	,'2021/02/22 01:00:20'	),
            (2, N'Nhóm 9'	,2	,'2021/02/22 02:11:01'	),
            (3, N'Nhóm 8'	,3	,'2021/02/23 03:20:10'	),
            (4, N'Nhóm 7'	,4	,'2021/02/23 04:30:34'	),
            (5, N'Nhóm 6'	,5	,'2021/02/24 05:40:40'	),
            (6, N'Nhóm 5'	,6	,'2021/02/24 06:50:12'	),
            (7, N'Nhóm 4'	,7	,'2021/02/25 07:00:43'	),
            (8, N'Nhóm 3'	,8	,'2021/02/25 08:10:23'	),
            (9, N'Nhóm 2'	,9	,'2021/02/26 09:40:15'	),
            (10,N'Nhóm 1'	,10	,'2021/02/26 10:50:09'	);
            
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate)
VALUE
			(1, 9	,'2021/02/22'		),
            (2, 8	,'2021/02/22'		),
            (3, 7	,'2021/02/23'		),
            (4, 6	,'2021/02/23'		),
            (5, 4	,'2021/02/24'		),
            (6, 5	,'2021/02/24'	),
            (7, 3	,'2021/02/25'		),
            (8,	2	,'2021/02/25'		),
            (9, 10	,'2021/02/26'		),
            (10,1   ,'2021/02/26'		);
            
INSERT INTO TypeQuestion (TypeID,TypeName)
VALUE
			(1, N'Essay'					),
            (2, N'Multiple-Choice'			),
            (3, N'Essay'					),
            (4, N'Multiple-Choice'			),
            (5, N'Essay'					);
            
INSERT INTO CategoryQuestion (CategoryID,CategoryName)
VALUE
			(1, 'Java'				),
            (2, 'C++'				),
            (3, 'Database'			),
            (4, 'SSL'				),
            (5, 'CEA'				);
            
INSERT INTO Question (QuestionID,Content,CategoryID,TypeID,CreatorID,CreateDate)
VALUE
			(1, N'Câu hỏi 1',1,0,100,'2021/02/22 02:11:28'			),
            (2, N'Câu hỏi 2',2,1,110,'2021/02/23 03:12:02'			),
            (3, N'Câu hỏi 3',3,0,120,'2021/02/24 04:13:20'			),
            (4, N'Câu hỏi 4',4,1,130,'2021/02/25 05:14:01'			),
            (5, N'Câu hỏi 5',5,0,140,'2021/02/26 06:15:30'			);
            
INSERT INTO Answer (AnswerID,Content,QuestionID,isCorrect)
VALUE
			(1,'Rep 1',1,'True'				),
            (2,'Rep 2',2,'False'			),
            (3,'Rep 3',3,'True'				),
            (4,'Rep 4',4,'False'			),
            (5,'Rep 5',5,'True'				);
            
INSERT INTO ExaM (ExamID,`Code`,Title,CategoryID,Duration, CreatorID,Createdate)
VALUE
			(1,2020, N'Tiếng Anh giao tiếp',1,30,11,'2021/02/22 07:16:20'	),
			(2,2021, N'Tiếng Anh nghe',2,60,12,'2021/02/23 08:17:18'			),
            (3,2022, N'Tiếng Anh đọc',3,90,13,'2021/02/24 09:18:14'			),
            (4,2023, N'Tiếng Anh viết',4,90,14,'2021/02/25 10:19:13'			),
            (5,2024, N'Tiếng Anh trắc nghiệm',5,120,15,'2021/02/26 11:20:12'	);
            
INSERT INTO ExamQuestion (ExamID,QuestionID)
VALUE
			(1,151380			),
            (2,151381			),
            (3,151382			),
            (4,151383			),
            (5,151384			);