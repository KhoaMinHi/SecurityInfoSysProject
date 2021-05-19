
    --t?o db
/*==============================================================*/
/* Table: BENHNHAN                                              */
/*==============================================================*/
create table BENHNHAN 
(
   MABN                 integer                        not null,
   TENBN                nvarchar2(50)                      null,
   SDTBN                integer                        null,
   DIACHIBN             nvarchar2(100)                      null,
   NAMSINHBN            date                           null,
   constraint PK_BENHNHAN primary key (MABN)
);

/*==============================================================*/
/* Table: CTDONTHUOC                                            */
/*==============================================================*/
create table CTDONTHUOC(
   MATHUOC              integer                        not null,
   MADT                 integer                        not null,
   constraint PK_CTDONTHUOC primary key(MATHUOC, MADT)
);


/*==============================================================*/
/* Table: CTHOADON                                              */
/*==============================================================*/
create table CTHOADON 
(
   MADVU                integer                        not null,
   MAHD                 integer                        not null,
   constraint PK_CTHOADON primary key (MADVU, MAHD)
);


/*==============================================================*/
/* Table: CTTRUCCONG                                            */
/*==============================================================*/
create table CTTRUCCONG 
(
   NGAY                 date                           not null,
   CA                   nvarchar2(10)                      not null,
   MANV                 integer                        not null,
   SONGAYTRUC           integer                        null,
   constraint PK_CTTRUCCONG primary key (NGAY, CA, MANV)
);



/*==============================================================*/
/* Table: DICHVU                                                */
/*==============================================================*/
create table DICHVU 
(
   MADVU                integer                        not null,
   TENDVU               nvarchar2(50)                      null,
   DONGIADVU            numeric                        null,
   constraint PK_DICHVU primary key (MADVU)
);

/*==============================================================*/
/* Table: DONTHUOC                                              */
/*==============================================================*/
create table DONTHUOC 
(
   MADT                 integer                        not null,
   MAKB                 integer                        not null,
   NGAYLAP              date                           null,
   constraint PK_DONTHUOC primary key (MADT)
);


/*==============================================================*/
/* Table: DONVI                                                 */
/*==============================================================*/
create table DONVI 
(
   MADVI                integer                        not null,
   TENDVI               nvarchar2(100)                      null,
   constraint PK_DONVI primary key (MADVI)
);


/*==============================================================*/
/* Table: HOADON                                                */
/*==============================================================*/
create table HOADON 
(
   MAHD                 integer                        not null,
   MAKB                 integer                        not null,
   NGAYHD               date                           null,
   constraint PK_HOADON primary key (MAHD)
);


/*==============================================================*/
/* Table: HOSOKB                                                */
/*==============================================================*/
create table HOSOKB 
(
   MAKB                 integer                        not null,
   MABN                 integer                        not null,
   MANV_DIEUPHOI                 integer                        not null,
   MANV_DON             integer                        not null,
   NGAYKB               date                           null,
   TRIEUCHUNG           nvarchar2(1000)                      null,
   KETLUANBS            nvarchar2(1000)                      null,
   constraint PK_HOSOKB primary key (MAKB)
);

/*==============================================================*/
/* Table: NHANVIEN                                              */
/*==============================================================*/
create table NHANVIEN 
(
   MANV                 integer                        not null,
   MADVI                integer                        not null,
   TENNV                nvarchar2(50)                      null,
   VAITRO               nvarchar2(50)                      null,
   LUONG                numeric                        null,
   constraint PK_NHANVIEN primary key (MANV)
);


/*==============================================================*/
/* Table: SUDUNG                                                */
/*==============================================================*/
create table SUDUNG 
(
   MANV                 integer                        not null,
   MAKB                 integer                        not null,
   MADVU                integer                        not null,
   NGAYSUDUNG           date                           null,
   constraint PK_SUDUNG primary key (MANV, MAKB, MADVU)
);


/*==============================================================*/
/* Table: THANGNAM                                              */
/*==============================================================*/
create table THANGNAM 
(
   NGAY                 date                           not null,
   CA                   nvarchar2(10)                      not null,
   constraint PK_THANGNAM primary key (NGAY, CA)
);


