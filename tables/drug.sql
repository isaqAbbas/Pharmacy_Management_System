create table drug
(
drug_id number,
name varchar2(50),
price number,
expiry_date date,
drug_producer_id number references drug_producer(drug_producer_id),
receipt number,
primary key(drug_id)
);
