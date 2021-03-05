-- Question 2
SELECT 		*
FROM		Department
;
-- Question 3
SELECT 		*
FROM 		Department
WHERE 		DepartmentName LIKE 'sale'
;

-- Question 4
SELECT 		*
FROM 		`Account`
WHERE		length(Fullname) = (	SELECT max(length(FullName)) 
									FROM `Account`)
;

-- Question 5
SELECT 		* 
FROM 		`Account` 
WHERE 		length(Fullname) = (	SELECT 	max( length(Fullname)) 
									FROM 	`Account`
									WHERE 	DepartmentID = 3)
;

-- Question 6
SELECT 		*
FROM 		`group`
WHERE		CreateDate < '2019/12/20'
;

-- Question 7
SELECT 		*
FROM 		Answer
GROUP BY 	QuestionID
HAVING 		COUNT(QuestionID) >= 4;

-- Question 8
SELECT 		*
FROM 		Exam
WHERE		Duration >= '60' AND Createdate < '2019/12/20'
;

-- Question 9
SELECT 		*
FROM 		`Group`
ORDER BY	CreateDate DESC LIMIT 5
;

-- Question 10
SELECT 		COUNT(DepartmentID)
FROM		Department
WHERE		DepartmentID = 2
;

-- Question 11
SELECT 		*
FROM 		`Account`
WHERE 		FullName LIKE 'V%n'
;

-- Question 12
DELETE
FROM 	Examquestion
WHERE	ExamID 	IN  (SELECT 	ExamID
					FROM 	Exam
                    WHERE	CreateDate < '20/12/2019'
);
DELETE
FROM 	exam
WHERE	CreateDate < '20/12/2019'
;

-- Question 13 (Em chưa biết làm câu này)
DELETE
FROM 		Categoryquestion
WHERE		Content LIKE ("câu hỏi%");

DELETE 		
FROM		Question
WHERE		Content LIKE ("câu hỏi%")
;

-- Question 14
UPDATE		`account`
SET 		FullName = 'Nguyễn Bá Lộc' ,email 	 = 'loc.nguyenba@vti.com.vn'
WHERE		AccountID = 5
;

-- Question 15
UPDATE 		`Account`
SET 		 GroupID =4
WHERE		 AcountID =5
;