CREATE DATABASE IF NOT EXISTS anychart_db;
USE anychart_db;
DROP PROCEDURE IF EXISTS init;
DELIMITER //
CREATE PROCEDURE init ()
LANGUAGE SQL
BEGIN
  DECLARE user_exist, data_present INT;
  SET user_exist = (SELECT EXISTS (SELECT DISTINCT user FROM mysql.user WHERE user = "anychart_user"));
  IF user_exist = 0 THEN
    CREATE USER 'anychart_user'@'localhost' IDENTIFIED BY 'anychart_pass';
    GRANT ALL PRIVILEGES ON anychart_db.* TO 'anychart_user'@'localhost';
    FLUSH PRIVILEGES;
  END IF;
  CREATE TABLE IF NOT EXISTS students (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    year INT,
    value INT
  );
  SET data_present = (SELECT COUNT(*) FROM students);
  IF data_present = 0 THEN
    INSERT INTO students (year, value) VALUES
      (2002, 4.04),
      (2003, 4.02),
      (2004, 3.93),
      (2005, 3.64),
      (2006, 3.14),
      (2007, 2.60),
      (2008, 2.9),
      (2009, 2.4),
      (2010, 2.13),
      (2011, 2.04),
      (2012, 2.7),
      (2013, 2.82),
      (2014, 2.34),
      (2015, 2.9),
      (2016, 3.07);
  END IF;
END;//
DELIMITER ;
CALL init();
