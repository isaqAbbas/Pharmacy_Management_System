create table pharmacy_branch
(
pharmacy_branch_id number,
address varchar2(50),
name varchar2(30),
chief varchar2(30),
open_from number,
open_to number,
contact_num varchar2(50) unique,
primary key(pharmacy_branch_id)
);

