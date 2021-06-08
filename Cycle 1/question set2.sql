CREATE TABLE STUDENT
(
SID INT,
Name VARCHAR(30),
DOB date,
Physics INT,
Chemistry INT,
Maths INT
);
INSERT INTO STUDENT VALUES (1,'Anju','2000-01-13',60,70,80),(2,'Bob','1997-02-11',70,75,80),(3,'Chinnu','1999-05-10',80,70,90),
(4,'David','1998-07-02',70,75,65),(5,'Emy','2002-10-20',40,70,90);
Select * from STUDENT;
select SID,Name from STUDENT where DOB=(select max(DOB) from STUDENT);
select * from STUDENT where maths >=40 and (physics >=40 or chemistry >=40);
alter table STUDENT add total int;
alter table STUDENT add average float(10,3);
describe STUDENT;
select name from STUDENT where maths=(select max(maths) from STUDENT);

select name from STUDENT where chemistry=(select min(chemistry) from STUDENT);
update STUDENT set total=physics+chemistry+maths;
Select * from STUDENT;
SELECT * FROM STUDENT ORDER BY total desc;
ALTER TABLE STUDENT RENAME COLUMN average TO avg_mark;
SELECT * FROM STUDENT;
UPDATE STUDENT SET avg_mark=total/3;
SELECT AVG(avg_mark) AS overall_average FROM STUDENT;
SELECT * from STUDENT where avg_mark>( SELECT AVG(avg_mark) AS overall_average FROM STUDENT);
SELECT Count(SID) from STUDENT where avg_mark>( SELECT AVG(avg_mark) AS overall_average FROM STUDENT);
