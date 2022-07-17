drop table Student
drop table Course
drop table GradeDetail
drop table Study

drop table Lecture
drop table [Group]
drop table Enroll
drop table TimeSlot
drop table Assessment

--1

create table Student(
[Sid] varchar(10) primary key,
SurName varchar(10),
MiddleName varchar(10),
GivenName varchar(10),
)

--2
create table Lecture(
Lid varchar(10) primary key,
Campus varchar(10)
)

--3
create table Course(
Suid varchar(10) primary key,
StartDate date,
EndDate date
)

--4
create table TimeSlot(
SlotNumber int primary key identity,
[start] varchar(10),
[end] varchar(10)
)

--5
create table [Group](
Gname varchar(10),
Lid varchar(10),
Suid varchar(10),
primary key (Gname,Lid,Suid),
foreign key (Lid) references Lecture(Lid),
foreign key (Suid) references Course(Suid),
)

--6
create table Study(
[Sid] varchar(10),
Suid varchar(10),
AverageGrade float,
[Status] int,
Primary key (Suid,[Sid]),
foreign key (Suid) references Course(Suid),
foreign key ([Sid]) references Student([Sid]),
)

--7


create table GradeDetail(
[Sid] varchar(10),
Suid varchar(10),
GradeCategory varchar(20),
[Weight] int,
[Value] float,
Primary key (Suid,[Sid],GradeCategory),
foreign key (Suid,[Sid]) references Study(Suid,[Sid]),
check ([Weight]> 0 and [Weight] < 100),
check ([Value]> 0 and [Value] < 10)
)

---8
create table Enroll(
[Sid] varchar(10),
Gname varchar(10),
Lid varchar(10),
Suid varchar(10),
Primary key (Gname,[Sid],Lid,Suid),
foreign key (Gname,Lid,Suid) references [Group](Gname,Lid,Suid),
foreign key ([Sid]) references Student([Sid]),
)

---9
create table Assessment(
[Sid] varchar(10),
Suid varchar(10),
GradeCategory varchar(20),
Duration varchar(20),
Note varchar(500),
[Type] varchar(10),
[Weight] int,
part int,
Primary key (Suid,[Sid],GradeCategory),
foreign key (Suid,[Sid],GradeCategory) references GradeDetail(Suid,[Sid],GradeCategory),
check ([Weight]>0 and [Weight]<100)
)

---insert data---
--1
insert Student([Sid],SurName,MiddleName,GivenName) values
('HE161275','Vu','Xuan','Truong'),
('HE163283','Nguyen','Hoang','Hieu'),
('HE161102','Ta','Viet','Hoang'),
('HE160176','Hoang','The','Anh'),
('HE160866','Vu','Duc','Huy'),
('HE161277','Nguyen','Manh','Truong'),
('HE162384','Nguyen','Van','Kien'),
('HE162601','Le','Van','Xuan'),
('HE160896','Hoang','Manh','Tuan'),
('HE163086','Nguyen','Duc','Huy')

--2
insert Lecture(Lid,Campus)
values
('sonnt5','HL'),
('caupd','HL'),
('anhdt','HL'),
('huyentt','HL')

--3
insert Course(Suid,StartDate,EndDate)
values
('DBI202','2022-05-12','2022-8-2'),
('CSD201','2022-05-12','2022-8-2'),
('LAB211','2022-05-12','2022-8-2'),
('JPD113','2022-05-12','2022-8-2')

--4
insert TimeSlot([start],[end])
values
('7:30','9:00'),
('9:10','10:40'),
('10:50','12:20')

--5
insert [Group](Gname,Lid,Suid)
values
('SE1647','sonnt5','DBI202'),
('SE1647','caupd','CSD201'),
('SE1647','anhdt','LAB211'),
('SE1647','huyentt','JPD113')

--6
insert Study([Sid],Suid,AverageGrade,[Status])
values
('HE161275','DBI202',7.5,0),
('HE163283','DBI202',7.5,1),
('HE161102','DBI202',6,1),
('HE160176','DBI202',4.5,1),
('HE160866','DBI202',6.0,1),
('HE161277','DBI202',7,0),
('HE162384','DBI202',7.2,0),
('HE162601','DBI202',6.8,1),
('HE160896','DBI202',7.5,0),
('HE163086','DBI202',8,0),

