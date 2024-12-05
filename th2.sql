create database QLTT;
use database QLTT;
create table SINHVIEN (
		MSSV char(8), 
        TENSV varchar(30) not null,
        SODT varchar(10),
        LOP char(10) not null,
        DIACHI char(50) not null,
		PRIMARY KEY (MSSV)
);
create table HOCHAM (
		MSHH int,
        TENHH varchar(20) not null,
        PRIMARY KEY (MSHH)
) ;
create table DETAI (
		MSDT char(6),
        TENDT varchar(30) not null,
		PRIMARY KEY (MSDT)
);
create table SV_DETAI (
		MSSV char(8) ,
        MSDT char(6) ,
        CONSTRAINT MSSV FOREIGN KEY (MSSV) REFERENCES SINHVIEN(MSSV),
        CONSTRAINT MSDT FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
);
create table GIAOVIEN (
		MSGV int ,
        TENGV varchar(30) not null,
        DIACHI varchar(50) not null ,
        SODT varchar(10) not null ,
        MSHH int ,
        NAMHH datetime not null,
        PRIMARY KEY (MSGV),
        CONSTRAINT MSHH FOREIGN KEY (MSHH) REFERENCES HOCHAM(MSHH)
);
create table HOCVI (
		MSHV int ,
        TENHV varchar(20) not null,
        PRIMARY KEY (MSHV)
);
create table CHUYENNGANH (
		MSCN int ,
        TENCN varchar(30) not null,
        PRIMARY KEY (MSCN)
);
create table GV_HV_CN (
		MSGV int ,
        MSHV int ,
        MSCN int ,
        NAM datetime not null,
        CONSTRAINT MSGV FOREIGN KEY (MSGV) REFERENCES GIAOVIEN(MSGV),
        CONSTRAINT MSHV FOREIGN KEY (MSHV) REFERENCES HOCVI(MSHV),
        CONSTRAINT MSCN FOREIGN KEY (MSCN) REFERENCES CHUYENNGANH(MSCN)
);
create table GV_HDDT (
		MSGV int ,
        MSDT char(6),
        DIEM float not null,
        CONSTRAINT fn1 FOREIGN KEY (MSGV) REFERENCES GIAOVIEN(MSGV),
        CONSTRAINT fn2 FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
);
create table GV_PBDT (
		MSGV int ,
        MSDT char(6),
        DIEM float not null,
        CONSTRAINT fn3 FOREIGN KEY (MSGV) REFERENCES GIAOVIEN(MSGV),
        CONSTRAINT fn4 FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
);
create table GV_UVDT (
		MSGV int ,
        MSDT char(6),
        DIEM float not null,
        CONSTRAINT fn5 FOREIGN KEY (MSGV) REFERENCES GIAOVIEN(MSGV),
        CONSTRAINT fn6 FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
);
create table HOIDONG (
		MSHD int,
        PHONG int ,
        TGBD datetime,
        NGAYHD datetime not null,
        TINHTRANG varchar(30) not null,
        MSGV int, 
        PRIMARY KEY (MSHD),
        CONSTRAINT fn7 FOREIGN KEY (MSGV) REFERENCES GIAOVIEN(MSGV)
);
create table HOIDONG_GV (
		MSHD int,
        MSGV int,
		CONSTRAINT fn8 FOREIGN KEY (MSHD) REFERENCES HOIDONG(MSHD),
        CONSTRAINT fn9 FOREIGN KEY (MSGV) REFERENCES GIAOVIEN(MSGV)       
);
create table HOIDONG_DT (
		MSHD int,
        MSDT char(6),
        QUYETDINH char(10),
		CONSTRAINT fn10 FOREIGN KEY (MSHD) REFERENCES HOIDONG(MSHD),
        CONSTRAINT fn11 FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)       
);
-- Insert
insert into SINHVIEN (MSSV, TENSV, SODT, LOP, DIACHI)
    values
		('13520001', 'Nguyễn Văn An', '0906762255', 'SE103.U32', 'THỦ ĐỨC'),
		('13520002', 'Phan Tấn Đạt', '0975672350', 'IE204.T21', 'QUẬN 1'),
        ('13520003', 'Nguyễn Anh Hải', '0947578688', 'IE205.R12', 'QUẬN 9'),
        ('13520004', 'Phạm Tài', '0956757869', 'IE202.A22', 'QUẬN 1'),
        ('13520005', 'Lê Thuý Hằng', '0976668688', 'SE304.E22', 'THỦ ĐỨC'),
        ('13520006', 'Ưng Hồng Ân', '0957475898', 'IE208.F33', 'QUẬN 2');
