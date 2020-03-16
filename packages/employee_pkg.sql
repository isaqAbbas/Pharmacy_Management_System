create or replace package employee_pkg as
procedure ins(p_employee_id employee.employee_id%type,p_name employee.name%type,p_pharmacy_branch_id employee.pharmacy_branch_id%type,p_contact_num employee.contact_num%type,p_gender employee.gender%type);
procedure upt(p_employee_id employee.employee_id%type,p_name employee.name%type,p_pharmacy_branch_id employee.pharmacy_branch_id%type,p_contact_num employee.contact_num%type,p_gender employee.gender%type);
procedure del(p_employee_id employee.employee_id%type);
end employee_pkg;
/

create or replace package body  employee_pkg as
procedure ins(p_employee_id employee.employee_id%type,p_name employee.name%type,p_pharmacy_branch_id employee.pharmacy_branch_id%type,p_contact_num employee.contact_num%type,p_gender employee.gender%type) as
begin
insert into  employee values(p_employee_id,p_name,p_pharmacy_branch_id,p_contact_num,p_gender);
commit;
end ins;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
procedure upt(p_employee_id employee.employee_id%type,p_name employee.name%type,p_pharmacy_branch_id employee.pharmacy_branch_id%type,p_contact_num employee.contact_num%type,p_gender employee.gender%type) as
begin
update employee set employee.name=p_name,employee.pharmacy_branch_id=p_pharmacy_branch_id,employee.contact_num=p_contact_num,employee.gender=p_gender where employee.employee_id=p_employee_id;
commit;
end upt;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
procedure del(p_employee_id employee.employee_id%type) as
begin
delete from employee where employee.employee_id=p_employee_id;
commit; 
end del;
end  employee_pkg;
