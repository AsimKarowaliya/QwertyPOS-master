USE [master]
GO
/****** Object:  Database [POS_System]    Script Date: 4/23/2019 9:45:16 PM ******/
CREATE DATABASE [POS_System]
GO
ALTER DATABASE [POS_System] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [POS_System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [POS_System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [POS_System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [POS_System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [POS_System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [POS_System] SET ARITHABORT OFF 
GO
ALTER DATABASE [POS_System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [POS_System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [POS_System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [POS_System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [POS_System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [POS_System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [POS_System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [POS_System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [POS_System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [POS_System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [POS_System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [POS_System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [POS_System] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [POS_System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [POS_System] SET  MULTI_USER 
GO
ALTER DATABASE [POS_System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [POS_System] SET ENCRYPTION ON
GO
ALTER DATABASE [POS_System] SET QUERY_STORE = ON
GO
ALTER DATABASE [POS_System] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = ALL, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [POS_System]
GO
/****** Object:  User [Nick]    Script Date: 4/23/2019 9:45:18 PM ******/
CREATE USER [Nick] FOR LOGIN [Nick] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Melissa]    Script Date: 4/23/2019 9:45:18 PM ******/
CREATE USER [Melissa] FOR LOGIN [Melissa] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Andrew]    Script Date: 4/23/2019 9:45:18 PM ******/
CREATE USER [Andrew] FOR LOGIN [Andrew] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Nick]
GO
ALTER ROLE [db_owner] ADD MEMBER [Melissa]
GO
ALTER ROLE [db_owner] ADD MEMBER [Andrew]
GO
/****** Object:  Table [dbo].[ProductApproval]    Script Date: 4/23/2019 9:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductApproval](
	[Brand] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/23/2019 9:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_ID] [int] NOT NULL,
	[Brand] [varchar](20) NOT NULL,
	[ApprovalStatus] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[BrandApprovalView]    Script Date: 4/23/2019 9:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BrandApprovalView]
AS
SELECT
    Brand,
    'Approved' ApprovalStatus
FROM
    Product
UNION
SELECT
    Brand,
    'Pending Approval' ApprovalStatus
FROM
    ProductApproval;
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 4/23/2019 9:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Gender_ID] [int] IDENTITY(1,1) NOT NULL,
	[GenderName] [char](1) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Gender_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 4/23/2019 9:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Inventory_ID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK__Inventor__2B65F40BBBDCE3E0] PRIMARY KEY CLUSTERED 
(
	[Inventory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LowQuantityLog]    Script Date: 4/23/2019 9:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LowQuantityLog](
	[lowQuant_ID] [int] IDENTITY(1,1) NOT NULL,
	[NameModel] [varchar](20) NULL,
	[Quantity] [varchar](20) NULL,
	[Dates] [datetime] NULL,
 CONSTRAINT [PK_LowQuantityLog] PRIMARY KEY CLUSTERED 
(
	[lowQuant_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OutOfStockLog]    Script Date: 4/23/2019 9:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutOfStockLog](
	[outStock_ID] [int] IDENTITY(1,1) NOT NULL,
	[NameModel] [varchar](20) NULL,
	[Quantity] [varchar](70) NULL,
	[Dates] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Details]    Script Date: 4/23/2019 9:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Details](
	[Details_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NULL,
	[Gender_ID] [int] NULL,
	[Model] [varchar](20) NOT NULL,
	[Size] [int] NOT NULL,
	[Price] [numeric](18, 0) NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Product_Details] PRIMARY KEY CLUSTERED 
(
	[Details_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductAudit]    Script Date: 4/23/2019 9:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAudit](
	[Details_ID] [int] NULL,
	[Product_ID] [int] NULL,
	[Gender_ID] [int] NULL,
	[Model] [varchar](20) NULL,
	[Size] [int] NULL,
	[Price] [numeric](18, 0) NULL,
	[Audit_Action] [varchar](100) NULL,
	[Audit_Timestamp] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 4/23/2019 9:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Transactions_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NULL,
	[Sold] [varchar](20) NULL,
	[Price] [numeric](18, 0) NULL,
	[Dates] [date] NULL,
 CONSTRAINT [PK__Transact__6E23801FCA12FC74] PRIMARY KEY CLUSTERED 
(
	[Transactions_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/23/2019 9:45:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Number] [varchar](7) NULL,
	[FirstName] [varchar](10) NULL,
	[LastName] [varchar](10) NULL,
	[PhoneNumber] [varchar](10) NULL,
	[passsword] [varchar](8) NULL,
	[UserType] [nchar](10) NULL,
 CONSTRAINT [PK__Users__1788CCAC9EE27620] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ('Approved') FOR [ApprovalStatus]
GO
ALTER TABLE [dbo].[Product_Details]  WITH CHECK ADD  CONSTRAINT [FK_Gender_ID] FOREIGN KEY([Gender_ID])
REFERENCES [dbo].[Gender] ([Gender_ID])
GO
ALTER TABLE [dbo].[Product_Details] CHECK CONSTRAINT [FK_Gender_ID]
GO
ALTER TABLE [dbo].[Product_Details]  WITH CHECK ADD  CONSTRAINT [FK_ProductID] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Product_Details] CHECK CONSTRAINT [FK_ProductID]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK__Transacti__Produ__0D7A0286] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK__Transacti__Produ__0D7A0286]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [Payment_ID] FOREIGN KEY([Transactions_ID])
REFERENCES [dbo].[Transactions] ([Transactions_ID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [Payment_ID]
GO
/****** Object:  StoredProcedure [dbo].[procBindAllProducts]    Script Date: 4/23/2019 9:45:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procBindAllProducts]
	
AS
	SELECT Product_Details.Details_ID, Product.Brand, Product_Details.Model,Product_Details.Size, Gender.GenderName, Product_Details.Quantity, Product_Details.Price FROM Product_Details
	INNER JOIN Product ON Product.Product_ID = Product_Details.Product_ID
	INNER JOIN Gender ON  Product_Details.Gender_ID = Gender.Gender_ID
RETURN 0
GO
USE [master]
GO
ALTER DATABASE [POS_System] SET  READ_WRITE 
GO
