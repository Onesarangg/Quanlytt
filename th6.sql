use th_QLTT;
-- 
create table CheckSV_DETAI ( 
	MSSV int, 
	MSDT int,
	DIEM float,
	primary key (MSSV, MSDT),
	foreign key (MSSV) references SINHVIEN(MSSV), 
	foreign key (MSDT) references DETAI(MSDT) 
);
alter table CheckSV_DETAI add constraint  CHECK (Diem BETWEEN 0 AND 10);
alter table CheckSV_DETAI add constraint CheckSV check ( (select count(*) from CheckSV_DETAI as A where A.MSDT = CheckSV_DETAI.MSDT) <= 3 );

-- cau4a
create function TinhDIEMTB (@MSDT char(6)) returns float 
as begin 
    return (select avg(DIEM) from GV_HDDT where MSDT = @MSDT) 
	end 
go

-- cau4b
select B.MSDT, B.TENDT, avg(A.DIEM) as DIEMTB from GV_HDDT A 
		join GV_HDDT B on B.MSDT = A.MSDT

-- cau4c
create procedure GVPHANBIEN 
as begin 
	select distinct A.TENGV from GIAOVIEN A 
		inner join UV_HDDT B on A.MSGV = B.MSGV 
end

-- cau4d
create procedure DanhSachDeTaiTrongHoiDong(@MaHD INT) 
as begin
	Select H.MSHD, D.TENDT as [Tên ĐT], H.MSDT, from HOIDONG_DT H 
		join DETAI D on H.MSDT = D.MSDT
		join HOIDONG E on H.MSHD = E.MSHD 
end 

--5.1
create user gvien with password = 'gvien123456';
create user gvu with password = 'gvu123456';
create user svien with password = 'svien123456';

--5.2
grant select, update on dbo.* to gvu;
grant select on GIAOVIEN, SINHVIEN, DETAI, PhanBien, HoiDong, ThamGiaHoiDong to gvien;
grant update(TENGV, DiaChi, SoDT) on GIAOVIEN to gvien;
grant select on SINHVIEN, HOIDONG, DETAI to svien;
revoke delete on svien, gvien, gvu from public;
