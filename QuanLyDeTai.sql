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
	fullname nvarchar(32) not null,
	email varchar(256) unique,
	phone varchar(11) unique,
	avatar varchar(218),
	passwd varchar(15) not null,
	major nvarchar(32) not null,
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
insert into dbo.Users values('SPK00111', N'Trần Công Nguyên', 'nguyentc@gmail.com', '0236723596',NULL,'SPK00122', N'Công nghệ phần mềm', 2)
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
insert into dbo.Users values('SPK00898', N'AdminIT1', 'nguyenhoanggiakhanh85@gmail.com', '0236769398',NULL,'AdminIT1', N'Quản lý website', 4)

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
	constraint UC_Topic Unique (topicname, major, topictype, schoolyear)
);

GO

insert into dbo.Topic values(N'Tìm hiểu Laravel & AngularJs và viết ứng dụng', N'Tìm hiểu PHP, Laravel, AngularJS, Bootstrap, Firebase , XML', N'Nhóm, Đọc hiểu tiếng anh', N'01 Website', 0, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', DEFAULT, 2018, NULL, NULL, 'SPK00063', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu NetCore và viết App ứng dụng', N'Tìm hiểu NetCore, Bootstrap, SQL, xml', N'Nhóm, đọc hiểu tiếng Anh', N'01 App', 0, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', 1, 2018, NULL, NULL, 'SPK00252', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng hệ thống cung cấp bữa ăn sạch (Clear Food)', N'Tìm hiểu quy trình cung cấp thức ăn sạch; Tìm hiểu các công nghệ React, ASP.NET Core...; Xây dựng hệ thống', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 0, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', 1, 2018, NULL, NULL, 'SPK00255', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu NodeJS, Web API và viết ứng dụng', N'Tìm hiểu MVC, Web API, Bootstrap, SQL, xml, NodeJS', N'Nhóm, đọc hiểu tiếng Anh', N'01 Website', 0, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', 1, 2018, NULL, NULL, 'SPK00063', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu Entity Framework và .NET, nâng cấp ứng dụng quản lý đề tài khóa luận tốt nghiệp', N'Tìm hiểu .NET, Bootstrap, SQL, xml', N'Nhóm, Đọc hiểu tiếng Anh', N'01 App', 0, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', 1, 2018, NULL, NULL, 'SPK00122', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu Spring Framework và Viết ứng dụng tư vấn sinh viên', N'Tìm hiểu Spring, Java, Bootstrap, SQL, xml', N'Nhóm, Đọc hiểu tiếng Anh', N'website', 0, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', DEFAULT, 2018, NULL, NULL, 'SPK00063', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website bán linh kiện điện tử', N'Tìm hiểu quy trình của các hệ thống tương tự; Tìm hiểu MERN Stack; Xây dựng website', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 0, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', DEFAULT, 2018, NULL, NULL, 'SPK00122', NULL, NULL)
insert into dbo.Topic values(N'Face Recognition Door Lock System using Raspberry Pi', N'Tìm hiểu vấn đề nhận dạng khuôn mặt, hệ thống nhúng', N'Tìm hiểu vấn đề nhận dạng khuôn mặt, hệ thống nhúng', N'tài liệu, triển khai hệ thống', 0, N'Mạng máy tính', N'Tiểu luận chuyên ngành', DEFAULT, 2018, NULL, NULL, 'SPK00526', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website hỗ trợ học tiếng Anh', N'Tìm hiểu các website tương tự; Tìm hiểu các công nghệ Laravel, Vue.js; Xây dựng website', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 1, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', 1, 2018, NULL, NULL, 'SPK00122', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website bán mỹ phẩm', N'Tìm hiểu các website tương tự; Tìm hiểu framework Django; Xây dựng website', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 1, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', 1, 2018, NULL, NULL, 'SPK00728', NULL, NULL)
insert into dbo.Topic values(N'	Wireless Communication between Arduino & Raspberry Pi using LoRa Module SX1278', N'	Tìm hiểu mạng không dây, module IoT', N'Tìm hiểu mạng không dây, module IoT', N'tài liệu, triển khai hệ thống', 1, N'Mạng máy tính', N'Tiểu luận chuyên ngành', 1, 2018, NULL, NULL, 'SPK00526', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu ngôn ngữ PHP, ReactJS và xây dựng website minh họa', N'Tìm hiểu ngôn ngữ PHP, ReactJS và xây dựng website minh họa', N'Nhóm, Đọc hiểu tiếng Anh', N'web', 1, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', 1, 2018, NULL, NULL, 'SPK00075', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website kinh doanh quần áo dùng Laravel', N'Xây dựng website kinh doanh quần áo dùng Laravel', N'Nhóm, Đọc hiểu tiếng Anh', N'web', 1, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', 1, 2018, NULL, NULL, 'SPK00075', NULL, NULL)
insert into dbo.Topic values(N'Real-Time License Plate Recognition using Raspberry Pi and Python', N'Tìm hiểu vấn đề nhận dạng', N'Tìm hiểu vấn đề nhận dạng', N'Tài liệu, triển khai', 1, N'Mạng máy tính', N'Tiểu luận chuyên ngành', 1, 2018, NULL, NULL, 'SPK00459', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng hệ thống website bán giày', N'Tìm hiểu quy trình của các hệ thống tương tự; Tìm hiểu MERN Stack; Xây dựng website', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 1, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', 1, 2018, NULL, NULL, 'SPK00018', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website kinh doanh điện thoại dùng .NET Core', N'Xây dựng website kinh doanh điện thoại dùng .NET Core', N'Nhóm, Đọc hiểu tiếng Anh', N'web', 1, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', 1, 2018, NULL, NULL, 'SPK00696', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu Hyper-V trên Windows 2019 R2 và demo', N'Tìm hiểu Hyper-V và công nghệ ảo hoá; Xây dựng Demo.', N'Nhóm, đọc hiểu tiếng Anh', N'Tài liệu tham khảo', 1, N'Mạng máy tính', N'Tiểu luận chuyên ngành', 1, 2018, NULL, NULL, 'SPK00459', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website quản lý cửa hàng thú cưng dùng MERN Stack', N'Xây dựng website quản lý cửa hàng thú cưng dùng MERN Stack', N'Nhóm, Đọc hiểu tiếng Anh', N'web', 1, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', 1, 2018, NULL, NULL, 'SPK00122', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website bán đồ nội thất', N'Tìm hiểu về công nghệ; Xây dựng demo', N'Lập trình web tốt', N'Báo cáo và demo', 1, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', 1, 2018, NULL, NULL, 'SPK00054', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website bán quần áo thời trang', N'Tìm hiểu về công nghệ; Xây dựng demo', N'Lập trình web tốt', N'Báo cáo và demo', 1, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', 1, 2018, NULL, NULL, 'SPK00054', NULL, NULL)


insert into dbo.Topic values(N'Tìm hiểu Laravel & AngularJs và viết ứng dụng', N'Tìm hiểu PHP, Laravel, AngularJS, Bootstrap, Firebase , XML', N'Nhóm, Đọc hiểu tiếng anh', N'01 Website', 0, N'Công nghệ phần mềm', N'Đề tài tốt nghiệp', DEFAULT, 2018, NULL, NULL, 'SPK00063', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu NetCore và viết App ứng dụng', N'Tìm hiểu NetCore, Bootstrap, SQL, xml', N'Nhóm, đọc hiểu tiếng Anh', N'01 App', 0, N'Công nghệ phần mềm', N'Đề tài tốt nghiệp', 1, 2018, NULL, NULL, 'SPK00252', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng hệ thống cung cấp bữa ăn sạch (Clear Food)', N'Tìm hiểu quy trình cung cấp thức ăn sạch; Tìm hiểu các công nghệ React, ASP.NET Core...; Xây dựng hệ thống', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 0, N'Hệ thống thông tin', N'Đề tài tốt nghiệp', 1, 2018, NULL, NULL, 'SPK00255', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu NodeJS, Web API và viết ứng dụng', N'Tìm hiểu MVC, Web API, Bootstrap, SQL, xml, NodeJS', N'Nhóm, đọc hiểu tiếng Anh', N'01 Website', 0, N'Công nghệ phần mềm', N'Đề tài tốt nghiệp', 1, 2018, NULL, NULL, 'SPK00063', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu Entity Framework và .NET, nâng cấp ứng dụng quản lý đề tài khóa luận tốt nghiệp', N'Tìm hiểu .NET, Bootstrap, SQL, xml', N'Nhóm, Đọc hiểu tiếng Anh', N'01 App', 0, N'Công nghệ phần mềm', N'Đề tài tốt nghiệp', 1, 2018, NULL, NULL, 'SPK00122', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu Spring Framework và Viết ứng dụng tư vấn sinh viên', N'Tìm hiểu Spring, Java, Bootstrap, SQL, xml', N'Nhóm, Đọc hiểu tiếng Anh', N'website', 0, N'Công nghệ phần mềm', N'Đề tài tốt nghiệp', DEFAULT, 2018, NULL, NULL, 'SPK00063', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website bán linh kiện điện tử', N'Tìm hiểu quy trình của các hệ thống tương tự; Tìm hiểu MERN Stack; Xây dựng website', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 0, N'Hệ thống thông tin', N'Đề tài tốt nghiệp', DEFAULT, 2018, NULL, NULL, 'SPK00122', NULL, NULL)
insert into dbo.Topic values(N'Face Recognition Door Lock System using Raspberry Pi', N'Tìm hiểu vấn đề nhận dạng khuôn mặt, hệ thống nhúng', N'Tìm hiểu vấn đề nhận dạng khuôn mặt, hệ thống nhúng', N'tài liệu, triển khai hệ thống', 0, N'Mạng máy tính', N'Đề tài tốt nghiệp', DEFAULT, 2018, NULL, NULL, 'SPK00526', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website hỗ trợ học tiếng Anh', N'Tìm hiểu các website tương tự; Tìm hiểu các công nghệ Laravel, Vue.js; Xây dựng website', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 1, N'Hệ thống thông tin', N'Đề tài tốt nghiệp', 1, 2018, NULL, NULL, 'SPK00122', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website bán mỹ phẩm', N'Tìm hiểu các website tương tự; Tìm hiểu framework Django; Xây dựng website', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 1, N'Hệ thống thông tin', N'Đề tài tốt nghiệp', 1, 2018, NULL, NULL, 'SPK00728', NULL, NULL)
insert into dbo.Topic values(N'	Wireless Communication between Arduino & Raspberry Pi using LoRa Module SX1278', N'	Tìm hiểu mạng không dây, module IoT', N'Tìm hiểu mạng không dây, module IoT', N'tài liệu, triển khai hệ thống', 1, N'Mạng máy tính', N'Đề tài tốt nghiệp', 1, 2018, NULL, NULL, 'SPK00526', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu ngôn ngữ PHP, ReactJS và xây dựng website minh họa', N'Tìm hiểu ngôn ngữ PHP, ReactJS và xây dựng website minh họa', N'Nhóm, Đọc hiểu tiếng Anh', N'web', 1, N'Công nghệ phần mềm', N'Đề tài tốt nghiệp', 1, 2018, NULL, NULL, 'SPK00075', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website kinh doanh quần áo dùng Laravel', N'Xây dựng website kinh doanh quần áo dùng Laravel', N'Nhóm, Đọc hiểu tiếng Anh', N'web', 1, N'Công nghệ phần mềm', N'Đề tài tốt nghiệp', 1, 2018, NULL, NULL, 'SPK00075', NULL, NULL)
insert into dbo.Topic values(N'Real-Time License Plate Recognition using Raspberry Pi and Python', N'Tìm hiểu vấn đề nhận dạng', N'Tìm hiểu vấn đề nhận dạng', N'Tài liệu, triển khai', 1, N'Mạng máy tính', N'Đề tài tốt nghiệp', 1, 2018, NULL, NULL, 'SPK00459', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng hệ thống website bán giày', N'Tìm hiểu quy trình của các hệ thống tương tự; Tìm hiểu MERN Stack; Xây dựng website', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 1, N'Hệ thống thông tin', N'Đề tài tốt nghiệp', 1, 2018, NULL, NULL, 'SPK00018', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website kinh doanh điện thoại dùng .NET Core', N'Xây dựng website kinh doanh điện thoại dùng .NET Core', N'Nhóm, Đọc hiểu tiếng Anh', N'web', 1, N'Công nghệ phần mềm', N'Đề tài tốt nghiệp', 1, 2018, NULL, NULL, 'SPK00696', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu Hyper-V trên Windows 2019 R2 và demo', N'Tìm hiểu Hyper-V và công nghệ ảo hoá; Xây dựng Demo.', N'Nhóm, đọc hiểu tiếng Anh', N'Tài liệu tham khảo', 1, N'Mạng máy tính', N'Đề tài tốt nghiệp', 1, 2018, NULL, NULL, 'SPK00459', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website quản lý cửa hàng thú cưng dùng MERN Stack', N'Xây dựng website quản lý cửa hàng thú cưng dùng MERN Stack', N'Nhóm, Đọc hiểu tiếng Anh', N'web', 1, N'Công nghệ phần mềm', N'Đề tài tốt nghiệp', 1, 2018, NULL, NULL, 'SPK00122', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website bán đồ nội thất', N'Tìm hiểu về công nghệ; Xây dựng demo', N'Lập trình web tốt', N'Báo cáo và demo', 1, N'Hệ thống thông tin', N'Đề tài tốt nghiệp', 1, 2018, NULL, NULL, 'SPK00054', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website bán quần áo thời trang', N'Tìm hiểu về công nghệ; Xây dựng demo', N'Lập trình web tốt', N'Báo cáo và demo', 1, N'Hệ thống thông tin', N'Đề tài tốt nghiệp', 1, 2018, NULL, NULL, 'SPK00054', NULL, NULL)

insert into dbo.Topic values(N'Tìm hiểu Laravel & AngularJs và viết ứng dụng', N'Tìm hiểu PHP, Laravel, AngularJS, Bootstrap, Firebase , XML', N'Nhóm, Đọc hiểu tiếng anh', N'01 Website', 0, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', DEFAULT, 2019, NULL, NULL, 'SPK00063', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu NetCore và viết App ứng dụng', N'Tìm hiểu NetCore, Bootstrap, SQL, xml', N'Nhóm, đọc hiểu tiếng Anh', N'01 App', 0, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', 1, 2019, NULL, NULL, 'SPK00252', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng hệ thống cung cấp bữa ăn sạch (Clear Food)', N'Tìm hiểu quy trình cung cấp thức ăn sạch; Tìm hiểu các công nghệ React, ASP.NET Core...; Xây dựng hệ thống', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 0, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', 1, 2019, NULL, NULL, 'SPK00255', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu NodeJS, Web API và viết ứng dụng', N'Tìm hiểu MVC, Web API, Bootstrap, SQL, xml, NodeJS', N'Nhóm, đọc hiểu tiếng Anh', N'01 Website', 0, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', 1, 2019, NULL, NULL, 'SPK00063', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu Entity Framework và .NET, nâng cấp ứng dụng quản lý đề tài khóa luận tốt nghiệp', N'Tìm hiểu .NET, Bootstrap, SQL, xml', N'Nhóm, Đọc hiểu tiếng Anh', N'01 App', 0, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', 1, 2019, NULL, NULL, 'SPK00122', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu Spring Framework và Viết ứng dụng tư vấn sinh viên', N'Tìm hiểu Spring, Java, Bootstrap, SQL, xml', N'Nhóm, Đọc hiểu tiếng Anh', N'website', 0, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', DEFAULT, 2019, NULL, NULL, 'SPK00063', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website bán linh kiện điện tử', N'Tìm hiểu quy trình của các hệ thống tương tự; Tìm hiểu MERN Stack; Xây dựng website', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 0, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', DEFAULT, 2019, NULL, NULL, 'SPK00122', NULL, NULL)
insert into dbo.Topic values(N'Face Recognition Door Lock System using Raspberry Pi', N'Tìm hiểu vấn đề nhận dạng khuôn mặt, hệ thống nhúng', N'Tìm hiểu vấn đề nhận dạng khuôn mặt, hệ thống nhúng', N'tài liệu, triển khai hệ thống', 0, N'Mạng máy tính', N'Tiểu luận chuyên ngành', DEFAULT, 2019, NULL, NULL, 'SPK00526', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website hỗ trợ học tiếng Anh', N'Tìm hiểu các website tương tự; Tìm hiểu các công nghệ Laravel, Vue.js; Xây dựng website', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 1, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', 1, 2019, NULL, NULL, 'SPK00122', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website bán mỹ phẩm', N'Tìm hiểu các website tương tự; Tìm hiểu framework Django; Xây dựng website', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 1, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', 1, 2019, NULL, NULL, 'SPK00728', NULL, NULL)
insert into dbo.Topic values(N'	Wireless Communication between Arduino & Raspberry Pi using LoRa Module SX1278', N'	Tìm hiểu mạng không dây, module IoT', N'Tìm hiểu mạng không dây, module IoT', N'tài liệu, triển khai hệ thống', 1, N'Mạng máy tính', N'Tiểu luận chuyên ngành', 1, 2019, NULL, NULL, 'SPK00526', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu ngôn ngữ PHP, ReactJS và xây dựng website minh họa', N'Tìm hiểu ngôn ngữ PHP, ReactJS và xây dựng website minh họa', N'Nhóm, Đọc hiểu tiếng Anh', N'web', 1, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', 1, 2019, NULL, NULL, 'SPK00075', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website kinh doanh quần áo dùng Laravel', N'Xây dựng website kinh doanh quần áo dùng Laravel', N'Nhóm, Đọc hiểu tiếng Anh', N'web', 1, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', 1, 2019, NULL, NULL, 'SPK00075', NULL, NULL)
insert into dbo.Topic values(N'Real-Time License Plate Recognition using Raspberry Pi and Python', N'Tìm hiểu vấn đề nhận dạng', N'Tìm hiểu vấn đề nhận dạng', N'Tài liệu, triển khai', 1, N'Mạng máy tính', N'Tiểu luận chuyên ngành', 1, 2019, NULL, NULL, 'SPK00459', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng hệ thống website bán giày', N'Tìm hiểu quy trình của các hệ thống tương tự; Tìm hiểu MERN Stack; Xây dựng website', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 1, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', 1, 2019, NULL, NULL, 'SPK00018', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website kinh doanh điện thoại dùng .NET Core', N'Xây dựng website kinh doanh điện thoại dùng .NET Core', N'Nhóm, Đọc hiểu tiếng Anh', N'web', 1, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', 1, 2019, NULL, NULL, 'SPK00696', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu Hyper-V trên Windows 2019 R2 và demo', N'Tìm hiểu Hyper-V và công nghệ ảo hoá; Xây dựng Demo.', N'Nhóm, đọc hiểu tiếng Anh', N'Tài liệu tham khảo', 1, N'Mạng máy tính', N'Tiểu luận chuyên ngành', 1, 2019, NULL, NULL, 'SPK00459', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website quản lý cửa hàng thú cưng dùng MERN Stack', N'Xây dựng website quản lý cửa hàng thú cưng dùng MERN Stack', N'Nhóm, Đọc hiểu tiếng Anh', N'web', 1, N'Công nghệ phần mềm', N'Tiểu luận chuyên ngành', 1, 2019, NULL, NULL, 'SPK00122', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website bán đồ nội thất', N'Tìm hiểu về công nghệ; Xây dựng demo', N'Lập trình web tốt', N'Báo cáo và demo', 1, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', 1, 2019, NULL, NULL, 'SPK00054', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website bán quần áo thời trang', N'Tìm hiểu về công nghệ; Xây dựng demo', N'Lập trình web tốt', N'Báo cáo và demo', 1, N'Hệ thống thông tin', N'Tiểu luận chuyên ngành', 1, 2019, NULL, NULL, 'SPK00054', NULL, NULL)

insert into dbo.Topic values(N'Tìm hiểu Laravel & AngularJs và viết ứng dụng', N'Tìm hiểu PHP, Laravel, AngularJS, Bootstrap, Firebase , XML', N'Nhóm, Đọc hiểu tiếng anh', N'01 Website', 0, N'Công nghệ phần mềm', N'Đề tài tốt nghiệp', DEFAULT, 2019, NULL, NULL, 'SPK00063', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu NetCore và viết App ứng dụng', N'Tìm hiểu NetCore, Bootstrap, SQL, xml', N'Nhóm, đọc hiểu tiếng Anh', N'01 App', 0, N'Công nghệ phần mềm', N'Đề tài tốt nghiệp', 1, 2019, NULL, NULL, 'SPK00252', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng hệ thống cung cấp bữa ăn sạch (Clear Food)', N'Tìm hiểu quy trình cung cấp thức ăn sạch; Tìm hiểu các công nghệ React, ASP.NET Core...; Xây dựng hệ thống', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 0, N'Hệ thống thông tin', N'Đề tài tốt nghiệp', 1, 2019, NULL, NULL, 'SPK00255', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu NodeJS, Web API và viết ứng dụng', N'Tìm hiểu MVC, Web API, Bootstrap, SQL, xml, NodeJS', N'Nhóm, đọc hiểu tiếng Anh', N'01 Website', 0, N'Công nghệ phần mềm', N'Đề tài tốt nghiệp', 1, 2019, NULL, NULL, 'SPK00063', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu Entity Framework và .NET, nâng cấp ứng dụng quản lý đề tài khóa luận tốt nghiệp', N'Tìm hiểu .NET, Bootstrap, SQL, xml', N'Nhóm, Đọc hiểu tiếng Anh', N'01 App', 0, N'Công nghệ phần mềm', N'Đề tài tốt nghiệp', 1, 2019, NULL, NULL, 'SPK00122', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu Spring Framework và Viết ứng dụng tư vấn sinh viên', N'Tìm hiểu Spring, Java, Bootstrap, SQL, xml', N'Nhóm, Đọc hiểu tiếng Anh', N'website', 0, N'Công nghệ phần mềm', N'Đề tài tốt nghiệp', DEFAULT, 2019, NULL, NULL, 'SPK00063', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website bán linh kiện điện tử', N'Tìm hiểu quy trình của các hệ thống tương tự; Tìm hiểu MERN Stack; Xây dựng website', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 0, N'Hệ thống thông tin', N'Đề tài tốt nghiệp', DEFAULT, 2019, NULL, NULL, 'SPK00122', NULL, NULL)
insert into dbo.Topic values(N'Face Recognition Door Lock System using Raspberry Pi', N'Tìm hiểu vấn đề nhận dạng khuôn mặt, hệ thống nhúng', N'Tìm hiểu vấn đề nhận dạng khuôn mặt, hệ thống nhúng', N'tài liệu, triển khai hệ thống', 0, N'Mạng máy tính', N'Đề tài tốt nghiệp', DEFAULT, 2019, NULL, NULL, 'SPK00526', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website hỗ trợ học tiếng Anh', N'Tìm hiểu các website tương tự; Tìm hiểu các công nghệ Laravel, Vue.js; Xây dựng website', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 1, N'Hệ thống thông tin', N'Đề tài tốt nghiệp', 1, 2019, NULL, NULL, 'SPK00122', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website bán mỹ phẩm', N'Tìm hiểu các website tương tự; Tìm hiểu framework Django; Xây dựng website', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 1, N'Hệ thống thông tin', N'Đề tài tốt nghiệp', 1, 2019, NULL, NULL, 'SPK00728', NULL, NULL)
insert into dbo.Topic values(N'	Wireless Communication between Arduino & Raspberry Pi using LoRa Module SX1278', N'	Tìm hiểu mạng không dây, module IoT', N'Tìm hiểu mạng không dây, module IoT', N'tài liệu, triển khai hệ thống', 1, N'Mạng máy tính', N'Đề tài tốt nghiệp', 1, 2019, NULL, NULL, 'SPK00526', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu ngôn ngữ PHP, ReactJS và xây dựng website minh họa', N'Tìm hiểu ngôn ngữ PHP, ReactJS và xây dựng website minh họa', N'Nhóm, Đọc hiểu tiếng Anh', N'web', 1, N'Công nghệ phần mềm', N'Đề tài tốt nghiệp', 1, 2019, NULL, NULL, 'SPK00075', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website kinh doanh quần áo dùng Laravel', N'Xây dựng website kinh doanh quần áo dùng Laravel', N'Nhóm, Đọc hiểu tiếng Anh', N'web', 1, N'Công nghệ phần mềm', N'Đề tài tốt nghiệp', 1, 2019, NULL, NULL, 'SPK00075', NULL, NULL)
insert into dbo.Topic values(N'Real-Time License Plate Recognition using Raspberry Pi and Python', N'Tìm hiểu vấn đề nhận dạng', N'Tìm hiểu vấn đề nhận dạng', N'Tài liệu, triển khai', 1, N'Mạng máy tính', N'Đề tài tốt nghiệp', 1, 2019, NULL, NULL, 'SPK00459', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng hệ thống website bán giày', N'Tìm hiểu quy trình của các hệ thống tương tự; Tìm hiểu MERN Stack; Xây dựng website', N'Lập trình web tốt', N'Báo cáo kết quả tìm hiểu được và chương trình demo', 1, N'Hệ thống thông tin', N'Đề tài tốt nghiệp', 1, 2019, NULL, NULL, 'SPK00018', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website kinh doanh điện thoại dùng .NET Core', N'Xây dựng website kinh doanh điện thoại dùng .NET Core', N'Nhóm, Đọc hiểu tiếng Anh', N'web', 1, N'Công nghệ phần mềm', N'Đề tài tốt nghiệp', 1, 2019, NULL, NULL, 'SPK00696', NULL, NULL)
insert into dbo.Topic values(N'Tìm hiểu Hyper-V trên Windows 2019 R2 và demo', N'Tìm hiểu Hyper-V và công nghệ ảo hoá; Xây dựng Demo.', N'Nhóm, đọc hiểu tiếng Anh', N'Tài liệu tham khảo', 1, N'Mạng máy tính', N'Đề tài tốt nghiệp', 1, 2019, NULL, NULL, 'SPK00459', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website quản lý cửa hàng thú cưng dùng MERN Stack', N'Xây dựng website quản lý cửa hàng thú cưng dùng MERN Stack', N'Nhóm, Đọc hiểu tiếng Anh', N'web', 1, N'Công nghệ phần mềm', N'Đề tài tốt nghiệp', 1, 2019, NULL, NULL, 'SPK00122', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website bán đồ nội thất', N'Tìm hiểu về công nghệ; Xây dựng demo', N'Lập trình web tốt', N'Báo cáo và demo', 1, N'Hệ thống thông tin', N'Đề tài tốt nghiệp', 1, 2019, NULL, NULL, 'SPK00054', NULL, NULL)
insert into dbo.Topic values(N'Xây dựng website bán quần áo thời trang', N'Tìm hiểu về công nghệ; Xây dựng demo', N'Lập trình web tốt', N'Báo cáo và demo', 1, N'Hệ thống thông tin', N'Đề tài tốt nghiệp', 1, 2019, NULL, NULL, 'SPK00054', NULL, NULL)

GO

-- Create a new table called '[RegistrationPeriod]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[SubmitTopic]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SubmitTopic];

GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[SubmitTopic]
(
    topicid int references dbo.Topic(topicid), 
	userid varchar(10) references dbo.Users(userid),
	link varchar(256) unique not null,
	Constraint PK_SubmitTopic primary key (topicid , userid)
);

GO

-- Create a new table called '[RegistrationPeriod]' in schema '[dbo]'

-- Drop the table if it already exists

IF OBJECT_ID('[dbo].[RegistrationPeriod]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RegistrationPeriod];

GO

-- Create the table in the specified schema

CREATE TABLE [dbo].[RegistrationPeriod]
(
    id int identity(1,1) primary key,   
	objectreg TINYINT NOT NULL, --  1: Giảng viên ; 2: Sinh viên
	schoolyear int not null,
	regtype TINYINT NOT NULL, -- 1: Tiểu luận chuyên ngành; 2: Đề tài tốt nghiệp
	datefrom date not null,
	datefinal date,
	Constraint UC_RegistrationPeriod UNIQUE (objectreg, schoolyear, regtype)
);

GO

insert into dbo.RegistrationPeriod values(1, 2018, 1, '2021-07-08', '2022-08-15')
insert into dbo.RegistrationPeriod values(2, 2018, 1, '2021-08-28', '2022-09-15')
insert into dbo.RegistrationPeriod values(1, 2018, 2, '2021-02-09', '2022-03-14')
insert into dbo.RegistrationPeriod values(2, 2018, 2, '2021-03-25', '2022-04-25')
insert into dbo.RegistrationPeriod values(1, 2019, 1, '2022-07-06', '2022-08-16')
insert into dbo.RegistrationPeriod values(2, 2019, 1, '2022-08-29', '2022-09-20')

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
	topicid int references dbo.Topic(topicid),
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
