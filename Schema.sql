use ddrk;

CREATE TABLE portal (
    ipaddress VARCHAR(20) not null,
    domainname VARCHAR(20) not null
);

CREATE TABLE employeerole (
    departmentid INT AUTO_INCREMENT PRIMARY KEY,
    department VARCHAR(30)
);

CREATE TABLE employee (
    employeeid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phoneno VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,
    address TEXT,
    departmentid INT NOT NULL,
    FOREIGN KEY (departmentid)
        REFERENCES employeerole (departmentid)
);
ALTER TABLE employee DROP phoneno;
select *from employee;

CREATE TABLE empphoneno (
    phonenoid INT AUTO_INCREMENT PRIMARY KEY,
    phoneno VARCHAR(20) not null,
    employeeid INT not null,
    FOREIGN KEY (employeeid)
        REFERENCES employee (employeeid)
);

CREATE TABLE member ( 
memberid INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) not null,
email VARCHAR(50) not null,
password VARCHAR(20) not null
);

CREATE TABLE phoneno (
    phonenoid INT AUTO_INCREMENT PRIMARY KEY,
    phoneno VARCHAR(20) not null,
    memberid INT not null,
    FOREIGN KEY (memberid)
        REFERENCES member (memberid)
);

create table property (
propertyid INT AUTO_INCREMENT PRIMARY KEY,
status varchar(20) not null,
price float not null,
memberid int not null,
    FOREIGN KEY (memberid)
        REFERENCES member (memberid)
);

create table location (
locationid INT AUTO_INCREMENT PRIMARY KEY,
city varchar(50) not null,
locality varchar(50),
society text not null,
pincode int not null,
propertyid int not null,
    FOREIGN KEY (propertyid)
        REFERENCES property (propertyid)
);

create table pictures (
pictureid INT AUTO_INCREMENT PRIMARY KEY,
picture varchar(100) not null,
propertyid int not null,
    FOREIGN KEY (propertyid)
        REFERENCES property (propertyid)
);

create table residential (
propertyid INT AUTO_INCREMENT PRIMARY KEY,
specifications text,
size float not null,
possession date,
builder varchar(30),
    FOREIGN KEY (propertyid)
        REFERENCES property (propertyid)
);

create table furnishing (
furnishingid INT AUTO_INCREMENT PRIMARY KEY,
type varchar(30) not null
);

create table residentialtype (
typeid INT AUTO_INCREMENT PRIMARY KEY,
type varchar(30) not null
);

create table residentialdetails (
propertyid INT AUTO_INCREMENT PRIMARY KEY,
typeid int not null,
bhk int not  null,
bathroom int,
floor int,
furnishingid int,
FOREIGN KEY (typeid)
        REFERENCES residentialtype (typeid),
FOREIGN KEY (furnishingid)
        REFERENCES furnishing (furnishingid),
FOREIGN KEY (propertyid)
        REFERENCES property (propertyid)
);

create table commercialtype (
typeid INT AUTO_INCREMENT PRIMARY KEY,
type varchar(30) not null
);

create table commercial (
propertyid INT AUTO_INCREMENT PRIMARY KEY,
typeid int not null,
size float not null,
possession date,
builder varchar(30),
    FOREIGN KEY (propertyid)
        REFERENCES property (propertyid),
    FOREIGN KEY (typeid)
        REFERENCES commercialtype (typeid)
);

create table plottype (
typeid INT AUTO_INCREMENT PRIMARY KEY,
type varchar(30) not null
);

create table plot (
propertyid INT AUTO_INCREMENT PRIMARY KEY,
typeid int not null,
size float not null,
    FOREIGN KEY (propertyid)
        REFERENCES property (propertyid),
    FOREIGN KEY (typeid)
        REFERENCES plottype (typeid)
);

create table review (
reviewid INT AUTO_INCREMENT PRIMARY KEY,
rating int not null,
description text,
memberid int not null,
propertyid int not null,
    FOREIGN KEY (propertyid)
        REFERENCES property (propertyid),
    FOREIGN KEY (memberid)
        REFERENCES member (memberid)
);

create table faq (
faqid INT AUTO_INCREMENT PRIMARY KEY,
question text not null,
memberid int not null,
answer text,
employeeid int ,
    FOREIGN KEY (employeeid)
        REFERENCES employee (employeeid),
    FOREIGN KEY (memberid)
        REFERENCES member (memberid)
);

create table status (
statusid INT AUTO_INCREMENT PRIMARY KEY,
status varchar(20) not null
);