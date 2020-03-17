alter table employee add constraint empl_unique unique(pharmacy_branch_id);
alter table employee modify (pharmacy_branch_id not null);


