CREATE DATABASE placement_cell_db;
USE placement_cell_db;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    role ENUM('STUDENT', 'OFFICER') NOT NULL
);

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE,
    enrollment_no VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15),
    branch VARCHAR(50),
    cgpa DECIMAL(4,2),
    passing_year INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
);

CREATE TABLE placement_officers (
    officer_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
);

CREATE TABLE companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    hr_name VARCHAR(100),
    hr_email VARCHAR(100),
    hr_phone VARCHAR(15)
);

CREATE TABLE jobs (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT,
    job_title VARCHAR(100) NOT NULL,
    job_description TEXT,
    salary VARCHAR(50),
    eligibility_cgpa DECIMAL(3,2),
    last_date DATE,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
        ON DELETE CASCADE
);

CREATE TABLE applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    job_id INT,
    application_date DATE,
    status ENUM('APPLIED', 'SELECTED', 'REJECTED') DEFAULT 'APPLIED',
    FOREIGN KEY (student_id) REFERENCES students(student_id)
        ON DELETE CASCADE,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
        ON DELETE CASCADE,
    UNIQUE (student_id, job_id)
);





INSERT INTO users (username, password, role) VALUES
('admin', 'admin123', 'OFFICER'),
('rahul', 'rahul123', 'STUDENT'),
('jay', 'jay123', 'STUDENT');

INSERT INTO placement_officers (user_id, name, email, phone)
VALUES (1, 'Amit Sharma', 'amit.sharma@college.edu.in', '9876543210');

INSERT INTO students 
(user_id, enrollment_no, name, email, phone, branch, cgpa, passing_year)
VALUES
(2, 'IT2023001', 'Rahul Patel', 'rahul.patel@gmail.com', '9123456780', 'IT', 8.20, 2026),
(3, 'IT2023002', 'Jay Desai', 'jay.desai@gmail.com', '9012345678', 'IT', 8.65, 2026);

INSERT INTO companies 
(company_name, location, hr_name, hr_email, hr_phone)
VALUES
('Tata Consultancy Services', 'Ahmedabad, Gujarat', 
 'Neha Verma', 'neha.verma@tcs.com', '9898989898');

