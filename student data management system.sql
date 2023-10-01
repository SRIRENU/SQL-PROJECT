CREATE TABLE students (
 student_id INT PRIMARY KEY,
 name VARCHAR(50),
 date_of_birth DATE,
 address VARCHAR(100),
 contact_number VARCHAR(15)
);


CREATE TABLE courses (
 course_id INT PRIMARY KEY,
 name VARCHAR(50),
 description VARCHAR(200),
 credits INT
);


CREATE TABLE grades (
 student_id INT,
 course_id INT,
 grade FLOAT,
 PRIMARY KEY (student_id, course_id),
 FOREIGN KEY (student_id) REFERENCES students(student_id),
 FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE enrollments (
 student_id INT,
 course_id INT,
 enrollment_date DATE,
 PRIMARY KEY (student_id, course_id),
 FOREIGN KEY (student_id) REFERENCES students(student_id),
 FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

Add a new student to the database:
INSERT INTO students (student_id, name, date_of_birth, address, contact_number)
VALUES (1, 'John Doe', '1995-07-15', '123 Main Street', '555-1234');
Retrieve student information:
SELECT * FROM students WHERE student_id = 1;
Course Management:
Add a new course to the database:
INSERT INTO courses (course_id, name, description, credits)
VALUES (101, 'Mathematics', 'Introduction to Calculus', 3);
Retrieve course information:
SELECT * FROM courses WHERE course_id = 101;
Grade Management:
Record a student's grade for a specific course:
INSERT INTO grades (student_id, course_id, grade)
VALUES (1, 101, 85.5);
Update a student's grade for a course:
UPDATE grades SET grade = 90.0 WHERE student_id = 1 AND course_id = 101;
Enrollment Management:
Enroll a student in a course:
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES (1, 101, '2023-01-01');
Retrieve enrolled courses for a student:
SELECT courses.* FROM courses
JOIN enrollments ON courses.course_id = enrollments.course_id
WHERE enrollments.student_id = 1;
Calculate average grade for a student:
SELECT AVG(grade) FROM grades WHERE student_id = 1;
Display top-performing students:
SELECT students.*, AVG(grades.grade) AS average_grade
FROM students
JOIN grades ON students.student_id = grades.student_id
GROUP BY students.student_id
ORDER BY average_grade DESC
LIMIT 10;
