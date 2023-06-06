CREATE DATABASE studentManagements;
CREATE TABLE student(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT DEFAULT 18,
    address VARCHAR(500),
    javascore DECIMAL(18, 1),
    csharpscore DECIMAL(18, 1)
);
