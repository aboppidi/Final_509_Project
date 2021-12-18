CREATE TABLE `employee` (
  `empId` INT NOT NULL AUTO_INCREMENT,
  `empName` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `dateOfBirth` DATE NULL,
  `isActive` TINYINT(2) NULL DEFAULT 1,
  PRIMARY KEY (`empId`),
  UNIQUE INDEX `empId_UNIQUE` (`empId` ASC) VISIBLE);
  
   
  CREATE TABLE  `department` (
  `departmentid` INT NOT NULL AUTO_INCREMENT,
  `departmentName` VARCHAR(45) NOT NULL,
  `isActive` TINYINT(2) NULL DEFAULT 1,
  PRIMARY KEY (`departmentid`),
  UNIQUE INDEX `departmentid_UNIQUE` (`departmentid` ASC) VISIBLE);
  

 CREATE TABLE `employeedepartment` (
  `empId` int NOT NULL,
  `departmentId` int NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`empId`,`departmentId`),
  KEY `departmentId_idx` (`departmentId`),
  CONSTRAINT `departmentId` FOREIGN KEY (`departmentId`) REFERENCES `department` (`departmentid`) ON UPDATE CASCADE,
  CONSTRAINT `empId` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`)  ON UPDATE CASCADE
);


CREATE TABLE `salarydetails` (
  `empId` INT NOT NULL,
  `salary` VARCHAR(45) NOT NULL,
  `financialYear` VARCHAR(45) NOT NULL);
  
  ALTER TABLE slarydetails ADD CONSTRAINT empId_fk1 FOREIGN KEY (empId) REFERENCES employee (empId) on UPDATE CASCADE;
  
  CREATE TABLE `employeeDesignation` (
  `empId` INT NOT NULL,
  `designation` VARCHAR(45) NOT NULL,
  `fromDate` datetime NOT NULL,
  `toDate` datetime NOT NULL);
  
  ALTER TABLE employeeDesignation ADD CONSTRAINT empId_fk2 FOREIGN KEY (empId) REFERENCES employee (empId) on UPDATE CASCADE;
  
  ALTER TABLE employeedesignation
 MODIFY fromDate datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
 ALTER TABLE employeedesignation
 MODIFY toDate datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
  
insert into employee(empName, address, dateOfBirth) values('John','Washington DC','2009-11-23');
insert into employee(empName, address, dateOfBirth) values('Kevin','South America','2009-01-23');
insert into employee(empName, address, dateOfBirth) values('Mary','Australia','2009-02-07');


insert into department(departmentName) values('Finance');
insert into department(departmentName) values('Administration');
insert into department(departmentName) values('Support Staff');

insert into employeedepartment (empId, departmentId, startDate, endDate) values(1,2,'2017-01-23', null);
insert into employeedepartment (empId, departmentId, startDate, endDate) values(2,3,'2019-01-23', null);
insert into employeedepartment (empId, departmentId, startDate, endDate) values(3,1,'2020-01-23', null);

insert into salarydetails(empId, salary, financialYear) values(1,'2500','2017');
insert into salarydetails(empId, salary, financialYear) values(2,'2000','2019');
insert into salarydetails(empId, salary, financialYear) values(2,'2300','2020');

insert into employeeDesignation(empId, designation) values(1, 'Manager');
insert into employeeDesignation(empId, designation) values(2, 'Backend developer');
insert into employeeDesignation(empId, designation) values(3, 'Admin');


insert into employee(empName, address, dateOfBirth) values('Diya','South Africa','2009-03-07');
insert into department(departmentName) values('Backend');

update employeedepartment set departmentId=4 where empId=3;
update salarydetails set salary='2600' where empid=1;

delete from department where departmentid=1;

select * from employeedepartment;

select * from department d, employeedepartment ed where d.departmentId = ed. departmentId;
select e.empName, s.salary from employee e  join salarydetails s on e.empId = s.empId;

select * from salarydetails s, employeeDesignation d where s.empId=d.empId;

select * from salarydetails s, employeeDesignation d where s.empId=d.empId;

select * from employeedepartment where empId=3;
