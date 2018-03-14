USE [master]
GO
/****** Object:  Database [OutdoorParadise]    Script Date: 14-3-2018 09:58:46 ******/
CREATE DATABASE [OutdoorParadise]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OutdoorParadise', FILENAME = N'C:\Users\joshu\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\mssqllocaldb\OutdoorParadise.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OutdoorParadise_log', FILENAME = N'C:\Users\joshu\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\mssqllocaldb\OutdoorParadise.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OutdoorParadise] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OutdoorParadise].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OutdoorParadise] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [OutdoorParadise] SET ANSI_NULLS ON 
GO
ALTER DATABASE [OutdoorParadise] SET ANSI_PADDING ON 
GO
ALTER DATABASE [OutdoorParadise] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [OutdoorParadise] SET ARITHABORT ON 
GO
ALTER DATABASE [OutdoorParadise] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OutdoorParadise] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OutdoorParadise] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OutdoorParadise] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OutdoorParadise] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [OutdoorParadise] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [OutdoorParadise] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OutdoorParadise] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [OutdoorParadise] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OutdoorParadise] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OutdoorParadise] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OutdoorParadise] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OutdoorParadise] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OutdoorParadise] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OutdoorParadise] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OutdoorParadise] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OutdoorParadise] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OutdoorParadise] SET RECOVERY FULL 
GO
ALTER DATABASE [OutdoorParadise] SET  MULTI_USER 
GO
ALTER DATABASE [OutdoorParadise] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OutdoorParadise] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OutdoorParadise] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OutdoorParadise] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OutdoorParadise] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OutdoorParadise] SET QUERY_STORE = OFF
GO
USE [OutdoorParadise]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [OutdoorParadise]
GO
/****** Object:  Table [dbo].[Acc_vac]    Script Date: 14-3-2018 09:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acc_vac](
	[Acc_Id] [int] NOT NULL,
	[Vac_Id] [int] NOT NULL,
 CONSTRAINT [PK_ACC_VAC] PRIMARY KEY CLUSTERED 
(
	[Acc_Id] ASC,
	[Vac_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accommodation]    Script Date: 14-3-2018 09:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accommodation](
	[Acc_Id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](255) NOT NULL,
	[Contact] [varchar](255) NULL,
	[Phone_Number] [varchar](20) NOT NULL,
	[Country_Code] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Acc_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bonus]    Script Date: 14-3-2018 09:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bonus](
	[Bonus_Date] [date] NOT NULL,
	[Bonus_Amo] [float] NOT NULL,
	[Emp_Id] [int] NOT NULL,
 CONSTRAINT [PK_BONUS] PRIMARY KEY CLUSTERED 
(
	[Emp_Id] ASC,
	[Bonus_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 14-3-2018 09:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[Booking_Id] [int] IDENTITY(1,1) NOT NULL,
	[Transport_To] [varchar](255) NULL,
	[Transport_From] [varchar](255) NULL,
	[Vac_Id] [int] NOT NULL,
	[Start_Date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Booking_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 14-3-2018 09:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[Branch_Code] [int] IDENTITY(1,1) NOT NULL,
	[Address1] [varchar](50) NOT NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](40) NULL,
	[Region] [varchar](50) NULL,
	[Postal_Zone] [varchar](10) NULL,
	[Dept_Id] [int] NOT NULL,
	[Country_Code] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Branch_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign]    Script Date: 14-3-2018 09:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign](
	[Pr_Number] [smallint] NOT NULL,
	[Product_Number] [int] NOT NULL,
	[Discount] [int] NOT NULL,
 CONSTRAINT [PK_CAMPAIGN] PRIMARY KEY CLUSTERED 
(
	[Pr_Number] ASC,
	[Product_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 14-3-2018 09:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Country_Code] [int] NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Language] [varchar](50) NOT NULL,
	[Minimum_Wage] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Country_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 14-3-2018 09:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](255) NULL,
	[Lname] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](40) NULL,
	[State] [varchar](255) NULL,
	[Zip] [varchar](6) NULL,
	[Phone] [varchar](20) NULL,
	[Company_Name] [varchar](255) NULL,
	[Type] [char](1) NOT NULL,
	[Discount] [float] NOT NULL,
	[Max_quantity_order] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 14-3-2018 09:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Dept_Id] [int] IDENTITY(1,1) NOT NULL,
	[Dept_Name] [varchar](255) NOT NULL,
	[Dept_Head_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Dept_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emp_Training]    Script Date: 14-3-2018 09:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emp_Training](
	[Emp_Id] [int] NOT NULL,
	[Training_Id] [int] NOT NULL,
	[date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Emp_Id] ASC,
	[Training_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 14-3-2018 09:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Emp_Id] [int] IDENTITY(1,1) NOT NULL,
	[Emp_FirstName] [varchar](20) NOT NULL,
	[Emp_LastName] [varchar](20) NOT NULL,
	[Street] [varchar](100) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](2) NULL,
	[Zip_Code] [varchar](10) NULL,
	[Phone] [varchar](20) NULL,
	[Status] [varchar](2) NULL,
	[Ss_Number] [varchar](10) NULL,
	[Start_Date] [datetime] NOT NULL,
	[Termination_Date] [datetime] NULL,
	[Birth_Date] [datetime] NOT NULL,
	[Bene_Health_Ins] [char](1) NULL,
	[Bene_Life_Ins] [char](1) NULL,
	[Bene_Day_Care] [char](1) NULL,
	[Sex] [char](1) NULL,
	[Salary] [float] NOT NULL,
	[Phone_Work] [varchar](20) NULL,
	[Extension] [varchar](6) NULL,
	[Fax] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Cv] [varchar](50) NULL,
	[Manager_Id] [int] NULL,
	[Branch_Code] [int] NOT NULL,
	[Pos_Numb] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Emp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Excursion]    Script Date: 14-3-2018 09:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Excursion](
	[Ex_Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NULL,
	[Price] [float] NULL,
	[Guide_Name] [varchar](50) NULL,
	[Guide_Phone] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Ex_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 14-3-2018 09:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Inventory_Year] [smallint] NOT NULL,
	[Inventory_Month] [tinyint] NOT NULL,
	[Product_Number] [int] NOT NULL,
	[Storage_Code] [int] NOT NULL,
	[Inventory_Count] [int] NOT NULL,
 CONSTRAINT [PK_INVENTORY] PRIMARY KEY CLUSTERED 
(
	[Inventory_Year] ASC,
	[Inventory_Month] ASC,
	[Product_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 14-3-2018 09:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_Id] [int] IDENTITY(1,1) NOT NULL,
	[Cust_Id] [int] NOT NULL,
	[Total_Quantity] [int] NOT NULL,
	[Retailer_Site_Code] [int] NOT NULL,
	[Emp_Id] [int] NOT NULL,
	[Sales_Branch_Code] [int] NOT NULL,
	[Order_Date] [datetime] NOT NULL,
	[Order_Method_Code] [int] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[Finance_Code] [int] NULL,
	[Region] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_finance]    Script Date: 14-3-2018 09:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_finance](
	[Finance_Code] [int] IDENTITY(1,1) NOT NULL,
	[Finance_Type] [varchar](10) NOT NULL,
	[Finance_Description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Finance_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Item]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Item](
	[Order_Id] [int] NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Ship_Date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Method]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Method](
	[Order_Method_Code] [int] IDENTITY(1,1) NOT NULL,
	[Order_Method_En] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_Method_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[Pos_Numb] [int] IDENTITY(1,1) NOT NULL,
	[Pos_Abbr] [varchar](20) NULL,
	[Pos_Title] [varchar](50) NULL,
	[Min_Salary] [float] NULL,
	[Max_Salary] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Pos_Numb] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pref_Appraisal]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pref_Appraisal](
	[Target_Code] [int] NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[Manager_Id] [int] NOT NULL,
	[Emp_Id] [int] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[Achievement] [varchar](20) NULL,
 CONSTRAINT [PK_PREF_APPRAISAL] PRIMARY KEY CLUSTERED 
(
	[Target_Code] ASC,
	[Manager_Id] ASC,
	[Emp_Id] ASC,
	[Timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_Number] [int] IDENTITY(1,1) NOT NULL,
	[Introduction_Date] [date] NOT NULL,
	[Product_Type_Id] [int] NOT NULL,
	[Production_Cost] [float] NOT NULL,
	[Margin] [float] NOT NULL,
	[Product_Image] [varchar](255) NOT NULL,
	[Product_Name] [varchar](255) NULL,
	[Product_Description] [varchar](255) NULL,
	[Product_Size] [varchar](20) NULL,
	[Product_Color] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Forecast]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Forecast](
	[Product_Number] [int] NOT NULL,
	[Year] [smallint] NOT NULL,
	[Month] [tinyint] NOT NULL,
	[Expected_Volume] [int] NULL,
 CONSTRAINT [PK_PRODUCT_FORECAST] PRIMARY KEY CLUSTERED 
(
	[Product_Number] ASC,
	[Year] ASC,
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Line]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Line](
	[Prod_Line_Code] [int] IDENTITY(1,1) NOT NULL,
	[Prod_Line_En] [varchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Prod_Line_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Type]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Type](
	[Product_Type_Code] [int] IDENTITY(1,1) NOT NULL,
	[Product_Line_Code] [int] NULL,
	[Product_Type_En] [varchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_Type_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[Pr_Number] [smallint] NOT NULL,
	[Date_Start] [datetime] NULL,
	[Date_End] [datetime] NULL,
	[Description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pr_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Retailer]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Retailer](
	[Retailer_Code] [int] IDENTITY(1,1) NOT NULL,
	[Company_Name] [varchar](255) NOT NULL,
	[Retailer_Type_Code] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Retailer_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Retailer_Site]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Retailer_Site](
	[Retailer_Site_Code] [int] IDENTITY(1,1) NOT NULL,
	[Retailer_Code] [int] NOT NULL,
	[Address1] [varchar](50) NOT NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](40) NULL,
	[Region] [varchar](50) NULL,
	[Postal_Zone] [varchar](10) NULL,
	[Country_Code] [int] NULL,
	[Active_Indicator] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Retailer_Site_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Retailer_Type]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Retailer_Type](
	[Retailer_Type_Code] [int] IDENTITY(1,1) NOT NULL,
	[Type_name_En] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Retailer_Type_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Return_Reason]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Return_Reason](
	[Return_Reason_Code] [int] IDENTITY(1,1) NOT NULL,
	[Return_Description_En] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Return_Reason_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Returned_Item]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Returned_Item](
	[Return_Code] [int] NOT NULL,
	[Return_Date] [datetime] NOT NULL,
	[Order_Detail_Code] [int] NOT NULL,
	[Return_Reason] [int] NOT NULL,
	[Return_Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Return_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales_Target]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Target](
	[Emp_Id] [int] NOT NULL,
	[Sales_Year] [smallint] NOT NULL,
	[Sales_Period] [int] NOT NULL,
	[Retailer_Name] [varchar](50) NOT NULL,
	[Product_Number] [int] NOT NULL,
	[Sales_Target] [float] NOT NULL,
	[Retailer_Code] [int] NOT NULL,
 CONSTRAINT [PK_SALES_TARGET] PRIMARY KEY CLUSTERED 
(
	[Emp_Id] ASC,
	[Sales_Year] ASC,
	[Sales_Period] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Storage]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Storage](
	[Storage_Code] [int] NOT NULL,
	[City] [varchar](50) NULL,
	[Country_Code] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Storage_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Target]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Target](
	[Target_Code] [int] NOT NULL,
	[Target_Description_En] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Target_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Training]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Training](
	[Training_Id] [int] IDENTITY(1,1) NOT NULL,
	[Course] [varchar](255) NOT NULL,
	[Pos_Numb] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Training_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Traveller]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Traveller](
	[Customer_Id] [int] NOT NULL,
	[Booking_Id] [int] NOT NULL,
	[Iban] [varchar](255) NULL,
	[Birth_Date] [date] NOT NULL,
	[Sex] [char](1) NOT NULL,
 CONSTRAINT [PK_TRAVELLER] PRIMARY KEY CLUSTERED 
(
	[Customer_Id] ASC,
	[Booking_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vac_Ex]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vac_Ex](
	[Vac_Id] [int] NOT NULL,
	[Ex_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Vac_Id] ASC,
	[Ex_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vacation]    Script Date: 14-3-2018 09:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacation](
	[Vac_Id] [int] IDENTITY(1,1) NOT NULL,
	[Price] [float] NOT NULL,
	[Transport] [varchar](255) NULL,
	[Duration] [int] NOT NULL,
	[Min_People] [int] NOT NULL,
	[Max_People] [int] NOT NULL,
	[Child_Proof] [bit] NOT NULL,
	[Product_Type_Code] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Vac_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT (getdate()) FOR [Start_Date]
GO
ALTER TABLE [dbo].[Excursion] ADD  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [Order_Date]
GO
ALTER TABLE [dbo].[Order_Item] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Acc_vac]  WITH CHECK ADD  CONSTRAINT [FK_ACC_VAC_ACC_ID] FOREIGN KEY([Acc_Id])
REFERENCES [dbo].[Accommodation] ([Acc_Id])
GO
ALTER TABLE [dbo].[Acc_vac] CHECK CONSTRAINT [FK_ACC_VAC_ACC_ID]
GO
ALTER TABLE [dbo].[Acc_vac]  WITH CHECK ADD  CONSTRAINT [FK_ACC_VAC_VAC_ID] FOREIGN KEY([Vac_Id])
REFERENCES [dbo].[Vacation] ([Vac_Id])
GO
ALTER TABLE [dbo].[Acc_vac] CHECK CONSTRAINT [FK_ACC_VAC_VAC_ID]
GO
ALTER TABLE [dbo].[Accommodation]  WITH CHECK ADD  CONSTRAINT [FK_ACCOMODATION_COUNTRY_CODE] FOREIGN KEY([Country_Code])
REFERENCES [dbo].[Country] ([Country_Code])
GO
ALTER TABLE [dbo].[Accommodation] CHECK CONSTRAINT [FK_ACCOMODATION_COUNTRY_CODE]
GO
ALTER TABLE [dbo].[Bonus]  WITH CHECK ADD  CONSTRAINT [FK_BONUS_EMP_ID] FOREIGN KEY([Emp_Id])
REFERENCES [dbo].[Employee] ([Emp_Id])
GO
ALTER TABLE [dbo].[Bonus] CHECK CONSTRAINT [FK_BONUS_EMP_ID]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_BOOKING_VAC_ID] FOREIGN KEY([Vac_Id])
REFERENCES [dbo].[Vacation] ([Vac_Id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_BOOKING_VAC_ID]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_COUNTRY_CODE] FOREIGN KEY([Country_Code])
REFERENCES [dbo].[Country] ([Country_Code])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_COUNTRY_CODE]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_DEPT_ID] FOREIGN KEY([Dept_Id])
REFERENCES [dbo].[Department] ([Dept_Id])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_DEPT_ID]
GO
ALTER TABLE [dbo].[Campaign]  WITH CHECK ADD  CONSTRAINT [FK_CAMPAIGN_PRODUCT_NUMBER] FOREIGN KEY([Product_Number])
REFERENCES [dbo].[Product] ([Product_Number])
GO
ALTER TABLE [dbo].[Campaign] CHECK CONSTRAINT [FK_CAMPAIGN_PRODUCT_NUMBER]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_DEPARTMENT_HEAD_ID] FOREIGN KEY([Dept_Head_Id])
REFERENCES [dbo].[Employee] ([Emp_Id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_DEPARTMENT_HEAD_ID]
GO
ALTER TABLE [dbo].[Emp_Training]  WITH CHECK ADD  CONSTRAINT [FK_EMP_TRAINING_EMP_ID] FOREIGN KEY([Emp_Id])
REFERENCES [dbo].[Employee] ([Emp_Id])
GO
ALTER TABLE [dbo].[Emp_Training] CHECK CONSTRAINT [FK_EMP_TRAINING_EMP_ID]
GO
ALTER TABLE [dbo].[Emp_Training]  WITH CHECK ADD  CONSTRAINT [FK_EMP_TRAINING_TRAINING_ID] FOREIGN KEY([Training_Id])
REFERENCES [dbo].[Training] ([Training_Id])
GO
ALTER TABLE [dbo].[Emp_Training] CHECK CONSTRAINT [FK_EMP_TRAINING_TRAINING_ID]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_EMPLOYEE_BRANCH_CODE] FOREIGN KEY([Branch_Code])
REFERENCES [dbo].[Branch] ([Branch_Code])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_EMPLOYEE_BRANCH_CODE]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_EMPLOYEE_MANAGER_ID] FOREIGN KEY([Manager_Id])
REFERENCES [dbo].[Employee] ([Emp_Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_EMPLOYEE_MANAGER_ID]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_EMPLOYEE_POS_NUMB] FOREIGN KEY([Pos_Numb])
REFERENCES [dbo].[Position] ([Pos_Numb])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_EMPLOYEE_POS_NUMB]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_INVENTORY_PRODUCT] FOREIGN KEY([Product_Number])
REFERENCES [dbo].[Product] ([Product_Number])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_INVENTORY_PRODUCT]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_INVENTORY_STORAGE_CODE] FOREIGN KEY([Storage_Code])
REFERENCES [dbo].[Storage] ([Storage_Code])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_INVENTORY_STORAGE_CODE]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_CUST_ID] FOREIGN KEY([Cust_Id])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_ORDER_CUST_ID]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_EMP_ID] FOREIGN KEY([Emp_Id])
REFERENCES [dbo].[Employee] ([Emp_Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_ORDER_EMP_ID]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_FINANCE_CODE] FOREIGN KEY([Finance_Code])
REFERENCES [dbo].[Order_finance] ([Finance_Code])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_ORDER_FINANCE_CODE]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_METHOD_CODE] FOREIGN KEY([Order_Method_Code])
REFERENCES [dbo].[Order_Method] ([Order_Method_Code])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_ORDER_METHOD_CODE]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_RETAILER_SITE_CODE] FOREIGN KEY([Retailer_Site_Code])
REFERENCES [dbo].[Retailer_Site] ([Retailer_Site_Code])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_ORDER_RETAILER_SITE_CODE]
GO
ALTER TABLE [dbo].[Order_Item]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_ITEM] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Order] ([Order_Id])
GO
ALTER TABLE [dbo].[Order_Item] CHECK CONSTRAINT [FK_ORDER_ITEM]
GO
ALTER TABLE [dbo].[Order_Item]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_ID] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Product] ([Product_Number])
GO
ALTER TABLE [dbo].[Order_Item] CHECK CONSTRAINT [FK_PRODUCT_ID]
GO
ALTER TABLE [dbo].[Pref_Appraisal]  WITH CHECK ADD  CONSTRAINT [FK_PREF_APPRAISAL_EMP_ID] FOREIGN KEY([Emp_Id])
REFERENCES [dbo].[Employee] ([Emp_Id])
GO
ALTER TABLE [dbo].[Pref_Appraisal] CHECK CONSTRAINT [FK_PREF_APPRAISAL_EMP_ID]
GO
ALTER TABLE [dbo].[Pref_Appraisal]  WITH CHECK ADD  CONSTRAINT [FK_PREF_APPRAISAL_MANAGER_ID] FOREIGN KEY([Manager_Id])
REFERENCES [dbo].[Employee] ([Emp_Id])
GO
ALTER TABLE [dbo].[Pref_Appraisal] CHECK CONSTRAINT [FK_PREF_APPRAISAL_MANAGER_ID]
GO
ALTER TABLE [dbo].[Pref_Appraisal]  WITH CHECK ADD  CONSTRAINT [FK_PREF_APPRAISAL_TARGET_CODE] FOREIGN KEY([Target_Code])
REFERENCES [dbo].[Target] ([Target_Code])
GO
ALTER TABLE [dbo].[Pref_Appraisal] CHECK CONSTRAINT [FK_PREF_APPRAISAL_TARGET_CODE]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_PRODUCT_TYPE_ID] FOREIGN KEY([Product_Type_Id])
REFERENCES [dbo].[Product_Type] ([Product_Type_Code])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_PRODUCT_PRODUCT_TYPE_ID]
GO
ALTER TABLE [dbo].[Product_Forecast]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_FORECAST_PRODUCT_NUMBER] FOREIGN KEY([Product_Number])
REFERENCES [dbo].[Product] ([Product_Number])
GO
ALTER TABLE [dbo].[Product_Forecast] CHECK CONSTRAINT [FK_PRODUCT_FORECAST_PRODUCT_NUMBER]
GO
ALTER TABLE [dbo].[Product_Type]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_TYPE_PRODUCT_LINE_CODE] FOREIGN KEY([Product_Line_Code])
REFERENCES [dbo].[Product_Line] ([Prod_Line_Code])
GO
ALTER TABLE [dbo].[Product_Type] CHECK CONSTRAINT [FK_PRODUCT_TYPE_PRODUCT_LINE_CODE]
GO
ALTER TABLE [dbo].[Retailer]  WITH CHECK ADD  CONSTRAINT [FK_RETAILER_RETAILER_TYPE_CODE] FOREIGN KEY([Retailer_Type_Code])
REFERENCES [dbo].[Retailer_Type] ([Retailer_Type_Code])
GO
ALTER TABLE [dbo].[Retailer] CHECK CONSTRAINT [FK_RETAILER_RETAILER_TYPE_CODE]
GO
ALTER TABLE [dbo].[Retailer_Site]  WITH CHECK ADD  CONSTRAINT [FK_RETAILER_SITE_COUNTRY_CODE] FOREIGN KEY([Country_Code])
REFERENCES [dbo].[Country] ([Country_Code])
GO
ALTER TABLE [dbo].[Retailer_Site] CHECK CONSTRAINT [FK_RETAILER_SITE_COUNTRY_CODE]
GO
ALTER TABLE [dbo].[Retailer_Site]  WITH CHECK ADD  CONSTRAINT [FK_RETAILER_SITE_RETAILER_CODE] FOREIGN KEY([Retailer_Code])
REFERENCES [dbo].[Retailer] ([Retailer_Code])
GO
ALTER TABLE [dbo].[Retailer_Site] CHECK CONSTRAINT [FK_RETAILER_SITE_RETAILER_CODE]
GO
ALTER TABLE [dbo].[Returned_Item]  WITH CHECK ADD  CONSTRAINT [FK_RETURNED_ITEM_ORDER_DETAIL_CODE] FOREIGN KEY([Order_Detail_Code])
REFERENCES [dbo].[Order_Item] ([Order_Id])
GO
ALTER TABLE [dbo].[Returned_Item] CHECK CONSTRAINT [FK_RETURNED_ITEM_ORDER_DETAIL_CODE]
GO
ALTER TABLE [dbo].[Returned_Item]  WITH CHECK ADD  CONSTRAINT [FK_RETURNED_ITEM_RETURN_REASON] FOREIGN KEY([Return_Reason])
REFERENCES [dbo].[Return_Reason] ([Return_Reason_Code])
GO
ALTER TABLE [dbo].[Returned_Item] CHECK CONSTRAINT [FK_RETURNED_ITEM_RETURN_REASON]
GO
ALTER TABLE [dbo].[Sales_Target]  WITH CHECK ADD  CONSTRAINT [FK_SALES_TARGET_EMP_ID] FOREIGN KEY([Emp_Id])
REFERENCES [dbo].[Employee] ([Emp_Id])
GO
ALTER TABLE [dbo].[Sales_Target] CHECK CONSTRAINT [FK_SALES_TARGET_EMP_ID]
GO
ALTER TABLE [dbo].[Sales_Target]  WITH CHECK ADD  CONSTRAINT [FK_SALES_TARGET_PRODUCT_NUMBER] FOREIGN KEY([Product_Number])
REFERENCES [dbo].[Product] ([Product_Number])
GO
ALTER TABLE [dbo].[Sales_Target] CHECK CONSTRAINT [FK_SALES_TARGET_PRODUCT_NUMBER]
GO
ALTER TABLE [dbo].[Sales_Target]  WITH CHECK ADD  CONSTRAINT [FK_SALES_TARGET_RETAILER_CODE] FOREIGN KEY([Retailer_Code])
REFERENCES [dbo].[Retailer] ([Retailer_Code])
GO
ALTER TABLE [dbo].[Sales_Target] CHECK CONSTRAINT [FK_SALES_TARGET_RETAILER_CODE]
GO
ALTER TABLE [dbo].[Storage]  WITH CHECK ADD  CONSTRAINT [FK_COUNTRY_CODE] FOREIGN KEY([Country_Code])
REFERENCES [dbo].[Country] ([Country_Code])
GO
ALTER TABLE [dbo].[Storage] CHECK CONSTRAINT [FK_COUNTRY_CODE]
GO
ALTER TABLE [dbo].[Storage]  WITH CHECK ADD  CONSTRAINT [FK_STORAGE_COUNTRY_CODE] FOREIGN KEY([Country_Code])
REFERENCES [dbo].[Country] ([Country_Code])
GO
ALTER TABLE [dbo].[Storage] CHECK CONSTRAINT [FK_STORAGE_COUNTRY_CODE]
GO
ALTER TABLE [dbo].[Training]  WITH CHECK ADD  CONSTRAINT [FK_TRAINING_POS_NUMB] FOREIGN KEY([Pos_Numb])
REFERENCES [dbo].[Position] ([Pos_Numb])
GO
ALTER TABLE [dbo].[Training] CHECK CONSTRAINT [FK_TRAINING_POS_NUMB]
GO
ALTER TABLE [dbo].[Traveller]  WITH CHECK ADD  CONSTRAINT [FK_TRAVELLER_BOOKING_ID] FOREIGN KEY([Booking_Id])
REFERENCES [dbo].[Booking] ([Booking_Id])
GO
ALTER TABLE [dbo].[Traveller] CHECK CONSTRAINT [FK_TRAVELLER_BOOKING_ID]
GO
ALTER TABLE [dbo].[Traveller]  WITH CHECK ADD  CONSTRAINT [FK_TRAVELLER_CUSTOMER_ID] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Traveller] CHECK CONSTRAINT [FK_TRAVELLER_CUSTOMER_ID]
GO
ALTER TABLE [dbo].[Vac_Ex]  WITH CHECK ADD  CONSTRAINT [FK_VAC_EX_VAC_ID] FOREIGN KEY([Vac_Id])
REFERENCES [dbo].[Vacation] ([Vac_Id])
GO
ALTER TABLE [dbo].[Vac_Ex] CHECK CONSTRAINT [FK_VAC_EX_VAC_ID]
GO
ALTER TABLE [dbo].[Vacation]  WITH CHECK ADD  CONSTRAINT [FK_VACATION_PROD_TYPE_CODE] FOREIGN KEY([Product_Type_Code])
REFERENCES [dbo].[Product_Type] ([Product_Type_Code])
GO
ALTER TABLE [dbo].[Vacation] CHECK CONSTRAINT [FK_VACATION_PROD_TYPE_CODE]
GO
ALTER TABLE [dbo].[Bonus]  WITH CHECK ADD  CONSTRAINT [BONUS_BONUS_AMO] CHECK  (([Bonus_Amo]>=(0)))
GO
ALTER TABLE [dbo].[Bonus] CHECK CONSTRAINT [BONUS_BONUS_AMO]
GO
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [COUNTRY_MINIMUM_WAGE] CHECK  (([Minimum_Wage]>(0)))
GO
ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [COUNTRY_MINIMUM_WAGE]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [CUSTOMER_DISCOUNT_CONSTRAINT] CHECK  (([Discount]>=(0) AND [Discount]<=(8)))
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [CUSTOMER_DISCOUNT_CONSTRAINT]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [CUSTOMER_TYPE_CONSTRAINT] CHECK  (([Type]='S' OR [Type]='B'))
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [CUSTOMER_TYPE_CONSTRAINT]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [CUSTOMER_TYPE_MAX_QUANTITY_ORDER_CONSTRAINT] CHECK  (([Type]='B' AND [Max_quantity_order] IS NULL AND [Discount]>=(0) OR [Type]='S' AND [Discount]=(0) AND [Max_quantity_order]>(0)))
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [CUSTOMER_TYPE_MAX_QUANTITY_ORDER_CONSTRAINT]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [EMPLOYEE_BIRTH_DATE_CONSTRAINT] CHECK  (([Birth_Date]<[Start_Date]))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [EMPLOYEE_BIRTH_DATE_CONSTRAINT]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [EMPLOYEE_SALARY_CONSTRAINT] CHECK  (([Salary]>(0)))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [EMPLOYEE_SALARY_CONSTRAINT]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [EMPLOYEE_SEX_CONSTRAINT] CHECK  (([Sex]='M' OR [Sex]='F' OR [SEX] IS NULL))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [EMPLOYEE_SEX_CONSTRAINT]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [EMPLOYEE_TERMINATION_DATE_CONSTRAINT] CHECK  (([Termination_Date] IS NULL OR [Termination_Date]>[Start_Date]))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [EMPLOYEE_TERMINATION_DATE_CONSTRAINT]
GO
ALTER TABLE [dbo].[Excursion]  WITH CHECK ADD  CONSTRAINT [EXCURSION_PRICE_CONSTRAINT] CHECK  (([Price]>(0)))
GO
ALTER TABLE [dbo].[Excursion] CHECK CONSTRAINT [EXCURSION_PRICE_CONSTRAINT]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [ORDER_ORDER_DATE_CONSTRAINT] CHECK  (([Order_Date]>=getdate()))
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [ORDER_ORDER_DATE_CONSTRAINT]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [ORDER_STATUS_CONSTRAINT] CHECK  (([Status]='ongoing' OR [Status]='done'))
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [ORDER_STATUS_CONSTRAINT]
GO
ALTER TABLE [dbo].[Order_finance]  WITH CHECK ADD CHECK  (([finance_type]='Revenue' OR [finance_type]='Expense'))
GO
ALTER TABLE [dbo].[Order_Item]  WITH CHECK ADD  CONSTRAINT [ORDER_ITEM_QUANTITY_CONSTRAINT] CHECK  (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[Order_Item] CHECK CONSTRAINT [ORDER_ITEM_QUANTITY_CONSTRAINT]
GO
ALTER TABLE [dbo].[Pref_Appraisal]  WITH CHECK ADD CHECK  (([Achievement]='achieved' OR [Achievement]='failed'))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [PRODUCT_MARGIN] CHECK  (([Margin]>=(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [PRODUCT_MARGIN]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [PRODUCT_PRODUCT_SIZE_CONSTRAINT] CHECK  (([Product_Size]='x-small' OR [Product_Size]='small' OR [Product_Size]='medium' OR [Product_Size]='large' OR [Product_Size]='x-large' OR [Product_Size]='xx-large' OR [Product_Size]='xxx-large'))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [PRODUCT_PRODUCT_SIZE_CONSTRAINT]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [PRODUCT_PRODUCTION_COST] CHECK  (([Production_cost]>=(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [PRODUCT_PRODUCTION_COST]
GO
ALTER TABLE [dbo].[Product_Forecast]  WITH CHECK ADD  CONSTRAINT [FORECAST_EXPECTED_VOLUME_CONSTRAINT] CHECK  (([Expected_Volume] IS NULL OR [Expected_Volume]>(0)))
GO
ALTER TABLE [dbo].[Product_Forecast] CHECK CONSTRAINT [FORECAST_EXPECTED_VOLUME_CONSTRAINT]
GO
ALTER TABLE [dbo].[Sales_Target]  WITH CHECK ADD  CONSTRAINT [SALES_TARGET_SALES_TARGET] CHECK  (([Sales_Target]>(0)))
GO
ALTER TABLE [dbo].[Sales_Target] CHECK CONSTRAINT [SALES_TARGET_SALES_TARGET]
GO
ALTER TABLE [dbo].[Vacation]  WITH CHECK ADD  CONSTRAINT [VACATION_DURATION_CONSTRAINT] CHECK  (([DURATION]>(0)))
GO
ALTER TABLE [dbo].[Vacation] CHECK CONSTRAINT [VACATION_DURATION_CONSTRAINT]
GO
ALTER TABLE [dbo].[Vacation]  WITH CHECK ADD  CONSTRAINT [VACATION_PRICE_CONSTRAINT] CHECK  (([Price]>(0)))
GO
ALTER TABLE [dbo].[Vacation] CHECK CONSTRAINT [VACATION_PRICE_CONSTRAINT]
GO
/****** Object:  StoredProcedure [dbo].[getProductSellPrice]    Script Date: 14-3-2018 09:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getProductSellPrice] 
	-- Add the parameters for the stored procedure here
	@product_number INT, --input parameter
	@sellprice FLOAT OUT        -- Out parameter declared with the help of OUT keyword
AS
BEGIN
	SELECT @sellprice=(production_cost + margin) FROM Product WHERE product_number=@product_number
END
GO
USE [master]
GO
ALTER DATABASE [OutdoorParadise] SET  READ_WRITE 
GO
