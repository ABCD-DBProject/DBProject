drop schema dbproject;

create schema dbproject;
use dbproject;

CREATE TABLE DEPARTMENT(/*1*/
    DEPTNAME VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (DEPTNAME)
);

insert into DEPARTMENT (DEPTNAME) values
('human_resource'),('accounting'),('management'),('sales'),('purchase'),('marketing'),('computer');

CREATE TABLE ROOM(/*2*/
    ROOMNO INTEGER NOT NULL UNIQUE,
    CAPACITY INTEGER NOT NULL,
    PRIMARY KEY (ROOMNO)
);

insert into ROOM (ROOMNO, CAPACITY) values
(101, 6), (102, 6), (103, 6), (201, 6), (202, 6), (203, 10), (301, 10), (302, 16);

CREATE TABLE MANAGER(/*3*/
    MANNO INTEGER AUTO_INCREMENT,
    MANNAME CHAR(10) NOT NULL,
    MANID VARCHAR(45) NOT NULL,
    MANPW VARCHAR(45) NOT NULL,
    DNAME VARCHAR(50) NOT NULL,
    PRIMARY KEY (MANNO),
    FOREIGN KEY (DNAME) REFERENCES DEPARTMENT(DEPTNAME)
);

insert into MANAGER (MANNAME, MANID, MANPW, DNAME)value
('이승연','tmddus40','tmddus40','management'),
('소희진','heejin26','heejin26','computer'),
('이주연','juyeon12','juyeon12','marketing');

CREATE TABLE EMPLOYEE(/*4*/
    EMPNO INTEGER AUTO_INCREMENT,
    EMPNAME CHAR(10) NOT NULL,
    EMPID VARCHAR(45) NOT NULL,
    EMPPW VARCHAR(45) NOT NULL,
    DNAME VARCHAR(50),
    TITLE VARCHAR(10) DEFAULT 'staff',/*직책*/
    TEL VARCHAR(45) NOT NULL,
    BIRTHDATE DATETIME,/*not null로 바꿀것*/
    EMAIL CHAR(20) NOT NULL,
    SALARY  INTEGER DEFAULT 2000000,
    SDATE DATETIME default NOW(),/*입사일 - not null로 바꿀것*/
    PRIMARY KEY (EMPNO),
    FOREIGN KEY (DNAME) REFERENCES DEPARTMENT (DEPTNAME)
);
/*holiday 뺌*/
CREATE TABLE RESERVATION(/*5*/
   RESNO INTEGER NOT NULL AUTO_INCREMENT,
    EMPID VARCHAR(45),
    ROOMNO INTEGER NOT NULL,/*ENAME CHAR(10)*/
    RDATE VARCHAR(45) NOT NULL,
    RTIME VARCHAR(45),
    PRIMARY KEY (RESNO),
    FOREIGN KEY (ROOMNO) REFERENCES ROOM (ROOMNO),
    FOREIGN KEY (EMPID) REFERENCES EMPLOYEE (EMPID)
);

CREATE TABLE ATTENDENCE(
    ATTNO INTEGER NOT NULL AUTO_INCREMENT,
    EMPNO INTEGER,
    EMPNAME CHAR(10),
    ATTEND_TIME DATETIME,/**/
    PRIMARY KEY (ATTNO),
    FOREIGN KEY (EMPNO) REFERENCES EMPLOYEE (EMPNO)
    /*FOREIGN KEY (EMPNAME) REFERENCES EMPLOYEE (EMPNAME)*/
);

CREATE TABLE HREQUEST(
    REQNO INTEGER NOT NULL AUTO_INCREMENT,
    EMPNO INTEGER,
    HTYPE VARCHAR(50) NOT NULL,
    START_TIME DATETIME NOT NULL,
    END_TIME DATETIME NOT NULL,
    DNAME varchar(50),
    STATUS VARCHAR(45) DEFAULT 'waiting',
    PRIMARY KEY (REQNO),
    FOREIGN KEY (DNAME) REFERENCES DEPARTMENT(DEPTNAME),
    FOREIGN KEY (EMPNO) REFERENCES EMPLOYEE (EMPNO)
);


insert into EMPLOYEE (EMPNAME, EMPID, EMPPW, DNAME, TEL, BIRTHDATE,
EMAIL, SDATE) value('juyeon','1234','1234','management','010-1234-1234',19991214,'asdf@naver.com', 20201111);