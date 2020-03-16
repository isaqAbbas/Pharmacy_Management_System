create table customer
(
customer_id number primary key,
name varchar2(30),
address varchar2(50),
contact_num varchar2(50) unique,
gender varchar2(20) check(gender IN ('Male','Female'))
);
