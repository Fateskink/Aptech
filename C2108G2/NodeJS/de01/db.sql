--//docker run --name mysql-container -p 3307:3306 -e MYSQL_ROOT_PASSWORD=123456 -e MYSQL_DATABASE=studentManagements -d mysql/mysql-server:latest --default-authentication-plugin=mysql_native_password
--mysql --protocol=TCP -h localhost -P 3307 -u root -p
--docker exec -it mysql-container mysql -uroot -p
-- GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;
-- FLUSH PRIVILEGES;

CREATE DATABASE studentManagements;
USE studentManagements;
CREATE TABLE student(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT DEFAULT 18,
    address VARCHAR(500),
    javascore DECIMAL(18, 1),
    csharpscore DECIMAL(18, 1)
);

INSERT INTO student (name, age, address, javascore, csharpscore)
VALUES
    ('Nguyễn Văn A', FLOOR(RAND() * 11), 'Địa chỉ A', ROUND(RAND() * 10, 1), ROUND(RAND() * 10, 1)),
    ('Nguyễn Văn B', FLOOR(RAND() * 11), 'Địa chỉ B', ROUND(RAND() * 10, 1), ROUND(RAND() * 10, 1)),
    ('Nguyễn Văn C', FLOOR(RAND() * 11), 'Địa chỉ C', ROUND(RAND() * 10, 1), ROUND(RAND() * 10, 1)),
    ('Nguyễn Văn D', FLOOR(RAND() * 11), 'Địa chỉ D', ROUND(RAND() * 10, 1), ROUND(RAND() * 10, 1)),
    ('Nguyễn Văn E', FLOOR(RAND() * 11), 'Địa chỉ E', ROUND(RAND() * 10, 1), ROUND(RAND() * 10, 1)),
    ('Nguyễn Văn F', FLOOR(RAND() * 11), 'Địa chỉ F', ROUND(RAND() * 10, 1), ROUND(RAND() * 10, 1)),
    ('Nguyễn Văn G', FLOOR(RAND() * 11), 'Địa chỉ G', ROUND(RAND() * 10, 1), ROUND(RAND() * 10, 1)),
    ('Nguyễn Văn H', FLOOR(RAND() * 11), 'Địa chỉ H', ROUND(RAND() * 10, 1), ROUND(RAND() * 10, 1)),
    ('Nguyễn Văn I', FLOOR(RAND() * 11), 'Địa chỉ I', ROUND(RAND() * 10, 1), ROUND(RAND() * 10, 1)),
    ('Nguyễn Văn J', FLOOR(RAND() * 11), 'Địa chỉ J', ROUND(RAND() * 10, 1), ROUND(RAND() * 10, 1)),
    ('Nguyễn Văn K', FLOOR(RAND() * 11), 'Địa chỉ K', ROUND(RAND() * 10, 1), ROUND(RAND() * 10, 1)),
    ('Nguyễn Văn L', FLOOR(RAND() * 11), 'Địa chỉ L', ROUND(RAND() * 10, 1), ROUND(RAND() * 10, 1)),
    ('Nguyễn Văn M', FLOOR(RAND() * 11), 'Địa chỉ M', ROUND(RAND() * 10, 1), ROUND(RAND() * 10, 1));


