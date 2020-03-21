create or replace  package sold_drugs_pkg as
type ttrec is record
(expire_date drug.expiry_date%type,cnt number,branch_name pharmacy_branch.name%type);
type trec is table of ttrec;

procedure sell(p_drug_id drug.drug_id%type,p_employee_id employee.employee_id%type,p_sell_count number);
function find_res(p_drug_id drug.drug_id%type) return trec pipelined;
procedure ins(p_employee_id sold_drugs.employee_id%type,p_customer_id sold_drugs.customer_id%type,p_sold_date sold_drugs.sold_date%type,p_drug_id sold_drugs.drug_id%type,p_pharmacy_branch_id sold_drugs.pharmacy_branch_id%type);
end sold_drugs_pkg;
/
create or replace package body sold_drugs_pkg as

procedure ins(p_employee_id sold_drugs.employee_id%type,p_customer_id sold_drugs.customer_id%type,p_sold_date sold_drugs.sold_date%type,p_drug_id sold_drugs.drug_id%type,p_pharmacy_branch_id sold_drugs.pharmacy_branch_id%type) as
 begin
 insert into sold_drugs values(p_employee_id,p_customer_id,p_sold_date,p_drug_id,p_pharmacy_branch_id);
 commit;
 end ins;
---------------------------------------------------------------------------------------------------------------------
procedure sell(p_drug_id drug.drug_id%type,p_employee_id employee.employee_id%type,p_sell_count number) is
v_available_count number;
v_branch_id number default employee_pkg.getbranchid(p_employee_id);
begin
-- raise_application_error(-20001,employee_pkg.getbranchid(p_employee_id));
-- raise_application_error(-20001,p_employee_id);

select availabe_count into v_available_count from (
select distribute.drug_id,distribute.pharmacy_branch_id,distribute.cnt-nvl(sold.cnt,0) as availabe_count from
(select a.drug_id,a.pharmacy_branch_id,count(*) cnt from sold_drugs a group by a.drug_id,a.pharmacy_branch_id ) sold  right join
(select a.drug_id,a.pharmacy_branch_id,count(*) cnt from available_drugs_store a group by a.pharmacy_branch_id,a.drug_id) distribute
 on  sold.pharmacy_branch_id=distribute.pharmacy_branch_id and sold.drug_id=distribute.drug_id) a, pharmacy_branch b, drug c where a.pharmacy_branch_id=b.pharmacy_branch_id
 and a.drug_id=c.drug_id
 and a.drug_id=p_drug_id
 and a.pharmacy_branch_id=v_branch_id;

  if v_available_count=0 then
    raise_application_error(-20001,'Hal-hazirda filialda bu dermandan qalmayib!!!');
  end if;
  if p_sell_count>v_available_count then
    raise_application_error(-20001,'Hal-hazirda filialda bu sayda derman movcud deyil!!!');
 end if;
for i in 1..p_sell_count loop
 sold_drugs_pkg.ins(p_employee_id        => p_employee_id,
                    p_customer_id        => null,
                    p_sold_date          => sysdate,
                    p_drug_id            => p_drug_id,
                    p_pharmacy_branch_id => v_branch_id);

end loop;
end sell;
-------------------------------------------------------------------------------------------------------------------------------------------

function find_res(p_drug_id drug.drug_id%type) return trec  pipelined as
  begin
for i in (select c.expiry_date,a.availabe_count,b.name from (
select distribute.drug_id,distribute.pharmacy_branch_id,distribute.cnt-nvl(sold.cnt,0) as availabe_count from
(select a.drug_id,a.pharmacy_branch_id,count(*) cnt from sold_drugs a group by a.drug_id,a.pharmacy_branch_id ) sold  right join
(select a.drug_id,a.pharmacy_branch_id,count(*) cnt from available_drugs_store a group by a.pharmacy_branch_id,a.drug_id) distribute
 on  sold.pharmacy_branch_id=distribute.pharmacy_branch_id and sold.drug_id=distribute.drug_id) a, pharmacy_branch b, drug c where a.pharmacy_branch_id=b.pharmacy_branch_id
 and a.drug_id=c.drug_id
 and a.drug_id=p_drug_id) loop
       pipe row (i);
    end loop;
    return;
  end find_res;

end sold_drugs_pkg;
