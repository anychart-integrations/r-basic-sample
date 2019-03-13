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
  CREATE TABLE IF NOT EXISTS web_users_flow (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    from_node VARCHAR(64),
    to_node VARCHAR(64),
    flow_value INT
  );
  SET data_present = (SELECT COUNT(*) FROM web_users_flow);
  IF data_present = 0 THEN
    INSERT INTO web_users_flow (from_node, to_node, flow_value) VALUES
        ('United States','/home', 5546),
        ('United States','/shop', 3647),
        ('United States','/blog', 3124),
        ('United Kingdom', '/home', 897),
        ('United Kingdom', '/shop', 229),
        ('India', '/home', 1100),
        ('India', '/shop', 150),
        ('Canada', '/home', 691),
        ('Canada', '/shop', 316),
        ('Germany', '/home', 473),
        ('Germany', '/shop', 373),
        ('Other', '/home', 3600),
        ('Other', '/shop', 309),
        ('/home', '/about', 2850),
        ('/home', '/contacts', 3802),
        ('/home', '/signup', 1377),
        ('/home', null, 4278),
        ('/shop', '/checkout', 2603),
        ('/shop', '/contacts', 1231),
        ('/shop', '/signup', 1030),
        ('/shop', null, 160),
        ('/blog', '/blog/article', 1804),
        ('/blog', null, 1320),
        ('/about', '/our-team', 850),
        ('/about', '/profile', 1380),
        ('/about', null, 620),
        ('/contacts', '/our-team', 3322),
        ('/contacts', null, 1711),
        ('/signup', '/profile', 1932),
        ('/signup', null, 475),
        ('/checkout', '/order-success', 1106),
        ('/checkout', '/profile', 710),
        ('/checkout', null, 787),
        ('/blog/article', '/blog/next-article', 1320),
        ('/blog/article', null, 484);
  END IF;
END;//
DELIMITER ;
CALL init();
