# 1. User data
CREATE TABLE user (
        user_id INT AUTO_INCREMENT PRIMARY KEY,
        email_id VARCHAR(40) NOT NULL,
        phone_no INT NOT NULL,
        firstname VARCHAR(10) NOT NULL,
        middlename VARCHAR(10),
        lastname VARCHAR(10) NOT NULL,
        user_status 
        user_password VARCHAR(30) NOT NULL);

