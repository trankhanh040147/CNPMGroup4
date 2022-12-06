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

USE QUANLYDETAI
GO

-- Create a new table called '[Users]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[Users]
(
    userid varchar(10) primary key, --sv: mssv, gv: msgv
	fullname nvarchar(32),
	email varchar(256) unique,
	phone varchar(11) unique,
	avatar varchar(218),
	passwd varchar(15) not null,
	major nvarchar(32),
	roleid TINYINT NOT NULL, --   1: Trưởng bộ môn ; 2: Giảng viên ; 3: Sinh viên ; 4: Admin
	CONSTRAINT checkEmail CHECK (email LIKE '[a-z,0-9,_,-]%@[a-z]%.[a-z][a-z]%'),
	CONSTRAINT checkPhone CHECK (phone NOT LIKE '%[^0-9]%'),
	CONSTRAINT checkPasswd CHECK (passwd LIKE '%[0-9]%' OR passwd LIKE '%[A-Z]%' AND len(passwd) >= 6)
);

GO

insert into dbo.Users values('18110123', N'Nguyễn Bảo Khánh', 'baokhanhnguyen2k@mail.com', '0978978335',NULL,'18110123', N'Mạng máy tính', 3)
insert into dbo.Users values('19110459', N'Nguyễn Thị Vân', 'hoanglan93@mail.com', '0936535221',NULL,'19110459', N'Hệ thống thông tin', 3)
insert into dbo.Users values('18110008', N'Trần Hoàng Công', 'conghoang2k@mail.com', '0364537892',NULL,'18110008', N'Hệ thống thông tin', 3)
insert into dbo.Users values('18110352', N'Vi Thanh Hoàng', 'thanhhoangvi@mail.com', '0367237898',NULL,'18110352', N'Công nghệ phần mềm', 3)
insert into dbo.Users values('19110174', N'Hoàng Gia Bảo', 'hgbao@mail.com', '0978978435',NULL,'19110174', N'Hệ thống thông tin', 3)
insert into dbo.Users values('19110666', N'Lê Thanh Ánh Tuyết', 'anhtuyetle@mail.com', '0946925335',NULL,'19110666', N'Hệ thống thông tin', 3)
insert into dbo.Users values('18110359', N'Trần Bảo Trí', 'baotri2k@mail.com', '0125778335',NULL,'18110359', N'Mạng máy tính', 3)
insert into dbo.Users values('18110812', N'Cao Thị Mỹ Uyên', 'uyencao@mail.com', '0993688335',NULL,'18110812', N'Mạng máy tính', 3)
insert into dbo.Users values('18110636', N'Nguyễn Thị Mỹ Hạnh', 'myhanhnguyen@mail.com', '0974433275',NULL,'18110636', N'Hệ thống thông tin', 3)
insert into dbo.Users values('18110117', N'Ngô Hoàng Hoài Cẩm', 'hoaicamngo@mail.com', '0425768335',NULL,'18110117', N'Công nghệ phần mềm', 3)
insert into dbo.Users values('19110123', N'Trịnh Cao Thiên', 'caothientrinh@mail.com', '0339678335',NULL,'19110123', N'Công nghệ phần mềm', 3)
insert into dbo.Users values('19110223', N'Nguyễn Mỹ Lệ', 'myle2k1@mail.com', '0978935478',NULL,'19110223', N'Hệ thống thông tin', 3)
insert into dbo.Users values('19110435', N'Nguyễn Hoàng Lan', 'hoanglan2k1@mail.com', '0978236535',NULL,'19110435', N'Công nghệ phần mềm', 3)
insert into dbo.Users values('18110279', N'Lê Hoài Lâm', 'lehoailam@gmail.com', '0356536245',NULL,'18110279', N'Công nghệ phần mềm', 3)
insert into dbo.Users values('19110356', N'Trần Văn Khánh', 'tvkhanh@gmail.com', '0256536245',NULL,'19110356', N'Hệ thống thông tin', 3)
insert into dbo.Users values('19110004', N'Lê Hoài Đức', 'ducleh@gmail.com', '0356534777',NULL,'19110004', N'Công nghệ phần mềm', 3)
insert into dbo.Users values('19110009', N'Ngô Thanh Ân', 'thanhanngo@gmail.com', '0976978204',NULL,'19110009', N'Hệ thống thông tin', 3)
insert into dbo.Users values('18110089', N'Nguyễn Tuyết Hạnh', 'tuyetlan@gmail.com', '0836978204',NULL,'18110089', N'Mạng máy tính', 3)
insert into dbo.Users values('18110247', N'Hoàng Văn Thái', 'thaihv@gmail.com', '0126978204',NULL,'18110247', N'Công nghệ phần mềm', 3)
insert into dbo.Users values('18110755', N'Nguyễn Lê Thiên Lý'	, 'thienlynl@mail.com', '0978978395',NULL,'18110755', N'Hệ thống thông tin', 3)
insert into dbo.Users values('SPK00054', N'Quách Đình Huỳnh', 'huynhdq@gmail.com', '0967278204',NULL,'SPK00054', N'Hệ thống thông tin', 2)
insert into dbo.Users values('SPK00126', N'Trần Văn Đức', 'ductv@mail.com', '0237777838',NULL,'SPK00126', N'Mạng máy tính', 2)
insert into dbo.Users values('SPK00252', N'Nguyễn Hữu Nghĩa', 'nghianh@gmail.com', '0936532786',NULL,'SPK00252', N'Công nghệ phần mềm', 2)
insert into dbo.Users values('SPK00111', N'Trần Công Nguyên', 'phunghx@gmail.com', '0236723596',NULL,'SPK00122', N'Công nghệ phần mềm', 2)
insert into dbo.Users values('SPK00459', N'Võ Văn Chánh', 'chanhvv@gmail.com', '0236725556',NULL,'SPK00459', N'Mạng máy tính', 2)
insert into dbo.Users values('SPK00018', N'Lê Thị Minh Lý', 'lyltm@gmail.com', '0435732786',NULL,'SPK00018', N'Hệ thống thông tin', 2)
insert into dbo.Users values('SPK00075', N'Hoàng Văn Hải', 'haihv@gmail.com', '012523596',NULL,'SPK00075', N'Công nghệ phần mềm', 2)
insert into dbo.Users values('SPK00063', N'Nguyễn Khánh Toàn', 'toannk@gmail.com', '0237672786',NULL,'SPK00063', N'Công nghệ phần mềm', 2)
insert into dbo.Users values('SPK00526', N'Trần Công Ngọc', 'ngoctc@gmail.com', '0244659396',NULL,'SPK00526', N'Mạng máy tính', 2)
insert into dbo.Users values('SPK00728', N'Đặng Hoàng Trâm', 'tramdh@gmail.com', '0934537786',NULL,'SPK00728', N'Hệ thống thông tin', 2)
insert into dbo.Users values('SPK00255', N'Lê Thái Bảo', 'baolt@gmail.com', '0243579996',NULL,'SPK00255', N'Hệ thống thông tin', 2)
insert into dbo.Users values('SPK00696', N'Huỳnh Kim Sơn', 'sonnk@gmail.com', '0935934717',NULL,'SPK00696', N'Công nghệ phần mềm', 2)
insert into dbo.Users values('SPK00357', N'Nguyễn Thị Thanh Vân', 'vanntt@gmail.com', '0967778786',NULL,'SPK00357', N'Mạng máy tính', 1)
insert into dbo.Users values('SPK00122', N'Huỳnh Xuân Phụng', 'phunghx@gmail.com', '0236747596',NULL,'SPK00122', N'Công nghệ phần mềm', 1)
insert into dbo.Users values('SPK00014', N'Nguyễn Thành Sơn', 'sonnt@gmail.com', '0935932786',NULL,'SPK00014', N'Hệ thống thông tin', 1)