('HE161275','CSD201',7.7,1),
('HE163283','CSD201',7,1),
('HE161102','CSD201',6,1),
('HE160176','CSD201',5.5,1),
('HE160866','CSD201',6.0,1),
('HE161277','CSD201',7,0),
('HE162384','CSD201',7.2,0),
('HE162601','CSD201',4.5,1),
('HE160896','CSD201',7.5,0),
('HE163086','CSD201',8,0),

('HE161275','JPD113',8.5,1),
('HE163283','JPD113',6.5,1),
('HE161102','JPD113',8,1),
('HE160176','JPD113',7.5,1),
('HE160866','JPD113',5.0,1),
('HE161277','JPD113',8,0),
('HE162384','JPD113',7.2,0),
('HE162601','JPD113',6.8,1),
('HE160896','JPD113',7.5,0),
('HE163086','JPD113',7.5,0)


--7
insert GradeDetail(Suid,[Sid],GradeCategory,[Weight],[Value])
values

('DBI202','HE161275','Lab 1',2,6.5),
('DBI202','HE163283','Lab 1',2,7.5),
('DBI202','HE161102','Lab 1',2,5.5),
('DBI202','HE160176','Lab 1',2,3),
('DBI202','HE160866','Lab 1',2,5),
('DBI202','HE161277','Lab 1',2,7),
('DBI202','HE162384','Lab 1',2,8),
('DBI202','HE162601','Lab 1',2,7),
('DBI202','HE160896','Lab 1',2,8),
('DBI202','HE163086','Lab 1',2,7.5),

('DBI202','HE161275','Lab 2',2,7.5),
('DBI202','HE163283','Lab 2',2,7.5),
('DBI202','HE161102','Lab 2',2,4.5),
('DBI202','HE160176','Lab 2',2,6),
('DBI202','HE160866','Lab 2',2,8),
('DBI202','HE161277','Lab 2',2,7),
('DBI202','HE162384','Lab 2',2,7),
('DBI202','HE162601','Lab 2',2,6),
('DBI202','HE160896','Lab 2',2,8),
('DBI202','HE163086','Lab 2',2,7.5),

('DBI202','HE161275','Lab 3',2,8.5),
('DBI202','HE163283','Lab 3',2,8.5),
('DBI202','HE161102','Lab 3',2,6.5),
('DBI202','HE160176','Lab 3',2,5),
('DBI202','HE160866','Lab 3',2,7),
('DBI202','HE161277','Lab 3',2,7),
('DBI202','HE162384','Lab 3',2,8),
('DBI202','HE162601','Lab 3',2,9),
('DBI202','HE160896','Lab 3',2,6),
('DBI202','HE163086','Lab 3',2,7.5),

('DBI202','HE161275','Lab 4',2,4.5),
('DBI202','HE163283','Lab 4',2,7.5),
('DBI202','HE161102','Lab 4',2,8.5),
('DBI202','HE160176','Lab 4',2,9),
('DBI202','HE160866','Lab 4',2,5),
('DBI202','HE161277','Lab 4',2,3),
('DBI202','HE162384','Lab 4',2,8),
('DBI202','HE162601','Lab 4',2,4),
('DBI202','HE160896','Lab 4',2,4),
('DBI202','HE163086','Lab 4',2,6.5),

('DBI202','HE161275','Lab 5',2,6.5),
('DBI202','HE163283','Lab 5',2,7.5),
('DBI202','HE161102','Lab 5',2,5.5),
('DBI202','HE160176','Lab 5',2,3),
('DBI202','HE160866','Lab 5',2,5),
('DBI202','HE161277','Lab 5',2,7),
('DBI202','HE162384','Lab 5',2,8),
('DBI202','HE162601','Lab 5',2,7),
('DBI202','HE160896','Lab 5',2,8),
('DBI202','HE163086','Lab 5',2,7.5),

