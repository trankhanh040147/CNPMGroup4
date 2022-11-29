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

insert into dbo.Users values('20110123', N'Nguyễn Hoàng Lan', 'hoanglan2k2@mail.com', '0978978335',NULL,'20110123', NULL, 3)
insert into dbo.Users values('20110279', N'Lê Hoài Lâm', 'lehoailam@gmail.com', '0356536245',NULL,'20110279', NULL, 3)
insert into dbo.Users values('20110356', N'Trần Văn Khánh', 'tvkhanh@gmail.com', '0256536245',NULL,'20110356', NULL, 3)
insert into dbo.Users values('20110004', N'Lê Hoài Đức', 'ducleh@gmail.com', '0356534777',NULL,'20110004', NULL, 3)
insert into dbo.Users values('20110009', N'Ngô Thanh Ân', 'thanhanngo@gmail.com', '0976978204',NULL,'20110009', NULL, 3)
insert into dbo.Users values('20110089', N'Nguyễn Tuyết Lan', 'tuyetlan@gmail.com', '0836978204',NULL,'20110089', NULL, 3)
insert into dbo.Users values('20110247', N'Hoàng Văn Thái', 'thaihv@gmail.com', '0126978204',NULL,'20110247', NULL, 3)
insert into dbo.Users values('GVCNTT0054', N'Quách Đình Huỳnh', 'huynhdq@gmail.com', '0967278204',NULL,'GVCNTT0054', N'Hệ thống thông tin', 2)
insert into dbo.Users values('GVCNTT0126', N'Trần Văn Đức', 'ductv@mail.com', '0237777838',NULL,'GVCNTT0126', N'Trí tuệ nhân tạo', 2)
insert into dbo.Users values('GVCNTT0252', N'Nguyễn Hữu Nghĩa', 'nghianh@gmail.com', '0936532786',NULL,'GVCNTT0252', N'Công nghệ phần mềm', 2)
insert into dbo.Users values('TBMCNPM012', N'Huỳnh Xuân Phụng', 'phunghx@gmail.com', '0236723596',NULL,'TBMCNPM012', N'Công nghệ phần mềm', 1)
insert into dbo.Users values('TBMHTTT014', N'Nguyễn Thành Sơn', 'sonnt@gmail.com', '0935932786',NULL,'TBMHTTT014', N'Hệ thống thông tin', 1)

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

-- Create a new table called '[Topic]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[Topic]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Topic];

GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[Topic]
(
    topicid varchar(25) primary key,
	topicname nvarchar(256) not null,
	major nvarchar(32) not null,
	request nvarchar(100),
	topictype TINYINT NOT NULL, -- 1: Tiểu luận chuyên ngành ; 2: Đề tài tốt nghiệp
	regperid varchar(25) references dbo.RegistrationPeriod(id),
	countcomid varchar(25) references dbo.CounterCommittee(id),
	instructorsid varchar(10) references dbo.Users(userid),
	crilecturerid varchar(10) references dbo.Users(userid),
	tpstatus BIT NOT NULL DEFAULT 0, --Mặc định là chưa được duyệt
);

GO

insert into dbo.Topic values('DT_CNPM_TLCN_2122_001', N'Xây dựng ứng dụng mạng xã hội sản phẩm trên Android', N'Công nghệ phần mềm', NULL, 1, NULL, NULL, NULL, NULL, 0)
insert into dbo.Topic values('DT_HTTT_TLCN_2122_034', N'Xây dựng ứng dụng IoT với NodeJS.', N'Hệ thống thông tin', 'Đã thi đậu các môn: Cơ sở dữ liệu, Hệ quản trị cơ sở dữ liệu', 1, NULL, NULL, NULL, NULL, 0)

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
