create database tuan4;
use tuan4;

create table DSDETAI (
		MSDT varchar(30)  not null,
        TENDT varchar(255) not null,
        TENGVHD varchar(255) not null,
		MSGV int not null
);
insert into DSDETAI (MSDT, TENDT, TENGVHD, MSGV)
    values
		('DT1', 'Xứ lý ảnh', 'Nguyễn Văn A', 8888),
		('DT2', 'Xử lý ngôn ngữ', 'Nguyễn Văn B', 7777);
-- a
create view v_DanhSachDeTai as select MSDT, TENDT, TENGVHD, MSGV from DSDETAI;
