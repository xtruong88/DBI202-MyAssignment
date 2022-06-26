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
ICode varchar(10) primary key,
Campus varchar(10)
)
insert Lecture(ICode,Campus)
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


