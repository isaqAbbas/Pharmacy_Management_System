create or replace  package drug_pkg as
function getid(p_drug_name drug.name%type) return drug.drug_id%type;
procedure ins(p_drug_id drug.drug_id%type,p_name drug.name%type,p_price drug.price%type,p_expiry_date drug.expiry_date%type,p_drug_producer_id drug.drug_producer_id%type,p_receipt drug.receipt%type);
procedure upt(p_drug_id drug.drug_id%type,p_name drug.name%type,p_price drug.price%type,p_expiry_date drug.expiry_date%type,p_drug_producer_id drug.drug_producer_id%type,p_receipt drug.receipt%type);
procedure del(p_drug_id drug.drug_id%type);
end drug_pkg;
/
create or replace  package body drug_pkg as
function getid(p_drug_name drug.name%type) return drug.drug_id%type as
  v_id drug.drug_id%type;
begin
    select drug_id into v_id from drug where name=p_drug_name;
    return v_id;
   exception--sytem defined exception
     when no_data_found then
       return 0;
end getid;

procedure ins(p_drug_id drug.drug_id%type,p_name drug.name%type,p_price drug.price%type,p_expiry_date drug.expiry_date%type,p_drug_producer_id drug.drug_producer_id%type,p_receipt drug.receipt%type)as
begin
 insert into drug  values(p_drug_id,p_name,p_price,p_expiry_date,p_drug_producer_id,p_receipt);
 commit;
end ins;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
procedure upt(p_drug_id drug.drug_id%type,p_name drug.name%type,p_price drug.price%type,p_expiry_date drug.expiry_date%type,p_drug_producer_id drug.drug_producer_id%type,p_receipt drug.receipt%type) as
begin
 update drug set drug.name=p_name,drug.price=p_price,drug.expiry_date=p_expiry_date,drug.drug_producer_id=p_drug_producer_id,drug.receipt=p_receipt where drug.drug_id=p_drug_id;
 commit;
end upt;
------------------------------------------------------------------------------------------------------------------------
procedure del(p_drug_id drug.drug_id%type) as
begin
delete from drug where drug.drug_id=p_drug_id;
commit;
end del;
end drug_pkg;
