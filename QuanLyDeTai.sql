-- Drop the database 'QUANLYDETAI'

-- Connect to the 'master' database to run this snippet

USE master;

GO

-- Uncomment the ALTER DATABASE statement below to set the database to SINGLE_USER mode if the drop database command fails because the database is in use.

-- ALTER DATABASE QUANLYDETAI SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

-- Drop the database if it exists

IF EXISTS
(
    SELECT [name]
    FROM sys.databases
    WHERE [name] = N'QUANLYDETAI'
)
    DROP DATABASE QUANLYDETAI;

GO

-- Create a new database called 'QUANLYDETAI'

-- Connect to the 'master' database to run this snippet

USE master;

GO

-- Create the new database if it does not exist already

IF NOT EXISTS
(
    SELECT [name]
    FROM sys.databases
    WHERE [name] = N'QUANLYDETAI'
)
    CREATE DATABASE QUANLYDETAI;

GO

USE QUANLYDETAI;

-- Create a new table called '[TaiKhoan]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[Users]
(
    userid varchar(10) primary key,
	fullname nvarchar(32),
	email varchar(256) unique,
	phone varchar(11) unique,
	avatar varchar(218),
	passwd varchar(15) not null,
	roleid TINYINT NOT NULL --   1: Trưởng bộ môn ; 2: Giảng viên ; 3: Sinh viên ; 4: Admin
);

GO

insert into dbo.Users values('20110123', N'Nguyễn Hoàng Lan', 'hoanglan2k2@mail.com', '0978978335','','20110123', 3)
insert into dbo.Users values('20110279', N'Lê Hoài Lâm', 'lehoailam@gmail.com', '0356536245','','20110279', 3)
insert into dbo.Users values('20110356', N'Trần Văn Khánh', 'tvkhanh@gmail.com', '0256536245','','20110356', 3)
insert into dbo.Users values('20110004', N'Lê Hoài Đức', 'ducleh@gmail.com', '0356534777','','20110004', 3)
insert into dbo.Users values('20110009', N'Ngô Thanh Ân', 'thanhanngo@gmail.com', '0976978204','','20110009', 3)
insert into dbo.Users values('20110089', N'Nguyễn Tuyết Lan', 'tuyetlan@gmail.com', '0836978204','','20110089', 3)
insert into dbo.Users values('20110247', N'Hoàng Văn Thái', 'thaihv@gmail.com', '0126978204','','20110247', 3)
insert into dbo.Users values('GVCNTT0054', N'Quách Đình Huỳnh', 'huynhdq@gmail.com', '0967278204','','GVCNTT0054', 2)
insert into dbo.Users values('GVCNTT0126', N'Trần Văn Đức', 'ductv@mail.com', '0237777838','','GVCNTT0126', 2)
insert into dbo.Users values('GVCNTT0252', N'Nguyễn Hữu Nghĩa', 'nghianh@gmail.com', '0936532786','','GVCNTT0252', 2)
insert into dbo.Users values('TBMCNPM012', N'Huỳnh Xuân Phụng', 'phunghx@gmail.com', '0236723596','','TBMCNPM012', 1)
insert into dbo.Users values('TBMHTTT014', N'Nguyễn Thành Sơn', 'sonnt@gmail.com', '0935932786','','TBMHTTT014', 1)

GO

-- Create a new table called '[HoiDongPB]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[HoiDongPB]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HoiDongPB];

GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[HoiDongPB]
(
    MaHoiDongPB varchar(25) primary key,
	TruongHoiDong varchar(10) references dbo.TaiKhoan(MaTaiKhoan),
	ThuKyHoiDong varchar(10) references dbo.TaiKhoan(MaTaiKhoan),
	SoThanhVien int not null
);

GO

-- Create a new table called '[DotDangKy]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[DotDangKy]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DotDangKy];

GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[DotDangKy]
(
    MaDotDangKy varchar(25) primary key,
	DoiTuongDangKy TINYINT NOT NULL, --  1: Giảng viên ; 2: Sinh viên 
	ThoiGianBatDau date not null,
	ThoiGianKetThuc date
);

GO

-- Create a new table called '[DeTai]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[DeTai]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DeTai];

GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[DeTai]
(
    MaDeTai varchar(25) primary key,
	TenDeTai nvarchar(256) not null,
	ChuyenNganh nvarchar(32) not null,
	YeuCau nvarchar(100),
	LoaiDeTai TINYINT NOT NULL, -- 1: Tiểu luận chuyên ngành ; 2: Đề tài tốt nghiệp
	MaDotDangKy varchar(25) references dbo.DotDangKy(maDotDangKy),
	MaHoiDongCham varchar(25) references dbo.HoiDongPB(maHoiDongPB),
	MaGVHD varchar(10) references dbo.TaiKhoan(MaTaiKhoan),
	MaGVPB varchar(10) references dbo.TaiKhoan(MaTaiKhoan),
	DuocDuyet BIT NOT NULL DEFAULT 0, --Mặc định là chưa được duyệt
);

GO


-- Create a new table called '[NhomSinhVien]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[NhomSinhVien]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NhomSinhVien];

GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[StudentGroup]
(
    groupid varchar(25) primary key, 
	leaderid varchar(10) references dbo.TaiKhoan(MaTaiKhoan),
	topicid varchar(25) references dbo.DeTai(maDeTai),
	amount int not null,
);

GO

-- Create a new table called '[ThanhVienNhom]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[ThanhVienNhom]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ThanhVienNhom];

GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[ThanhVienNhom]
(
    MaNhom varchar(25) references dbo.NhomSinhVien(MaNhom), 
	MaThanhVien varchar(10) references dbo.TaiKhoan(MaTaiKhoan),
	Constraint PK_ThanhVienNhom primary key (MaNhom, MaThanhVien)
)

GO



insert into dbo.DeTai values('DT_CNPM_TLCN_2122_001', N'Xây dựng ứng dụng mạng xã hội sản phẩm trên Android', N'Công nghệ phần mềm', '', 1, NULL, NULL, NULL, NULL, 0)
insert into dbo.DeTai values('DT_HTTT_TLCN_2122_034', N'Xây dựng ứng dụng IoT với NodeJS.', N'Hệ thống thông tin', 'Đã thi đậu các môn: Cơ sở dữ liệu, Hệ quản trị cơ sở dữ liệu', 1, NULL, NULL, NULL, NULL, 0)

GO

insert into dbo.NhomSinhVien values('NH_CNPM_TLCN_2122_009', '20110279', NULL, 2)
insert into dbo.NhomSinhVien values('NH_HTTT_TLCN_2122_015', '20110123', NULL, 1)

GO

insert into dbo.ThanhVienNhom values('NH_CNPM_TLCN_2122_009', '20110279')
insert into dbo.ThanhVienNhom values('NH_CNPM_TLCN_2122_009', '20110089')
insert into dbo.ThanhVienNhom values('NH_HTTT_TLCN_2122_015', '20110123')

GO

insert into dbo.HoiDongPB values('HDPB_CNPM_TLCN_2122_001', NULL, NULL, 5)
insert into dbo.HoiDongPB values('HDPB_CNPM_TLCN_2122_002', NULL, NULL, 5)
insert into dbo.HoiDongPB values('HDPB_HTTT_TLCN_2122_001', NULL, NULL, 6)

GO

insert into dbo.DotDangKy values('DK_TLCN_2122_D1', 1, '2021-08-07', '2022-02-07')
insert into dbo.DotDangKy values('DK_TLCN_2122_D2', 2, '2022-02-10', NULL)
insert into dbo.DotDangKy values('DK_KLTN_2122_D1', 1, '2021-06-15', '2022-03-12')
insert into dbo.DotDangKy values('DK_KLTN_2122_D2', 2, '2022-01-21', NULL)

GO


