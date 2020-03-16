create table available_drugs_store
(
drug_id number references drug(drug_id),
pharmacy_branch_id  number references pharmacy_branch(pharmacy_branch_id)
);
