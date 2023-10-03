-- 1. Create the entities (tables)
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

CREATE TABLE Professor (
    professor_id INT PRIMARY KEY,
    professor_name VARCHAR(100)
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_title VARCHAR(200),
    max_capacity INT
);

CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE TeachingAssignment (
    assignment_id INT PRIMARY KEY,
    professor_id INT,
    course_id INT,
    start_date DATE,
    FOREIGN KEY (professor_id) REFERENCES Professor(professor_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- 2. Insert sample data into tables
-- Insert sample students
INSERT INTO Student (student_id, student_name) 
VALUES
    (1, 'Bimo Setiawan'),
    (2, 'Andy Young'),
    (3, 'Bambang Susanto');

-- Insert sample professors
INSERT INTO Professor (professor_id, professor_name) 
VALUES
    (101, 'Professor Wicaksono'),
    (102, 'Professor Subandi'),
    (103, 'Professor Trisumono'),
    (104, 'Professor Andiwijaya'),
    (105, 'Professor Adrianto');

-- Insert sample courses
INSERT INTO Course (course_id, course_title, max_capacity) 
VALUES
    (201, 'Introduction to Programming', 50),
    (202, 'Database Management', 40),
    (203, 'Data Structures and Algorithms', 60),
    (204, 'Artificial Intelligence', 45),
    (205, 'Web Development', 55);

-- 3. Kueri SQL untuk menjawab pertanyaan
-- A. Daftar siswa yang terdaftar dalam kursus tertentu
SELECT S.student_name
FROM Student S
JOIN Enrollment E ON S.student_id = E.student_id
WHERE E.course_id = 201; -- Ganti 201 dengan course_id yang diinginkan

-- B. Daftar mata kuliah yang diajarkan oleh profesor tertentu
SELECT C.course_title
FROM Course C
JOIN TeachingAssignment TA ON C.course_id = TA.course_id
JOIN Professor P ON P.professor_id = TA.professor_id
WHERE P.professor_name = 'Professor Trisumono'; -- Ganti dengan nama_profesor yang diinginkan

-- C. Daftar profesor yang mengajar mata kuliah tertentu
SELECT P.professor_name
FROM Professor P
JOIN TeachingAssignment TA ON P.professor_id = TA.professor_id
JOIN Course C ON C.course_id = TA.course_id
WHERE C.course_title = 'Database Management'; -- Ganti dengan judul_kursus yang diinginkane
