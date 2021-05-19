--in ra cac user co trong he thong
create or replace procedure showAllUser
is
    stmt varchar(1000);
begin
    stmt := 'select username from dba_users';
    execute immediate(stmt);
end;

begin
showAllUser;
end;
--in ra quyen cua user hoac role tren doi tuong du lieu
--granteename: ten user hoac role
--object : ten doi tuong du lieu 
create or replace procedure showPrivilegeOfUserOrRole
    (granteename varchar2,obj varchar2)
is
    grantee_name varchar2(50) := granteename;
    v_obj varchar2(50) := obj;
    stmt varchar2(1000);
begin
    stmt := 'select * from ' || v_obj || ' where granteename = ' || grantee_name;
    execute immediate(stmt);
end;

execute showPrivilegeOfUserOrRole('SYSTEM', 'dba_tab_privs');

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

exec cduuserorrole('create', 'user', 'a1a1', 'a1a1');
select * from dba_roles;
SELECT * FROM User_Source-- WHERE Name ='cduuserorrole' ORDER BY Type, Line;
select * from dba_procedures where object_name = 'CDUUSERORROLE';
alter procedure sys.CDUUSERORROLE recompile;
show con_name;
select * from dba_users;
--thu hoi quyen tu user or role
--objname: ten doi tuong can thu hoi
--priv: quyen can thu hoi
--obj: doi tuong duoc thu hoi quyen (co the co hoac khong)
create or replace procedure revokePriv(objectname varchar2, priv varchar2,obj varchar2 := null)
is
    object_name varchar2(20) := objectname;
    v_priv varchar2(20) := priv; 
    v_obj varchar2(20) := obj;
    stmt varchar2(1000);
begin
    if v_obj != null
    then
        stmt := 'revoke ' || v_priv || ' on ' || obj || ' from ' || object_name;
    else
        stmt := 'revoke ' || v_priv || ' from ' || object_name;
    end if;
    execute immediate(stmt);
end;

REVOKE UPDATE (c1,c2) ON TABLE s.v FROM PUBLIC
quyền, đối tượng, cho ai
--cap quyen cho user or role
--objname: ten doi tuong can cap
--priv: quyen can can
--obj: doi tuong duoc cap quyen(co the co hoac khong)
--WRO: with grant option
create or replace procedure grantPriv(priv varchar2, cot varchar2 := null, obj varchar2 := null, objectname varchar2, WRO char := '0')
is
    object_name varchar2(50) := objectname;
    v_priv varchar2(50) := priv; 
    v_obj varchar2(50) := obj;
    v_wro char(1) := WRO;
    v_col varchar2(50) := cot;
    stmt varchar2(1000);
begin
    if (v_priv = 'select' or v_priv = 'update') and v_col != null
    then 
        if v_obj is not null
        then
            if v_wro = '1'
            then
                stmt := 'grant ' || v_priv || '(' || v_col || ') on ' || obj || ' to ' || object_name || ' with grant option';
            else
                stmt := 'grant ' || v_priv || '(' || v_col || ') on ' || obj || ' to ' || object_name;
            end if;
        else
            if v_wro = '1'
            then
                stmt := 'grant ' || v_priv || '(' || v_col || ') to ' || object_name || ' with grant option';
            else
                stmt := 'grant ' || v_priv || '(' || v_col || ') to ' || object_name;
            end if;
        end if;
    else
        if v_obj is not null
        then
            if v_wro = '1'
            then
                stmt := 'grant ' || v_priv || ' on ' || obj || ' to ' || object_name || ' with grant option';
            else
                stmt := 'grant ' || v_priv || ' on ' || obj || ' to ' || object_name;
            end if;
        else
            if v_wro = '1'
            then
                stmt := 'grant ' || v_priv || ' to ' || object_name || ' with grant option';
            else
                stmt := 'grant ' || v_priv || ' to ' || object_name;
            end if;
        end if;
    end if;
    execute immediate(stmt);
end;

execute grantPriv('select', 'id', 'c##bv_schema.test', 'c##hoang'); 

--chinh sua quyen cua user or role
--objectname : ten doi tuong can sua quyen
--obj: loai doi tuong can sua quyen (user or role)
--priv: quyen muon chinh sua
create or replace procedure alterUserOrRole(objectname varchar2,obj varchar2,priv varchar2)
is
    object_name varchar2(100) := objectname;
    v_obj varchar2(100) := obj;
    v_priv varchar2(100) := priv;
    stmt varchar2(1000);
begin
    stmt := 'alter ' || v_obj || ' ' || object_name || ' ' || v_priv;
    execute immediate(stmt);
end;