('DBI202','HE161275','Progress Test 1',5,6.5),
('DBI202','HE163283','Progress Test 1',5,7.5),
('DBI202','HE161102','Progress Test 1',5,7.5),
('DBI202','HE160176','Progress Test 1',5,7),
('DBI202','HE160866','Progress Test 1',5,6),
('DBI202','HE161277','Progress Test 1',5,7),
('DBI202','HE162384','Progress Test 1',5,9),
('DBI202','HE162601','Progress Test 1',5,7),
('DBI202','HE160896','Progress Test 1',5,8.5),
('DBI202','HE163086','Progress Test 1',5,8.5),

('DBI202','HE161275','Progress Test 2',5,7.5),
('DBI202','HE163283','Progress Test 2',5,7.5),
('DBI202','HE161102','Progress Test 2',5,5.5),
('DBI202','HE160176','Progress Test 2',5,4),
('DBI202','HE160866','Progress Test 2',5,5),
('DBI202','HE161277','Progress Test 2',5,7),
('DBI202','HE162384','Progress Test 2',5,7),
('DBI202','HE162601','Progress Test 2',5,7),
('DBI202','HE160896','Progress Test 2',5,9),
('DBI202','HE163086','Progress Test 2',5,9.5),



('DBI202','HE161275','ASSIGNMENT',20,7.5),
('DBI202','HE163283','ASSIGNMENT',20,8.5),
('DBI202','HE161102','ASSIGNMENT',20,6.5),
('DBI202','HE160176','ASSIGNMENT',20,5),
('DBI202','HE160866','ASSIGNMENT',20,5),
('DBI202','HE161277','ASSIGNMENT',20,7),
('DBI202','HE162384','ASSIGNMENT',20,7),
('DBI202','HE162601','ASSIGNMENT',20,7),
('DBI202','HE160896','ASSIGNMENT',20,8),
('DBI202','HE163086','ASSIGNMENT',20,4.5),

('DBI202','HE161275','Practical Exam',30,7.5),
('DBI202','HE163283','Practical Exam',30,7.5),
('DBI202','HE161102','Practical Exam',30,5),
('DBI202','HE160176','Practical Exam',30,4),
('DBI202','HE160866','Practical Exam',30,5),
('DBI202','HE161277','Practical Exam',30,7),
('DBI202','HE162384','Practical Exam',30,8),
('DBI202','HE162601','Practical Exam',30,7),
('DBI202','HE160896','Practical Exam',30,8),
('DBI202','HE163086','Practical Exam',30,7.5),

('DBI202','HE161275','Final Exam',30,7),
('DBI202','HE163283','Final Exam',30,6.5),
('DBI202','HE161102','Final Exam',30,7.5),
('DBI202','HE160176','Final Exam',30,5),
('DBI202','HE160866','Final Exam',30,5),
('DBI202','HE161277','Final Exam',30,7),
('DBI202','HE162384','Final Exam',30,7),
('DBI202','HE162601','Final Exam',30,7),
('DBI202','HE160896','Final Exam',30,8),
('DBI202','HE163086','Final Exam',30,6.5),

('CSD201','HE161275','Assignment 1',10,7),
('CSD201','HE163283','Assignment 1',10,6.5),
('CSD201','HE161102','Assignment 1',10,7.5),
('CSD201','HE160176','Assignment 1',10,5),
('CSD201','HE160866','Assignment 1',10,5),
('CSD201','HE161277','Assignment 1',10,7),
('CSD201','HE162384','Assignment 1',10,7),
('CSD201','HE162601','Assignment 1',10,7),
('CSD201','HE160896','Assignment 1',10,8),
('CSD201','HE163086','Assignment 1',10,6.5),


('CSD201','HE161275','Assignment 2',10,9),
('CSD201','HE163283','Assignment 2',10,7.5),
('CSD201','HE161102','Assignment 2',10,7.5),
('CSD201','HE160176','Assignment 2',10,8),
('CSD201','HE160866','Assignment 2',10,7),
('CSD201','HE161277','Assignment 2',10,7),
('CSD201','HE162384','Assignment 2',10,7),
('CSD201','HE162601','Assignment 2',10,7),
('CSD201','HE160896','Assignment 2',10,8),
('CSD201','HE163086','Assignment 2',10,8.5),

