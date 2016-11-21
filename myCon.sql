 	



 	<%
      	<c:forEach var="empDeptClick" items="${empDeptClick}">
      		byte[] list3 = ${empDeptClick.empimg}
      		byte[] encodedBytes = Base64.encode(list3);
      		String encoded = new String(encodedBytes, "UTF-8");
      	</c:forEach>
      	for(Employee i = )
     %>

      

create table empEk2(
empid int not null,
empname varchar2(15),
empdesig varchar2(15),
deptid int not null,
Constraint pk_empEk2_empid primary key(empid),
constraint fk_empEk2_deptid foreign key(deptid) references deptEk2(deptid));

drop table empEk
create table deptEk2(
deptid int not null,
deptname varchar2(15),
Constraint pk_deptEk2_deptid primary key(deptid));


desc deptEk2;
desc empEk2;

drop table empEk2
drop table deptEk2

delete from deptEk2 where deptid = 16;
delete from empEk2;
desc empEk2
select * from empEk2 where deptid = 1;
delete from empEk2 where empid = 7;
select * from deptEk2;
Select empimg from empEk2 where deptid=1 and empid = 16;
insert into deptEk2 values(1,'R and D');
insert into deptEk2 values(2,'Admin');
insert into deptEk2 values(3,'HR');
insert into deptEk2 values(4,'Accounts');
insert into deptEk2 values(5,'House Keeping');
insert into deptEk2 values(6,'HR2');
delete from empEk2 where deptid = 1
alter table empEk2 drop column empimgstr

insert into empEk2 values(1,'Arun','ASE',1);
insert into empEk2 values(2,'Ashok','ASE',1);
insert into empEk2 values(3,'Raj','ASE',1);
insert into empEk2 values(4,'Ravi','ASE',1);
insert into empEk2 values(5,'Varun','ASE',1);
insert into empEk2 values(6,'Vivek','ASE',1);
insert into empEk2 values(7,'Aajay','ASE',1);

insert into empEk2 values(8,'Arun','Manager',2);
insert into empEk2 values(9,'Alok','AManager',2);

insert into empEk2 values(10,'Avik','lead Hr',3);
insert into empEk2 values(11,'Ajay','Relations',3);
insert into empEk2 values(12,'Vishal','BusinessR',3);
insert into empEk2 values(12,'Vishal','BusinsessR',3);
select count(e.empid) as noofemp,d.deptid from empEk2 e right join deptEk2 d on e.deptid = d.deptid group by d.deptid order by d.deptid desc;


alter table empEk2 add empimg  blob;
alter table empEk2 add empimgstr  varchar2(4000);
commit

select * from users

select * from user_roles

CREATE TABLE  imgtable2 
   (   empname VARCHAR2(40),   
      empphoto BLOB  
   ) 
select * from imgtable2


CREATE TABLE files_upload (
    upload_id int NOT NULL,
  file_name varchar(128) DEFAULT NULL,
  file_data blob,
  PRIMARY KEY (upload_id)
)

CREATE SEQUENCE files_seq2 ;

CREATE TRIGGER emp_tri 
BEFORE INSERT ON files_upload 
FOR EACH ROW

BEGIN
  SELECT files_seq2.NEXTVAL
  INTO   :new.upload_id
  FROM   dual;
END;
/

$ oerr ora 24816