insert into DETAI (MSDT, TENDT)
    values
		('97001', 'Quản lý thư viện'),
		('97002', 'Nhân dạng vân tay'),
        ('97003', 'Bán đấu giá trên mạng'),
        ('97004', 'Quản lý siêu thị'),
        ('97005', 'Xử lý ảnh'),
        ('97006', 'Hệ giải toán thông minh');
insert into SV_DETAI (MSSV, MSDT)
    values
		('13520001', '97004'),
		('13520002', '97005'),
        ('13520003', '97001'),
        ('13520004', '97002'),
        ('13520005', '97003'),
        ('13520006', '97005');
insert into HOCHAM (MSHH, TENHH)
    values
		(1, 'PHÓ GIÁO SƯ'),
		(2, 'GIÁO SƯ');
insert into GIAOVIEN (MSGV, TENGV, DIACHI, SODT, MSHH, NAMHH)
    values
		('00201', 'Trần Trung', 'Bến Tre', '35353535', 1, '1996'),
		('00202', 'Nguyễn Văn An', 'Tiền Giang', '67868688', 1, '1996'),
        ('00203', 'Trần Thu Trang', 'Cần Thơ', '74758687', 1, '1996'),
        ('00204', 'Nguyễn Thị Loan', 'TP.HCM', '56575868', 2, '2005'),
        ('00205', 'Chu Tiên', 'Hà Nội', '46466646', 2, '2005');
insert into HOCVI (MSHV, TENHV)
    values
		(1, 'Kỹ sư'),
        (2, 'Cử nhân'),
        (3, 'Thạc sĩ'),
        (4, 'Tiến sĩ'),
		(5, 'Tiến sĩ Khoa hoc');
insert into CHUYENNGANH (MSCN, TENCN)
    values
		(1, 'Công nghệ Web'),
        (2, 'Mạng xã hội'),
        (3, 'Quản lý CNTT'),
        (4, 'GIS');
insert into GV_HV_CN (MSGV, MSHV, MSCN, NAM)
    values
		('00201', 1, 1, 2013),
		('00201', 1, 2, 2013),
        ('00201', 2, 1, 2014),
        ('00202', 3, 2, 2013),
        ('00203', 2, 4, 2014),
        ('00204', 3, 2, 2014);
insert into GV_HDDT (MSGV, MSDT, DIEM)
    values
		('00201', '97001', 8),
        ('00202', '97002', 7),
        ('00205', '97001', 9),
        ('00204', '97004', 7),
		('00203', '97005', 9);
insert into GV_PBDT (MSGV, MSDT, DIEM)
    values
		('00201', '97005', 8),
        ('00202', '97001', 7),
        ('00205', '97004', 9),
        ('00204', '97003', 7),
		('00203', '97002', 9),
        ('00205', '97005', 8),
        ('00202', '97005', 7),
        ('00204', '97005', 9),
        ('00203', '97001', 7),
		('00204', '97001', 9),
        ('00205', '97001', 8),
        ('00203', '97003', 7),
        ('00201', '97003', 9),
        ('00202', '97003', 7),
		('00201', '97004', 9),
        ('00202', '97004', 8),
        ('00203', '97004', 7),
        ('00201', '97002', 9),
        ('00204', '97002', 7),
		('00205', '97002', 9),
        ('00201', '97006', 9),
        ('00202', '97006', 7),
        ('00204', '97006', 9);
