-- 1. Create a user data_analyst
-- 2. Grant permissions only to SELECT, UPDATE and DELETE to all sakila tables to it.
-- 3. Login with this user and try to create a table. Show the result of that operation.
-- 4. Try to update a title of a film. Write the update script.
-- 5. With root or any admin user revoke the UPDATE permission. Write the command
-- 6. Login again with data_analyst and try again the update done in step 4. Show the result


-- ------------------- 1 ------------------------------
CREATE USER "data_analyst"@"localhost" IDENTIFIED BY "VictoriaII";


-- ------------------- 2 ------------------------------
GRANT SELECT, UPDATE, DELETE ON sakila.* TO "data_analyst"@"localhost";


-- ------------------- 3 ------------------------------
-- i tried to create a table like this:
USE sakila;

CREATE TABLE pantuflas (
  id INT NOT NULL PRIMARY KEY
);

-- and resulted in this error:
-- ERROR 1142 (42000): CREATE command denied to user 'data_analyst'@'localhost' for table 'pantuflas'


-- ------------------- 4 ------------------------------
-- no problem when updating the title of a film
-- mysql> UPDATE film
--     ->    SET title = "ACADEMY DINOSAUR UPDATED"
--     ->  WHERE film_id = 1;

-- Query OK, 1 row affected (0.01 sec)
-- Rows matched: 1  Changed: 1  Warnings: 0




-- ------------------- 5 ------------------------------
-- i used root and this query:
REVOKE UPDATE ON sakila.* FROM "data_analyst"@"localhost";
-- the result:
-- mysql> REVOKE UPDATE ON sakila.* FROM "data_analyst"@"localhost";
-- Query OK, 0 rows affected, 1 warning (0.00 sec)


-- ------------------- 6 ------------------------------
-- mysql> USE sakila;
-- Reading table information for completion of table and column names
-- You can turn off this feature to get a quicker startup with -A

-- Database changed
-- mysql> 
-- mysql> UPDATE film
--     ->    SET title = "ACADEMY DINOSAUR UPDATED AGAIN"
--     ->  WHERE film_id = 1;
-- ERROR 1142 (42000): UPDATE command denied to user 'data_analyst'@'localhost' for table 'film'
-- mysql> 



-- the result is the same as before, but this time regarding to the UPDATE command and not the CREATE one
-- ERROR 1142 (42000): UPDATE command denied to user 'data_analyst'@'localhost' for table 'film'



