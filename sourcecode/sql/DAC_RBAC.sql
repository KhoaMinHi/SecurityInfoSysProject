create role QuanLyTaiNguyenVaNhanSu;
create role QuanLyTaiVu;
create role QuanLyChuyenMon;
create role BoPhanTiepTan;
create role BoPhanTaiVu;
create role BacSiDieuTri;
create role BoPhanBanThuoc;
create role BoPhanKeToan;

--thu tuc cap quyen select tren tat ca bang
--username: schema chua cac bang
--grantee: doi tuong can cap quyen
create or replace procedure grantSelectAllTable(username varchar2,grantee varchar2)
as
begin
    for i in (select owner,table_name from all_tables where owner = username)
    loop
        execute immediate 'grant select on ' || i.owner || '.' || i.table_name || ' to ' || grantee;
    end loop;
end;


--cap quyen cho role QuanLyTaiNguyenVaNhanSu
--role QUANLYTAINGUYENVANHANSU duoc them,xoa,sua tren bang NHANVIEN,DONVI va Xem tat ca cac bang
grant insert,delete,update on NHANVIEN to QuanLyTaiNguyenVaNhanSu;
grant insert,delete,update on DONVI to QuanLyTaiNguyenVaNhanSu;
execute grantSelectAllTable('QUANLYBENHVIEN','QuanLyTaiNguyenVaNhanSu');

--cap quyen cho role QuanLyTaiVu
--QuanLyTaiVu duoc quyen insert,update tren don gia thuoc va don gia dich vu
--QuanLyTaiVu duoc quyen select tren tat ca bang
grant insert,update(DONGIADVU) on DICHVU to QuanLyTaiVu;
grant insert,update(DONGIATHUOC) on THUOC to QuanLyTaiVu;
execute grantSelectAllTable('QUANLYBENHVIEN','QuanLyTaiVu');

--cap quyen cho role QuanLyChuyenMon
grant select on HOSOKB to QuanLyChuyenMon;

--cap quyen cho role BoPhanTiepTan
grant insert,update,delete on BENHNHAN to BoPhanTiepTan;
grant insert(MAKB,MABN,MANV_DIEUPHOI,MANV_DON,NGAYKB,TRIEUCHUNG),update(MAKB,MABN,MANV_DIEUPHOI,MANV_DON,NGAYKB,TRIEUCHUNG) on HOSOKB to BoPhanTiepTan;
grant delete on HOSOKB to BoPhanTiepTan;

--thu tuc tim kiem benh nhan co id duoc nhap vao
create or replace procedure TimKiemBenhNHan(p_id integer)
as
    p_Ten nvarchar2(50);
    p_SDT integer;
    p_DiaChi nvarchar2(100);
    p_NamSinh date;
begin
    select TENBN,SDTBN,DIACHIBN,NAMSINHBN into p_Ten,p_SDT,p_DiaChi,p_NamSinh
    from BENHNHAN
    where MABN = p_id;
    dbms_output.put_line('Ten: ' || p_Ten);
    dbms_output.put_line('SDT: ' || p_SDT);
    dbms_output.put_line('Dia Chi: ' || p_DiaChi);
    dbms_output.put_line('Nam Sinh: ' || p_NamSinh);
    exception 
        when no_data_found then
            dbms_output.put_line('khong tim thay benh nhan!');        
end;
grant execute on TimKiemBenhNhan to BoPhanTiepTan;

--cap quyen cho role BoPhanTaiVu
grant select on DICHVU to BoPhanTaiVu;
grant select on HOADON to BoPhanTaiVu;
grant select on CTHOADON to BoPhanTaiVu;
grant update(DONGIADVU) on DICHVU to BoPhanTaiVu;

--cap quyen cho role BacSiDieuTri
create or replace view v_HoSoDichVu as
select SUDUNG.MAKB,SUDUNG.MADVU,SUDUNG.NGAYSUDUNG,HOSOKB.KETLUANBS,DONTHUOC.MADT,DONTHUOC.NGAYLAP,THUOC.MATHUOC,THUOC.NGAYHETHANG,THUOC.CONGDUNGTHUOC,THUOC.TENTHUOC,THUOC.DONGIATHUOC
from HOSOKB join SUDUNG on HOSOKB.MAKB = SUDUNG.MAKB 
            join NHANVIEN on SUDUNG.MANV = NHANVIEN.MANV
            join DONTHUOC on HOSOKB.MAKB = DONTHUOC.MAKB
            join CTDONTHUOC on DONTHUOC.MAKB = CTDONTHUOC.MADT
            join THUOC on CTDONTHUOC.MATHUOC = THUOC.MATHUOC
where NHANVIEN.VAITRO = 'Bac Si' and NHANVIEN.MANV = sys_context('userenv','session_user');
grant insert,update on v_HoSoDichVu to BacSiDieuTri;

--cap quyen cho role BoPhanBanThuoc
grant select on THUOC to BoPhanBanThuoc;
grant select on DONTHUOC to BoPhanBanThuoc;
grant select on CTDONTHUOC to BoPhanBanThuoc;

--cap quyen cho role BoPhanKeToan
grant select on THANGNAM to BoPhanKeToan;
grant select on NHANVIEN to BoPhanKeToan;
grant select on CTTRUCCONG to BoPhanKeToan;