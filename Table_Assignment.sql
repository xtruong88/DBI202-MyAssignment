drop table Lecture

--1
create table Student(
[Sid] varchar(10) primary key,
SurName varchar(10),
MiddleName varchar(10),
GivenName varchar(10),
)
insert Student([Sid],SurName,MiddleName,GivenName)
values
('HE161275','Vu','Xuan','Truong'),
('HE163283','Nguyen','Hoang','Hieu'),
('HE161102','Ta','Viet','Hoang'),
('HE160176','Hoang','The','Anh'),
('HE160866','Vu','Duc','Huy')

--2
create table Lecture(
Lid varchar(10) primary key,
Campus varchar(10)
)
insert Lecture(Lid,Campus)
values
('sonnt5','HL'),
('caupd','HL'),
('anhdt','HL')

--3
create table Course(
Suid varchar(10) primary key,
StartDate date,
EndDate date
)

insert Course(Suid,StartDate,EndDate)
values
('DBI202','2022-05-12','2022-8-2'),
('CSD201','2022-05-12','2022-8-2'),
('LAB211','2022-05-12','2022-8-2')

--4
create table TimeSlot(
SlotNumber int primary key identity,
[start] varchar(10),
[end] varchar(10)
)

insert TimeSlot([start],[end])
values
('7:30','9:00'),
('9:10','10:40'),
('10:50','12:20')

--5

create table [Group](
Gname varchar(10),
Lid varchar(10),
Suid varchar(10),
primary key (Gname,Lid,Suid),
foreign key (Lid) references Lecture(Lid),
foreign key (Suid) references Course(Suid),
)

insert [Group](Gname,Lid,Suid)
values
('SE1647','sonnt5','DBI202'),
('SE1647','caupd','CSD201'),
('SE1647','anhdt','LAB211')

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

insert Study([Sid],Suid,AverageGrade,[Status])
values
('HE163283','DBI202',7.5,1),
('HE161275','JPD113',7.5,1),
('HE161102','JPD113',6,1),
('HE160176','DBI202',4.5,1),
('HE160866','DBI202',6.0,1)

create table GradeDetail(
[Sid] varchar(10),
Suid varchar(10),
GradeCategory varchar(20),
[Weight] int,
[Value] float,
Primary key (Suid,[Sid],GradeCategory),
foreign key (Suid,[Sid]) references Study(Suid,[Sid]),
check ([Weight]>0 and [Weight]<100),
check ([Value]>0 and [Value]<10)
)

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




