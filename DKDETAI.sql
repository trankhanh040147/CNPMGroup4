CREATE DATABASE DKDETAI
GO

USE DKDETAI
GO

Create table dbo.Account (
	maSo varchar(10) primary key,
	hoTen nvarchar(32) not null,
	email varchar(256) unique,
	phone varchar(11) unique,
	avatar varchar(218),
	passwd varchar(12) not null,
	quyenHan varchar(32) not null
)

Create table dbo.HoiDongPB (
	maHoiDongPB varchar(25) primary key,
	truongHoiDong varchar(10) references dbo.Account(maSo),
	thuKyHoiDong varchar(10) references dbo.Account(maSo),
	soThanhVien int not null
)

Create table dbo.DotDangKy ( 
	maDotDangKy varchar(25) primary key,
	nguoiDangKy varchar(10) references dbo.Account(maSo),
	thoiGianBatDau datetime not null,
	thoiGianKetThuc datetime
)

Create table dbo.DeTai ( 
	maDeTai varchar(25) primary key,
	tenDeTai nvarchar(256) not null,
	chuyenNganh nvarchar(32) not null,
	maDotDangKy varchar(25) references dbo.DotDangKy(maDotDangKy),
	maHoiDongCham varchar(25) references dbo.HoiDongPB(maHoiDongPB),
	maGVHD varchar(10) references dbo.Account(maSo),
	maGVPB varchar(10) references dbo.Account(maSo),
	duocDuyet int not null
)

Create table dbo.NhomSinhVien ( 
	maNhom varchar(25) primary key, 
	maNhomtruong varchar(10) references dbo.Account(maSo),
	maThanhVien varchar(10) references dbo.Account(maSo),
	maDeTai varchar(25) references dbo.DeTai(maDeTai),
	soThanhVien int not null,
)