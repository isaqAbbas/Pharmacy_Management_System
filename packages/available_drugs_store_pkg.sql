create or replace package available_drugs_store_pkg as
procedure ins(p_drug_id available_drugs_store.drug_id%type,p_pharmacy_branch_id available_drugs_store.pharmacy_branch_id%type);
end available_drugs_store_pkg;
/
create or replace package body available_drugs_store_pkg as
procedure ins(p_drug_id available_drugs_store.drug_id%type,p_pharmacy_branch_id available_drugs_store.pharmacy_branch_id%type) as
begin
  insert into available_drugs_store values(p_drug_id,p_pharmacy_branch_id);
 commit; 
end ins;
end available_drugs_store_pkg;
