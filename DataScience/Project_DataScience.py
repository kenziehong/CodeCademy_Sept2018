INTRODUCTION TO SQL
Create a Table


CREATE TABLE friends(
  id INTEGER,
  name TEXT,
  birthday DATE
);

INSERT INTO friends(id, name, birthday) 
VALUES(1, "Jane Doe", "1990-05-30");

INSERT INTO friends(id, name, birthday) 
VALUES(2, "BFF One", "1990-02-10");

INSERT INTO friends(id, name, birthday) 
VALUES(3, "BFF Two", "1990-12-12");

UPDATE friends SET name = "Smith" WHERE id =1;

ALTER TABLE friends ADD COLUMN email TEXT;

UPDATE friends SET email = "jane@codecademy.com" WHERE id = 1;

UPDATE friends SET email = "bffone@codecademy.com" WHERE id = 2;

UPDATE friends SET email = "bbftwo@codecademy.com" WHERE id = 3;

DELETE FROM friends WHERE id = 1;

SELECT * FROM friends;

