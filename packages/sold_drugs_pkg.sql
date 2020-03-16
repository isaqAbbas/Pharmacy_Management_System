create or replace package sold_drugs_pkg as
procedure ins(p_employee_id sold_drugs.employee_id%type,p_customer_id sold_drugs.customer_id%type,p_sold_date sold_drugs.sold_date%type,p_drug_id sold_drugs.drug_id%type,p_pharmacy_branch_id sold_drugs.pharmacy_branch_id%type);
end sold_drugs_pkg;
/
create or replace package body sold_drugs_pkg as


procedure ins(p_employee_id sold_drugs.employee_id%type,p_customer_id sold_drugs.customer_id%type,p_sold_date sold_drugs.sold_date%type,p_drug_id sold_drugs.drug_id%type,p_pharmacy_branch_id sold_drugs.pharmacy_branch_id%type) as
 begin
 insert into sold_drugs values(p_employee_id,p_customer_id,p_sold_date,p_drug_id,p_pharmacy_branch_id);
 commit;
 end ins;
end sold_drugs_pkg;