/*==============================================================*/
/* Table: THUOC                                                 */
/*==============================================================*/
create table THUOC 
(
   MATHUOC              integer                        not null,
   TENTHUOC             nvarchar2(50)                      null,
   CONGDUNGTHUOC        nvarchar2(400)                      null,
   NGAYHETHANG          date                           null,
   DONGIATHUOC          numeric                        null,
   constraint PK_THUOC primary key (MATHUOC)
);


alter table CTDONTHUOC
   add constraint FK_CTDONTHU_CTDONTHUO_THUOC foreign key (MATHUOC)
      references THUOC (MATHUOC);

alter table CTDONTHUOC
   add constraint FK_CTDONTHU_CTDONTHUO_DONTHUOC foreign key (MADT)
      references DONTHUOC (MADT);

alter table CTHOADON
   add constraint FK_CTHOADON_CTHOADON_DICHVU foreign key (MADVU)
      references DICHVU (MADVU);

alter table CTHOADON
   add constraint FK_CTHOADON_CTHOADON2_HOADON foreign key (MAHD)
      references HOADON (MAHD);

alter table CTTRUCCONG
   add constraint FK_CTTRUCCO_CTTRUCCON_THANGNAM foreign key (NGAY, CA)
      references THANGNAM (NGAY, CA);

alter table CTTRUCCONG
   add constraint FK_CTTRUCCO_CTTRUCCON_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV);

alter table DONTHUOC
   add constraint FK_DONTHUOC_THUOC_HOSOKB foreign key (MAKB)
      references HOSOKB (MAKB);

alter table HOADON
   add constraint FK_HOADON_CO2_HOSOKB foreign key (MAKB)
      references HOSOKB (MAKB);

alter table HOSOKB
   add constraint FK_HOSOKB_CO_BENHNHAN foreign key (MABN)
      references BENHNHAN (MABN);

alter table HOSOKB
   add constraint FK_HOSOKB_DIEUPHOI_NHANVIEN foreign key (MANV_DIEUPHOI)
      references NHANVIEN (MANV);

alter table HOSOKB
   add constraint FK_HOSOKB_DON_NHANVIEN foreign key (MANV_DON)
      references NHANVIEN (MANV);

alter table NHANVIEN
   add constraint FK_NHANVIEN_THUOC2_DONVI foreign key (MADVI)
      references DONVI (MADVI);

alter table SUDUNG
   add constraint FK_SUDUNG_SUDUNG_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV);

alter table SUDUNG
   add constraint FK_SUDUNG_SUDUNG2_HOSOKB foreign key (MAKB)
      references HOSOKB (MAKB);

alter table SUDUNG
   add constraint FK_SUDUNG_SUDUNG3_DICHVU foreign key (MADVU)
      references DICHVU (MADVU);



            /*nh?p li?u*/
--nhap bang phan cong ngay lam
insert all
    into THANGNAM(ngay, ca) values(to_date('2021/04/01', 'yyyy/mm/dd'),'02')
    into THANGNAM(ngay, ca) values(to_date('2021/04/01', 'yyyy/mm/dd'),'01')
    into THANGNAM(ngay, ca) values(to_date('2021/04/02', 'yyyy/mm/dd'),'01')
    into THANGNAM(ngay, ca) values(to_date('2021/04/02', 'yyyy/mm/dd'),'02')
   into THANGNAM(ngay, ca)  values(to_date('2021/04/03', 'yyyy/mm/dd'),'01')
   into THANGNAM(ngay, ca) values(to_date('2021/04/03', 'yyyy/mm/dd'),'02')
    into THANGNAM(ngay, ca) values(to_date('2021/04/04', 'yyyy/mm/dd'),'02')
    into THANGNAM(ngay, ca) values(to_date('2021/04/05', 'yyyy/mm/dd'),'01')
    into THANGNAM(ngay, ca) values(to_date('2021/04/05', 'yyyy/mm/dd'),'02')
    select DUMMY  from dual;

--ma don vi trong benh vien
insert all
into DONVI(MADVI) values (1)
into DONVI(MADVI) values (2)
select * from dual;

