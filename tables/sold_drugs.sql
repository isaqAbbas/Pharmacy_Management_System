create table sold_drugs
(
employee_id number references employee(employee_id),
customer_id number references customer(customer_id),
sold_date date,
drug_id number references drug(drug_id),
pharmacy_branch_id number references pharmacy_branch(pharmacy_branch_id)
);
