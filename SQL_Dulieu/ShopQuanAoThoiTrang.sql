USE [master]
GO
/****** Object:  Database [ShopQuanAoThoiTrang]    Script Date: 8/7/2024 3:21:30 PM ******/
CREATE DATABASE [ShopQuanAoThoiTrang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopQuanAoThoiTrang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DANG\MSSQL\DATA\ShopQuanAoThoiTrang.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopQuanAoThoiTrang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DANG\MSSQL\DATA\ShopQuanAoThoiTrang_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopQuanAoThoiTrang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET  MULTI_USER 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopQuanAoThoiTrang', N'ON'
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShopQuanAoThoiTrang]
GO
/****** Object:  Table [dbo].[admin_Employee]    Script Date: 8/7/2024 3:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_Employee](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NULL,
	[Age] [int] NULL,
	[DateofBirth] [date] NULL,
	[Gender] [nvarchar](10) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](15) NULL,
	[Mobile] [nvarchar](15) NOT NULL,
	[PhotoPath] [nvarchar](500) NULL,
 CONSTRAINT [PK_admin_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[admin_Login]    Script Date: 8/7/2024 3:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_Login](
	[LoginID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleType] [int] NULL,
	[Notes] [nvarchar](255) NULL,
 CONSTRAINT [PK_admin_Login] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC,
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8/7/2024 3:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Picture1] [nvarchar](255) NULL,
	[Picture2] [nvarchar](250) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 8/7/2024 3:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[First Name] [nvarchar](50) NOT NULL,
	[Last Name] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Age] [int] NULL,
	[Gender] [nvarchar](50) NULL,
	[DateofBirth] [date] NULL,
	[Organization] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[AltEmail] [nvarchar](50) NULL,
	[Phone1] [nvarchar](50) NULL,
	[Phone2] [nvarchar](20) NULL,
	[Mobile1] [nvarchar](50) NULL,
	[Mobile2] [nvarchar](50) NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](50) NULL,
	[Picture] [nvarchar](250) NULL,
	[status] [nvarchar](50) NULL,
	[LastLogin] [datetime] NULL,
	[Created] [date] NULL,
	[Notes] [nvarchar](250) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genMainSlider]    Script Date: 8/7/2024 3:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genMainSlider](
	[MainSliderID] [int] IDENTITY(1,1) NOT NULL,
	[ImageURL] [nvarchar](500) NULL,
	[AltText] [nvarchar](255) NULL,
	[OfferTag] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[BtnText] [nvarchar](50) NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_genMainSlider] PRIMARY KEY CLUSTERED 
(
	[MainSliderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genPromoRight]    Script Date: 8/7/2024 3:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genPromoRight](
	[PromoRightID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ImageURL] [nvarchar](500) NULL,
	[AltText] [nvarchar](500) NULL,
	[OfferTag] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_genPromoRight] PRIMARY KEY CLUSTERED 
(
	[PromoRightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 8/7/2024 3:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[PaymentID] [int] NULL,
	[ShippingID] [int] NULL,
	[Discount] [int] NULL,
	[Taxes] [int] NULL,
	[TotalAmount] [int] NULL,
	[isCompleted] [bit] NULL,
	[OrderDate] [datetime] NULL,
	[DIspatched] [bit] NULL,
	[DispatchedDate] [datetime] NULL,
	[Shipped] [bit] NULL,
	[ShippingDate] [datetime] NULL,
	[Deliver] [bit] NULL,
	[DeliveryDate] [datetime] NULL,
	[Notes] [nvarchar](500) NULL,
	[CancelOrder] [bit] NULL,
 CONSTRAINT [PK_Oder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 8/7/2024 3:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[Discount] [decimal](18, 0) NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[OrderDate] [datetime] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 8/7/2024 3:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[CreditAmount] [money] NULL,
	[DebitAmount] [money] NULL,
	[Balance] [money] NULL,
	[PaymentDateTime] [datetime] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 8/7/2024 3:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[PayTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[PayTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/7/2024 3:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SubCategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](50) NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[OldPrice] [decimal](18, 0) NULL,
	[UnitWeight] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Discount] [decimal](18, 0) NULL,
	[UnitInStock] [int] NULL,
	[UnitOnOrder] [int] NULL,
	[ProductAvailable] [bit] NULL,
	[ImageURL] [nvarchar](500) NULL,
	[AltText] [nvarchar](50) NULL,
	[AddBadge] [bit] NULL,
	[OfferTitle] [nvarchar](50) NULL,
	[OfferBadgeClass] [nvarchar](50) NULL,
	[ShortDescription] [nvarchar](300) NULL,
	[LongDescription] [nvarchar](2000) NULL,
	[Picture1] [nvarchar](500) NULL,
	[Picture2] [nvarchar](500) NULL,
	[Picture3] [nvarchar](500) NULL,
	[Picture4] [nvarchar](500) NULL,
	[Note] [nvarchar](250) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecentlyViews]    Script Date: 8/7/2024 3:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecentlyViews](
	[RViewID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ViewDate] [datetime] NOT NULL,
	[Note] [nvarchar](255) NULL,
 CONSTRAINT [PK_RecentlyViews] PRIMARY KEY CLUSTERED 
(
	[RViewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 8/7/2024 3:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[ProductID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Review] [nvarchar](500) NULL,
	[Rate] [int] NULL,
	[DateTime] [datetime] NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 8/7/2024 3:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingDetails]    Script Date: 8/7/2024 3:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingDetails](
	[ShippingID] [int] NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Mobile] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Province] [nvarchar](20) NULL,
	[City] [nvarchar](20) NULL,
	[PostCode] [nvarchar](10) NULL,
 CONSTRAINT [PK_ShippingDetails] PRIMARY KEY CLUSTERED 
(
	[ShippingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 8/7/2024 3:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Picture1] [nvarchar](500) NULL,
	[Picture2] [nvarchar](500) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 8/7/2024 3:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[ContactName] [nvarchar](50) NULL,
	[ContactTitle] [nvarchar](50) NULL,
	[Address] [nvarchar](128) NULL,
	[Mobile] [nvarchar](15) NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[Fax] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[City] [nvarchar](20) NULL,
	[Country] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 8/7/2024 3:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[WishlistID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Wishlist] PRIMARY KEY CLUSTERED 
(
	[WishlistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin_Employee] ON 

INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath]) VALUES (1, N'Nguyễn', N'Đăng', 21, CAST(N'2003-12-03' AS Date), N'Nam', N'dangnguyen5321@gmail.com', N'Tổ 37, Khóm 4, Phường 11, TP Cao Lãnh, Đồng Tháp', N'0943572251', N'0943572251', NULL)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath]) VALUES (5, N'Văng', N'Tín', 21, CAST(N'1997-08-26' AS Date), N'Nam', N'vangcongtin@gmail.com', N'An Giang', N'0344123456', N'0344123456', NULL)
SET IDENTITY_INSERT [dbo].[admin_Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[admin_Login] ON 

INSERT [dbo].[admin_Login] ([LoginID], [EmpID], [UserName], [Password], [RoleType], [Notes]) VALUES (1, 1, N'Dang5321', N'53217777', 2, NULL)
INSERT [dbo].[admin_Login] ([LoginID], [EmpID], [UserName], [Password], [RoleType], [Notes]) VALUES (2, 5, N'Tin123', N'123456', 1, NULL)
SET IDENTITY_INSERT [dbo].[admin_Login] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (1, N'Nam', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (2, N'Nữ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (3, N'Trẻ em', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (4, N'Thể thao', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (5, N'Phụ kiện', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (6, N'Thời trang công sở', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (7, N'Đồ dạ hội', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (8, N'Đồ lót', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (9, N'Thời trang mùa đông', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (10, N'Đồ biển', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (1, N'Nguyễn', N'Đăng', N'Dang7777', N'53217777', 21, N'Nam', CAST(N'2003-12-03' AS Date), NULL, N'Việt Nam', N'Đồng Tháp', N'Cao Lãnh', N'870000', N'dangnguyen5321@gmail.com', NULL, NULL, NULL, N'0943572251', NULL, N'Tổ 37, Khóm 4, Phường 11, TP Cao Lãnh, Đồng Tháp', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (6, N'Nguyễn', N'An', N'An123', N'1234', NULL, NULL, NULL, NULL, N'Việt Nam', NULL, NULL, NULL, N'an123@gmail.com', NULL, NULL, NULL, N'0844123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (7, N'Trần', N'Bích', N'Bich123', N'1234', NULL, NULL, NULL, NULL, N'Việt Nam', NULL, NULL, NULL, N'bich@gmail.com', NULL, NULL, NULL, N'0844123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (8, N'Lê', N'Dũng', N'Dung123', N'1234', NULL, NULL, NULL, NULL, N'Việt Nam', NULL, NULL, NULL, N'inzi@gmail.com', NULL, NULL, NULL, N'0844123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (9, N'Đặng', N'Anh', N'Anh123', N'1234', NULL, NULL, NULL, NULL, N'Việt Nam', NULL, NULL, NULL, N'anhdang@gmail.com', NULL, NULL, NULL, N'0844123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (10, N'Vũ', N'Tuấn', N'Tuan123', N'12345', NULL, NULL, NULL, NULL, N'Việt Nam', NULL, NULL, NULL, N'tuanvu@gmail.com', NULL, NULL, NULL, N'0844123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (11, N'Văng', N'Tín', N'Tin123', N'1234', 21, N'Nam', CAST(N'1994-08-26' AS Date), NULL, N'Việt Nam', N'An Giang', N'An Phú', N'880000', N'vangcongtin@gmail.com', NULL, NULL, NULL, N'0983815343', NULL, N'Thị Trấn Long Bình, An Phú, An Giang', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes]) VALUES (12, N'Bùi', N'Thanh', N'Thanh123', N'1234', NULL, NULL, NULL, NULL, N'Việt Nam', NULL, NULL, NULL, N'thanh123@gmail.com', NULL, NULL, NULL, N'0844123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[genMainSlider] ON 

INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (1, N'/Content/img/slider/1.jpg', N'Nam slide img', N'Giảm tới 75%', N'Bộ sưu tập nam', N'Điều rất quan trọng là khách hàng phải chú ý đến quá trình mua sắm.', N'MUA NGAY', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (2, N'/Content/img/slider/2.jpg', N'Sang trọng slide img', N'Giảm tới 40%', N'Bộ sưu tập phụ kiện', N'Điều rất quan trọng là khách hàng phải chú ý đến quá trình mua sắm.', N'MUA NGAY', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (3, N'/Content/img/slider/3.jpg', N'Quần Jean Nữ slide img', N'Giảm tới 75%', N'Bộ sưu tập quần jean', N'Điều rất quan trọng là khách hàng phải chú ý đến quá trình mua sắm.', N'MUA NGAY', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (4, N'/Content/img/slider/4.jpg', N'Giày slide img', N'Giảm tới 75%', N'Bộ sưu tập độc quyền', N'Điều rất quan trọng là khách hàng phải chú ý đến quá trình mua sắm.', N'MUA NGAY', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (5, N'/Content/img/slider/5.jpg', N'Nam và Nữ slide img', N'Giảm tới 50%', N'Bộ sưu tập tốt nhất', N'Điều rất quan trọng là khách hàng phải chú ý đến quá trình mua sắm.', N'MUA NGAY', 0)
SET IDENTITY_INSERT [dbo].[genMainSlider] OFF
GO
SET IDENTITY_INSERT [dbo].[genPromoRight] ON 

INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (0, 1, N'/Content/img/promo-banner-mens.jpg', N'img', N'Mặt hàng độc quyền', N'Dành cho nam', 0)
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (1, 5, N'/Content/img/promo-banner-phukien.jpg', N'img', N'Giảm giá', N'Dành cho phụ kiện', 0)
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (2, 3, N'/Content/img/promo-banner-kids.jpg', N'img', N'Điểm đến mới', N'Dành cho trẻ em', 0)
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (3, 4, N'/Content/img/promo-banner-sport.jpg', N'img', N'Giảm 25%', N'Dành cho thể thao', 0)
SET IDENTITY_INSERT [dbo].[genPromoRight] OFF
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (1, 1, 1, 1, 0, 0, 450, 1, CAST(N'2016-09-09T20:54:32.980' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (2, 6, 2, 2, 0, 0, 3250, 1, CAST(N'2016-09-11T17:57:16.727' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (3, 7, 3, 3, 0, 0, 1000, 1, CAST(N'2016-09-11T18:01:33.653' AS DateTime), 1, NULL, 0, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (4, 1, 4, 4, 0, 0, 3650, 1, CAST(N'2016-09-11T18:07:10.180' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (5, 6, 5, 5, 0, 0, 2550, 1, CAST(N'2016-09-12T11:48:10.897' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (6, 6, 6, 6, 0, 0, 1400, 1, CAST(N'2016-09-12T11:49:50.607' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (7, 8, 7, 7, 0, 0, 1600, 1, CAST(N'2016-09-12T13:15:02.647' AS DateTime), 1, NULL, 1, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (8, 1, 8, 8, 0, NULL, 6650, 1, CAST(N'2016-09-16T22:47:37.677' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (9, 1, 9, 9, 0, NULL, 2350, 1, CAST(N'2016-09-17T15:47:05.120' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (10, 12, 10, 10, 0, NULL, 6950, 1, CAST(N'2016-09-17T22:33:22.687' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (11, 1, 11, 11, 0, NULL, 750700, 1, CAST(N'2024-08-07T08:08:45.720' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (1, 1, 3, CAST(450 AS Decimal(18, 0)), 1, NULL, CAST(450 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (2, 2, 3, CAST(450 AS Decimal(18, 0)), 1, NULL, CAST(450 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (3, 2, 29, CAST(900 AS Decimal(18, 0)), 2, NULL, CAST(1800 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (4, 2, 1, CAST(550 AS Decimal(18, 0)), 3, NULL, CAST(1650 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (5, 2, 25, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (6, 2, 4, CAST(800 AS Decimal(18, 0)), 3, NULL, CAST(2400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (7, 3, 1, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (8, 3, 3, CAST(450 AS Decimal(18, 0)), 3, NULL, CAST(1350 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (9, 4, 3, CAST(450 AS Decimal(18, 0)), 1, NULL, CAST(450 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (10, 4, 2, CAST(700 AS Decimal(18, 0)), 1, NULL, CAST(700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (11, 4, 1, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (12, 4, 26, CAST(850 AS Decimal(18, 0)), 1, NULL, CAST(850 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (13, 4, 30, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (14, 4, 33, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (15, 5, 3, CAST(450 AS Decimal(18, 0)), 1, NULL, CAST(450 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (16, 5, 25, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (17, 5, 5, CAST(700 AS Decimal(18, 0)), 1, NULL, CAST(700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (18, 5, 34, CAST(850 AS Decimal(18, 0)), 1, NULL, CAST(850 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (19, 6, 2, CAST(700 AS Decimal(18, 0)), 2, NULL, CAST(1400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (20, 7, 2, CAST(700 AS Decimal(18, 0)), 1, NULL, CAST(700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (21, 7, 3, CAST(450 AS Decimal(18, 0)), 2, NULL, CAST(900 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (22, 8, 7, CAST(700 AS Decimal(18, 0)), 4, NULL, CAST(2800 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (23, 8, 25, CAST(550 AS Decimal(18, 0)), 7, NULL, CAST(3850 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (24, 9, 2, CAST(700 AS Decimal(18, 0)), 1, NULL, CAST(700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (25, 9, 31, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (26, 9, 33, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (27, 9, 30, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (28, 10, 1, CAST(550 AS Decimal(18, 0)), 5, NULL, CAST(2750 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (29, 10, 29, CAST(900 AS Decimal(18, 0)), 3, NULL, CAST(2700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (30, 10, 35, CAST(750 AS Decimal(18, 0)), 2, NULL, CAST(1500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (31, 11, 1, CAST(250000 AS Decimal(18, 0)), 3, NULL, CAST(750000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (32, 11, 8, CAST(700 AS Decimal(18, 0)), 1, NULL, CAST(700 AS Decimal(18, 0)), NULL)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (3, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (4, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (5, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (6, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (7, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (8, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (9, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (10, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (11, 2, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (1, N'Cash on Delivery', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (2, N'Paypal', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (3, N'Master Card', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (4, N'Easypaisa', NULL)
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (1, N'Polo T-Shirt', 2, 1, 1, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 6, NULL, NULL, N'/Content/img/man/polo-shirt-2.png', N'polo shirt img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (2, N'T-Shirt', 2, 1, 6, NULL, CAST(700 AS Decimal(18, 0)), CAST(850 AS Decimal(18, 0)), NULL, NULL, NULL, 8, NULL, NULL, N'/Content/img/man/t-shirt-1.png', N'polo shirt img', 1, N'SOLD OUT', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (3, N'Polo T-Shirt', 2, 1, 6, NULL, CAST(450 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 9, NULL, NULL, N'/Content/img/man/polo-shirt-1.png', N'polo shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (4, N'New Polo T-Shirt', 2, 1, 6, NULL, CAST(800 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), NULL, NULL, NULL, 48, NULL, NULL, N'/Content/img/man/polo-shirt-4.png', N'polo shirt img', 1, N'HOT!', N'aa-hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (5, N'New T-Shirt', 2, 1, 6, NULL, CAST(700 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 51, NULL, NULL, N'/Content/img/man/polo-shirt-5.png', N'polo shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (6, N'Star T-Shirt', 2, 1, 6, NULL, CAST(700 AS Decimal(18, 0)), CAST(950 AS Decimal(18, 0)), NULL, NULL, NULL, 99, NULL, NULL, N'/Content/img/man/polo-shirt-6.png', N'polo shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (7, N'Polo T-Shirt', 2, 1, 6, NULL, CAST(700 AS Decimal(18, 0)), CAST(950 AS Decimal(18, 0)), NULL, NULL, NULL, 20, NULL, NULL, N'/Content/img/man/polo-shirt-2.png', N'polo shirt img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (8, N'T-Shirt', 2, 1, 6, NULL, CAST(700 AS Decimal(18, 0)), CAST(850 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/man/t-shirt-1.png', N'polo shirt img', 1, N'SOLD OUT', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (9, N'Girl-1', 2, 2, 1, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/women/girl-1.png', N'girl shirt img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (10, N'Girl-2', 2, 2, 1, NULL, CAST(850 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 8, NULL, NULL, N'/Content/img/women/girl-2.png', N'girl shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (11, N'Girl-3', 2, 2, 1, NULL, CAST(750 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 25, NULL, NULL, N'/Content/img/women/girl-3.png', N'girl shirt img', 1, N'HOT!', N'aa-hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (12, N'Girl-4', 2, 2, 1, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 2, NULL, NULL, N'/Content/img/women/girl-4.png', N'girl shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (13, N'Girl-5', 2, 2, 1, NULL, CAST(900 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 8, NULL, NULL, N'/Content/img/women/girl-5.png', N'girl shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (14, N'Girl-6', 2, 2, 1, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/women/girl-6.png', N'girl shirt img', 1, N'SOLD OUT!', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (15, N'Girl-7', 2, 2, 1, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 16, NULL, NULL, N'/Content/img/women/girl-7.png', N'girl shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (16, N'Girl-8', 2, 2, 1, NULL, CAST(1500 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 18, NULL, NULL, N'/Content/img/women/girl-1.png', N'girl shirt img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (25, N'sport-1', 2, 4, 2, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 45, NULL, NULL, N'/Content/img/sports/sport-1.png', N'sport shirt img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (26, N'sport-2', 2, 4, 2, NULL, CAST(850 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 50, NULL, NULL, N'/Content/img/sports/sport-2.png', N'sport shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (27, N'sport-3', 2, 4, 2, NULL, CAST(750 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 33, NULL, NULL, N'/Content/img/sports/sport-3.png', N'sport shirt img', 1, N'HOT!', N'aa-hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (28, N'sport-4', 2, 4, 2, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/sports/sport-4.png', N'sport shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (29, N'sport-5', 2, 4, 2, NULL, CAST(900 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/sports/sport-5.png', N'sport shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (30, N'sport-6', 2, 4, 2, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/sports/sport-6.png', N'sport shirt img', 1, N'SOLD OUT!', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (31, N'sport-7', 2, 4, 2, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 8, NULL, NULL, N'/Content/img/sports/sport-7.png', N'sport shirt img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (32, N'sport-8', 2, 4, 2, NULL, CAST(1500 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 3, NULL, NULL, N'/Content/img/sports/sport-1.png', N'sport shirt img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (33, N'electronic-1', 2, 5, NULL, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 30, NULL, NULL, N'/Content/img/electronics/electronic-1.png', N'electronic item img', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (34, N'electronic-2', 2, 5, NULL, NULL, CAST(850 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 29, NULL, NULL, N'/Content/img/electronics/electronic-2.png', N'electronic item img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (35, N'electronic-3', 2, 5, NULL, NULL, CAST(750 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 21, NULL, NULL, N'/Content/img/electronics/electronic-3.png', N'electronic item img', 1, N'HOT!', N'aa-hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (36, N'electronic-4', 2, 5, NULL, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 19, NULL, NULL, N'/Content/img/electronics/electronic-4.png', N'electronic item img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (37, N'electronic-5', 2, 5, NULL, NULL, CAST(900 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 9, NULL, NULL, N'/Content/img/electronics/electronic-5.png', N'electronic item img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (38, N'electronic-6', 2, 5, NULL, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 4, NULL, NULL, N'/Content/img/electronics/electronic-6.png', N'electronic item img', 1, N'SOLD OUT!', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (39, N'electronic-7', 2, 5, NULL, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 2, NULL, NULL, N'/Content/img/electronics/electronic-7.png', N'electronic item img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (41, N'Áo So Mi', 2, 1, 2, NULL, CAST(250000 AS Decimal(18, 0)), CAST(350000 AS Decimal(18, 0)), NULL, NULL, NULL, 50, NULL, NULL, N'/Content/img/man/Ao-so-mi.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (42, N'Áo So Mi Tr?ng', 2, 1, 2, NULL, CAST(250000 AS Decimal(18, 0)), CAST(350000 AS Decimal(18, 0)), NULL, NULL, NULL, 7, NULL, NULL, N'/Content/img/man/Ao-so-mi.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Ao-so-mi.jpg', N'Ao-so-mi.jpg', N'Ao-so-mi.jpg', N'Ao-so-mi.jpg', NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note]) VALUES (43, N'Ao so mi', 2, 1, 2, NULL, CAST(250000 AS Decimal(18, 0)), CAST(350000 AS Decimal(18, 0)), NULL, NULL, NULL, 6, NULL, NULL, N'/Content/img/man/Ao-so-mi.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[RecentlyViews] ON 

INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (1, 8, 3, CAST(N'2016-09-12T13:04:22.833' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (2, 8, 3, CAST(N'2016-09-12T13:06:15.157' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (3, 8, 3, CAST(N'2016-09-12T13:06:23.053' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (4, 8, 3, CAST(N'2016-09-12T13:08:32.260' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (5, 8, 3, CAST(N'2016-09-12T13:08:38.983' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (6, 8, 3, CAST(N'2016-09-12T13:09:03.177' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (7, 8, 3, CAST(N'2016-09-12T13:11:26.760' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (8, 8, 2, CAST(N'2016-09-12T13:13:51.517' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (10, 9, 5, CAST(N'2016-09-16T21:23:59.193' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (11, 9, 31, CAST(N'2016-09-16T21:24:08.987' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (12, 9, 4, CAST(N'2016-09-16T21:24:18.577' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (13, 9, 10, CAST(N'2016-09-16T21:25:00.783' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (14, 1, 6, CAST(N'2016-09-16T22:27:00.397' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (15, 1, 3, CAST(N'2016-09-16T22:27:04.163' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (16, 1, 27, CAST(N'2016-09-16T22:27:09.210' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (17, 1, 7, CAST(N'2016-09-16T22:27:13.827' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (18, 1, 7, CAST(N'2016-09-16T22:27:17.980' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (19, 1, 7, CAST(N'2016-09-16T22:27:18.000' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (20, 1, 2, CAST(N'2016-09-16T22:35:59.680' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (21, 1, 6, CAST(N'2016-09-16T22:36:14.390' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (22, 1, 5, CAST(N'2016-09-16T22:36:44.520' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (23, 1, 2, CAST(N'2016-09-16T22:44:09.607' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (24, 1, 2, CAST(N'2016-09-16T22:44:15.410' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (25, 1, 7, CAST(N'2016-09-16T22:46:56.820' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (26, 1, 25, CAST(N'2016-09-16T22:47:05.047' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (27, 1, 25, CAST(N'2016-09-16T22:47:12.357' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (28, 1, 25, CAST(N'2016-09-16T22:47:12.407' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (29, 10, 3, CAST(N'2016-09-16T23:27:42.397' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (30, 10, 3, CAST(N'2016-09-16T23:27:45.477' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (31, 10, 3, CAST(N'2016-09-16T23:27:45.523' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (32, 10, 4, CAST(N'2016-09-16T23:28:35.837' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (33, 1, 2, CAST(N'2016-09-17T15:44:58.923' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (34, 1, 31, CAST(N'2016-09-17T15:45:06.387' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (35, 1, 33, CAST(N'2016-09-17T15:45:15.667' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (36, 1, 30, CAST(N'2016-09-17T15:45:21.820' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (37, 11, 28, CAST(N'2016-09-17T22:25:05.957' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (38, 11, 30, CAST(N'2016-09-17T22:25:13.003' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (39, 11, 34, CAST(N'2016-09-17T22:25:24.977' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (40, 11, 3, CAST(N'2016-09-17T22:25:45.587' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (41, 11, 3, CAST(N'2016-09-17T22:29:14.070' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (42, 11, 3, CAST(N'2016-09-17T22:29:30.140' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (43, 12, 1, CAST(N'2016-09-17T22:30:48.747' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (44, 12, 29, CAST(N'2016-09-17T22:31:00.773' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (45, 12, 26, CAST(N'2016-09-17T22:31:06.380' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (46, 12, 35, CAST(N'2016-09-17T22:31:41.210' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (47, 12, 35, CAST(N'2016-09-17T22:32:11.543' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (48, 12, 35, CAST(N'2016-09-17T22:32:22.803' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (49, 12, 35, CAST(N'2016-09-17T22:32:22.840' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (50, 1, 2, CAST(N'2024-08-07T07:32:22.487' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (51, 1, 41, CAST(N'2024-08-07T08:06:21.093' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (52, 1, 8, CAST(N'2024-08-07T08:06:28.540' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (53, 1, 42, CAST(N'2024-08-07T08:32:03.053' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (54, 1, 42, CAST(N'2024-08-07T08:32:46.860' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (55, 1, 41, CAST(N'2024-08-07T09:25:41.220' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (56, 1, 41, CAST(N'2024-08-07T09:30:12.493' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (57, 1, 41, CAST(N'2024-08-07T09:30:33.040' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (58, 1, 1, CAST(N'2024-08-07T09:32:13.477' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (59, 1, 6, CAST(N'2024-08-07T09:41:19.140' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[RecentlyViews] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (1, 7, 3, N'Faraz Talpur', N'faraz@yahoo.com', N'Good Product.', 4, CAST(N'2016-08-11T19:03:00.227' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (6, 8, 3, N'ABC', N'abc@gmail.com', N'Nice', 5, CAST(N'2016-08-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (7, 8, 3, N'XYZ', N'xyz@hotmail.com', N'Excellent product. thank you', 5, CAST(N'2016-08-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (8, 7, 3, N'dfg', N'dfg@gmail.com', N'bad', 2, CAST(N'2015-09-23T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (9, 11, 3, N'Zulfiqar Akram', N'zulfiqar.akram366@yahoo.com', N'Good Product', 4, CAST(N'2016-09-17T22:26:20.900' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (10, 11, 3, N'Zulfiqar Akram', N'zulfiqar.akram366@yahoo.com', N'Good Product', 4, CAST(N'2016-09-17T22:29:30.030' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (11, 12, 35, N'Ali', N'ali@gmail.com', N'Nice Product', 4, CAST(N'2016-09-17T22:32:11.457' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (12, 1, 42, N'Ðang', N'nguyenhaidang12cb3tqt@gmail.com', N'Ð?p', 5, CAST(N'2024-08-07T08:32:46.823' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (13, 1, 41, N'Ðang', N'nguyenhaidang12cb3tqt@gmail.com', N'Ao dep', 4, CAST(N'2024-08-07T09:30:33.003' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (1, N'Admin', N'All rights')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (2, N'Employee', N'Some rights')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (3, N'User', N'Some rights')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (1, N'Zulfiqar', N'Akram', N'zulfiqar.akram366@yahoo.com', N'+923448127902', N'Dalmain karachi
', N'Sindh', N'Karachi', N'75300')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (2, N'Ali', N'sultan', N'ali123@gmail.com', N'03441234567', N'karachi
punjab', N'Sindh', N'karachi', N'75000')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (3, N'Faraz', N'Akram', N'faraz@hotmail.com', N'+923448127902', N'cpo14-1', N'KPK', N'CZXCZ', N'3123')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (4, N'Zulfiqar', N'Akram', N'zulfiqar.akram366@yahoo.com', N'+923448127902', N'Dalmain karachi
', N'Sindh', N'Karachi', N'75300')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (5, N'Ali', N'sultan', N'ali123@gmail.com', N'03441234567', N'karachi
punjab', N'Sindh', N'karachi', N'75000')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (6, N'Ali', N'sultan', N'ali123@gmail.com', N'03441234567', N'karachi
punjab', N'Sindh', N'karachi', N'75000')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (7, N'inzi', N'mama', N'inzi@gmail.com', N'03441234567', N'cpo14-1', N'Punjab', N'Karachi', N'75300')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (8, N'Zulfiqar', N'Akram', N'zulfiqar.akram366@yahoo.com', N'+923448127902', N'Dalmain karachi
', N'Sindh', N'Karachi', N'75300')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (9, N'Zulfiqar', N'Akram', N'zulfiqar123@yahoo.com', N'+923441234567', N'Dalmain karachi
', N'Sindh', N'Karachi', N'75000')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (10, N'Ali', N'Khan', N'ali123@gmail.com', N'03441234567', N'karachi
punjab', N'Sindh', N'karachi', N'75000')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (11, N'Nguy?n', N'Ðang', N'nguyenhaidang12cb3tqt@gmail.com', N'0943572251', N'oanuvqvuq9v', N'--', N'', N'')
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (1, 1, N'Áo thun             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (2, 1, N'Áo sơ mi            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (3, 1, N'Áo polo             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (4, 1, N'Quần Jean           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (5, 1, N'Kurtas              ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (6, 1, N'Shalwar Kameez      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (7, 1, N'Casual Shoes        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (8, 1, N'Formal Shoes        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (11, 1, N'Boots               ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (12, 1, N'Hoodies             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (13, 1, N'Sweaters            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (14, 1, N'Watches             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (15, 1, N'Wallets             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (16, 1, N'Ties                ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (17, 1, N'Cufflinks           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (18, 1, N'Sunglasses          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (19, 2, N'Kurtas              ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (20, 2, N'Shalwar Kameez      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (21, 2, N'Fabric              ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (22, 2, N'Tops                ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (23, 2, N'Pants               ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (24, 2, N'Innerwear           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (25, 2, N'Flats & Sandals     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (26, 2, N'Heels               ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (27, 2, N'Jewellery           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (28, 2, N'Watches             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (29, 2, N'Bags                ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (30, 2, N'Sunglasses          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (32, 3, N'Baby Care           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (33, 3, N'Baby Feeding        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (34, 3, N'Baby Bottles        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (35, 3, N'Educational Toys    ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (36, 3, N'Remote Control Cars ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (37, 3, N'All Toys            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (38, 4, N'Men Wear            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (39, 4, N'Women Wear          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (40, 4, N'Kids Wear           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (41, 4, N'Fitness equipments  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (42, 4, N'Fitness Nutrition   ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (43, 5, N'All Brands          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (44, 5, N'IPhone              ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (45, 5, N'Samsung             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (46, 5, N'Nokia               ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (47, 5, N'QMobile             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (48, 5, N'Infinix             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (49, 6, N'Desktop Computer    ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (51, 6, N'Laptop              ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (52, 6, N'Printers            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (53, 6, N'Hard Drives         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (54, 6, N'USB Drives          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (55, 6, N'Scanners            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (57, 6, N'Accessories         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (58, 7, N'Cooling & Heating   ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (59, 7, N'Refrigerators       ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (60, 7, N'Washers             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (61, 7, N'Cooking Appliances  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (62, 7, N'Blenders            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (63, 7, N'Ironing             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (64, 7, N'Beverage Preparation', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (65, 8, N'Face                ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (66, 8, N'Eyes                ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (67, 8, N'Lips                ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (68, 8, N'Men Perfumes        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (69, 8, N'Women Perfumes      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (70, 8, N'Hair Care           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (71, 9, N'LED & LCD           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (72, 9, N'DVD Player          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (73, 9, N'Speakers            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (74, 9, N'Headphones          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (75, 9, N'MP3 Players         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (76, 10, N'Wifi                ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (77, 10, N'Furniture           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (78, 10, N'Lighting            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (79, 10, N'Cameras             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (80, 10, N'Videos Games        ', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country]) VALUES (2, N'Pavlova Ltd', N'Ian Devling', N'Marketing Manager', N'karachi', N'03441234567', N'03441234567', N'(03) 444-6588', N'lan@gmail.com', N'karachi', N'Pakistan')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[Wishlist] ON 

INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (5, 9, 4, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (6, 1, 6, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (7, 1, 5, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (8, 1, 2, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (9, 11, 30, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (10, 12, 26, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (11, 1, 41, NULL)
SET IDENTITY_INSERT [dbo].[Wishlist] OFF
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Taxes]  DEFAULT ((0)) FOR [Taxes]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_isCompleted]  DEFAULT ((0)) FOR [isCompleted]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_DIspatched]  DEFAULT ((0)) FOR [DIspatched]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Shipped]  DEFAULT ((0)) FOR [Shipped]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Deliver]  DEFAULT ((0)) FOR [Deliver]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_CancelOrder]  DEFAULT ((0)) FOR [CancelOrder]
GO
ALTER TABLE [dbo].[Wishlist] ADD  CONSTRAINT [DF_Wishlist_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[admin_Login]  WITH CHECK ADD  CONSTRAINT [FK_admin_Login_admin_Employee] FOREIGN KEY([EmpID])
REFERENCES [dbo].[admin_Employee] ([EmpID])
GO
ALTER TABLE [dbo].[admin_Login] CHECK CONSTRAINT [FK_admin_Login_admin_Employee]
GO
ALTER TABLE [dbo].[admin_Login]  WITH CHECK ADD  CONSTRAINT [FK_admin_Login_Roles] FOREIGN KEY([RoleType])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[admin_Login] CHECK CONSTRAINT [FK_admin_Login_Roles]
GO
ALTER TABLE [dbo].[genPromoRight]  WITH CHECK ADD  CONSTRAINT [FK_genPromoRight_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[genPromoRight] CHECK CONSTRAINT [FK_genPromoRight_Categories]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customers]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Payment] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payment] ([PaymentID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Payment]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_ShippingDetails] FOREIGN KEY([ShippingID])
REFERENCES [dbo].[ShippingDetails] ([ShippingID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_ShippingDetails]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_PaymentType] FOREIGN KEY([Type])
REFERENCES [dbo].[PaymentType] ([PayTypeID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_PaymentType]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_SubCategory]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[RecentlyViews]  WITH CHECK ADD  CONSTRAINT [FK_RecentlyViews_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[RecentlyViews] CHECK CONSTRAINT [FK_RecentlyViews_Customers]
GO
ALTER TABLE [dbo].[RecentlyViews]  WITH CHECK ADD  CONSTRAINT [FK_RecentlyViews_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[RecentlyViews] CHECK CONSTRAINT [FK_RecentlyViews_Products]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Customers]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Products]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Categories]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Customers]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Products]
GO
USE [master]
GO
ALTER DATABASE [ShopQuanAoThoiTrang] SET  READ_WRITE 
GO
