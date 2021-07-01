--Đề trong dấu nháy thì phải viết đúng hoa, thường.


--Tạo một schema chứa các bảng. COMMON USER KHÔNG LIÊN HÊ VỚI PLUGGABLE DATABASE ĐƯỢC, VÍ DỤ NHƯ KHÔNG PHÂN QUYỀN ĐẾN PLUGGABLE ĐƯỢC
create user c##bv_schema identified by bv_schema;
grant create session to C##bv_schema; --de login duoc
grant create table to c##bv_schema;
grant unlimited tablespace to c##bv_schema; --cap vung nho cho user(de insert duoc du lieu)
--Tao mot user quan tri
create user c##admin_bv identified by admin_bv;
grant create session to C##admin_bv;

CREATE USER bv_schema identified by bv_schema;
grant create session to bv_schema;
grant create table to bv_schema;
grant unlimited tablespace to bv_schema;

--xem danh sach nguoi dung trong he thong
select username from all_users;

--Xem thong tin ve quyen cua user/role
select u.username, s.grantee, r.granted_role, s.privilege
from all_users u left join dba_sys_privs s on u.username=s.grantee left join dba_role_privs r on r.grantee=s.grantee
where u.username='&username'
order by 1;
/*
select * from dba_role_privs connect by prior granted_role = grantee start with grantee = '&USER' order by 1,2,3;
select * from dba_sys_privs  where grantee = '&USER' or grantee in (select granted_role from dba_role_privs connect by prior granted_role = grantee start with grantee = '&USER') order by 1,2,3;
select * from dba_tab_privs  where grantee = '&USER' or grantee in (select granted_role from dba_role_privs connect by prior granted_role = grantee start with grantee = '&USER') order by 1,2,3,4;

select * from user_role_privs;
select * from user_tab_privs;
select * from dba_tab_privs;
select * from dba_col_privs;
select * from dba_sys_privs;
select * from dba_views;
*/
select * from dba_objects; --xem danh sach cac object trong db.

select o.owner as chusohuu, o.object_name as tendoituong, o.object_type as loai ,
    t.grantee as nguoiduocquyenBang,t.privilege as quyen
from dba_objects o left join dba_tab_privs t on o.object_name = t.table_name
order by 1;

--Cho phép tạo mới, xóa, sửa (hiệu chỉnh) user hoặc role.
--create or delete or update on user or role
--objectname: ten doi tuong 
--pass: mat khau doi tuong
--CDU; ten thao tac (create,delete,update)
--obt: doi tuong thao tac (role,user)
create or replace procedure CDUUserOrRole(CDU varchar2, obj varchar2, objectname varchar2,pass varchar2 := null)
is
    object_name varchar2(20) := objectname;
    pwd varchar2(20) := pass;
    c_d_u varchar2(20) := CDU;
    v_obj varchar2(20) := obj;
    stmt varchar2(1000);
begin
    if v_obj != 'user' or v_obj != 'role'
    then 
        dbms_output.put_line('object must be role or user');
        rollback;
    end if;
    if c_d_u = 'create'
    then
        stmt := 'create ' || v_obj || ' ' || object_name || ' identified by ' || pwd ;
    elsif c_d_u = 'delete'
    then 
        stmt := 'drop ' || v_obj || ' ' || object_name;
    elsif c_d_u = 'update'
    then 
        stmt := 'alter ' || v_obj || ' ' || object_name || ' identified by ' || pwd;
    else
        dbms_output.put_line('CDU must be create or delete or update');
        rollback;
    end if;
    execute immediate(stmt);
end;
--execute cduuserorrole('update', 'user', 'c##hoang', 'hoang1');
--grant create session to c##hoang;
show connection;
show con_name;
show pdbs;
alter pluggable database pdb open read write force;
alter session set container=pdb;

select * from all_users;
SELECT SYS_CONTEXT('USERENV','SERVER_HOST') FROM dual;
SELECT SYS_CONTEXT('USERENV','current_schema') FROM dual;
SELECT SYS_CONTEXT('USERENV','session_user') FROM dual;
--select * from c##bv_schema.benhnhan;
create user khoaminhi identified by khoaminhi;
select * from all_users where username = 'KHOAMINHI';--mat khau viet hoa moi truy cap duoc dung, neu muon khong phai viet hoa thi phài đặt mật khẩu trong ""
select * from dba_users;

/*xem quyền vừa mới phát
DBA_ROLE_PRIVS - Roles granted to users and roles
ROLE_ROLE_PRIVS - Roles which are granted to roles
ROLE_SYS_PRIVS - System privileges granted to roles
ROLE_TAB_PRIVS - Table privileges granted to roles
*/

select * from dba_role_privs WHERE GRANTED_ROLE = 'QUANLYTAINGUYENVANHANSU';
select distinct role from dba_roles;

--select * from role_role_privs;
select * from role_sys_privs;
select * from role_tab_privs;

select dr.granted_role, dr.grantee, rs.privilege as quyenhethong, dr.admin_option,
    rt.table_name, rt.privilege as quyentrenbang, rt.owner
from dba_role_privs dr left join role_sys_privs rs on dr.granted_role = rs.role
    left join role_tab_privs rt on rt.role = dr.granted_role
where dr.granted_role = 'QUANLYTAINGUYENVANHANSU';

select * from dba_roles dr left join dba
--tao role


--===================Xu ly phan nguoi dung==============================--
--Them thong tin nguoi dung
create or replace procedure p_insert_thongtinnhanvien
    (MADVI in NUMBER, TENNV in NVARCHAR2 := NULL, VAITRO in NVARCHAR2 := NULL, LUONG in NUMBER := NULL)
is 
    get_manv number(38, 0);
begin
    select (max(manv)+1) into get_manv from bv_schema.nhanvien;
    insert into bv_schema.nhanvien(MANV, MADVI, TENNV, VAITRO, LUONG) 
        values(get_manv, MADVI, TENNV, VAITRO, LUONG);
    commit;
end;

begin 
    p_insert_thongtinnhanvien(1, 'huong', 'ke toan', 12);
end;

select * from dual;
select * from bv_schema.nhanvien where tennv = 'HƯNG';
select password from dba_users  where username = 'THUONG' and password = null;
SELECT SYS_CONTEXT ('USERENV', 'SESSION_USER') 
   FROM DUAL;
   
select value from v$parameter where name='service_names'
