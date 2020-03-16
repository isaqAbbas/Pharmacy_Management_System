create or replace package drug_producer_pkg as
procedure ins(p_drug_producer_id drug_producer.drug_producer_id%type,p_name drug_producer.name%type,p_contact_num drug_producer.contact_num%type);
procedure upt(p_drug_producer_id drug_producer.drug_producer_id%type,p_name drug_producer.name%type,p_contact_num drug_producer.contact_num%type);
procedure  del(p_drug_producer_id drug_producer.drug_producer_id%type);
end drug_producer_pkg;
/
create or replace package body drug_producer_pkg as
procedure ins(p_drug_producer_id drug_producer.drug_producer_id%type,p_name drug_producer.name%type,p_contact_num drug_producer.contact_num%type) as
begin
insert into drug_producer values(p_drug_producer_id,p_name,p_contact_num); 
commit;
end ins;
-----------------------------------------------------------------------------------------------------------------------------------------------------
procedure upt(p_drug_producer_id drug_producer.drug_producer_id%type,p_name drug_producer.name%type,p_contact_num drug_producer.contact_num%type) as
begin
update drug_producer set drug_producer.name=p_name,drug_producer.contact_num=p_contact_num  where drug_producer.drug_producer_id=p_drug_producer_id; 
commit;
end upt;
--------------------------------------------------------------------------------------------------------------------------------------------------
procedure  del(p_drug_producer_id drug_producer.drug_producer_id%type) as
begin
delete from drug_producer where drug_producer.drug_producer_id=p_drug_producer_id;
commit;
end del;
end drug_producer_pkg;
