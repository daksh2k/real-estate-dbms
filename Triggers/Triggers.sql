-- Triggers


-- Trigger 1 - Delete phone no. records of employee after deleting an employee record. 
delimiter @
create trigger empdel 
BEFORE DELETE
on employee 
for each row
DELETE FROM empphoneno ep where ep.employeeid=old.employeeid;
@

select * from employee;
select * from empphoneno;
drop trigger empdel;
delete from employee e where e.employeeid = 11;

-- Trigger 2 - Delete phone no. records of member after deleting a member record. 
delimiter @
create trigger memdel 
BEFORE DELETE
on member 
for each row
DELETE FROM phoneno p where p.memberid=old.memberid;
@

select * from member;
select * from phoneno;
drop trigger memdel;
delete from member m where m.memberid = 31;


-- Trigger 3 - Trigger to add logs on property updation.
CREATE TABLE updateproperty (
    upid INT AUTO_INCREMENT,
    propertyid INT,
    price INT,
    statusid int,
    action VARCHAR(25),
    changedon DATETIME,
    PRIMARY KEY (upid)
);
delimiter @
create trigger updatepropertytrigger
after update 
on property
for each row 
begin
insert into updateproperty set action='Update',propertyid=old.propertyid, statusid = old.statusid , price=old.price ,changedon=now();
end @

select * from updateproperty;
drop trigger updatepropertytrigger;


-- Trigger 4 - Trigger to add logs on employee insertion.
CREATE TABLE updateemp (
    upid INT AUTO_INCREMENT,
    employeeid INT,
    name varchar(50),
    address TEXT,
    departmentid INT,
    action VARCHAR(25),
    changedon DATETIME,
    PRIMARY KEY (upid)
);

delimiter @
create trigger updateemptrigger
before insert 
on employee
for each row 
begin
insert into updateemp set action='Insert',employeeid=new.employeeid, name = new.name , address=new.address, departmentid=new.departmentid ,changedon=now();
end @

select * from updateemp;
drop table updateemp;
drop trigger updateemptrigger;


-- Trigger 5 - Trigger to add logs on member updation.
CREATE TABLE updatemem (
    upid INT AUTO_INCREMENT,
    memberid INT,
    name VARCHAR(50),
    email VARCHAR(50),
    action VARCHAR(25),
    changedon DATETIME,
    PRIMARY KEY (upid)
);

delimiter @
create trigger updatememtrigger
before update
on member
for each row 
begin
insert into updatemem set action='Update',memberid=new.memberid , name=new.name, email=new.email ,changedon=now();
end @

select * from updatemem;
drop trigger updatememtrigger;