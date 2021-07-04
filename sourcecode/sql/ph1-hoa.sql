--in ra cac user,role,table,view co trong he thong
create or replace procedure showAllUserRoleTableView
is
    stmt varchar(1000);
begin
    dbms_output.put_line('-----------USER TRONG HE THONG----------');
    for i in (select username from dba_users)
    loop
        dbms_output.put_line(i.username);
    end loop;
    dbms_output.put_line('-----------------------------------------');
    dbms_output.put_line('-----------ROLE TRONG HE THONG----------');
    for i in (select role from dba_roles)
    loop
        dbms_output.put_line(i.role);
    end loop;
    dbms_output.put_line('------------------------------------------');
    dbms_output.put_line('-----------TABLE TRONG HE THONG----------');
    for i in (select table_name from all_tables)
    loop
        dbms_output.put_line(i.table_name);
    end loop;
    dbms_output.put_line('-----------------------------------------');
    dbms_output.put_line('-----------VIEW TRONG HE THONG----------');
    for i in (select view_name from all_views)
    loop
        dbms_output.put_line(i.view_name);
    end loop;
end;
exec showAllUserRoleTableView;

--in ra quyen cua user hoac role tren doi tuong du lieu
--nameRoleOrUser: ten cua user hoac role
--obj : ten doi tuong du lieu
--RoleOrUser: la role hay user
create or replace procedure showPrivilegeOfUserOrRole
    (obj varchar2,nameRoleOrUser varchar2,RoleOrUser varchar2)
is
begin
    if(RoleOrUser = 'USER')
    then
        if(obj = 'dba_tab_privs')
        then
            dbms_output.put_line('grantee   | owner    | table_name     |grantor    |privilege      |grantable      |hierarchy');
            for i in (select * from dba_tab_privs where grantee = nameRoleOrUser)
            loop
                dbms_output.put_line(i.grantee||'  |  '||i.Owner||'  |  '||i.table_name||'  |  '||i.grantor||'  |  '||i.privilege||'  |  '||i.grantable||'  |  '||i.hierarchy);
            end loop;
        elsif(obj = 'dba_sys_privs')
        then
            dbms_output.put_line('grantee   |privilege      |admin_option');
            for i in (select * from dba_sys_privs where grantee = nameRoleOrUser)
            loop
                dbms_output.put_line(i.grantee||'  |  '||i.privilege||'  |  '||i.admin_option);
            end loop;
        elsif(obj = 'dba_col_privs')
        then
            dbms_output.put_line('grantee   | owner    | table_name     |column_name    |grantor    |privilege');
            for i in (select * from dba_col_privs where grantee = nameRoleOrUser)
            loop
                dbms_output.put_line(i.grantee||'  |  '||i.Owner||'  |  '||i.table_name||'  |  '||i.column_name||'  |   '||i.grantor||'  |  '||i.privilege);
            end loop;
        end if;
    else
        if(obj = 'role_tab_privs')
        then
            dbms_output.put_line('role   | owner    | table_name     |column_name    |privilege      |grantable');
            for i in (select * from role_tab_privs where role = nameRoleOrUser)
            loop
                dbms_output.put_line(i.role||'  |  '||i.Owner||'  |  '||i.table_name||'  |  '||i.column_name||'  |  '||i.privilege||'  |  '||i.grantable);
            end loop;
        elsif(obj = 'role_role_privs')
        then
            dbms_output.put_line('role   |granted_role      |admin_option');
            for i in (select * from role_role_privs where role = nameRoleOrUser)
            loop
                dbms_output.put_line(i.role||'  |  '||i.granted_role||'  |  '||i.admin_option);
            end loop;
        end if;
    end if;
end;
create user DEMO identified by demo;
grant update(EMAIL,HOTEN) on NHANVIEN to DEMO;
grant select on NHANVIEN to DEMO;
exec showPrivilegeOfUserOrRole('dba_sys_privs','SYS','USER');
exec showPrivilegeOfUserOrRole('dba_tab_privs','DEMO','USER');
exec showPrivilegeOfUserOrRole('dba_col_privs','DEMO','USER');
exec showPrivilegeOfUserOrRole('role_tab_privs','DBA','ROLE');


--thu hoi quyen tu user or role
--objname: ten doi tuong can thu hoi
--priv: quyen can thu hoi
--obj: doi tuong duoc thu hoi quyen (co the co hoac khong)
create or replace procedure revokePriv(objectname varchar2, priv varchar2,obj varchar2)
is
    stmt varchar2(2000);
begin
    if obj is not null
    then
        stmt := 'revoke ' || priv || ' on ' || obj || ' from ' || objectname;
    else
        stmt := 'revoke ' || priv || ' from ' || objectname;
    end if;
    execute immediate(stmt);
end;

grant create session to demo;

--thu hoi quyen update ten table demo tu user demo
select * from dba_tab_privs where grantee = 'DEMO';
select * from dba_sys_privs where grantee = 'DEMO';
select * from dba_col_privs where grantee = 'DEMO';

exec revokepriv('demo', 'select','NHANVIEN');
exec revokepriv('demo', 'create session',null);
exec revokepriv('demo', 'update','NHANVIEN');

--cap quyen cho user or role
--objname: ten doi tuong can cap
--priv: quyen can can
--obj: doi tuong duoc cap quyen(co the co hoac khong)
--WRO: with grant option
create or replace procedure grantPriv(priv varchar2, col varchar2, obj varchar2, objectname varchar2, WRO char)
is
    stmt varchar2(10000);
begin
    if (priv = 'select' or priv = 'update') and col is not null
    then 
        if wro = '1'
        then
            stmt := 'grant ' || priv || '(' || col || ') on ' || obj || ' to ' || objectname || ' with grant option';
        else
            stmt := 'grant ' || priv || '(' || col || ') on ' || obj || ' to ' || objectname;
        end if;
    else
        if obj is not null
        then
            if wro = '1'
            then
                stmt := 'grant ' || priv || ' on ' || obj || ' to ' || objectname || ' with grant option';
            else
                stmt := 'grant ' || priv || ' on ' || obj || ' to ' || objectname;
            end if;
        else
            if wro = '1'
            then
                stmt := 'grant ' || priv || ' to ' || objectname || ' with grant option';
            else
                stmt := 'grant ' || priv || ' to ' || objectname;
            end if;
        end if;
    end if;
    execute immediate(stmt);
end;

select * from dba_tab_privs where grantee = 'DEMO';
select * from dba_sys_privs where grantee = 'DEMO';
select * from dba_col_privs where grantee = 'DEMO';

execute grantPriv('update', 'HOTEN', 'NHANVIEN', 'DEMO','0'); 
execute grantPriv('select', null, 'NHANVIEN', 'DEMO','0'); 
execute grantPriv('create session', null, null, 'DEMO','0'); 

create or replace procedure addUserOrRole(UserOrRole varchar2,Name varchar2,clause varchar2)
is
    stmt varchar2(2000);
begin
    stmt := 'create ' || UserOrRole || ' ' || Name || ' ' || clause;
    execute immediate(stmt);
end;
drop user test11;
drop role test12;
select * from dba_users where username = 'TEST11';
select * from dba_roles where role = 'TEST12';
exec addUserOrRole('User','test11','identified by test11');
exec addUserOrRole('Role','test12',null);