insert into HOIDONG (MSHD, PHONG, TGBD, NGAYHD, TINHTRANG, MSGV)
    values
		(1, 002, '07:00:00', '2014-11-29', 'Thật', '00201'),
        (2, 102, '07:00:00', '2014-12-5', 'Thật', '00202'),
        (3, 003, '08:00:00', '2014-12-6', 'Thật', '00203');
insert into HOIDONG_GV (MSHD, MSGV)
    values
		(1, '00201'),
        (1, '00202'),
        (1, '00203'),
        (1, '00204'),
        (2, '00203'),
        (2, '00202'),
        (2, '00205'),
        (2, '00204'),
        (3, '00201'),
        (3, '00202'),
        (3, '00203'),
        (3, '00204');
insert into HOIDONG_DT (MSHD, MSDT, QUYETDINH)
    values
		(1, '97001', 'Được'),
        (1, '97002', 'Được'),
        (2, '97001', 'Không'),
        (2, '97004', 'Không'),
		(1, '97005', 'Được'),
        (3, '97001', 'Không'),
        (3, '97002', 'Được');
        
-- A.1
Create table ThemGV 
		@MSGV int, 
		@TENGV nvarchar(30), 
		@SODT varchar(10), 
		@DIACHI nvarchar(50), 
		@MSHH int, 
		@NAMHH year 
as 
begin 
-- Kiểm tra MSHH có tồn tại trong bảng HOCHAM không 
	if not exists (select * from HOCHAM where MSHH = @MSHH) 
	begin 
	print 'Mã học hàm không tồn tại!'; 
	return 0; 
end 
-- Nếu MSHH tồn tại, thực hiện insert 
	insert into GIAOVIEN (MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH) 
	values (@MSGV, @TENGV, @SODT, @DIACHI, @MSHH, @NAMHH); 
end

-- A.2
create table ThemGV_check 
	@MSGV int, 
	@TENGV nvarchar(30), 
	@SODT varchar(10), 
	@DIACHI nvarchar(50), 
	@MSHH int, 
	@NAMHH year
as 
begin 
 
-- Kiểm tra MSGV có tồn tại trong bảng GIAOVIEN không 
	if exists (select * from GIAOVIEN where MSGV = @MSGV) 
	begin
	print 'Mã giáo viên đã tồn tại!'; 
	return 0; 
end 
-- Nếu MSGV chưa tồn tại, thực hiện insert 
	insert into GIAOVIEN (MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH) 
	values (@MSGV, @TENGV, @SODT, @DIACHI, @MSHH, @NAMHH); 
end

-- A.3 
create table ThemGV_check
		@MSGV int, 
		@TENGV nvarchar(30), 
		@SODT varchar(10), 
		@DIACHI nvarchar(50), 
		@MSHH int, 
		@NAMHH year 
as 
begin 
	-- Kiểm tra MSGV có tồn tại trong bảng GIAOVIEN không 
	if exists (select * from GIAOVIEN where MSGV = @MSGV) 
	begin 
	print 'Mã giáo viên đã tồn tại!'; 
	return 0; 
end 
-- Kiểm tra MSHH có tồn tại trong bảng HOCHAM không 
	if not exists (select * from HOCHAM where MSHH = @MSHH) 
	begin 
	print 'Mã học hàm không tồn tại!'; 
	return 1; 
end 
-- Nếu cả hai điều kiện đều đúng, thực hiện insert 
	insert into GIAOVIEN (MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH) 
	values (@MSGV, @TENGV, @SODT, @DIACHI, @MSHH, @NAMHH); 
end

