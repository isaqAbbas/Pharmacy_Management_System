create or replace package  pharmacy_branch_pkg as
procedure ins(p_pharmacy_branch_id pharmacy_branch.pharmacy_branch_id%type,p_address pharmacy_branch.address%type,p_name pharmacy_branch.name%type,p_chief pharmacy_branch.chief%type,p_open_from pharmacy_branch.open_from%type,p_open_to pharmacy_branch.open_to%type,p_contact_num pharmacy_branch.contact_num%type);
procedure upt(p_pharmacy_branch_id pharmacy_branch.pharmacy_branch_id%type,p_address pharmacy_branch.address%type,p_name pharmacy_branch.name%type,p_chief pharmacy_branch.chief%type,p_open_from pharmacy_branch.open_from%type,p_open_to pharmacy_branch.open_to%type,p_contact_num pharmacy_branch.contact_num%type);
procedure del(p_pharmacy_branch_id pharmacy_branch.pharmacy_branch_id%type);
end pharmacy_branch_pkg;
/
create or replace package body pharmacy_branch_pkg as
procedure ins(p_pharmacy_branch_id pharmacy_branch.pharmacy_branch_id%type,p_address pharmacy_branch.address%type,p_name pharmacy_branch.name%type,p_chief pharmacy_branch.chief%type,p_open_from pharmacy_branch.open_from%type,p_open_to pharmacy_branch.open_to%type,p_contact_num pharmacy_branch.contact_num%type) as
begin
insert into pharmacy_branch values(p_pharmacy_branch_id,p_address,p_name,p_chief,p_open_from,p_open_to,p_contact_num);
commit;
end ins;
---------------------------------------------------------------------------------------------------------------------------------
procedure upt(p_pharmacy_branch_id pharmacy_branch.pharmacy_branch_id%type,p_address pharmacy_branch.address%type,p_name pharmacy_branch.name%type,p_chief pharmacy_branch.chief%type,p_open_from pharmacy_branch.open_from%type,p_open_to pharmacy_branch.open_to%type,p_contact_num pharmacy_branch.contact_num%type) as
begin
update pharmacy_branch set pharmacy_branch.address=p_address,pharmacy_branch.name=p_name,pharmacy_branch.chief=p_chief,pharmacy_branch.open_from=p_open_from,pharmacy_branch.open_to=p_open_to,pharmacy_branch.contact_num=p_contact_num where pharmacy_branch.pharmacy_branch_id=p_pharmacy_branch_id;
commit; 
end upt;
---------------------------------------------------------------------------------------------------------------------------------
procedure del(p_pharmacy_branch_id pharmacy_branch.pharmacy_branch_id%type) as
begin
delete from pharmacy_branch where pharmacy_branch.pharmacy_branch_id=p_pharmacy_branch_id;
commit;
end del;
end pharmacy_branch_pkg;
