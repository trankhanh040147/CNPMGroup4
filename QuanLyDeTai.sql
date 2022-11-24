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
    WHERE [name] = N'QUANLYCUAHANG'
)
    CREATE DATABASE QUANLYCUAHANG;

GO

USE QUANLYCUAHANG;

-- Create a new table called '[TaiKhoan]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[TaiKhoan]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TaiKhoan];
GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[TaiKhoan]
(
    MaTaiKhoan varchar(10) primary key,
	HoTen nvarchar(32),
	Email varchar(256) unique,
	Phone varchar(11) unique,
	Avatar varchar(218),
	Passwd varchar(15) not null,
	QuyenHan TINYINT NOT NULL --   1: Trưởng bộ môn ; 2: Giảng viên ; 3: Sinh viên ; 4: Admin
);

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

CREATE TABLE [dbo].[NhomSinhVien]
(
    MaNhom varchar(25) primary key, 
	MaNhomtruong varchar(10) references dbo.TaiKhoan(MaTaiKhoan),
	
	maDeTai varchar(25) references dbo.DeTai(maDeTai),
	SoThanhVien int not null,
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




