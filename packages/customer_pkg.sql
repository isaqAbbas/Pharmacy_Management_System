create or replace package customer_pkg as
procedure ins(p_customer_id customer.customer_id%type,p_name customer.name%type,p_address customer.address%type,p_contact_num customer.contact_num%type,p_gender customer.gender%type);
procedure upt(p_customer_id customer.customer_id%type,p_name customer.name%type,p_address customer.address%type,p_contact_num customer.contact_num%type,p_gender customer.gender%type);
procedure del(p_customer_id customer.customer_id%type);
end customer_pkg;
/
create or replace package body customer_pkg as
procedure ins(p_customer_id customer.customer_id%type,p_name customer.name%type,p_address customer.address%type,p_contact_num customer.contact_num%type,p_gender customer.gender%type) as
begin
insert into customer values(p_customer_id,p_name,p_address,p_contact_num,p_gender);
commit;
end ins;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
procedure upt(p_customer_id customer.customer_id%type,p_name customer.name%type,p_address customer.address%type,p_contact_num customer.contact_num%type,p_gender customer.gender%type) as
begin
update customer set customer.name=p_name,customer.address=p_address,customer.contact_num=p_contact_num,customer.gender=p_gender  where customer.customer_id=p_customer_id;
commit; 
end upt;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
procedure del(p_customer_id customer.customer_id%type) as
begin
delete from customer where customer.customer_id=p_customer_id;
commit;
end del;
end customer_pkg;