('CSD201','HE161275','Progress Test 1',10,7),
('CSD201','HE163283','Progress Test 1',10,6.5),
('CSD201','HE161102','Progress Test 1',10,7.5),
('CSD201','HE160176','Progress Test 1',10,8),
('CSD201','HE160866','Progress Test 1',10,7.5),
('CSD201','HE161277','Progress Test 1',10,7.5),
('CSD201','HE162384','Progress Test 1',10,7),
('CSD201','HE162601','Progress Test 1',10,7),
('CSD201','HE160896','Progress Test 1',10,8),
('CSD201','HE163086','Progress Test 1',10,7.5),

('CSD201','HE161275','Progress Test 2',10,7),
('CSD201','HE163283','Progress Test 2',10,6.5),
('CSD201','HE161102','Progress Test 2',10,7.5),
('CSD201','HE160176','Progress Test 2',10,7),
('CSD201','HE160866','Progress Test 2',10,8),
('CSD201','HE161277','Progress Test 2',10,8),
('CSD201','HE162384','Progress Test 2',10,9),
('CSD201','HE162601','Progress Test 2',10,9),
('CSD201','HE160896','Progress Test 2',10,8),
('CSD201','HE163086','Progress Test 2',10,8.5),

('CSD201','HE161275','Practical Exam',30,7),
('CSD201','HE163283','Practical Exam',30,6.5),
('CSD201','HE161102','Practical Exam',30,7.5),
('CSD201','HE160176','Practical Exam',30,3),
('CSD201','HE160866','Practical Exam',30,4.5),
('CSD201','HE161277','Practical Exam',30,6),
('CSD201','HE162384','Practical Exam',30,4),
('CSD201','HE162601','Practical Exam',30,5),
('CSD201','HE160896','Practical Exam',30,8),
('CSD201','HE163086','Practical Exam',30,8.5),

('CSD201','HE161275','Final Exam',30,7),
('CSD201','HE163283','Final Exam',30,6.5),
('CSD201','HE161102','Final Exam',30,7.5),
('CSD201','HE160176','Final Exam',30,5),
('CSD201','HE160866','Final Exam',30,5),
('CSD201','HE161277','Final Exam',30,7),
('CSD201','HE162384','Final Exam',30,7),
('CSD201','HE162601','Final Exam',30,7),
('CSD201','HE160896','Final Exam',30,8),
('CSD201','HE163086','Final Exam',30,6.5),

('JPD113','HE161275','Participation',10,9),
('JPD113','HE163283','Participation',10,8),
('JPD113','HE161102','Participation',10,7),
('JPD113','HE160176','Participation',10,8),
('JPD113','HE160866','Participation',10,9),
('JPD113','HE161277','Participation',10,8),
('JPD113','HE162384','Participation',10,7),
('JPD113','HE162601','Participation',10,7),
('JPD113','HE160896','Participation',10,8),
('JPD113','HE163086','Participation',10,7),

('JPD113','HE161275','Progress Test 1',10,7.5),
('JPD113','HE163283','Progress Test 1',10,6),
('JPD113','HE161102','Progress Test 1',10,7),
('JPD113','HE160176','Progress Test 1',10,7),
('JPD113','HE160866','Progress Test 1',10,7),
('JPD113','HE161277','Progress Test 1',10,8),
('JPD113','HE162384','Progress Test 1',10,7),
('JPD113','HE162601','Progress Test 1',10,7.5),
('JPD113','HE160896','Progress Test 1',10,8.5),
('JPD113','HE163086','Progress Test 1',10,9),
										 
('JPD113','HE161275','Progress Test 2',10,9),
('JPD113','HE163283','Progress Test 2',10,8),
('JPD113','HE161102','Progress Test 2',10,7),
('JPD113','HE160176','Progress Test 2',10,8),
('JPD113','HE160866','Progress Test 2',10,9),
('JPD113','HE161277','Progress Test 2',10,8),
('JPD113','HE162384','Progress Test 2',10,7),
('JPD113','HE162601','Progress Test 2',10,7),
('JPD113','HE160896','Progress Test 2',10,8),
('JPD113','HE163086','Progress Test 2',10,7),

