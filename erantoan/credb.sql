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
/* Index: CTDONTHUOC_PK                                         */
/*==============================================================*/
create unique index CTDONTHUOC_PK on CTDONTHUOC (
MATHUOC ASC,
MADT ASC
);

/*==============================================================*/
/* Index: CTDONTHUOC_FK                                         */
/*==============================================================*/
create index CTDONTHUOC_FK on CTDONTHUOC (
MATHUOC ASC
);

/*==============================================================*/
/* Index: CTDONTHUOC2_FK                                        */
/*==============================================================*/
create index CTDONTHUOC2_FK on CTDONTHUOC (
MADT ASC
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
/* Index: CTHOADON_PK                                           */
/*==============================================================*/
create unique index CTHOADON_PK on CTHOADON (
MADVU ASC,
MAHD ASC
);

/*==============================================================*/
/* Index: CTHOADON_FK                                           */
/*==============================================================*/
create index CTHOADON_FK on CTHOADON (
MADVU ASC
);

/*==============================================================*/
/* Index: CTHOADON2_FK                                          */
/*==============================================================*/
create index CTHOADON2_FK on CTHOADON (
MAHD ASC
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
/* Index: CTTRUCCONG_PK                                         */
/*==============================================================*/
create unique index CTTRUCCONG_PK on CTTRUCCONG (
NGAY ASC,
CA ASC,
MANV ASC
);

/*==============================================================*/
/* Index: CTTRUCCONG_FK                                         */
/*==============================================================*/
create index CTTRUCCONG_FK on CTTRUCCONG (
NGAY ASC,
CA ASC
);

/*==============================================================*/
/* Index: CTTRUCCONG2_FK                                        */
/*==============================================================*/
create index CTTRUCCONG2_FK on CTTRUCCONG (
MANV ASC
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
/* Index: DICHVU_PK                                             */
/*==============================================================*/
create unique index DICHVU_PK on DICHVU (
MADVU ASC
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
/* Index: DONTHUOC_PK                                           */
/*==============================================================*/
create unique index DONTHUOC_PK on DONTHUOC (
MADT ASC
);

/*==============================================================*/
/* Index: THUOC_FK                                              */
/*==============================================================*/
create index THUOC_FK on DONTHUOC (
MAKB ASC
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
/* Index: DONVI_PK                                              */
/*==============================================================*/
create unique index DONVI_PK on DONVI (
MADVI ASC
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
/* Index: HOADON_PK                                             */
/*==============================================================*/
create unique index HOADON_PK on HOADON (
MAHD ASC
);

/*==============================================================*/
/* Index: CO2_FK                                                */
/*==============================================================*/
create index CO2_FK on HOADON (
MAKB ASC
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
--n?m ngoái
/*==============================================================*/
/* Index: HOSOKB_PK                                             */
/*==============================================================*/
create unique index HOSOKB_PK on HOSOKB (
MAKB ASC
);

/*==============================================================*/
/* Index: CO_FK                                                 */
/*==============================================================*/
create index CO_FK on HOSOKB (
MABN ASC
);

/*==============================================================*/
/* Index: DON_FK                                                */
/*==============================================================*/
create index DON_FK on HOSOKB (
MANV_DON ASC
);

/*==============================================================*/
/* Index: DIEUPHOI_FK                                           */
/*==============================================================*/
create index DIEUPHOI_FK on HOSOKB (
MANV_DIEUPHOI ASC
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
/* Index: NHANVIEN_PK                                           */
/*==============================================================*/
create unique index NHANVIEN_PK on NHANVIEN (
MANV ASC
);

/*==============================================================*/
/* Index: THUOC2_FK                                             */
/*==============================================================*/
create index THUOC2_FK on NHANVIEN (
MADVI ASC
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
/* Index: SUDUNG_PK                                             */
/*==============================================================*/
create unique index SUDUNG_PK on SUDUNG (
MANV ASC,
MAKB ASC,
MADVU ASC
);

/*==============================================================*/
/* Index: SUDUNG_FK                                             */
/*==============================================================*/
create index SUDUNG_FK on SUDUNG (
MANV ASC
);

/*==============================================================*/
/* Index: SUDUNG2_FK                                            */
/*==============================================================*/
create index SUDUNG2_FK on SUDUNG (
MAKB ASC
);

/*==============================================================*/
/* Index: SUDUNG3_FK                                            */
/*==============================================================*/
create index SUDUNG3_FK on SUDUNG (
MADVU ASC
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
/* Index: THANGNAM_PK                                           */
/*==============================================================*/
create unique index THANGNAM_PK on THANGNAM (
NGAY ASC,
CA ASC
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

/*==============================================================*/
/* Index: THUOC_PK                                              */
/*==============================================================*/
create unique index THUOC_PK on THUOC (
MATHUOC ASC
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

