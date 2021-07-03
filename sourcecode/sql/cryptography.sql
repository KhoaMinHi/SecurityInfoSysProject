alter pluggable database  pdb open;
set serveroutput on;



create or replace function f_myEncryption(input_string in varchar2, 
            key_string in varchar2)
    return varchar2
    is
        encrypted_raw raw(2048);     -- Dữ liệu đã được mã hóa
        encryption_type    PLS_INTEGER;
        keylength_longer_7 exception;
    begin
        if length(key_string) < 8 then
            raise keylength_longer_7;
        else
        encryption_type :=  DBMS_CRYPTO.ENCRYPT_DES
                          + DBMS_CRYPTO.CHAIN_CBC
                          + DBMS_CRYPTO.PAD_PKCS5;
        encrypted_raw := dbms_crypto.encrypt(src => UTL_I18N.STRING_TO_RAW (input_string,  'AL32UTF8'),
                                             typ => encryption_type,
                                             key => UTL_I18N.STRING_TO_RAW (key_string,  'AL32UTF8'));
             
        return rawtohex(encrypted_raw);
        end if;
    exception
        when keylength_longer_7 then
            dbms_output.put_line('key string must be longer than 7!');
        when others then
            dbms_output.put_line('MYENCRYPTION FUNCTION ERROR');
    end;
    

--hàm decrypt
create or replace function f_myDecryption (input_string in varchar2, 
            key_string in varchar2)
    return varchar2
    is
        decrypted_raw raw(2048);     -- Dữ liệu đã được mã hóa
        decryption_type    PLS_INTEGER;
        keylength_longer_7 exception;
    begin
        if length(key_string) < 8 then
            raise keylength_longer_7;
        else
        decryption_type :=  DBMS_CRYPTO.ENCRYPT_DES
                          + DBMS_CRYPTO.CHAIN_CBC
                          + DBMS_CRYPTO.PAD_PKCS5;
        decrypted_raw := dbms_crypto.decrypt(src => hextoraw(input_string),
                                            typ => decryption_type,
                                            key => UTL_I18N.STRING_TO_RAW (key_string,  'AL32UTF8'));

        return UTL_I18N.RAW_TO_CHAR(decrypted_raw, 'AL32UTF8');
        end if;
    exception
        when keylength_longer_7 then
            dbms_output.put_line('Key string must be longer than 7!');
        when others then
            dbms_output.put_line('MYDECRYPTION FUNCTION ERROR');
    end;
    

/*
--============== test ====================
set serveroutput on
declare
    input_string varchar2(1028) := '....';
    key_string varchar2(32) := '12345678';
    output_raw raw(1028);
    output_string varchar2(1028);
    
begin
    dbms_output.put_line('input_string: ' || input_string);
    output_raw := F_MYENCRYPTION(input_string, key_string);
    DBMS_OUTPUT.PUT_LINE('After encrypt: ' || output_raw);
    
    dbms_output.put_line('output_raw of decryption parameter: ' || output_raw || ' key: ' || key_string);
    
    output_string := F_MYDECRYPTION(output_raw, key_string);
    DBMS_OUTPUT.PUT_LINE('After decrypt: ' || output_string);
end;


declare
tensv_temp varchar2(50);
key_sv varchar2(50) := 'khoaminhi';
begin

select h.tensv into tensv_temp  from KHOA.HOCSINH h where h.mssv=1;
    update khoa.hocsinh
    set tensv = f_myencryption(tensv_temp, key_sv)
    where mssv = 1;

end;
select * from khoa.hocsinh;
select f_mydecryption(tensv, 'khoaminhi') from khoa.hocsinh where mssv  = 2;
*/

create or replace trigger trigger_myencryption
before update of ketluanbs on BV_SCHEMA.hosokb for each row
declare
    key_string varchar2(150);
    makbnumber number(38,0);
    numberrow number;
begin
    key_string := dbms_random.string('p', 16);
    :new.ketluanbs := F_MYENCRYPTION(:new.ketluanbs, key_string);
    
    select count(*) into numberrow from bv_schema.hosobenhnhankeytable where makb = :old.makb;
    if numberrow = 0 then
        insert into bv_schema.hosobenhnhankeytable(makb, keystring) values(:old.makb, key_string);
    else
        update bv_schema.hosobenhnhankeytable set keystring = key_string where makb = :old.makb;
    end if;
end;

drop trigger myencryption;
create table bv_schema.hosobenhnhankeytable
(
    makb NUMBER(38,0), 
	keystring VARCHAR2(128)
);

/*
set serveroutput on;
declare 
    a number;
begin
select count(makb) into a from bv_schema.hosobenhnhankeytable where makb = 1;
dbms_output.put_line('kq:' || a);
end;*/

--bê cái nay qua bv_schema phan quyen select lai cho sys
grant all on BV_SCHEMA.hosobenhnhankeytable to sys;
select F_MYDECRYPTION(keystring, 'KF}Rc]{LMm`K~?;#') from BV_SCHEMA.hosobenhnhankeytable where makb = 1;

SELECT K.MAKB, k.keystring, h.makb, h.ketluanbs, F_MYDECRYPTION(h.ketluanbs, k.keystring) FROM BV_SCHEMA.hosobenhnhankeytable K JOIN  BV_SCHEMA.HOSOKB H ON K.MAKB = H.MAKB;
declare
    output_raw varchar2(500) := 'C8D22EC412B08BAA0B1E57B9B5DD7ADEABA69E0E013C9C3D';
    output_string varchar2(500);
begin
output_string := F_MYDECRYPTION(output_raw, 'KF}Rc]{LMm`K~?;#');
    DBMS_OUTPUT.PUT_LINE('After decrypt: ' || output_string);
end;


--============ bác sĩ tìm kiếm bệnh nhan và cập nhật kết luận bệnh============--

select b.mabn, b.tenbn, h.makb, h.trieuchung, SYS.F_MYDECRYPTION(h.ketluanbs, k.keystring), h.ngaykb 
from bv_schema.benhnhan b join BV_SCHEMA.hosokb h on h.mabn=b.mabn JOIN BV_SCHEMA.hosobenhnhankeytable k on k.makb=h.makb;
grant select on bv_schema.benhnhan to HUNG, THANH;
grant select on bv_schema.HOSOKB to HUNG, THANH;
GRANT SELECT ON BV_SCHEMA.hosobenhnhankeytable TO HUNG, THANH;
GRANT UPDATE(KETLUANBS) ON BV_SCHEMA.HOSOKB TO HUNG, THANH;
grant EXECUTE on F_MYDECRYPTION to HUNG, THANH;