('JPD113','HE161275','Mid-term test',30,6),
('JPD113','HE163283','Mid-term test',30,7),
('JPD113','HE161102','Mid-term test',30,7),
('JPD113','HE160176','Mid-term test',30,5),
('JPD113','HE160866','Mid-term test',30,5),
('JPD113','HE161277','Mid-term test',30,6),
('JPD113','HE162384','Mid-term test',30,6.5),
('JPD113','HE162601','Mid-term test',30,7),
('JPD113','HE160896','Mid-term test',30,5.5),
('JPD113','HE163086','Mid-term test',30,7),

('JPD113','HE161275','Final Exam',30,9),
('JPD113','HE163283','Final Exam',30,8),
('JPD113','HE161102','Final Exam',30,7),
('JPD113','HE160176','Final Exam',30,8),
('JPD113','HE160866','Final Exam',30,9),
('JPD113','HE161277','Final Exam',30,8),
('JPD113','HE162384','Final Exam',30,7),
('JPD113','HE162601','Final Exam',30,7),
('JPD113','HE160896','Final Exam',30,8),
('JPD113','HE163086','Final Exam',30,7)

--8
insert Enroll([Sid],Gname,Lid,Suid)
values
('HE161275','SE1647','sonnt5','DBI202'),
('HE161275','SE1647','caupd','CSD201'),
('HE161275','SE1647','anhdt','LAB211'),
('HE161275','SE1647','huyentt','JPD113'),

('HE163283','SE1647','sonnt5','DBI202'),
('HE163283','SE1647','caupd','CSD201'),
('HE163283','SE1647','anhdt','LAB211'),
('HE163283','SE1647','huyentt','JPD113'),

('HE161102','SE1647','sonnt5','DBI202'),
('HE161102','SE1647','caupd','CSD201'),
('HE161102','SE1647','anhdt','LAB211'),
('HE161102','SE1647','huyentt','JPD113'),

('HE160176','SE1647','sonnt5','DBI202'),
('HE160176','SE1647','caupd','CSD201'),
('HE160176','SE1647','anhdt','LAB211'),
('HE160176','SE1647','huyentt','JPD113'),

('HE160866','SE1647','sonnt5','DBI202'),
('HE160866','SE1647','caupd','CSD201'),
('HE160866','SE1647','anhdt','LAB211'),
('HE160866','SE1647','huyentt','JPD113'),

('HE161277','SE1647','sonnt5','DBI202'),
('HE161277','SE1647','caupd','CSD201'),
('HE161277','SE1647','anhdt','LAB211'),
('HE161277','SE1647','huyentt','JPD113'),

('HE162384','SE1647','sonnt5','DBI202'),
('HE162384','SE1647','caupd','CSD201'),
('HE162384','SE1647','anhdt','LAB211'),
('HE162384','SE1647','huyentt','JPD113'),

('HE162601','SE1647','sonnt5','DBI202'),
('HE162601','SE1647','caupd','CSD201'),
('HE162601','SE1647','anhdt','LAB211'),
('HE162601','SE1647','huyentt','JPD113'),

('HE160896','SE1647','sonnt5','DBI202'),
('HE160896','SE1647','caupd','CSD201'),
('HE160896','SE1647','anhdt','LAB211'),
('HE160896','SE1647','huyentt','JPD113'),
('HE163086','SE1647','sonnt5','DBI202'),
('HE163086','SE1647','caupd','CSD201'),
('HE163086','SE1647','anhdt','LAB211'),
('HE163086','SE1647','huyentt','JPD113')

--9
insert Assessment([Sid],Suid,GradeCategory,[Weight],Duration)
values
('DBI202','HE161275','Pratical Exam',30,'Future'),
('DBI202','HE163283','Pratical Exam',30,'Future'),
('DBI202','HE161102','Pratical Exam',30,'Future'),
('DBI202','HE160176','Pratical Exam',30,'Future'),
('DBI202','HE160866','Pratical Exam',30,'Future'),
('DBI202','HE161277','Pratical Exam',30,'Future'),
('DBI202','HE162601','Pratical Exam',30,'Future'),
('DBI202','HE160896','Pratical Exam',30,'Future'),
('DBI202','HE163086','Pratical Exam',30,'Future')














