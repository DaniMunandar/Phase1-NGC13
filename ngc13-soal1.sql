-- creat table database
CREATE TABLE siswa (
    id_siswa INT PRIMARY KEY,
    nama VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    jurusan VARCHAR(50),
    tahun_studi INT
);

CREATE TABLE kursus (
    course_id INT PRIMARY KEY,
    judul VARCHAR(255) NOT NULL,
    instruktur VARCHAR(255),
    jadwal VARCHAR(100),
    kredit_jam INT
);

CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    jadwal_pilihan VARCHAR(100),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES siswa(id_siswa),
    FOREIGN KEY (course_id) REFERENCES kursus(course_id)
);

--insert data pada table databse
-- Memasukkan data siswa
INSERT INTO siswa (id_siswa, nama, email, jurusan, tahun_studi)
VALUES
    (1, 'Budi ', 'budi@example.com', 'Teknik Informatika', 2),
    (2, 'Rano', 'rano@example.com', 'Manajemen Bisnis', 3),
    (3, 'Yogi', 'yogi@example.com', 'Kedokteran', 1),
    (4, 'Andrean', 'andrean@example.com', 'Psikologi', 4),
    (5, 'Mika', 'mika@example.com', 'Kimia', 2);

-- Memasukkan data kursus
INSERT INTO kursus (course_id, judul, instruktur, jadwal, kredit_jam)
VALUES
    (101, 'Pemrograman Java', 'Prof. Peter', 'Senin 08:00-10:00', 3),
    (102, 'Manajemen Keuangan', 'Dr. Indra', 'Selasa 14:00-16:00', 3),
    (103, 'Biologi Sel', 'Prof. Kusuma', 'Rabu 10:00-12:00', 4),
    (104, 'Psikologi Kognitif', 'Dr. Sami', 'Kamis 09:00-11:00', 3),
    (105, 'Kimia Organik', 'Prof. Ayuni', 'Jumat 13:00-15:00', 4);

-- Mendaftarkan siswa ke beberapa kursus dengan jadwal pilihan
INSERT INTO student_courses (student_id, course_id, jadwal_pilihan)
VALUES
    (1, 101, 'Senin 08:00-10:00'),
    (1, 102, 'Selasa 14:00-16:00'),
    (2, 101, 'Senin 08:00-10:00'),
    (3, 103, 'Rabu 10:00-12:00'),
    (4, 104, 'Kamis 09:00-11:00'),
    (4, 105, 'Jumat 13:00-15:00');


-- A. Ambil daftar semua siswa yang terdaftar dalam kursus tertentu (misalnya, kursus dengan ID 101):
SELECT s.nama
FROM siswa s
JOIN student_courses sc ON s.id_siswa = sc.student_id
WHERE sc.course_id = 101;


-- B. Temukan semua kursus yang telah didaftarkan oleh siswa tertentu (misalnya, siswa dengan ID 1):
SELECT k.judul
FROM kursus k
JOIN student_courses sc ON k.course_id = sc.course_id
WHERE sc.student_id = 1;

-- Dapatkan jadwal pilihan siswa untuk kursus tertentu (misalnya, siswa dengan ID 1 dan kursus dengan ID 101):
SELECT sc.jadwal_pilihan
FROM student_courses sc
WHERE sc.student_id = 1 AND sc.course_id = 101;
