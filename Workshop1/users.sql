create database workshop1;
go
use workshop1	
go
create table tblUsers (
	Username VARCHAR(50) PRIMARY KEY,
	Name VARCHAR(100) Not null,
	Password VARCHAR(255) Not null,
	Role VARCHAR(20) Not null check(Role in ('Folder','Team Member'))
	);
go
create table tblStartupProjects (
	project_id int PRIMARY KEY, 
    project_name varchar(100) NOT NULL, 
    Description text, 
    Status varchar(20) NOT NULL check (Status in ('Ideation', 'Development', 'Launch', 'Scaling')),
    estimated_launch date NOT NULL
);
go
	


