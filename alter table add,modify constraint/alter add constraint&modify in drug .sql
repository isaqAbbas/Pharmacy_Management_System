alter table drug  modify receipt varchar2(10);
alter table drug add constraint check_receipt check(receipt in ('Yes','No'));
