-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT		*
FROM 		`Account` a
INNER JOIN	Department d ON d.DepartmentID = a.DepartmentID;

-- Question 2 : Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT		*
FROM 		`Account`
WHERE		CreateDate > '2010/12/20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT		*
FROM		`Account` a
INNER JOIN 	Position p ON a.PositionID = p.PositionID
WHERE		PositionName = 'Dev';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >=1 nhân viên
SELECT			* , COUNT(a.AccountID) AS Nhanvien
FROM 			Department d
INNER JOIN 		`Account` a ON d.DepartmentID = a.DepartmentID
GROUP BY 		d.DepartmentID
HAVING			COUNT(AccountID) >=1 ;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT		cq.CategoryID,cq.CategoryName , COUNT(q.CategoryID) AS 'SoLan'
FROM		CategoryQuestion cq
INNER JOIN 	Question q ON q.CategoryID = cq.CategoryID
GROUP BY	CQ.CategoryID
HAVING 		COUNT(q.CategoryID);

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT		q.Content , COUNT(eq.QuestionID) AS 'SoLan'
FROM		Question q
LEFT JOIN 	ExamQuestion eq ON eq.QuestionID = q.QuestionID
GROUP BY 	q.Content;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT 			g.GroupID , ga.AccountID , COUNT(ga.AccountID) AS 'SoLan'
FROM			groupaccount ga
RIGHT JOIN		`group` g ON  ga.GroupID = g.GroupID
GROUP BY 		g.GroupID , ga.AccountID;

-- Question 10: Tìm chức vụ có ít người nhất( câu này em đag )
SELECT			p.PositionID , p.PositionName	, COUNT(a.PositionID) AS 'SoLuong'
FROM 			Position p
INNER JOIN		`Account` a ON p.PositionID = a.PositionID
GROUP BY		p.PositionID;

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của Question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
SELECT			t.TypeID AS 'ID The Loai' , t.TypeName AS 'Ten The Loai' , q.Content AS 'Noi Dung Cau Hoi', q.CreatorID AS 'ID Nguoi Tao', q.CreateDate AS 'Ngay Tao Cau Hoi', a.Content AS 'Noi Dung Cau Tra Loi'
FROM			Question q
INNER JOIN 		TypeQuestion t ON  t.TypeID = q.TypeID
INNER JOIN		Answer a	   ON  q.QuestionID = a.QuestionID
GROUP BY		t.TypeID , t.TypeName , q.Content, q.CreatorID , q.CreateDate , a.Content;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT			t.TypeName , COUNT(q.TypeID)
FROM			TypeQuestion t
INNER JOIN		Question q ON t.TypeID = q.TypeID
GROUP BY		t.TypeName;

-- Question 14:Lấy ra group không có account nào
SELECT			 g.GroupName
FROM			 `Group` g
LEFT JOIN		 GroupAccount ga ON g.GroupID = ga.GroupID
WHERE			 ga.AccountID	IS NULL;

-- Question 15: Lấy ra group không có account nào
SELECT			*
FROM			 `Group`
WHERE			 GroupID	NOT IN ( SELECT		GroupID
									 FROM 		groupaccount		);

-- Question 16: Lấy ra question không có answer nào
SELECT	*
FROM 	Question
WHERE	QuestionID	NOT IN (SELECT	QuestionID
							  FROM		Answer  	);

-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
SELECT		a.AccountID , a.FullName
FROM 		`account` a
JOIN		GroupAccount ga ON a.AccountID = ga.AccountID
WHERE		ga.GroupID = 1;
		
-- b) Lấy các account thuộc nhóm thứ 2
SELECT		a.AccountID , a.FullName
FROM 		`account` a
JOIN		GroupAccount ga ON a.AccountID = ga.AccountID
WHERE		ga.GroupID = 2;	
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT		a.AccountID , a.FullName
FROM 		`account` a
JOIN		GroupAccount ga ON a.AccountID = ga.AccountID
WHERE		ga.GroupID = 1
UNION
SELECT		a.AccountID , a.FullName
FROM 		`account` a
JOIN		GroupAccount ga ON a.AccountID = ga.AccountID
WHERE		ga.GroupID = 2;

-- Question 18:
-- a) Lấy các group có lớn hơn 5 thành viên
SELECT			G.GroupName , COUNT(1) AS 'SoNhanVien'
FROM 			`Group` g
JOIN			GroupAccount ga ON g.GroupID = ga.GroupID
GROUP BY 		G.GroupName
HAVING 			`SoNhanVien` >= 1;
-- b) Lấy các group có nhỏ hơn 7 thành viên
SELECT			G.GroupName , COUNT(1) AS 'SoNhanVien'
FROM 			`Group` g
JOIN			GroupAccount ga ON g.GroupID = ga.GroupID
GROUP BY 		G.GroupName
HAVING 			`SoNhanVien` <= 1;
-- ) Ghép 2 kết quả từ câu a) và câu b)
SELECT			G.GroupName , COUNT(1) AS 'SoNhanVien'
FROM 			`Group` g
JOIN			GroupAccount ga ON g.GroupID = ga.GroupID
GROUP BY 		G.GroupName
HAVING 			`SoNhanVien` >= 1
UNION
SELECT			G.GroupName , COUNT(1) AS 'SoNhanVien'
FROM 			`Group` g
JOIN			GroupAccount ga ON g.GroupID = ga.GroupID
GROUP BY 		G.GroupName
HAVING 			`SoNhanVien` <= 1;