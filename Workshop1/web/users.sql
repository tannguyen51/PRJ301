create table tblUsers (
	Username VARCHAR(50) PRIMARY KEY,
	Name VARCHAR(100) Not null,
	Password VARCHAR(255) Not null,
	Role VARCHAR(20) Not null 
	);
go
create table tblStartupProjects (
	project_id int PRIMARY KEY, 
    project_name varchar(100) Not null, 
    Description text, 
    Status varchar(20) Not null, 
    estimated_launch date Not null
);
go
	

	insert into tblUsers(Username,Name,Password,Role) values
	('xuantan51','Xuan Tan','123456','Founder'),
	('xuantan05','Nguyen Tan','123456','Team member');
	go
