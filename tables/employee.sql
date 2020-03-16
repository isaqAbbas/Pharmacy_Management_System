create table employee
(

employee_id number primary key,
name varchar2(30),
pharmacy_branch_id number references pharmacy_branch(pharmacy_branch_id),
contact_num varchar2(50),
gender varchar2(20) check(gender IN ('Male','Female')),
unique(contact_num)
);

