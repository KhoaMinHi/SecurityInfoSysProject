/*
select * from sys.aud$; --table cho xem thong tin audit khi set audit_trail parameter = db
select * from dba_common_audit_trail;

show pdbs;
select * from ALL_DEF_AUDIT_OPTS;
select * from dba_audit_trail;
select * from dba_audit_session;
--Fine-Grain Audit
select * from sys.fga_log$;
select * from dba_fga_audit_trail;

show parameter audit_trail;
show parameter AUDIT_SYS_OPERATIONS;
select username,machine,terminal,logon_time from v$session;
show pdbs;
ALTER PLUGGABLE DATABASE pdb open;
show CON_NAME;
select * from dba_users;

select * from dba_sys_privs;
*/

--Viec audit logon, logoff:
--  audit trong pluggable database chi audit cac user trong pluggable (user khong co tien to c##)
--  audit trong cdb thi chi audit cac user co tien to c##
--  khong audit user sys
--=======================================
--standard audit
alter system set audit_trail=db, extended scope=spfile; --qua sql plus shutdown and restart database

--Viec audit logon, logoff:
--  audit trong pluggable database chi audit cac user trong pluggable (user khong co tien to c##)
--  audit trong cdb thi chi audit cac user co tien to c##
--  khong audit user sys
audit session;
select audit_type, session_id, db_user, os_user, statement_type, extended_timestamp as "thuc hien luc" from dba_common_audit_trail;

--=================
--2. Giám sát hoạt động của bộ phận tiếp tân và điều phối bệnh: 
--  xóa, sửa thông tin bệnh nhân và hồ sơ bệnh nhân.
audit delete, update on bv_schema.benhnhan;

select audit_type, db_user, os_user, object_schema, object_name,
    statement_type,sql_text, extended_timestamp as "luc may gio" 
from dba_common_audit_trail
where statement_type = 'UPDATE' OR statement_type = 'DELETE';


--=================
--3.	Giám sát nhân viên phòng tài vụ cập nhật tiền về việc sử dụng 
--các dịch vụ và hóa đơn tính tiền của bệnh nhân. FGA
-- Hình như không audit với lệnh delete vì nó vi phạm khóa ngoại (CHITIETHOADON table) xóa không được,  nếu 
--  chỉ định xóa casecase? thì oke
begin
    dbms_fga.add_policy
    (
        object_schema => 'BV_SCHEMA',
        object_name => 'HOADON',
        policy_name => 'chiphikhambenh_audit',
        audit_column => 'TONGTIEN',
        statement_types => 'UPDATE, DELETE'
    );
end;

select db_user, os_user, object_schema, policy_name, sql_text, statement_type, extended_timestamp from dba_fga_audit_trail;



