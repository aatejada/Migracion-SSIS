USE [master]
GO
/****** Object:  Database [NorthwindDW]    Script Date: 1/11/2022 15:38:27 ******/
CREATE DATABASE [NorthwindDW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NorthwindDW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NorthwindDW.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NorthwindDW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NorthwindDW_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NorthwindDW] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NorthwindDW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NorthwindDW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NorthwindDW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NorthwindDW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NorthwindDW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NorthwindDW] SET ARITHABORT OFF 
GO
ALTER DATABASE [NorthwindDW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NorthwindDW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NorthwindDW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NorthwindDW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NorthwindDW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NorthwindDW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NorthwindDW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NorthwindDW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NorthwindDW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NorthwindDW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NorthwindDW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NorthwindDW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NorthwindDW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NorthwindDW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NorthwindDW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NorthwindDW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NorthwindDW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NorthwindDW] SET RECOVERY FULL 
GO
ALTER DATABASE [NorthwindDW] SET  MULTI_USER 
GO
ALTER DATABASE [NorthwindDW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NorthwindDW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NorthwindDW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NorthwindDW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NorthwindDW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NorthwindDW] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'NorthwindDW', N'ON'
GO
ALTER DATABASE [NorthwindDW] SET QUERY_STORE = OFF
GO
USE [NorthwindDW]
GO
/****** Object:  Table [dbo].[Dim_Cliente]    Script Date: 1/11/2022 15:38:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Cliente](
	[CustomerID] [nchar](5) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[Region] [nvarchar](15) NULL,
	[City] [nvarchar](15) NULL,
	[Country] [nvarchar](15) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Empleado]    Script Date: 1/11/2022 15:38:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Empleado](
	[EmployeeID] [int] NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](10) NOT NULL,
	[Region] [nvarchar](15) NULL,
	[City] [nvarchar](15) NULL,
	[Country] [nvarchar](15) NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Producto]    Script Date: 1/11/2022 15:38:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Producto](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[Category] [nvarchar](100) NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Tiempo]    Script Date: 1/11/2022 15:38:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Tiempo](
	[Date] [datetime] NOT NULL,
	[DayName] [varchar](9) NULL,
	[WeekOfMonth] [int] NULL,
	[MonthName] [varchar](9) NULL,
	[Quarter] [int] NULL,
	[Year] [int] NULL,
 CONSTRAINT [PK_Tiempo] PRIMARY KEY CLUSTERED 
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Ordenes]    Script Date: 1/11/2022 15:38:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Ordenes](
	[OrderID] [int] NOT NULL,
	[OrderDate] [datetime] NULL,
	[ProductID] [int] NOT NULL,
	[CustomerID] [nchar](5) NULL,
	[EmployeeID] [int] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[ShipVia] [int] NULL,
	[Date] [datetime] NULL,
	[Quantity] [smallint] NOT NULL,
	[Discount] [real] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Freight] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsInOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
 CONSTRAINT [PK_Ordenes] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Fact_Ordenes]  WITH CHECK ADD  CONSTRAINT [FK_cliente] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Dim_Cliente] ([CustomerID])
GO
ALTER TABLE [dbo].[Fact_Ordenes] CHECK CONSTRAINT [FK_cliente]
GO
ALTER TABLE [dbo].[Fact_Ordenes]  WITH CHECK ADD  CONSTRAINT [FK_empleado] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Dim_Empleado] ([EmployeeID])
GO
ALTER TABLE [dbo].[Fact_Ordenes] CHECK CONSTRAINT [FK_empleado]
GO
ALTER TABLE [dbo].[Fact_Ordenes]  WITH CHECK ADD  CONSTRAINT [FK_producto] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Dim_Producto] ([ProductID])
GO
ALTER TABLE [dbo].[Fact_Ordenes] CHECK CONSTRAINT [FK_producto]
GO
ALTER TABLE [dbo].[Fact_Ordenes]  WITH CHECK ADD  CONSTRAINT [FK_tiempo] FOREIGN KEY([Date])
REFERENCES [dbo].[Dim_Tiempo] ([Date])
GO
ALTER TABLE [dbo].[Fact_Ordenes] CHECK CONSTRAINT [FK_tiempo]
GO
USE [master]
GO
ALTER DATABASE [NorthwindDW] SET  READ_WRITE 
GO