--nhap thuoc
insert all
into THUOC(MATHUOC, TENTHUOC) values(1,'thuốc giảm đau')
into THUOC(MATHUOC, TENTHUOC) values(2,'thuốc nhỏ mắt')
into THUOC(MATHUOC, TENTHUOC) values(3,'thuốc đau bụng')
into THUOC(MATHUOC, TENTHUOC) values(10,'thuốc đau đầu')
into THUOC(MATHUOC, TENTHUOC) values(4,'thuốc tránh thai')
into THUOC(MATHUOC, TENTHUOC) values(5,'thuốc ngừa viêm')
into THUOC(MATHUOC, TENTHUOC) values(6,'thuốc kháng sinh')
into THUOC(MATHUOC, TENTHUOC) values(7,'thuốc trị mụn')
into THUOC(MATHUOC, TENTHUOC) values(8,'thuốc trị nám')
into THUOC(MATHUOC, TENTHUOC) values(9,'thuốc an thần')
select 1 from dual;

--nhap thong tin benh nhan
insert all
into BENHNHAN(MABN, TENBN)values(1,'Trần Hữu Hoàng')
into BENHNHAN(MABN, TENBN)values(2,'Huỳnh Ngọc Hòa')
into BENHNHAN(MABN, TENBN)values(3,'Phạm Minh Khoa')
select 1 from dual;

--thong tin nhan vi�n
insert all
into NHANVIEN(MANV, MADVI, TENNV)values(1,1,'Hưng')
into NHANVIEN(MANV, MADVI, TENNV)values(2,2,'Thành')
into NHANVIEN(MANV, MADVI, TENNV)values(3,1,'Mẫn')
into NHANVIEN(MANV, MADVI, TENNV)values(4,2,'Sang')
select 1 from dual;

--th�ng tin chi ti?t tr?c c�ng
insert all
into CTTRUCCONG(NGAY,CA,MANV)values (to_date('2021/04/01', 'yyyy/mm/dd'),'02',1)
into CTTRUCCONG(NGAY,CA,MANV)values(to_date('2021/04/02', 'yyyy/mm/dd'),'01',2)
into CTTRUCCONG(NGAY,CA,MANV)values(to_date('2021/04/03', 'yyyy/mm/dd'),'01',3)
into CTTRUCCONG(NGAY,CA,MANV)values(to_date('2021/04/02', 'yyyy/mm/dd'),'02',4)
into CTTRUCCONG(NGAY,CA,MANV)values(to_date('2021/04/03', 'yyyy/mm/dd'),'01',1)
into CTTRUCCONG(NGAY,CA,MANV)values(to_date('2021/04/03', 'yyyy/mm/dd'),'02',2)
into CTTRUCCONG(NGAY,CA,MANV)values(to_date('2021/04/04', 'yyyy/mm/dd'),'02',3)
into CTTRUCCONG(NGAY,CA,MANV)values(to_date('2021/04/05', 'yyyy/mm/dd'),'01',4)
into CTTRUCCONG(NGAY,CA,MANV)values(to_date('2021/04/05', 'yyyy/mm/dd'),'02',1)
select 1 from dual;

--nh?p li?u h? s? kh�m b?nh
insert all
into HOSOKB(MAKB,MABN,MANV_DIEUPHOI,MANV_DON)values (1,1,1,1)
into HOSOKB(MAKB,MABN,MANV_DIEUPHOI,MANV_DON)values(2,2,2,2)
into HOSOKB(MAKB,MABN,MANV_DIEUPHOI,MANV_DON)values(3,3,3,3)
into HOSOKB(MAKB,MABN,MANV_DIEUPHOI,MANV_DON)values(4,1,4,4)
into HOSOKB(MAKB,MABN,MANV_DIEUPHOI,MANV_DON)values(5,2,1,1)
into HOSOKB(MAKB,MABN,MANV_DIEUPHOI,MANV_DON)values(6,3,2,2)
into HOSOKB(MAKB,MABN,MANV_DIEUPHOI,MANV_DON)values(7,1,3,3)
into HOSOKB(MAKB,MABN,MANV_DIEUPHOI,MANV_DON)values(8,2,4,4)
into HOSOKB(MAKB,MABN,MANV_DIEUPHOI,MANV_DON)values(9,3,1,1)
into HOSOKB(MAKB,MABN,MANV_DIEUPHOI,MANV_DON)values(10,1,2,2)
select * from dual;

