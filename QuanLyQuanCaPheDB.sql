USE [master]
GO
/****** Object:  Database [QuanLyQuanCafe]    Script Date: 24/03/2019 10:18:56 PM ******/
CREATE DATABASE [QuanLyQuanCafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyQuanCafe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLyQuanCafe.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyQuanCafe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLyQuanCafe_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyQuanCafe] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyQuanCafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyQuanCafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyQuanCafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyQuanCafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyQuanCafe] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyQuanCafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyQuanCafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyQuanCafe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyQuanCafe] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLyQuanCafe]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserName] [nvarchar](100) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[PassWord] [nvarchar](1000) NOT NULL DEFAULT ((0)),
	[Type] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bill]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateCheckIn] [date] NOT NULL DEFAULT (getdate()),
	[DateCheckOut] [date] NULL,
	[idTable] [int] NOT NULL,
	[status] [int] NOT NULL DEFAULT ((0)),
	[discount] [int] NULL,
	[totalPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBill] [int] NOT NULL,
	[idFood] [int] NOT NULL,
	[count] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Food]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[idCategory] [int] NOT NULL,
	[price] [float] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableFood]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableFood](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[status] [nvarchar](100) NOT NULL DEFAULT (N'Trống'),
	[stateOfTable] [bit] NULL DEFAULT ((1)),
	[stateTable] [int] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type]) VALUES (N'linhnhi', N'Linh Nhi', N'nhi123', 0)
INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type]) VALUES (N'vankhanh', N'Bui Van Khanh', N'khanh123', 1)
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (37, CAST(N'2019-03-13' AS Date), CAST(N'2019-03-13' AS Date), 2, 1, 20, 62400)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (38, CAST(N'2019-03-13' AS Date), CAST(N'2019-03-13' AS Date), 5, 1, 10, 101700)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1037, CAST(N'2019-03-13' AS Date), CAST(N'2019-03-13' AS Date), 2, 1, 0, 15000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1038, CAST(N'2019-03-14' AS Date), CAST(N'2019-03-24' AS Date), 2, 1, 0, 37000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1039, CAST(N'2019-03-14' AS Date), CAST(N'2019-03-14' AS Date), 5, 1, 0, 84000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1040, CAST(N'2019-03-20' AS Date), CAST(N'2019-03-24' AS Date), 1, 1, 5, 45600)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1041, CAST(N'2019-03-20' AS Date), CAST(N'2019-03-21' AS Date), 3, 1, 50, 58000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1042, CAST(N'2019-03-22' AS Date), NULL, 3, 0, 0, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1043, CAST(N'2019-03-22' AS Date), CAST(N'2019-03-22' AS Date), 9, 1, 10, 169200)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1044, CAST(N'2019-03-24' AS Date), CAST(N'2019-03-24' AS Date), 6, 1, 0, 125000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (1045, CAST(N'2019-03-24' AS Date), NULL, 6, 0, 0, NULL)
SET IDENTITY_INSERT [dbo].[Bill] OFF
SET IDENTITY_INSERT [dbo].[BillInfo] ON 

INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (82, 37, 33, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (83, 37, 29, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (84, 37, 35, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (85, 38, 22, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (86, 38, 23, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (87, 38, 29, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (88, 38, 47, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1082, 1037, 44, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1083, 1039, 45, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1084, 1039, 22, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1085, 1039, 25, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1090, 1041, 43, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1091, 1041, 45, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1092, 1041, 46, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1093, 1041, 22, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1096, 1043, 22, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1097, 1043, 23, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1098, 1043, 26, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1099, 1043, 39, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1100, 1043, 40, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1101, 1044, 44, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1102, 1044, 33, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1103, 1044, 37, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1104, 1044, 38, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1105, 1044, 35, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1106, 1040, 45, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1107, 1040, 33, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1108, 1038, 43, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1109, 1038, 45, 1)
SET IDENTITY_INSERT [dbo].[BillInfo] OFF
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (22, N'Americano', 12, 39000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (23, N'Bạc xỉu', 12, 29000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (24, N'Cà phê đen', 12, 20000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (25, N'Cà phê sữa', 12, 25000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (26, N'Cappucinno', 12, 40000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (27, N'Mocha', 12, 49000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (28, N'Latte', 12, 45000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (29, N'Trà sữa panda', 13, 20000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (30, N'Trà sữa olong', 13, 22000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (31, N'Trà sữa panda', 13, 25000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (32, N'Trà sữa matcha', 13, 30000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (33, N'Nước ép cam tươi', 14, 28000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (34, N'Nước ép cà rốt', 14, 28000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (35, N'Nước ép dưa hấu', 14, 30000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (36, N'Nước ép sơ ri', 14, 25000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (37, N'Nước ép bí đỏ', 14, 27000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (38, N'Nước ép ổi', 14, 25000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (39, N'Sinh tố bơ', 15, 30000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (40, N'Sinh tố cam xoài', 15, 50000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (41, N'Sinh việt quất', 15, 50000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (42, N'Sinh tố mẳng cầu', 15, 45000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (43, N'Trà cam', 11, 17000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (44, N'Trà chanh', 11, 15000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (45, N'Trà vải', 11, 20000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (46, N'Trà đào cam sả', 11, 40000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (47, N'Trà gạo', 11, 25000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (55, N'Món mới ai biết', 12, 39000)
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (11, N'Trà')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (12, N'Cà phê')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (13, N'Trà sữa')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (14, N'Nước ép trái cây')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (15, N'Sinh tố')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (20, N'nuoc mam')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (21, N'nuoc ngot')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (25, N'Trà')
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
SET IDENTITY_INSERT [dbo].[TableFood] ON 

INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (1, N'Bàn 1', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (2, N'Bàn 2', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (3, N'Bàn 3', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (4, N'Bàn 4', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (5, N'Bàn 5', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (6, N'Bàn 6', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (7, N'Bàn 7', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (8, N'Bàn 8', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (9, N'Bàn 9', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (10, N'Bàn 10', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (11, N'Bàn 11', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (12, N'Bàn 12', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (13, N'Bàn 13', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (14, N'Bàn 14', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (15, N'Bàn 15', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (16, N'Bàn 16', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (17, N'Bàn 17', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (18, N'Bàn 18', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (19, N'Bàn 19', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (20, N'Bàn 20', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (21, N'Bàn 21', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (25, N'Bàn 22', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (26, N'Bàn 23', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (27, N'Bàn 24', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (28, N'Bàn 25', N'Trống', 1, 1)
INSERT [dbo].[TableFood] ([id], [name], [status], [stateOfTable], [stateTable]) VALUES (29, N'Bàn 26', N'Trống', 1, 0)
SET IDENTITY_INSERT [dbo].[TableFood] OFF
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([idTable])
REFERENCES [dbo].[TableFood] ([id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idBill])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([id])
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([idCategory])
REFERENCES [dbo].[FoodCategory] ([id])
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAccountByUserName]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetAccountByUserName]
@userName nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName
END

GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDate]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GetListBillByDate]
@checkIn date, @checkOut date
as
Begin
	Select t.name as [Tên bàn], b.totalPrice as [Tổng tiền], DateCheckIn as [Ngày vào], DateCheckOut as [Ngày ra], discount as [Giảm giá]
	from Bill as b, TableFood as t
	where DateCheckIn >= @checkIn and DateCheckOut <= @checkOut and b.status = 1
	and t.id = b.idTable
end

GO
/****** Object:  StoredProcedure [dbo].[USP_GetTableList]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetTableList]
AS select * from TableFood

GO
/****** Object:  StoredProcedure [dbo].[USP_GetTableListOfState]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GetTableListOfState]
As 

select * From TableFood where stateTable = 1


GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBill]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertBill]
@idTable INT
AS
BEGIN
	INSERT dbo.Bill 
	        ( DateCheckIn ,
	          DateCheckOut ,
	          idTable ,
	          status,
			  discount
	        )
	VALUES  ( GETDATE() , -- DateCheckIn - date
	          NULL , -- DateCheckOut - date
	          @idTable , -- idTable - int
	          0 , -- status - int
			  0
	        )
END

GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillInfo]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertBillInfo]
@idBill INT, @idFood INT, @count INT
AS
BEGIN

	DECLARE @isExitsBillInfo INT
	DECLARE @foodCount INT = 1
	
	SELECT @isExitsBillInfo = id, @foodCount = b.count 
	FROM dbo.BillInfo AS b 
	WHERE idBill = @idBill AND idFood = @idFood

	IF (@isExitsBillInfo > 0)
	BEGIN
		DECLARE @newCount INT = @foodCount + @count
		IF (@newCount > 0)
			UPDATE dbo.BillInfo	SET count = @foodCount + @count WHERE idFood = @idFood
		ELSE
			DELETE dbo.BillInfo WHERE idBill = @idBill AND idFood = @idFood
	END
	ELSE
	BEGIN
		INSERT	dbo.BillInfo
        ( idBill, idFood, count )
		VALUES  ( @idBill, -- idBill - int
          @idFood, -- idFood - int
          @count  -- count - int
          )
	END
END

GO
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_Login]
@userName nvarchar(100), @passWord nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName AND PassWord = @passWord
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SwitchTabel]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_SwitchTabel]
@idTable1 int, @idTable2 int
AS BEGIN

	declare @idFirstBill int
	declare @idSeconrdBill int
	
	declare @isFirstTablEmty int = 1 --co bill info
	declare @isSecondTablEmty int = 1 -- co bill info
	
	
	select @idSeconrdBill = id from dbo.Bill where idTable = @idTable2 AND status = 0 --lay ra idBill cua ban thu hai
	select @idFirstBill = id from dbo.Bill where idTable = @idTable1 AND status = 0 --lay ra idBill cua ban thu nhat
	
	
	if (@idFirstBill IS NULL)
	BEGIN
		
		INSERT dbo.Bill
		        ( DateCheckIn ,
		          DateCheckOut ,
		          idTable ,
		          status
		        )
		values  ( getdate() , -- DateCheckIn - date
		          NULL , -- DateCheckOut - date
		          @idTable1 , -- idTable - int
		          0  -- status - int
		        )
		        
		select @idFirstBill = max(id) from dbo.Bill where idTable = @idTable1 AND status = 0 --cap nhat idFistBill lay ra idBill vua moi insert vao
		
	end
	--dem so luong billinfo trong ban 1
	SELECT @isFirstTablEmty = count(*) from dbo.BillInfo where idBill = @idFirstBill 

	if (@idSeconrdBill IS NULL)
	begin
		
		insert dbo.Bill
		        ( DateCheckIn ,
		          DateCheckOut ,
		          idTable ,
		          status
		        )
		values  ( getdate() , -- DateCheckIn - date
		          NULL , -- DateCheckOut - date
		          @idTable2 , -- idTable - int
		          0  -- status - int
		        )
				
		select @idSeconrdBill = max(id) from dbo.Bill where idTable = @idTable2 AND status = 0--cap nhat idSecondBill lay ra idBill vua moi insert vao
		
	end
	--dem so luong billinfo trong ban 2
	select @isSecondTablEmty = count(*) from dbo.BillInfo where idBill = @idSeconrdBill
	
	select id into IDBillInfoTable from dbo.BillInfo where idBill = @idSeconrdBill --lay ra idBillInfo cua ban 2 bo vao bang IDBillInfoTable
	
	update dbo.BillInfo set idBill = @idSeconrdBill where idBill = @idFirstBill 
	
	update dbo.BillInfo set idBill = @idFirstBill where id IN (select * from IDBillInfoTable)
	
	DROP TABLE IDBillInfoTable
	
	if (@isFirstTablEmty = 0)
		update dbo.TableFood set status = N'Trống' where id = @idTable2
		
	if (@isSecondTablEmty= 0)
		update dbo.TableFood set status = N'Trống' where id = @idTable1
end

GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateAccount]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateAccount]
@userName NVARCHAR(100), @displayName NVARCHAR(100), @password NVARCHAR(100), @newPassword NVARCHAR(100)
AS
BEGIN
	DECLARE @isRightPass INT = 0
	
	SELECT @isRightPass = COUNT(*) FROM dbo.Account WHERE USERName = @userName AND PassWord = @password
	
	IF (@isRightPass = 1)
	BEGIN
		IF (@newPassword = NULL OR @newPassword = '')
		BEGIN
			UPDATE dbo.Account SET DisplayName = @displayName WHERE UserName = @userName
		END		
		ELSE
			UPDATE dbo.Account SET DisplayName = @displayName, PassWord = @newPassword WHERE UserName = @userName
	end
END

GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateStatusFood]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[USP_UpdateStatusFood]
	
	@id int
AS

BEGIN
	DECLARE @statusTable nvarchar(100) = N'Có người'
	Update TableFood set status = @statusTable where id = @id
END
GO
/****** Object:  Trigger [dbo].[UTG_UpdateBill]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[UTG_UpdateBill]
on [dbo].[Bill] for update
as
begin
	declare @idBill int
	
	select @idBill = id from Inserted	
	
	declare @idTable int
	
	select @idTable = idTable from dbo.Bill where id = @idBill
	
	declare @count int = 0
	
	select @count = count(*) from dbo.Bill where idTable = @idTable AND status = 0
	
	if (@count = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable
end

GO
/****** Object:  Trigger [dbo].[UIG_UpdateBillInfo]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[UIG_UpdateBillInfo]
on [dbo].[BillInfo] for Insert, update
as
begin
	declare @idBill int
	--lay ra id bill
	Select @idBill = idBill from inserted
	declare @idTable int
	--lay ra idTable tu bill va bill chua dc check out
	select @idTable = idTable from Bill where id = @idBill and status = 0

	DECLARE @count INT
	SELECT @count = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idBill
	
	IF (@count > 0)
		BEGIN
		
			update dbo.TableFood SET status = N'Có người' WHERE id = @idTable		
		
		END		
	ELSE
		BEGIN
			update dbo.TableFood SET status = N'Trống' WHERE id = @idTable	
		end
	

end

GO
/****** Object:  Trigger [dbo].[UTG_DeleteBillInfo]    Script Date: 24/03/2019 10:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[UTG_DeleteBillInfo]
on [dbo].[BillInfo] for delete
as 
BEGIN
	declare @idBillInfo int
	declare @idBill int
	select @idBillInfo = id, @idBill = Deleted.idBill from Deleted
	
	declare @idTable int
	select @idTable = idTable from dbo.Bill where id = @idBill
	
	declare @count int = 0
	
	select @count = COUNT(*) from dbo.BillInfo as bi, dbo.Bill as b where b.id = bi.idBill AND b.id = @idBill AND b.status = 0
	
	IF (@count = 0)
		UPDATE dbo.TableFood set status = N'Trống' where id = @idTable
END

GO
USE [master]
GO
ALTER DATABASE [QuanLyQuanCafe] SET  READ_WRITE 
GO