-- A.4:
create table CapnhatDETAI 
	@MSDT_cu char(6), 
	@TENDT_moi nvarchar(30) 
as 
begin 
	declare @rowsAffected INT; 
	update DETAI set TENDT = @TENDT_moi where MSDT = @MSDT_cu; 
	set @rowsAffected = @@ROWCOUNT; 
	if @rowsAffected = 0 
	begin 
		print 'Không tìm thấy đề tài có mã: ' + @MSDT_cu; 
	return 0; 
end 
else 
	begin 
		print 'Cập nhật tên đề tài thành công!'; 
	return 1; 
	end 
end

-- A.5: 
create table CapnhatSINHVIEN 
		@MSSV char(8), 
		@TENSV_moi nvarchar(30), 
		@DIACHI_moi nvarchar(50) 
as 
begin 
	declare @rowsAffected INT; 
	update SINHVIEN set TENSV = @TENSV_moi, 
	DIACHI = @DIACHI_moi where MSSV = @MSSV; 
	set @rowsAffected = @@ROWCOUNT; 
	if @rowsAffected = 0 
	begin 
		print 'Không tìm thấy sinh viên có mã: ' + @MSSV; 
	return 0; 
	end 
else 
	begin 
		print 'Cập nhật thông tin sinh viên thành công!'; 
	return 1; 
	end 
end

-- B.1:
create table DemGVTheoHocVi 
	@TENHV nvarchar(20) 
as 
begin 
	declare @SoLuongGV int; 
	-- Tìm mã học vị dựa trên tên học vị 
	declare @MSHV int; 
	select @MSHV = MSHV from HOCVI where TENHV = @TENHV; 
	-- Đếm số lượng giáo viên có học vị đó 
	select @SoLuongGV = count(*) from GIAOVIEN 
	inner join GV_HV_CN ghvc ON g.MSGV = ghvc.MSGV where ghvc.MSHV = @MSHV;
	 -- Kiểm tra và trả về kết quả 
	if @SoLuongGV is null set @SoLuongGV = 0; 
	select @SoLuongGV AS SoLuongGV;  
    end
 
-- B.2:
create table TinhDiemTrungBinhDETAI
	@MSDT char(6) 
as 
begin 
	declare @DiemTrungBinh float; 
	-- Tính tổng điểm của đề tài từ các bảng đánh giá 
	select @DiemTrungBinh = AVG(Diem) from ( select DIEM from GV_HDDT where MSDT = @MSDT union all select DIEM from GV_PBDT where MSDT = @MSDT union all select DIEM from GV_UVDT where MSDT = @MSDT ) as DiemDeTai; 
	-- Kiểm tra và trả về kết quả 
	if @DiemTrungBinh is null set @DiemTrungBinh = 0; 
	select @DiemTrungBinh as DiemTrungBinh; 
end
-- B.3:
create table TimSDTTheoTenGV 
	@TENGV nvarchar(30) 
as 
begin 
	declare @SoLuongGV int; 
	-- Tìm kiếm giáo viên dựa trên tên 
	select @SoLuongGV = count(*) from GIAOVIEN where TENGV = @TENGV; 
	if @SoLuongGV = 0 
	begin 
		print 'Không tìm thấy giáo viên có tên: ' + @TENGV; 
	return 0;
	 -- Nếu có nhiều giáo viên trùng tên 
end 
	else if @SoLuongGV > 1 begin print 'Có ' + CAST(@SoLuongGV AS nvarchar) + ' giáo viên có tên ' + @TENGV; 
		select SODT from GIAOVIEN where TENGV = @TENGV;
	 -- Nếu tìm thấy duy nhất 
	end 
	else 
	begin 
		select SODT from GIAOVIEN where TENGV = @TENGV; 
	end 
end
-- B.4:
create table TinhDiemTrungBinhHOIDONG
	@MSHD char(6) 