--nh?p ??n thu�c
insert all
into DONTHUOC(MADT,MAKB)values (1,1)
into DONTHUOC(MADT,MAKB)values(2,2)
into DONTHUOC(MADT,MAKB)values(3,3)
into DONTHUOC(MADT,MAKB)values(4,4)
into DONTHUOC(MADT,MAKB)values(5,5)
into DONTHUOC(MADT,MAKB)values(6,6)
into DONTHUOC(MADT,MAKB)values(7,7)
into DONTHUOC(MADT,MAKB)values(8,8)
into DONTHUOC(MADT,MAKB)values(9,9)
into DONTHUOC(MADT,MAKB)values(10,10)
select dummy from dual;

--nh?p chi ti?t ??n thu?c
insert all
into CTDONTHUOC(MATHUOC,MADT)values(1,1)
into CTDONTHUOC(MATHUOC,MADT)values(2,2)
into CTDONTHUOC(MATHUOC,MADT)values(3,3)
into CTDONTHUOC(MATHUOC,MADT)values(4,4)
into CTDONTHUOC(MATHUOC,MADT)values(5,5)
into CTDONTHUOC(MATHUOC,MADT)values(6,6)
into CTDONTHUOC(MATHUOC,MADT)values(7,7)
into CTDONTHUOC(MATHUOC,MADT)values(8,8)
into CTDONTHUOC(MATHUOC,MADT)values(9,9)
into CTDONTHUOC(MATHUOC,MADT)values(10,10)
select *from dual;

--nh?p h�a ??n
insert all
into HOADON(MAHD,MAKB)values(1,1)
into HOADON(MAHD,MAKB)values (2,2)
into HOADON(MAHD,MAKB)values(3,3)
into HOADON(MAHD,MAKB)values(4,4)
into HOADON(MAHD,MAKB)values(5,5)
into HOADON(MAHD,MAKB)values(6,6)
into HOADON(MAHD,MAKB)values(7,7)
into HOADON(MAHD,MAKB)values(8,8)
into HOADON(MAHD,MAKB)values(9,9)
into HOADON(MAHD,MAKB)values(10,10)
select *from dual;

--nh?p d?ch v?
insert all
into DICHVU(MADVU)values (1)
into DICHVU(MADVU)values(2)
into DICHVU(MADVU)values(3)
into DICHVU(MADVU)values(4)
into DICHVU(MADVU)values(5)
into DICHVU(MADVU)values(6)
into DICHVU(MADVU)values(7)
into DICHVU(MADVU)values(8)
into DICHVU(MADVU)values(9)
into DICHVU(MADVU)values(10)
select 1 from dual;


insert all
into CTHOADON(MADVU, MAHD)values(1,1)
into CTHOADON(MADVU, MAHD)values(2,2)
into CTHOADON(MADVU, MAHD)values(3,3)
into CTHOADON(MADVU, MAHD)values(4,4)
into CTHOADON(MADVU, MAHD)values(5,5)
into CTHOADON(MADVU, MAHD)values(6,6)
into CTHOADON(MADVU, MAHD)values(7,7)
into CTHOADON(MADVU, MAHD)values(8,8)
into CTHOADON(MADVU, MAHD)values(9,9)
into CTHOADON(MADVU, MAHD)values(10,10)
select * from dual;

--nH?P sudung
insert all
into SUDUNG(MAKB,MADVU,MANV)values (1,1,1)
into SUDUNG(MAKB,MADVU,MANV)values (2,2,2)
into SUDUNG(MAKB,MADVU,MANV)values (3,3,3)
into SUDUNG(MAKB,MADVU,MANV)values (4,4,4)
into SUDUNG(MAKB,MADVU,MANV)values (5,5,1)
into SUDUNG(MAKB,MADVU,MANV)values (6,6,2)
into SUDUNG(MAKB,MADVU,MANV)values (7,7,3)
into SUDUNG(MAKB,MADVU,MANV)values (8,8,4)
into SUDUNG(MAKB,MADVU,MANV)values (9,9,1)
into SUDUNG(MAKB,MADVU,MANV)values (10,10,2)
select dummy from dual;