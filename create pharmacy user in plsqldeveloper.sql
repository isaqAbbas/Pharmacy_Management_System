alter session set "_ORACLE_SCRIPT"=true; 
create user PHARMACY identified by pharmacy;

grant connect to pharmacy;
GRANT CONNECT, RESOURCE, DBA TO pharmacy;
GRANT UNLIMITED TABLESPACE TO pharmacy;

PS:You can create a user and grant privileges in any user

