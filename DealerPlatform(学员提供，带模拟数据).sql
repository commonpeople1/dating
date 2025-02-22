USE [master]
GO
/****** Object:  Database [DealerPlatform]    Script Date: 2022/9/27 16:07:13 ******/
CREATE DATABASE [DealerPlatform]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DealerPlatform', FILENAME = N'D:\MyStudy\DataBase\DealerPlatform.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DealerPlatform_log', FILENAME = N'D:\MyStudy\DataBase\DealerPlatform_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DealerPlatform] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DealerPlatform].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DealerPlatform] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DealerPlatform] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DealerPlatform] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DealerPlatform] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DealerPlatform] SET ARITHABORT OFF 
GO
ALTER DATABASE [DealerPlatform] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DealerPlatform] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DealerPlatform] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DealerPlatform] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DealerPlatform] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DealerPlatform] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DealerPlatform] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DealerPlatform] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DealerPlatform] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DealerPlatform] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DealerPlatform] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DealerPlatform] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DealerPlatform] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DealerPlatform] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DealerPlatform] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DealerPlatform] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DealerPlatform] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DealerPlatform] SET RECOVERY FULL 
GO
ALTER DATABASE [DealerPlatform] SET  MULTI_USER 
GO
ALTER DATABASE [DealerPlatform] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DealerPlatform] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DealerPlatform] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DealerPlatform] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DealerPlatform] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DealerPlatform] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DealerPlatform', N'ON'
GO
ALTER DATABASE [DealerPlatform] SET QUERY_STORE = OFF
GO
USE [DealerPlatform]
GO
/****** Object:  Table [dbo].[CustomerInvoices]    Script Date: 2022/9/27 16:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerInvoices](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CustomerNo] [varchar](40) NOT NULL,
	[InvoiceNo] [varchar](100) NOT NULL,
	[InvoiceEin] [varchar](40) NOT NULL,
	[InvoiceBank] [varchar](100) NOT NULL,
	[InvoiceAccount] [varchar](40) NOT NULL,
	[InvoiceAddress] [varchar](100) NOT NULL,
	[InvoicePhone] [varchar](40) NOT NULL,
 CONSTRAINT [PK_T200_customer_invoice] PRIMARY KEY CLUSTERED 
(
	[CustomerNo] ASC,
	[InvoiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPwds]    Script Date: 2022/9/27 16:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPwds](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CustomerNo] [varchar](40) NOT NULL,
	[CustomerPwd] [varchar](40) NOT NULL,
 CONSTRAINT [PK_T101_customer_psw] PRIMARY KEY CLUSTERED 
(
	[CustomerNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2022/9/27 16:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CustomerNo] [varchar](40) NOT NULL,
	[CustomerName] [varchar](100) NOT NULL,
	[FirstAreaNo] [varchar](40) NOT NULL,
	[FirstAreaName] [varchar](100) NOT NULL,
	[AreaNo] [varchar](40) NOT NULL,
	[AreaName] [varchar](100) NOT NULL,
	[Province] [varchar](40) NOT NULL,
	[City] [varchar](40) NOT NULL,
	[Tel] [varchar](40) NOT NULL,
	[Phone] [varchar](40) NOT NULL,
	[Fax] [varchar](40) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[BankAccount] [varchar](40) NOT NULL,
	[BankNo] [varchar](40) NOT NULL,
	[BankName] [varchar](100) NOT NULL,
	[Ein] [varchar](40) NOT NULL,
	[CustomerNote] [varchar](500) NOT NULL,
	[OwnerWorkerNo] [varchar](40) NULL,
	[OwnerWorkerName] [varchar](100) NULL,
	[OwnerWorkerTel] [varchar](40) NULL,
	[OpenId] [varchar](40) NULL,
	[HeadImgUrl] [varchar](255) NULL,
 CONSTRAINT [PK_T200_customer_code] PRIMARY KEY CLUSTERED 
(
	[CustomerNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhotos]    Script Date: 2022/9/27 16:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhotos](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SysNo] [varchar](40) NULL,
	[ProductNo] [varchar](100) NOT NULL,
	[ProductPhotoUrl] [varchar](100) NOT NULL,
 CONSTRAINT [PK_T200_product_photo] PRIMARY KEY CLUSTERED 
(
	[ProductNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2022/9/27 16:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SysNo] [varchar](100) NOT NULL,
	[ProductNo] [varchar](100) NOT NULL,
	[ProductName] [varchar](200) NOT NULL,
	[TypeNo] [varchar](40) NOT NULL,
	[TypeName] [varchar](40) NOT NULL,
	[ProductPP] [varchar](100) NOT NULL,
	[ProductXH] [varchar](100) NOT NULL,
	[ProductCZ] [varchar](100) NOT NULL,
	[ProductHB] [varchar](100) NOT NULL,
	[ProductHD] [varchar](100) NOT NULL,
	[ProductGY] [varchar](100) NOT NULL,
	[ProductHS] [varchar](100) NOT NULL,
	[ProductMC] [varchar](100) NOT NULL,
	[ProductDJ] [varchar](100) NOT NULL,
	[ProductCD] [varchar](100) NOT NULL,
	[ProductGG] [varchar](100) NOT NULL,
	[ProductYS] [varchar](100) NOT NULL,
	[UnitNo] [varchar](100) NOT NULL,
	[UnitName] [varchar](100) NOT NULL,
	[ProductNote] [varchar](500) NOT NULL,
	[ProductBZGG] [varchar](100) NOT NULL,
	[BelongTypeNo] [varchar](40) NOT NULL,
	[BelongTypeName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_T200_product_code] PRIMARY KEY CLUSTERED 
(
	[SysNo] ASC,
	[ProductNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSaleAreaDiffs]    Script Date: 2022/9/27 16:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSaleAreaDiffs](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SysNo] [varchar](100) NOT NULL,
	[ProductNo] [varchar](100) NOT NULL,
	[StockNo] [varchar](40) NOT NULL,
	[AreaNo] [varchar](40) NOT NULL,
	[FirstAreaNo] [varchar](40) NOT NULL,
	[DiffPrice] [float] NOT NULL,
 CONSTRAINT [PK_T201_product_sale_area_diff] PRIMARY KEY CLUSTERED 
(
	[SysNo] ASC,
	[ProductNo] ASC,
	[StockNo] ASC,
	[AreaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSales]    Script Date: 2022/9/27 16:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSales](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SysNo] [varchar](100) NOT NULL,
	[ProductNo] [varchar](40) NOT NULL,
	[StockNo] [varchar](40) NULL,
	[SalePrice] [float] NOT NULL,
 CONSTRAINT [PK_T201_product_sale_list] PRIMARY KEY CLUSTERED 
(
	[SysNo] ASC,
	[ProductNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleOrderDetails]    Script Date: 2022/9/27 16:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleOrderDetails](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SaleOrderGuid] [varchar](40) NOT NULL,
	[SaleOrderNo] [varchar](40) NOT NULL,
	[ProductNo] [varchar](40) NOT NULL,
	[ProductName] [varchar](40) NULL,
	[ProductPhotoUrl] [varchar](200) NULL,
	[CustomerNo] [varchar](40) NOT NULL,
	[InputDate] [datetime] NOT NULL,
	[OrderNum] [int] NOT NULL,
	[BasePrice] [float] NOT NULL,
	[DiffPrice] [float] NOT NULL,
	[SalePrice] [float] NOT NULL,
 CONSTRAINT [PK_SaleOrderDetails] PRIMARY KEY CLUSTERED 
(
	[SaleOrderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleOrderMasters]    Script Date: 2022/9/27 16:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleOrderMasters](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SaleOrderNo] [varchar](40) NOT NULL,
	[CustomerNo] [varchar](40) NOT NULL,
	[InvoiceNo] [varchar](40) NOT NULL,
	[InputDate] [datetime] NOT NULL,
	[StockNo] [varchar](40) NOT NULL,
	[EditUserNo] [varchar](40) NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[Remark] [varchar](50) NULL,
 CONSTRAINT [PK_SaleOrderMasters] PRIMARY KEY CLUSTERED 
(
	[SaleOrderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleOrderProgresses]    Script Date: 2022/9/27 16:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleOrderProgresses](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SaleOrderNo] [varchar](40) NOT NULL,
	[ProgressGuid] [varchar](40) NOT NULL,
	[StepSn] [int] NOT NULL,
	[StepName] [varchar](100) NOT NULL,
	[StepTime] [datetime] NOT NULL,
 CONSTRAINT [PK_SaleOrderProgresses] PRIMARY KEY CLUSTERED 
(
	[SaleOrderNo] ASC,
	[ProgressGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCarts]    Script Date: 2022/9/27 16:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCarts](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CartGuid] [varchar](40) NOT NULL,
	[CustomerNo] [varchar](40) NOT NULL,
	[ProductNo] [varchar](40) NOT NULL,
	[ProductNum] [int] NOT NULL,
	[CartSelected] [bit] NOT NULL,
 CONSTRAINT [PK_T200_shopping_cart] PRIMARY KEY CLUSTERED 
(
	[CartGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stocks]    Script Date: 2022/9/27 16:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stocks](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[StockNo] [varchar](40) NOT NULL,
	[StockName] [varchar](100) NOT NULL,
	[StockLinkman] [varchar](40) NOT NULL,
	[StockTel] [varchar](40) NOT NULL,
	[StockPhone] [varchar](40) NOT NULL,
 CONSTRAINT [PK_T200_stock_code] PRIMARY KEY CLUSTERED 
(
	[StockNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CustomerInvoices] ON 

INSERT [dbo].[CustomerInvoices] ([Id], [CustomerNo], [InvoiceNo], [InvoiceEin], [InvoiceBank], [InvoiceAccount], [InvoiceAddress], [InvoicePhone]) VALUES (7, N'AHAQWYZ', N'安徽安庆哈哈哈', N' ', N'徽商银行港口支行', N'1691601021000408566', N'安庆市光彩大市场杀杀杀', N'15036522452')
INSERT [dbo].[CustomerInvoices] ([Id], [CustomerNo], [InvoiceNo], [InvoiceEin], [InvoiceBank], [InvoiceAccount], [InvoiceAddress], [InvoicePhone]) VALUES (1, N'AHAQWYZ', N'安徽安庆王跃争', N'', N'徽商银行港口支行', N'1691601021000408566', N'安庆市光彩大市场四期C区三撞1-9号', N'18058718795')
SET IDENTITY_INSERT [dbo].[CustomerInvoices] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerPwds] ON 

INSERT [dbo].[CustomerPwds] ([id], [CustomerNo], [CustomerPwd]) VALUES (1, N'AHAQWYZ', N'D55B0E6AE40835918E779F243436F11A')
SET IDENTITY_INSERT [dbo].[CustomerPwds] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [CustomerNo], [CustomerName], [FirstAreaNo], [FirstAreaName], [AreaNo], [AreaName], [Province], [City], [Tel], [Phone], [Fax], [Address], [BankAccount], [BankNo], [BankName], [Ein], [CustomerNote], [OwnerWorkerNo], [OwnerWorkerName], [OwnerWorkerTel], [OpenId], [HeadImgUrl]) VALUES (1, N'AHAQWYZ', N'安徽安庆王跃争', N'北区', N'北区', N'06', N'安徽', N'安徽省', N'安庆', N'0556-5176888', N'13909669828', N'0556-5362599', N'安庆市光彩大市场四期', N'', N'', N'安徽安庆王跃争', N'', N'', N'admin', N'菜菜', N'18888888888', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductPhotos] ON 

INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (79, N'2', N' WJBCDBB', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (80, N'2', N' WJBCDBBB', N'/img/productPhotos/3.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (81, N'2', N' WJBCDBBN', N'/img/productPhotos/4.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (82, N'2', N' WJBCDBE', N'/img/productPhotos/5.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (83, N'2', N' WJBCDBF', N'/img/productPhotos/6.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (84, N'2', N' WJBCDBG', N'/img/productPhotos/7.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (85, N'2', N' WJBCDBH', N'/img/productPhotos/8.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (86, N'2', N' WJBCDBI', N'/img/productPhotos/9.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (87, N'2', N' WJBCDBJ', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (88, N'2', N' WJBCDBK', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (89, N'2', N' WJBCDBM', N'/img/productPhotos/4.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (90, N'2', N' WJBCDBN', N'/img/productPhotos/5.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (91, N'2', N' WJBCDBq', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (92, N'2', N' WJBCDBS', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (93, N'2', N' WJBCDBT', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (94, N'2', N' WJBCDBU', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (95, N'2', N' WJBCDBV', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (96, N'2', N' WJBCDBVC', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (97, N'2', N' WJBCDBW', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (98, N'2', N' WJBCDBX', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (99, N'2', N' WJBCDBZ', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (1, N'1', N' WJJZZDB', N'/img/productPhotos/1.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (36, N'1', N' WJJZZDB1', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (37, N'1', N' WJJZZDB10', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (38, N'1', N' WJJZZDB11', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (39, N'1', N' WJJZZDB12', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (40, N'1', N' WJJZZDB13', N'/img/productPhotos/11.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (41, N'1', N' WJJZZDB14', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (42, N'1', N' WJJZZDB15', N'/img/productPhotos/11.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (43, N'1', N' WJJZZDB16', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (44, N'1', N' WJJZZDB17', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (45, N'1', N' WJJZZDB18', N'/img/productPhotos/11.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (46, N'1', N' WJJZZDB19', N'/img/productPhotos/3.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (47, N'1', N' WJJZZDB2', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (48, N'1', N' WJJZZDB20', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (49, N'1', N' WJJZZDB21', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (50, N'1', N' WJJZZDB3', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (51, N'1', N' WJJZZDB4', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (52, N'1', N' WJJZZDB5', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (53, N'1', N' WJJZZDB6', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (54, N'1', N' WJJZZDB7', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (55, N'1', N' WJJZZDB8', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (56, N'1', N' WJJZZDB9', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (57, N'1', N' WJJZZDBB', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (58, N'1', N' WJJZZDBBB', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (59, N'1', N' WJJZZDBBN', N'/img/productPhotos/5.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (60, N'1', N' WJJZZDBE', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (61, N'1', N' WJJZZDBF', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (62, N'1', N' WJJZZDBG', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (63, N'1', N' WJJZZDBH', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (64, N'1', N' WJJZZDBI', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (65, N'1', N' WJJZZDBJ', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (66, N'1', N' WJJZZDBK', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (67, N'1', N' WJJZZDBM', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (68, N'1', N' WJJZZDBN', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (69, N'1', N' WJJZZDBO', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (70, N'1', N' WJJZZDBq', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (71, N'1', N' WJJZZDBS', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (72, N'1', N' WJJZZDBT', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (73, N'1', N' WJJZZDBU', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (74, N'1', N' WJJZZDBV', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (75, N'1', N' WJJZZDBVC', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (76, N'1', N' WJJZZDBW', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (77, N'1', N' WJJZZDBX', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (78, N'1', N' WJJZZDBZ', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (2, N'1', N'0.9MDB', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (3, N'1', N'0103050501', N'/img/productPhotos/3.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (4, N'1', N'0103050502', N'/img/productPhotos/8.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (5, N'1', N'1.2SND20', N'/img/productPhotos/4.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (6, N'1', N'1.5DBD25', N'/img/productPhotos/1.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (7, N'1', N'1.5SND20', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (8, N'1', N'12YDHTSZGZHGYB20', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (9, N'1', N'12YDZNSZGZHGYB20', N'/img/productPhotos/1.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (10, N'1', N'14YDHTSZGZHGYB20', N'/img/productPhotos/3.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (11, N'1', N'14YDZNSZGZHGYB20', N'/img/productPhotos/4.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (12, N'1', N'16YDHTSZGZHGYB20', N'/img/productPhotos/5.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (13, N'1', N'16YDZNSZGZHGYB20', N'/img/productPhotos/6.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (14, N'1', N'18YDHTSZGZHGYB20', N'/img/productPhotos/7.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (15, N'1', N'18YDZNSZGZHGYB20', N'/img/productPhotos/8.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (16, N'1', N'20YDHTSZGZHGYB20', N'/img/productPhotos/9.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (17, N'1', N'20YDZNSZGZHGYB20', N'/img/productPhotos/10.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (18, N'1', N'22YDHTSZGZHGYB20', N'/img/productPhotos/11.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (19, N'1', N'22YDZNSZGZHGYB20', N'/img/productPhotos/8.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (20, N'1', N'CL 1200JCC', N'/img/productPhotos/11.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (21, N'1', N'CL 1500JCC', N'/img/productPhotos/10.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (22, N'1', N'CL 1800JCC', N'/img/productPhotos/7.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (23, N'1', N'CL DXZ', N'/img/productPhotos/9.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (24, N'1', N'CL MGB', N'/img/productPhotos/8.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (25, N'1', N'CL1650 XT', N'/img/productPhotos/6.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (26, N'1', N'DWYZGXMLJSMYXB(ALFSXZXL)-DGNB', N'/img/productPhotos/5.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (27, N'1', N'DWYZGXMLJSMYXB(ALFSXZXL)-GTB', N'/img/productPhotos/6.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (28, N'1', N'DWYZGXMLJSMYXB(ALXXYXL)-DGNB', N'/img/productPhotos/7.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (29, N'1', N'DWYZGXMLJSMYXB(DTEZXTBBXL)-DGNB', N'/img/productPhotos/9.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (30, N'1', N'DWYZGXMLJSMYXB(DTEZXTBBXL)-GMB', N'/img/productPhotos/10.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (31, N'1', N'DWYZGXMLJSMYXB(DTEZXTBBXL)-GTB', N'/img/productPhotos/2.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (32, N'1', N'DWYZGXSMYXB(ALFSXZXL)-DGNB', N'/img/productPhotos/8.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (33, N'1', N'DWYZGXSMYXB(DTEZXTBBXL)-DGNB', N'/img/productPhotos/11.jpg')
INSERT [dbo].[ProductPhotos] ([Id], [SysNo], [ProductNo], [ProductPhotoUrl]) VALUES (34, N'1', N'DWYZGXSMYXB(DTEZXTBBXL)-GMB', N'/img/productPhotos/8.jpg')
SET IDENTITY_INSERT [dbo].[ProductPhotos] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (1, N'1', N' WJJZZDB', N' 五金架子做垫板', N'CLCP', N'处理产品', N'哈哈', N'sadsadas', N'搜索', N'得到', N'巩固', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (11, N'1', N' WJJZZDB1', N' 五金架子做垫板', N'CLCP', N'处理产品', N'ss', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (20, N'1', N' WJJZZDB10', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'', N'', N'', N'', N'sdfds', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (21, N'1', N' WJJZZDB11', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'', N'', N'', N'', N'', N'打发士大夫', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (22, N'1', N' WJJZZDB12', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'', N'', N'', N'', N'搜索', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (23, N'1', N' WJJZZDB13', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'', N'', N'搜索', N'', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (24, N'1', N' WJJZZDB14', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'', N'十三点', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (25, N'1', N' WJJZZDB15', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (26, N'1', N' WJJZZDB16', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'', N'', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (27, N'1', N' WJJZZDB17', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'', N'', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (28, N'1', N' WJJZZDB18', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'', N'', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (29, N'1', N' WJJZZDB19', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'', N'', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (12, N'1', N' WJJZZDB2', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'大苏打', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (30, N'1', N' WJJZZDB20', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'', N'', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (31, N'1', N' WJJZZDB21', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'', N'', N'', N'', N'', N'', N'烦烦烦', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (13, N'1', N' WJJZZDB3', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (14, N'1', N' WJJZZDB4', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'撒打算', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (15, N'1', N' WJJZZDB5', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'', N'', N'', N'大撒大撒', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (16, N'1', N' WJJZZDB6', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'', N'', N'', N'', N'', N'', N'大大', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (17, N'1', N' WJJZZDB7', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'', N'', N'', N'', N'', N'', N'的撒大', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (18, N'1', N' WJJZZDB8', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'', N'', N'', N'', N'', N'', N'发射点发射点', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (19, N'1', N' WJJZZDB9', N' 五金架子做垫板', N'CLCP', N'处理产品', N'', N'', N'', N'', N'', N'', N'大师傅但是', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (41, N'1', N' WJJZZDBB', N' 五金架子做垫板9', N'YM', N'移门', N'', N'', N'', N'', N'', N'sdfds', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (55, N'1', N' WJJZZDBBB', N' 五金架子做垫板18', N'ZSG', N'展示柜', N'', N'', N'', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (57, N'1', N' WJJZZDBBN', N' 五金架子做垫板20', N'ZSG', N'展示柜', N'', N'', N'', N'', N'', N'', N'', N'烦烦烦', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (34, N'1', N' WJJZZDBE', N' 五金架子做垫板3', N'YM', N'移门', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (35, N'1', N' WJJZZDBF', N' 五金架子做垫板4', N'YM', N'移门', N'', N'撒打算', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (40, N'1', N' WJJZZDBG', N' 五金架子做垫板8', N'YM', N'移门', N'', N'', N'', N'', N'', N'', N'大师傅但是', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (42, N'1', N' WJJZZDBH', N' 五金架子做垫板10', N'YM', N'移门', N'', N'', N'', N'', N'', N'', N'打发士大夫', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (47, N'1', N' WJJZZDBI', N' 五金架子做垫板15', N'YM', N'移门', N'', N'', N'', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (43, N'1', N' WJJZZDBJ', N' 五金架子做垫板11', N'YM', N'移门', N'', N'', N'', N'', N'', N'搜索', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (44, N'1', N' WJJZZDBK', N' 五金架子做垫板12', N'YM', N'移门', N'', N'', N'', N'搜索', N'', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (54, N'1', N' WJJZZDBM', N' 五金架子做垫板17', N'ZSG', N'展示柜', N'', N'', N'', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (53, N'1', N' WJJZZDBN', N' 五金架子做垫板16', N'ZSG', N'展示柜', N'', N'', N'', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (48, N'1', N' WJJZZDBO', N' 五金架子做垫板16', N'ZSG', N'展示柜', N'', N'', N'', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (32, N'1', N' WJJZZDBq', N' 五金架子做垫板1', N'YM', N'移门', N'ss', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (39, N'1', N' WJJZZDBS', N' 五金架子做垫板7', N'YM', N'移门', N'', N'', N'', N'', N'', N'', N'', N'发射点发射点', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (46, N'1', N' WJJZZDBT', N' 五金架子做垫板14', N'YM', N'移门', N'', N'', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (45, N'1', N' WJJZZDBU', N' 五金架子做垫板13', N'YM', N'移门', N'', N'', N'十三点', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (36, N'1', N' WJJZZDBV', N' 五金架子做垫板5', N'YM', N'移门', N'', N'', N'', N'', N'大撒大撒', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (56, N'1', N' WJJZZDBVC', N' 五金架子做垫板19', N'ZSG', N'展示柜', N'', N'', N'', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (33, N'1', N' WJJZZDBW', N' 五金架子做垫板2', N'YM', N'移门', N'', N'大苏打', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (37, N'1', N' WJJZZDBX', N' 五金架子做垫板6', N'YM', N'移门', N'', N'', N'', N'', N'', N'', N'', N'大大', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (38, N'1', N' WJJZZDBZ', N' 五金架子做垫板66', N'YM', N'移门', N'', N'', N'', N'', N'', N'', N'', N'的撒大', N'', N'', N'', N'', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (8, N'1', N'CL 1200JCC', N'处理 1200集成材', N'CLCP', N'处理产品', N'阿迪斯', N'处理', N'sd', N'大大', N'撒打算', N'顶顶顶', N'烦烦烦', N'啊啊啊', N'啊啊啊', N'fff', N'asda', N' ', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (10, N'1', N'CL 1500JCC', N'处理 1500集成材', N'CLCP', N'处理产品', N'阿迪斯', N'处理', N'sd', N'大大', N'撒打算', N'顶顶顶', N'烦烦烦', N'aaaa', N'ddd', N'fff', N'asda', N' ', N'23', N'张', N'', N'', N'BC', N'板材')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (67, N'2', N' WJBCDBB', N' 五金报表9', N'MGB', N'木工板', N'', N'', N'', N'', N'', N'sdfds', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (76, N'2', N' WJBCDBBB', N' 五金报表28', N'MB', N'面板', N'', N'', N'', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (78, N'2', N' WJBCDBBN', N' 五金报表20', N'MB', N'面板', N'', N'', N'', N'', N'', N'', N'', N'烦烦烦', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (60, N'2', N' WJBCDBE', N' 五金报表3', N'MGB', N'木工板', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (61, N'2', N' WJBCDBF', N' 五金报表4', N'MGB', N'木工板', N'', N'撒打算', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (66, N'2', N' WJBCDBG', N' 五金报表8', N'MGB', N'木工板', N'', N'', N'', N'', N'', N'', N'大师傅但是', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (68, N'2', N' WJBCDBH', N' 五金报表20', N'MGB', N'木工板', N'', N'', N'', N'', N'', N'', N'打发士大夫', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (73, N'2', N' WJBCDBI', N' 五金报表25', N'MGB', N'木工板', N'', N'', N'是顶顶顶', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (69, N'2', N' WJBCDBJ', N' 五金报表22', N'MGB', N'木工板', N'', N'', N'', N'', N'', N'搜索', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (70, N'2', N' WJBCDBK', N' 五金报表22', N'MGB', N'木工板', N'', N'', N'', N'搜索', N'', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (75, N'2', N' WJBCDBM', N' 五金报表27', N'MB', N'面板', N'', N'', N'', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (74, N'2', N' WJBCDBN', N' 五金报表26', N'MB', N'面板', N'', N'啊啊啊', N'', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (58, N'2', N' WJBCDBq', N' 五金报表2', N'MGB', N'木工板', N'ss', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (65, N'2', N' WJBCDBS', N' 五金报表7', N'MGB', N'木工板', N'', N'', N'', N'', N'', N'', N'', N'发射点发射点', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (72, N'2', N' WJBCDBT', N' 五金报表24', N'MGB', N'木工板', N'', N'', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (71, N'2', N' WJBCDBU', N' 五金报表23', N'MGB', N'木工板', N'', N'', N'十三点', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (62, N'2', N' WJBCDBV', N' 五金报表5', N'MGB', N'木工板', N'', N'', N'', N'', N'大撒大撒', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (77, N'2', N' WJBCDBVC', N' 五金报表29', N'MB', N'面板', N'', N'', N'', N'', N'', N'顶顶顶', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (59, N'2', N' WJBCDBW', N' 五金报表2', N'MGB', N'木工板', N'', N'大苏打', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (63, N'2', N' WJBCDBX', N' 五金报表6', N'MGB', N'木工板', N'', N'', N'', N'', N'', N'', N'', N'大大', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
INSERT [dbo].[Products] ([Id], [SysNo], [ProductNo], [ProductName], [TypeNo], [TypeName], [ProductPP], [ProductXH], [ProductCZ], [ProductHB], [ProductHD], [ProductGY], [ProductHS], [ProductMC], [ProductDJ], [ProductCD], [ProductGG], [ProductYS], [UnitNo], [UnitName], [ProductNote], [ProductBZGG], [BelongTypeNo], [BelongTypeName]) VALUES (64, N'2', N' WJBCDBZ', N' 五金报表66', N'MGB', N'木工板', N'', N'', N'', N'', N'', N'', N'', N'的撒大', N'', N'', N'', N'', N'23', N'张', N'', N'', N'WJ', N'五金')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSaleAreaDiffs] ON 

INSERT [dbo].[ProductSaleAreaDiffs] ([Id], [SysNo], [ProductNo], [StockNo], [AreaNo], [FirstAreaNo], [DiffPrice]) VALUES (1, N'442', N'DWY0.95NCSGB', N'GCZF', N'00', N'', 0.5)
SET IDENTITY_INSERT [dbo].[ProductSaleAreaDiffs] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSales] ON 

INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (92, N'1', N' WJBCDBB', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (93, N'1', N' WJBCDBBB', N'LSCK', 90)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (94, N'1', N' WJBCDBBN', N'LSCK', 100)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (95, N'1', N' WJBCDBE', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (96, N'1', N' WJBCDBF', N'LSCK', 20)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (97, N'1', N' WJBCDBG', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (98, N'1', N' WJBCDBH', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (99, N'1', N' WJBCDBI', N'LSCK', 50)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (100, N'1', N' WJBCDBJ', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (101, N'1', N' WJBCDBK', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (102, N'1', N' WJBCDBM', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (103, N'1', N' WJBCDBN', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (104, N'1', N' WJBCDBq', N'LSCK', 90)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (105, N'1', N' WJBCDBS', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (106, N'1', N' WJBCDBT', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (107, N'1', N' WJBCDBU', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (108, N'1', N' WJBCDBV', N'LSCK', 50)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (109, N'1', N' WJBCDBVC', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (110, N'1', N' WJBCDBW', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (111, N'1', N' WJBCDBX', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (112, N'1', N' WJBCDBZ', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (47, N'1', N' WJJZZDB', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (48, N'1', N' WJJZZDB1', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (49, N'1', N' WJJZZDB10', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (50, N'1', N' WJJZZDB11', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (51, N'1', N' WJJZZDB12', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (52, N'1', N' WJJZZDB13', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (53, N'1', N' WJJZZDB14', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (54, N'1', N' WJJZZDB15', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (55, N'1', N' WJJZZDB16', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (56, N'1', N' WJJZZDB17', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (57, N'1', N' WJJZZDB18', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (58, N'1', N' WJJZZDB19', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (59, N'1', N' WJJZZDB2', N'LSCK', 60)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (60, N'1', N' WJJZZDB20', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (61, N'1', N' WJJZZDB21', N'LSCK', 40)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (62, N'1', N' WJJZZDB3', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (63, N'1', N' WJJZZDB4', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (64, N'1', N' WJJZZDB5', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (65, N'1', N' WJJZZDB6', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (66, N'1', N' WJJZZDB7', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (67, N'1', N' WJJZZDB8', N'LSCK', 50)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (68, N'1', N' WJJZZDB9', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (69, N'1', N' WJJZZDBB', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (70, N'1', N' WJJZZDBBB', N'LSCK', 60)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (71, N'1', N' WJJZZDBBN', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (72, N'1', N' WJJZZDBE', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (73, N'1', N' WJJZZDBF', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (74, N'1', N' WJJZZDBG', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (75, N'1', N' WJJZZDBH', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (76, N'1', N' WJJZZDBI', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (77, N'1', N' WJJZZDBJ', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (78, N'1', N' WJJZZDBK', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (79, N'1', N' WJJZZDBM', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (80, N'1', N' WJJZZDBN', N'LSCK', 90)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (81, N'1', N' WJJZZDBO', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (82, N'1', N' WJJZZDBq', N'LSCK', 100)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (83, N'1', N' WJJZZDBS', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (84, N'1', N' WJJZZDBT', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (85, N'1', N' WJJZZDBU', N'LSCK', 100)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (86, N'1', N' WJJZZDBV', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (87, N'1', N' WJJZZDBVC', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (88, N'1', N' WJJZZDBW', N'LSCK', 220)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (89, N'1', N' WJJZZDBX', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (90, N'1', N' WJJZZDBZ', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (1, N'1', N'CL 1200JCC', N'LSCK', 80)
INSERT [dbo].[ProductSales] ([Id], [SysNo], [ProductNo], [StockNo], [SalePrice]) VALUES (91, N'1', N'CL 1500JCC', N'LSCK', 80)
SET IDENTITY_INSERT [dbo].[ProductSales] OFF
GO
SET IDENTITY_INSERT [dbo].[SaleOrderDetails] ON 

INSERT [dbo].[SaleOrderDetails] ([Id], [SaleOrderGuid], [SaleOrderNo], [ProductNo], [ProductName], [ProductPhotoUrl], [CustomerNo], [InputDate], [OrderNum], [BasePrice], [DiffPrice], [SalePrice]) VALUES (6, N'071a4f04-9cc2-4829-85e0-fc695b3c626f', N'7bf2dd35-a230-4c4a-8a93-044b5ed4245e', N' WJJZZDB17', N' 五金架子做垫板', N'/img/productPhotos/2.jpg', N'AHAQWYZ', CAST(N'2022-07-25T11:46:36.770' AS DateTime), 1, 80, 0, 80)
INSERT [dbo].[SaleOrderDetails] ([Id], [SaleOrderGuid], [SaleOrderNo], [ProductNo], [ProductName], [ProductPhotoUrl], [CustomerNo], [InputDate], [OrderNum], [BasePrice], [DiffPrice], [SalePrice]) VALUES (14, N'2689bb95-4dc3-4e29-809f-be61487f6452', N'1a2ccecd-a445-4b57-94f2-0e0e586bd728', N' WJJZZDB', N' 五金架子做垫板', N'/img/productPhotos/1.jpg', N'AHAQWYZ', CAST(N'2022-07-27T10:57:51.260' AS DateTime), 3, 80, 0, 80)
INSERT [dbo].[SaleOrderDetails] ([Id], [SaleOrderGuid], [SaleOrderNo], [ProductNo], [ProductName], [ProductPhotoUrl], [CustomerNo], [InputDate], [OrderNum], [BasePrice], [DiffPrice], [SalePrice]) VALUES (13, N'3dc5c81d-b98a-4779-9f92-dd6aa56a57ac', N'1a2ccecd-a445-4b57-94f2-0e0e586bd728', N' WJJZZDB17', N' 五金架子做垫板', N'/img/productPhotos/2.jpg', N'AHAQWYZ', CAST(N'2022-07-27T10:57:51.260' AS DateTime), 1, 80, 0, 80)
INSERT [dbo].[SaleOrderDetails] ([Id], [SaleOrderGuid], [SaleOrderNo], [ProductNo], [ProductName], [ProductPhotoUrl], [CustomerNo], [InputDate], [OrderNum], [BasePrice], [DiffPrice], [SalePrice]) VALUES (4, N'4ba6cd1b-dc43-4e52-a277-7983add3ce37', N'7bf2dd35-a230-4c4a-8a93-044b5ed4245e', N' WJJZZDB', N' 五金架子做垫板', N'/img/productPhotos/1.jpg', N'AHAQWYZ', CAST(N'2022-07-25T11:46:36.770' AS DateTime), 3, 80, 0, 80)
INSERT [dbo].[SaleOrderDetails] ([Id], [SaleOrderGuid], [SaleOrderNo], [ProductNo], [ProductName], [ProductPhotoUrl], [CustomerNo], [InputDate], [OrderNum], [BasePrice], [DiffPrice], [SalePrice]) VALUES (15, N'90c549f7-cf4f-47b8-abd6-2babb2006bbe', N'1a2ccecd-a445-4b57-94f2-0e0e586bd728', N' WJJZZDB5', N' 五金架子做垫板', N'/img/productPhotos/2.jpg', N'AHAQWYZ', CAST(N'2022-07-27T10:57:51.260' AS DateTime), 1, 80, 0, 80)
INSERT [dbo].[SaleOrderDetails] ([Id], [SaleOrderGuid], [SaleOrderNo], [ProductNo], [ProductName], [ProductPhotoUrl], [CustomerNo], [InputDate], [OrderNum], [BasePrice], [DiffPrice], [SalePrice]) VALUES (5, N'a6b27b34-63a5-46f1-82fb-75bc3e2b8a32', N'7bf2dd35-a230-4c4a-8a93-044b5ed4245e', N' WJJZZDB5', N' 五金架子做垫板', N'/img/productPhotos/2.jpg', N'AHAQWYZ', CAST(N'2022-07-25T11:46:36.770' AS DateTime), 1, 80, 0, 80)
INSERT [dbo].[SaleOrderDetails] ([Id], [SaleOrderGuid], [SaleOrderNo], [ProductNo], [ProductName], [ProductPhotoUrl], [CustomerNo], [InputDate], [OrderNum], [BasePrice], [DiffPrice], [SalePrice]) VALUES (3, N'bc23a26b-96f5-40db-8fbd-6ec6db988fa2', N'7bf2dd35-a230-4c4a-8a93-044b5ed4245e', N' WJJZZDB10', N' 五金架子做垫板', N'/img/productPhotos/2.jpg', N'AHAQWYZ', CAST(N'2022-07-25T11:46:36.770' AS DateTime), 1, 80, 0, 80)
INSERT [dbo].[SaleOrderDetails] ([Id], [SaleOrderGuid], [SaleOrderNo], [ProductNo], [ProductName], [ProductPhotoUrl], [CustomerNo], [InputDate], [OrderNum], [BasePrice], [DiffPrice], [SalePrice]) VALUES (16, N'f665eb36-e644-47af-919b-63118da9efd7', N'1a2ccecd-a445-4b57-94f2-0e0e586bd728', N' WJJZZDB10', N' 五金架子做垫板', N'/img/productPhotos/2.jpg', N'AHAQWYZ', CAST(N'2022-07-27T10:57:51.260' AS DateTime), 1, 80, 0, 80)
SET IDENTITY_INSERT [dbo].[SaleOrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[SaleOrderMasters] ON 

INSERT [dbo].[SaleOrderMasters] ([Id], [SaleOrderNo], [CustomerNo], [InvoiceNo], [InputDate], [StockNo], [EditUserNo], [DeliveryDate], [Remark]) VALUES (9, N'1a2ccecd-a445-4b57-94f2-0e0e586bd728', N'AHAQWYZ', N'安徽安庆哈哈哈', CAST(N'2022-07-27T10:57:51.260' AS DateTime), N'', N'AHAQWYZ', CAST(N'2022-07-27T10:57:51.260' AS DateTime), N'撒大大')
INSERT [dbo].[SaleOrderMasters] ([Id], [SaleOrderNo], [CustomerNo], [InvoiceNo], [InputDate], [StockNo], [EditUserNo], [DeliveryDate], [Remark]) VALUES (3, N'7bf2dd35-a230-4c4a-8a93-044b5ed4245e', N'AHAQWYZ', N'安徽安庆哈哈哈', CAST(N'2022-07-25T11:46:36.770' AS DateTime), N'', N'AHAQWYZ', CAST(N'2022-07-26T00:00:00.000' AS DateTime), N'撒大大')
SET IDENTITY_INSERT [dbo].[SaleOrderMasters] OFF
GO
SET IDENTITY_INSERT [dbo].[SaleOrderProgresses] ON 

INSERT [dbo].[SaleOrderProgresses] ([Id], [SaleOrderNo], [ProgressGuid], [StepSn], [StepName], [StepTime]) VALUES (4, N'1a2ccecd-a445-4b57-94f2-0e0e586bd728', N'e58ef687-c261-428b-8792-93790a7b118d', 1, N'下单', CAST(N'2022-07-27T10:57:51.260' AS DateTime))
INSERT [dbo].[SaleOrderProgresses] ([Id], [SaleOrderNo], [ProgressGuid], [StepSn], [StepName], [StepTime]) VALUES (3, N'7bf2dd35-a230-4c4a-8a93-044b5ed4245e', N'3bf73517-8bb7-4052-a16c-eb085dd75df1', 1, N'下单', CAST(N'2022-07-25T11:46:36.770' AS DateTime))
SET IDENTITY_INSERT [dbo].[SaleOrderProgresses] OFF
GO
SET IDENTITY_INSERT [dbo].[ShoppingCarts] ON 

INSERT [dbo].[ShoppingCarts] ([Id], [CartGuid], [CustomerNo], [ProductNo], [ProductNum], [CartSelected]) VALUES (1, N'00000000-0000-0000-0000-000000000000', N'AHAQWYZ', N' WJJZZDB3', 1, 1)
INSERT [dbo].[ShoppingCarts] ([Id], [CartGuid], [CustomerNo], [ProductNo], [ProductNum], [CartSelected]) VALUES (3, N'0e641910-db07-4a00-a122-bbe7224b1321', N'AHAQWYZ', N' WJJZZDBM', 1, 1)
INSERT [dbo].[ShoppingCarts] ([Id], [CartGuid], [CustomerNo], [ProductNo], [ProductNum], [CartSelected]) VALUES (6, N'11128bbf-7509-4a0d-a535-48a5755b8667', N'AHAQWYZ', N' WJJZZDB', 6, 1)
INSERT [dbo].[ShoppingCarts] ([Id], [CartGuid], [CustomerNo], [ProductNo], [ProductNum], [CartSelected]) VALUES (4, N'28475c29-9b3a-4964-bcd3-e7118803963e', N'AHAQWYZ', N' WJJZZDBX', 1, 1)
INSERT [dbo].[ShoppingCarts] ([Id], [CartGuid], [CustomerNo], [ProductNo], [ProductNum], [CartSelected]) VALUES (1002, N'3d2cfd62-9b6f-43a0-9da9-8463f84b2154', N'AHAQWYZ', N' WJJZZDB5', 1, 1)
INSERT [dbo].[ShoppingCarts] ([Id], [CartGuid], [CustomerNo], [ProductNo], [ProductNum], [CartSelected]) VALUES (5, N'6f7fe7c1-78e1-4cad-ae83-1caf5cad717f', N'AHAQWYZ', N' WJJZZDB11', 1, 1)
SET IDENTITY_INSERT [dbo].[ShoppingCarts] OFF
GO
SET IDENTITY_INSERT [dbo].[Stocks] ON 

INSERT [dbo].[Stocks] ([Id], [StockNo], [StockName], [StockLinkman], [StockTel], [StockPhone]) VALUES (1, N'CDCK', N'成都仓库', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Stocks] OFF
GO
USE [master]
GO
ALTER DATABASE [DealerPlatform] SET  READ_WRITE 
GO
