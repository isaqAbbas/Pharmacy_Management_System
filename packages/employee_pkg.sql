create or replace package employee_pkg as
function getid(p_employee_name employee.name%type) return employee.employee_id%Type;
function getbranchid(p_employee_name employee.name%type) return employee.pharmacy_branch_id%Type;
function getbranchid(p_employee_id employee.employee_id%type) return employee.pharmacy_branch_id%Type;
procedure ins(p_employee_id employee.employee_id%type,p_name employee.name%type,p_pharmacy_branch_id employee.pharmacy_branch_id%type,p_contact_num employee.contact_num%type,p_gender employee.gender%type);
procedure upt(p_employee_id employee.employee_id%type,p_name employee.name%type,p_pharmacy_branch_id employee.pharmacy_branch_id%type,p_contact_num employee.contact_num%type,p_gender employee.gender%type);
procedure del(p_employee_id employee.employee_id%type);
end employee_pkg;
/
create or replace  package body employee_pkg as
function getid(p_employee_name employee.name%type) return employee.employee_id%Type as
v_id number;
begin
   select employee_id into v_id from employee where name=p_employee_name;
   return v_id;
   exception
   when no_data_found then
        return 0;
 end getid;
 ---------------------------------------------------------------------------------------------------------------
function getbranchid(p_employee_name employee.name%type) return employee.pharmacy_branch_id%Type as
 v_branch_id number;
begin
  select employee.pharmacy_branch_id into v_branch_id from employee where name=p_employee_name;
  return v_branch_id;
  exception
    when no_data_found then
      return 0;
end getbranchid;
-----------------------------------------------------------------------------------------------------------------
function getbranchid(p_employee_id employee.employee_id%type) return employee.pharmacy_branch_id%Type as
 v_branch_id number;
begin
  select employee.pharmacy_branch_id into v_branch_id from employee where employee_id=p_employee_id;
  return v_branch_id;
  exception
    when no_data_found then
      return 0;
end getbranchid;
--------------------------------------------------------------------------------------------------------------------
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