GO


-- Create a new table called '[Topic]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[Topic]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Topic];

GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[Topic]
(
    topicid int identity(1,1) primary key,
	topicname nvarchar(256) not null,
	topictarget nvarchar(256),
	request nvarchar(256),
	product nvarchar(256),
	numofstudent int not null,
	major nvarchar(64) not null, -- Công nghệ phần mềm, Hệ thống thông tin, Mạng máy tính
	topictype nvarchar(64) NOT NULL, -- Tiểu luận chuyên ngành, Đề tài tốt nghiệp
	topicstatus BIT DEFAULT 0 not null, -- Mặc định là chưa được duyệt
	schoolyear int not null,
	leaderid varchar(10) references dbo.Users(userid),
	memberid varchar(10) references dbo.Users(userid),
	instructorid varchar(10) references dbo.Users(userid) not null,
	criticalid varchar(10) references dbo.Users(userid),
	topicscore int,
	constraint UC_Topic Unique (topicname, major, schoolyear)
);

GO

insert into dbo.Topic values(N'Xây dựng ứng dụng mạng xã hội sản phẩm trên Android', NULL, NULL, NULL, 0, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', DEFAULT, 2020, NULL, NULL, 'SPK00126', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng ứng dụng IoT với NodeJS', NULL, N'Đã thi đậu các môn: Cơ sở dữ liệu, Hệ quản trị cơ sở dữ liệu', NULL, 0, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', DEFAULT, 2020, NULL, NULL, 'SPK00054', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu công nghệ MonoGame và xây dựng game minh họa', N'MonoGame', N'Học Lập trình Web, Các CNPM Mới', N'Windows game', 0, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', DEFAULT, 2018, NULL, NULL, 'SPK00054', NULL, NULL)
insert into dbo.Topic values(N'B', NULL, N'Đã thi đậu các môn: Cơ sở dữ liệu, Hệ quản trị cơ sở dữ liệu', NULL, 0, N'Hệ thống thông tin', N'Khóa luận tốt nghiệp', DEFAULT, 2018, NULL, NULL, 'SPK00054', NULL, NULL)
insert into dbo.Topic values(N'C', NULL, N'Đã thi đậu các môn: Cơ sở dữ liệu, Hệ quản trị cơ sở dữ liệu', NULL, 0, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', DEFAULT, 2020, NULL, NULL, 'SPK00054', NULL, NULL)
insert into dbo.Topic values(N'D', NULL, N'Đã thi đậu các môn: Cơ sở dữ liệu, Hệ quản trị cơ sở dữ liệu', NULL, 0, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', DEFAULT, 2020, NULL, NULL, 'SPK00054', NULL, NULL)
insert into dbo.Topic values(N'E', NULL, N'Đã thi đậu các môn: Cơ sở dữ liệu, Hệ quản trị cơ sở dữ liệu', NULL, 0, N'Hệ thống thông tin', N'Khóa luận tốt nghiệp', DEFAULT, 2020, NULL, NULL, 'SPK00054', NULL, NULL)
insert into dbo.Topic values(N'F', NULL, N'Đã thi đậu các môn: Cơ sở dữ liệu, Hệ quản trị cơ sở dữ liệu', NULL, 0, N'Hệ thống thông tin', N'Khóa luận tốt nghiệp', DEFAULT, 2020, NULL, NULL, 'SPK00054', NULL, NULL)
insert into dbo.Topic values(N'G', NULL, N'Đã thi đậu các môn: Cơ sở dữ liệu, Hệ quản trị cơ sở dữ liệu', NULL, 0, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', DEFAULT, 2020, NULL, NULL, 'SPK00054', NULL, NULL)
insert into dbo.Topic values(N'H', NULL, N'Đã thi đậu các môn: Cơ sở dữ liệu, Hệ quản trị cơ sở dữ liệu', NULL, 0, N'Hệ thống thông tin', N'Khóa luận tốt nghiệp', DEFAULT, 2018, NULL, NULL, 'SPK00054', NULL, NULL)
insert into dbo.Topic values(N'I', NULL, N'Đã thi đậu các môn: Cơ sở dữ liệu, Hệ quản trị cơ sở dữ liệu', NULL, 0, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', DEFAULT, 2018, NULL, NULL, 'SPK00054', NULL, NULL)
insert into dbo.Topic values(N'K', NULL, N'Đã thi đậu các môn: Cơ sở dữ liệu, Hệ quản trị cơ sở dữ liệu', NULL, 0, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', 1, 2018, NULL, NULL, 'SPK00054', NULL, NULL)

GO
-- Create a new table called '[CounterCommittee' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[CounterCommittee]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CounterCommittee];

GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[CounterCommittee]
(
    id varchar(25) primary key,
	leader varchar(10) references dbo.Users(userid),
	secretary varchar(10) references dbo.Users(userid),
	amount int not null
);

GO

insert into dbo.CounterCommittee values('HDPB_CNPM_TLCN_2122_001', NULL, NULL, 5)
insert into dbo.CounterCommittee values('HDPB_CNPM_TLCN_2122_002', NULL, NULL, 5)
insert into dbo.CounterCommittee values('HDPB_HTTT_TLCN_2122_001', NULL, NULL, 6)

GO
-- Create a new table called '[RegistrationPeriod]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[RegistrationPeriod]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RegistrationPeriod];

GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[RegistrationPeriod]
(
    id varchar(25) primary key,
	objectreg TINYINT NOT NULL, --  1: Giảng viên ; 2: Sinh viên 
	datefrom date not null,
	datefinal date
);

GO

insert into dbo.RegistrationPeriod values('DK_TLCN_2122_D1', 1, '2021-08-07', '2022-02-07')
insert into dbo.RegistrationPeriod values('DK_TLCN_2122_D2', 2, '2022-02-10', NULL)
insert into dbo.RegistrationPeriod values('DK_KLTN_2122_D1', 1, '2021-06-15', '2022-03-12')
insert into dbo.RegistrationPeriod values('DK_KLTN_2122_D2', 2, '2022-01-21', NULL)

GO

-- Create a new table called '[StudentGroup]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[StudentGroup]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StudentGroup];

GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[StudentGroup]
(
    groupid varchar(25) primary key, 
	leaderid varchar(10) references dbo.Users(userid),
	topicid varchar(25) references dbo.Topic(topicid),
	amount int not null,
);

GO

insert into dbo.StudentGroup values('NH_CNPM_TLCN_2122_009', '20110279', NULL, 2)
insert into dbo.StudentGroup values('NH_HTTT_TLCN_2122_015', '20110123', NULL, 1)

GO

-- Create a new table called '[ThanhVienNhom]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[GroupMember]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GroupMember];

GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[GroupMember]
(
    groupid varchar(25) references dbo.StudentGroup(groupid), 
	memberid varchar(10) references dbo.Users(userid),
	Constraint PK_ThanhVienNhom primary key (groupid , memberid)
)

GO

insert into dbo.GroupMember values('NH_CNPM_TLCN_2122_009', '20110279')
insert into dbo.GroupMember values('NH_CNPM_TLCN_2122_009', '20110089')
insert into dbo.GroupMember values('NH_HTTT_TLCN_2122_015', '20110123')

GO
