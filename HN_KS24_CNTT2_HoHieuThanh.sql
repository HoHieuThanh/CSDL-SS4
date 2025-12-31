-- CREATE DATABASE mini_PJ;
-- USE mini_PJ;

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    full_name  VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
	credit INT NOT NULL CHECK (credit > 0)
);

CREATE TABLE Enrollment (
    student_id INT,
    course_id INT,
    gradle DECIMAL(4,2) NOT NULL CHECK (gradle BETWEEN 0 AND 10) DEFAULT (0),

    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id) 
);

INSERT INTO Student VALUES
    (1, 'Nguyễn Văn A', 'a@gmail.com', '0111111111'),
    (2, 'Trần Thị B', 'b@gmail.com', '0222222222'),
    (3, 'Lê Văn C', 'c@gmail.com', '0333333333'),
    (4, 'Phạm Thị D', 'd@gmail.com', '0444444444'),
    (5, 'Hoàng Văn E', 'e@gmail.com', '05555555555');
    
INSERT INTO Course VALUES
   (1, 'Cơ sở dữ liệu', 1),
   (2, 'Lập trình Java', 2),
   (3, 'Cấu trúc dữ liệu', 3),
   (4, 'Web cơ bản', 4),
   (101, 'Python cơ bản', 5);
   
INSERT INTO Enrollment VALUES
   (1, 1, 4.5),
   (1, 2, 7.0),
   (2, 3, 7.5),
   (3, 4, 8.0),
   (4, 101, 8.5);
   
UPDATE Enrollment
SET gradle = 9.0
WHERE student_id = 2
 AND course_id = 3;
 
SELECT full_name, email, phone FROM Student;

DELETE FROM Course
WHERE course_id = 101;
-- không xóa được bới vì id khóa học đã bị ràng buộc trong bảng Enrollment