as 
begin 
	declare @DiemTrungBinh float; 
	-- Tính tổng điểm của tất cả các đề tài mà hội đồng đánh giá 
	select @DiemTrungBinh = AVG(DIEM) from ( select DIEM from GV_HDDT where MSHD = @MSHD union all select DIEM from GV_PBDT where MSHD = @MSHD union all select DIEM from GV_UVDT where MSHD = @MSHD ) as DiemHoiDong; 
	-- Kiểm tra và trả về kết quả 
	if @DiemTrungBinh is null set @DiemTrungBinh = 0; 
	select @DiemTrungBinh as DiemTrungBinh; 
end

-- C.1
create trigger XoaDETAI on detai 
after delete
	as 
	begin 
	delete from GV_HDDT where MSDT in (select MSDT from deleted) 
	delete from GV_PBDT where MSDT in (select MSDT from deleted) 
	delete from GV_UVDT where MSDT in (select MSDT from deleted) 
	end;
 
-- C.2: 
alter table DETAI 
add constraint SoLuongDETAI_HOIDONG 
check ( (select count(*) from DETAI where MSHD = DETAI.MSHD) <= 10 
);

-- C.3:
alter table SINHVIEN_DETAI 
add constraint SoLuongSINHVIEN_DETAI 
check ( (select count(*) from SINHVIEN_DETAI where MSDT = SINHVIEN_DETAI.MSDT) <= 3 
);

-- C.4:
create trigger tr_KiemTraHocHamPGS 
	on giaovien 
	after update 
	as 
	begin 
	declare @MSGV_Updated int; 
	declare @HocVi_Updated nvarchar(50); 
	select @MSGV_Updated = inserted.MSGV, 
	@HocVi_Updated = inserted.HOCVI from inserted; 
	if update(HOCHAM) and inserted.HOCHAM = 'PGS' 
	begin 
	if not exists (select * from HOCVI where MAHV = @HocVi_Updated and TENHV = 'Tiến sĩ') 
	begin 
		raiserror('Giáo viên phải có học vị Tiến sĩ để được cấp học hàm PGS', 16, 1); 
		rollback transaction; 
		end 
	end 
end;
-- D.1:
create function TinhDiemTrungBinhDETAI (@MSDT char(6)) returns float 
as 
begin 
	declare @DiemTrungBinh float; 
	select @DiemTrungBinh = AVG(DIEM) from DIEM where MSDT = @MSDT; 
	return @DiemTrungBinh; 
end;

-- D.2:
create function KetQuaDETAI (@MSDT char(6)) returns varchar(10) 
as 
begin 
	declare @DiemTrungBinh float; 
	declare @KetQua varchar(10); 
	select @DiemTrungBinh = AVG(DIEM) from DIEM where MSDT = @MSDT; 
	if @DiemTrungBinh >= 5 set @KetQua = 'DAT'; 
		else set @KetQua = 'KHONGDAT'; 
	return @KetQua; 
end;

-- E.1
create table DETAI_DIEM ( 
MSDT char(6) PRIMARY KEY, 
DIEMTB float 
);
insert into DETAI_DIEM (MSDT, DIEMTB) select MSDT, AVG(DIEM) from DIEM group by MSDT;
-- E.2
create table TinhDiemTrungBinhDETAI 
as 
begin
	drop table if exists #Temp_DiemTrungBinh; 
	insert into select insert into DETAI_DIEM (MSDT, DIEMTB) 
	select MSDT, AVG(DIEM) from DIEM group by MSDT
end;
-- E.3
alter table DETAI_DIEM add XEPLOAI nvarchar(20) null;

update DETAI_DIEM 
	set XEPLOAI = CASE 
		when DIEMTB >= 9 then 'Xuất sắc' 
		when DIEMTB >= 8 then 'Giỏi' 
		when DIEMTB >= 7 then 'Khá'
		when DIEMTB >= 5 then 'Trung bình' 
		else 'Không đạt' 
	end;




