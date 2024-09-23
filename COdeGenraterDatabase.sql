USE [master]
GO
/****** Object:  Database [IBPTSmartOMS]    Script Date: 12-07-2024 2.56.49 PM ******/
CREATE DATABASE [IBPTSmartOMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IBPTSmartOMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\IBPTSmartOMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IBPTSmartOMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\IBPTSmartOMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [IBPTSmartOMS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IBPTSmartOMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IBPTSmartOMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IBPTSmartOMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IBPTSmartOMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IBPTSmartOMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IBPTSmartOMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [IBPTSmartOMS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [IBPTSmartOMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IBPTSmartOMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IBPTSmartOMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IBPTSmartOMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IBPTSmartOMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IBPTSmartOMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IBPTSmartOMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IBPTSmartOMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IBPTSmartOMS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [IBPTSmartOMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IBPTSmartOMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IBPTSmartOMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IBPTSmartOMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IBPTSmartOMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IBPTSmartOMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IBPTSmartOMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IBPTSmartOMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IBPTSmartOMS] SET  MULTI_USER 
GO
ALTER DATABASE [IBPTSmartOMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IBPTSmartOMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IBPTSmartOMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IBPTSmartOMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IBPTSmartOMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IBPTSmartOMS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [IBPTSmartOMS] SET QUERY_STORE = ON
GO
ALTER DATABASE [IBPTSmartOMS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [IBPTSmartOMS]
GO
/****** Object:  User [tanzeem]    Script Date: 12-07-2024 2.56.49 PM ******/
CREATE USER [tanzeem] FOR LOGIN [tanzeem] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[GDMstBanks]    Script Date: 12-07-2024 2.56.49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDMstBanks](
	[BankId] [int] IDENTITY(1,1) NOT NULL,
	[BankName] [varchar](150) NULL,
	[Status] [char](8) NOT NULL,
	[TransDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_GDMstBanks] PRIMARY KEY CLUSTERED 
(
	[BankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GDMstCity]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDMstCity](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CountryCode] [int] NULL,
	[StateId] [int] NULL,
	[CityName] [varchar](50) NULL,
	[Status] [char](8) NOT NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_GDMstCity] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GDMstCountry]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDMstCountry](
	[CountryCode] [int] NOT NULL,
	[CountryName] [varchar](150) NOT NULL,
	[ALPHA2] [varchar](5) NULL,
	[ALPHA3] [varchar](5) NULL,
	[ISO3166] [varchar](10) NULL,
	[CountryRegionCode] [smallint] NULL,
	[CountryRegion] [varchar](50) NULL,
	[CountrySubRegCode] [smallint] NULL,
	[CountrySubReg] [varchar](50) NULL,
	[IntlDealing] [varchar](20) NULL,
	[Status] [char](8) NOT NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_GDMstCountry] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GDMstEmailConfig]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDMstEmailConfig](
	[vEmailType] [tinyint] IDENTITY(1,1) NOT NULL,
	[vEmailName] [varchar](50) NULL,
	[vEmailId] [varchar](50) NULL,
	[vSMTP] [varchar](50) NULL,
	[vPort] [int] NULL,
	[vPassword] [varchar](50) NULL,
	[vHTMLTemplate] [varchar](max) NULL,
	[vSubject] [varchar](150) NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_MstEmailConfig] PRIMARY KEY CLUSTERED 
(
	[vEmailType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GDMstOrgType]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDMstOrgType](
	[OrgTypeId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationType] [varchar](100) NOT NULL,
	[Status] [char](8) NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_MstOrgType] PRIMARY KEY CLUSTERED 
(
	[OrgTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GDMstState]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDMstState](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateCode] [varchar](3) NOT NULL,
	[CountryCode] [int] NOT NULL,
	[StateType] [varchar](10) NOT NULL,
	[StateName] [varchar](50) NOT NULL,
	[StateCapital] [varchar](50) NOT NULL,
	[StateAbbr] [varchar](10) NOT NULL,
	[Status] [char](8) NOT NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_GDMstState] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GDMstSubscType]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDMstSubscType](
	[SubID] [int] IDENTITY(1,1) NOT NULL,
	[SubsCName] [varchar](50) NULL,
	[Status] [char](8) NOT NULL,
	[TransDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_MstSubscType] PRIMARY KEY CLUSTERED 
(
	[SubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GDMstUnit]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDMstUnit](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[UnitCode] [int] NOT NULL,
	[UnitName] [varchar](50) NOT NULL,
	[UnitDesc] [varchar](50) NOT NULL,
	[Status] [char](8) NOT NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_GDMstUnit] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GDMstUserType]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDMstUserType](
	[UserTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [varchar](50) NULL,
	[Status] [char](8) NOT NULL,
	[TransDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_MstUserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GDMstValidation]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDMstValidation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ValidationType] [varchar](50) NULL,
	[ControlType] [varchar](50) NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_GDMstValidation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MstCategory]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstCategory](
	[CatId] [int] IDENTITY(1,1) NOT NULL,
	[OrgCode] [int] NULL,
	[CatCode] [varchar](50) NULL,
	[CatName] [varchar](50) NULL,
	[CatImg] [varchar](50) NULL,
	[Status] [char](8) NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_MstCategory] PRIMARY KEY CLUSTERED 
(
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MstCustomer]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstCustomer](
	[CustID] [int] IDENTITY(1,1) NOT NULL,
	[OrgCode] [int] NULL,
	[CustCode] [varchar](10) NULL,
	[Name] [varchar](100) NULL,
	[Address1] [varchar](max) NULL,
	[Address2] [varchar](max) NULL,
	[Phone] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[PAN] [varchar](10) NULL,
	[GST] [varchar](50) NULL,
	[Image] [varchar](100) NULL,
	[TermPay] [varchar](50) NULL,
	[TermDelivery] [varchar](50) NULL,
	[Remarks] [varchar](100) NULL,
	[Status] [char](8) NULL,
	[TransDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_MstCustomer] PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MstOrgAccess]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstOrgAccess](
	[AccessID] [int] IDENTITY(1,1) NOT NULL,
	[OrgCode] [int] NULL,
	[ModStudentPrt] [bit] NULL,
	[ModParentPrt] [bit] NULL,
	[ModStaffPrt] [bit] NULL,
	[ModAlumniPrt] [bit] NULL,
	[Status] [char](8) NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_MstAccess] PRIMARY KEY CLUSTERED 
(
	[AccessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MstOrganization]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstOrganization](
	[OrgID] [int] IDENTITY(1,1) NOT NULL,
	[OrgCode] [int] NOT NULL,
	[OrgType] [varchar](50) NULL,
	[OrgName] [varchar](100) NULL,
	[ContactPerson] [varchar](50) NULL,
	[EstYear] [int] NULL,
	[MultiBranch] [varchar](50) NULL,
	[AffiliatedTo] [varchar](150) NULL,
	[AffiliationNo] [varchar](50) NULL,
	[SchoolMoto] [varchar](250) NULL,
	[RegistrationNo] [varchar](50) NULL,
	[BoardUniversity] [varchar](50) NULL,
	[Web] [varchar](max) NULL,
	[Logo] [varchar](max) NULL,
	[Address1] [varchar](150) NULL,
	[Address2] [varchar](150) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[PinNo] [int] NULL,
	[Phone] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[PANNo] [varchar](15) NULL,
	[GSTINNo] [varchar](50) NULL,
	[BankAccount] [varchar](50) NULL,
	[BankCode] [varchar](10) NULL,
	[BankBranch] [varchar](50) NULL,
	[BankIFSC] [varchar](50) NULL,
	[SubsType] [varchar](50) NULL,
	[SubsFrom] [date] NULL,
	[SubsTo] [date] NULL,
	[AdminEmail] [varchar](50) NULL,
	[AdminPwd] [varchar](50) NULL,
	[PwdChangeDate] [datetime] NULL,
	[WebAdminEmail] [varchar](50) NULL,
	[WebAdminPwd] [varchar](50) NULL,
	[WebPwdChangeDate] [datetime] NULL,
	[AdminResetPasswordToken] [varchar](max) NULL,
	[WebAdminResetPasswordToken] [varchar](max) NULL,
	[WAMsgVisit] [varchar](max) NULL,
	[WAMsgBusiness] [varchar](max) NULL,
	[Status] [char](8) NULL,
	[TransDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_MstOrganization] PRIMARY KEY CLUSTERED 
(
	[OrgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MstOrgLicense]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstOrgLicense](
	[LicenseID] [int] IDENTITY(1,1) NOT NULL,
	[LicenseName] [varchar](20) NULL,
	[LicenseKey] [varchar](max) NULL,
	[OrgCode] [int] NULL,
	[MaxUsers] [int] NULL,
	[MaxVisitors] [int] NULL,
	[Status] [char](8) NULL,
	[TransDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_MstOrgLicense] PRIMARY KEY CLUSTERED 
(
	[LicenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MstProduct]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstProduct](
	[ProdId] [int] IDENTITY(1,1) NOT NULL,
	[OrgCode] [int] NOT NULL,
	[ProdCode] [varchar](50) NOT NULL,
	[CatCode] [varchar](50) NULL,
	[SubCatCode] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Image] [varchar](50) NULL,
	[UoM] [varchar](50) NULL,
	[GSTRate] [varchar](50) NULL,
	[Rate] [varchar](50) NULL,
	[Status] [char](8) NOT NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_MstProduct] PRIMARY KEY CLUSTERED 
(
	[ProdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MstSubCategory]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstSubCategory](
	[SubCatId] [int] IDENTITY(1,1) NOT NULL,
	[OrgCode] [int] NULL,
	[SubCatCode] [varchar](50) NULL,
	[CatCode] [varchar](50) NOT NULL,
	[SubCatName] [varchar](50) NULL,
	[SubCatImg] [varchar](50) NULL,
	[Status] [char](8) NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_MstSubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MstUsers]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstUsers](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[OrgCode] [int] NOT NULL,
	[CustCode] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[UserEmail] [varchar](50) NULL,
	[UserDOB] [datetime] NULL,
	[UserPhoto] [varchar](500) NULL,
	[UserType] [varchar](50) NOT NULL,
	[LoginId] [varchar](50) NOT NULL,
	[LoginPwd] [varchar](50) NOT NULL,
	[SysPwd] [varchar](50) NOT NULL,
	[PwdChangeDate] [datetime] NOT NULL,
	[Mobile] [char](10) NULL,
	[Address1] [varchar](max) NULL,
	[Address2] [varchar](max) NULL,
	[Country] [int] NULL,
	[State] [int] NULL,
	[City] [int] NULL,
	[PinNo] [varchar](50) NULL,
	[PAN] [varchar](50) NULL,
	[GST] [varchar](50) NULL,
	[TermPay] [varchar](50) NULL,
	[TermDelivery] [varchar](50) NULL,
	[Remarks] [varchar](100) NULL,
	[AboutUs] [varchar](max) NULL,
	[Status] [char](8) NOT NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_MstUsers] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempAddCart]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempAddCart](
	[ProdId] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[ProdCode] [nvarchar](50) NULL,
	[CatName] [nvarchar](100) NULL,
	[SubCatName] [nvarchar](100) NULL,
	[UoM] [nvarchar](50) NULL,
	[Rate] [decimal](18, 2) NULL,
	[Image] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TranAANoti]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranAANoti](
	[NotiId] [int] IDENTITY(1,1) NOT NULL,
	[OrgCode] [int] NOT NULL,
	[NotiType] [char](1) NULL,
	[UserId] [int] NULL,
	[UserType] [varchar](50) NULL,
	[NotiTitle] [varchar](250) NULL,
	[ValidFrom] [datetime] NULL,
	[ValidTo] [datetime] NULL,
	[NotiFile] [varchar](100) NULL,
	[NotiDesc] [varchar](max) NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TranAANoti] PRIMARY KEY CLUSTERED 
(
	[NotiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TranErrorLog]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranErrorLog](
	[ErrorId] [int] IDENTITY(1,1) NOT NULL,
	[OrgCode] [int] NULL,
	[ErrMsg] [varchar](1000) NULL,
	[PageUrl] [varchar](200) NULL,
	[SpName] [varchar](50) NULL,
	[UserId] [varchar](50) NOT NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TranErrorLog] PRIMARY KEY CLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TranLoginAudit]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranLoginAudit](
	[AuditLoginId] [int] IDENTITY(1,1) NOT NULL,
	[OrgCode] [int] NULL,
	[LoginId] [varchar](50) NULL,
	[UserPCName] [varchar](50) NULL,
	[IPAddress] [char](15) NULL,
	[IsLogedSuccess] [bit] NOT NULL,
	[LoginDate] [datetime] NOT NULL,
	[LogoutDate] [datetime] NOT NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TranLoginAudit] PRIMARY KEY CLUSTERED 
(
	[AuditLoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TranSARaiseQuery]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranSARaiseQuery](
	[QID] [int] IDENTITY(1,1) NOT NULL,
	[OrgCode] [int] NULL,
	[Email] [varchar](50) NULL,
	[QueryDesc] [varchar](max) NULL,
	[SysAdmDesc] [varchar](max) NULL,
	[QueryFile] [varchar](max) NULL,
	[Status] [char](8) NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TranSARaiseQuery] PRIMARY KEY CLUSTERED 
(
	[QID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TranSAUpdates]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranSAUpdates](
	[NotiId] [int] IDENTITY(1,1) NOT NULL,
	[NotiType] [int] NOT NULL,
	[OrgCode] [int] NOT NULL,
	[NotiTitle] [varchar](250) NULL,
	[ValidFrom] [datetime] NULL,
	[ValidTo] [datetime] NULL,
	[NotiFile] [varchar](100) NULL,
	[NotiDesc] [varchar](max) NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TranSAUpdates] PRIMARY KEY CLUSTERED 
(
	[NotiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TranSOCart]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranSOCart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProdId] [int] NOT NULL,
	[OrgCode] [int] NOT NULL,
	[CustCode] [varchar](50) NULL,
	[ProdCode] [varchar](50) NOT NULL,
	[CatName] [varchar](50) NULL,
	[SubCatName] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Image] [varchar](50) NULL,
	[UoM] [varchar](50) NULL,
	[Rate] [varchar](50) NULL,
	[Qty] [int] NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TranSOCart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TranSODetails]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranSODetails](
	[SODetId] [int] IDENTITY(1,1) NOT NULL,
	[OrgCode] [int] NULL,
	[SOId] [int] NULL,
	[ProdId] [int] NULL,
	[UoM] [varchar](50) NULL,
	[Rate] [varchar](50) NULL,
	[Qty] [varchar](50) NULL,
	[Amount] [varchar](50) NULL,
	[GSTPercent] [varchar](50) NULL,
	[GSTAmount] [varchar](50) NULL,
	[GrossAmount] [varchar](50) NULL,
	[Status] [char](8) NULL,
	[TransDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_TranSODetails] PRIMARY KEY CLUSTERED 
(
	[SODetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TranSOHeader]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranSOHeader](
	[SOId] [int] IDENTITY(1,1) NOT NULL,
	[OrgCode] [int] NULL,
	[Date] [datetime] NULL,
	[Type] [varchar](50) NULL,
	[CustCode] [varchar](10) NULL,
	[OrderAmount] [varchar](50) NULL,
	[GSTAmount] [varchar](50) NULL,
	[NetAmount] [varchar](50) NULL,
	[Remarks] [varchar](100) NULL,
	[Status] [char](20) NULL,
	[TransDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_TranSOHeader] PRIMARY KEY CLUSTERED 
(
	[SOId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TranSOWaitList]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranSOWaitList](
	[WaitListId] [int] IDENTITY(1,1) NOT NULL,
	[ProdId] [nchar](10) NULL,
	[OrgCode] [int] NOT NULL,
	[CustCode] [varchar](50) NULL,
	[ProdCode] [varchar](50) NOT NULL,
	[CatName] [varchar](50) NULL,
	[SubCatName] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Image] [varchar](50) NULL,
	[UoM] [varchar](50) NULL,
	[GSTRate] [varchar](50) NULL,
	[Rate] [varchar](50) NULL,
	[Qty] [int] NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TranSOWaitList] PRIMARY KEY CLUSTERED 
(
	[WaitListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TranVMSDept]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranVMSDept](
	[DeptID] [int] IDENTITY(1,1) NOT NULL,
	[OrgCode] [int] NOT NULL,
	[DeptName] [varchar](50) NOT NULL,
	[DeptIncharge] [varchar](50) NOT NULL,
	[Status] [char](8) NOT NULL,
	[TransDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TranVMSDept] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TranVMSVisitor]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranVMSVisitor](
	[VID] [int] IDENTITY(1,1) NOT NULL,
	[OrgCode] [int] NOT NULL,
	[UserId] [int] NULL,
	[Name] [varchar](50) NOT NULL,
	[MobileNo] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[CompanyName] [varchar](50) NULL,
	[Designation] [varchar](50) NULL,
	[Address1] [varchar](150) NULL,
	[Address2] [varchar](150) NULL,
	[Photo] [varchar](max) NULL,
	[VisitingCard] [varchar](max) NULL,
	[QrCode] [varchar](max) NULL,
	[Status] [char](8) NULL,
	[TransDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_TranVMSVisitor] PRIMARY KEY CLUSTERED 
(
	[VID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TranVMSVisits]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranVMSVisits](
	[VisitID] [int] IDENTITY(1,1) NOT NULL,
	[OrgCode] [int] NOT NULL,
	[UserId] [int] NULL,
	[VisitDate] [datetime] NULL,
	[TimeIn] [varchar](50) NULL,
	[VID] [int] NULL,
	[DeptName] [int] NULL,
	[Reference] [varchar](50) NULL,
	[TimeOut] [varchar](50) NULL,
	[Reason] [varchar](250) NULL,
	[Status] [char](8) NULL,
	[TransDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_TranVMSVisits] PRIMARY KEY CLUSTERED 
(
	[VisitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wnn]    Script Date: 12-07-2024 2.56.50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wnn](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](500) NOT NULL,
	[Password] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Wnn] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GDMstBanks] ON 

INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (2, N'ALLAHABAD BANK', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (3, N'ANDHRA BANK', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (4, N'BANK OF BARODA', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (5, N'BANK OF INDIA', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (6, N'BANK OF MAHARASHTRA', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (7, N'CANARA BANK', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (8, N'CENTRAL BANK OF INDIA', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (9, N'CORPORATION BANK', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (10, N'DENA BANK', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (11, N'IDBI BANK LTD.', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (12, N'IND BANK HOUSING LTD.', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (13, N'INDBANK MERCHANT BANKING SERVICES LTD.', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (14, N'INDIAN BANK', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (15, N'INDIAN OVERSEAS BANK', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (16, N'JAMMU & KASHMIR BANK LTD.,THE', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (17, N'ORIENTAL BANK OF COMMERCE', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (18, N'PNB GILTS LTD.', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (19, N'PUNJAB & SIND BANK', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (20, N'PUNJAB NATIONAL BANK', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 1)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (21, N'STATE BANK OF INDIA', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (22, N'SYNDICATE BANK', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (23, N'UCO BANK', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (24, N'UNION BANK OF INDIA', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (25, N'UNITED BANK OF INDIA', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
INSERT [dbo].[GDMstBanks] ([BankId], [BankName], [Status], [TransDate], [IsDeleted]) VALUES (26, N'VIJAYA BANK', N'Active  ', CAST(N'2024-02-05T17:42:30.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[GDMstBanks] OFF
GO
SET IDENTITY_INSERT [dbo].[GDMstCity] ON 

INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (1, 356, 8, N'Jaipur', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (2, 356, 22, N'Raipur', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (3, 356, 22, N'Korba', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (4, 356, 22, N'Durg', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (5, 356, 22, N'Raigarh', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (6, 356, 7, N'New Delhi', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (7, 356, 7, N'Gurugram', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (8, 356, 7, N'Karol Bagh', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (9, 356, 7, N'Mehrauli', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (10, 356, 7, N'Dwarka', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (11, 356, 24, N'Ahmedabad', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (12, 356, 24, N'Somnath', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (13, 356, 24, N'Dwarka', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (14, 356, 24, N'Sasangir', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (15, 356, 24, N'Surat', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (16, 356, 24, N'Bhuj', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (17, 356, 24, N'Gandhinagar', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (18, 356, 24, N'Vadodara', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (19, 356, 24, N'Rajkot', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (20, 356, 23, N'Indore', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (21, 356, 23, N'Bhopal', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (22, 356, 23, N'Jabalpur', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (23, 356, 23, N'Gwalior', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (24, 356, 23, N'Ujjain', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (25, 356, 36, N'Hyderabad', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (26, 356, 36, N'Karimnagar', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (27, 356, 36, N'Khammam', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (28, 356, 36, N'Nizamabad', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (29, 356, 36, N'Ramagundam', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (30, 356, 36, N'Warangal', N'Active  ', CAST(N'2024-02-05T12:34:12.213' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (31, 356, 8, N'Alwar', N'Active  ', CAST(N'2024-02-10T15:39:05.563' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (48, 356, 9, N'Bareilly', N'Active  ', CAST(N'2024-03-02T13:54:21.757' AS DateTime), 0)
INSERT [dbo].[GDMstCity] ([CityId], [CountryCode], [StateId], [CityName], [Status], [TransDate], [IsDeleted]) VALUES (49, 356, 6, N'Rohtak', N'InActive', CAST(N'2024-03-02T16:14:50.050' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[GDMstCity] OFF
GO
INSERT [dbo].[GDMstCountry] ([CountryCode], [CountryName], [ALPHA2], [ALPHA3], [ISO3166], [CountryRegionCode], [CountryRegion], [CountrySubRegCode], [CountrySubReg], [IntlDealing], [Status], [TransDate], [IsDeleted]) VALUES (356, N'INDIA', N'IN', N'IND', N'ISO 3166-2', 142, N'ASIA', 34, N'ASIA', N'+91', N'Active  ', CAST(N'2024-02-10T14:38:26.510' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[GDMstEmailConfig] ON 

INSERT [dbo].[GDMstEmailConfig] ([vEmailType], [vEmailName], [vEmailId], [vSMTP], [vPort], [vPassword], [vHTMLTemplate], [vSubject], [TransDate], [IsDeleted]) VALUES (1, N'Sameer Khan', N'sameerkhan14018@gmail.com', N'smtp.gmail.com', 587, N'eyyjiracbdbslwsl', N'<html>
<body>
<p>Dear User,<br><br>
You have requested a password reset for your IBPT account. Please follow the instructions below to reset your password:<br><br>
<b>Instructions:</b><br>
1. Click on the following link to reset your password. <br>
<a href=''{0}'' style=''display: inline-block; padding: 10px 20px; background-color: #4CAF50; color: #fff; text-decoration: none; border-radius: 5px;''>Reset Password</a><br>
2. If you did not request this password reset, please ignore this email.<br><br>
Thank you,<br>
IBPT Support Team<br><br>
{1}
</p>
</body>
</html>
', N'IBPT - Password Reset Request', CAST(N'2024-02-24T10:42:15.980' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[GDMstEmailConfig] OFF
GO
SET IDENTITY_INSERT [dbo].[GDMstOrgType] ON 

INSERT [dbo].[GDMstOrgType] ([OrgTypeId], [OrganisationType], [Status], [TransDate], [IsDeleted]) VALUES (1, N'Proprietorship', N'Active  ', CAST(N'2017-08-25T18:45:54.670' AS DateTime), 0)
INSERT [dbo].[GDMstOrgType] ([OrgTypeId], [OrganisationType], [Status], [TransDate], [IsDeleted]) VALUES (2, N'One-Person Company (OPC)', N'Active  ', CAST(N'2017-08-25T18:46:06.597' AS DateTime), 0)
INSERT [dbo].[GDMstOrgType] ([OrgTypeId], [OrganisationType], [Status], [TransDate], [IsDeleted]) VALUES (3, N'Private Limited', N'Active  ', CAST(N'2017-08-25T18:46:31.147' AS DateTime), 0)
INSERT [dbo].[GDMstOrgType] ([OrgTypeId], [OrganisationType], [Status], [TransDate], [IsDeleted]) VALUES (4, N'Public Limited', N'Active  ', CAST(N'2017-08-25T18:47:00.460' AS DateTime), 0)
INSERT [dbo].[GDMstOrgType] ([OrgTypeId], [OrganisationType], [Status], [TransDate], [IsDeleted]) VALUES (5, N'NGO', N'Active  ', CAST(N'2017-08-25T18:47:22.607' AS DateTime), 0)
INSERT [dbo].[GDMstOrgType] ([OrgTypeId], [OrganisationType], [Status], [TransDate], [IsDeleted]) VALUES (19, N'Others', N'Active  ', CAST(N'2017-10-26T02:35:57.013' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[GDMstOrgType] OFF
GO
SET IDENTITY_INSERT [dbo].[GDMstState] ON 

INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (1, N'1', 356, N'State', N'Jammu & Kashmir', N'Srinagar/Jammu', N'JK', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (2, N'2', 356, N'State', N'Himachal Pradesh', N'Shimla', N'HP', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (3, N'3', 356, N'State', N'Punjab', N'Chandigarh', N'PB', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (4, N'4', 356, N'UT', N'Chandigarh', N'Chandigarh', N'CH', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (5, N'5', 356, N'State', N'Uttarakhand', N'Dehradun', N'UA', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (6, N'6', 356, N'State', N'Haryana', N'Chandigarh', N'HR', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (7, N'7', 356, N'UT', N'Delhi', N'New Delhi', N'DL', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (8, N'8', 356, N'State', N'Rajasthan', N'Jaipur', N'RJ', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (9, N'9', 356, N'State', N'Uttar Pradesh', N'Lucknow', N'UP', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (10, N'10', 356, N'State', N'Bihar', N'Patna', N'BR', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (11, N'11', 356, N'State', N'Sikkim', N'Gangtok', N'SK', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (12, N'12', 356, N'State', N'Arunachal Pradesh', N'Itanagar', N'AR', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (13, N'13', 356, N'State', N'Nagaland', N'Kohima', N'NL', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (14, N'14', 356, N'State', N'Manipur', N'Imphal', N'MN', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (15, N'15', 356, N'State', N'Mizoram', N'Aizawl', N'MZ', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (16, N'16', 356, N'State', N'Tripura', N'Agartala', N'TR', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (17, N'17', 356, N'State', N'Meghalaya', N'Shillong', N'ML', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (18, N'18', 356, N'State', N'Assam', N'Dispur', N'AS', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (19, N'19', 356, N'State', N'West Bengal', N'Kolkata', N'WB', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (20, N'20', 356, N'State', N'Jharkhand', N'Ranchi', N'JH', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (21, N'21', 356, N'State', N'Odisha', N'Bhubaneswar', N'OR', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (22, N'22', 356, N'State', N'Chhattisgarh', N'Raipur', N'CG', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (23, N'23', 356, N'State', N'Madhya Pradesh', N'Bhopal', N'MP', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (24, N'24', 356, N'State', N'Gujarat', N'Gandhinagar', N'GJ', N'Active  ', CAST(N'2024-02-10T15:10:49.083' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (25, N'25', 356, N'UT', N'Daman & Diu', N'Daman', N'DD', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (26, N'26', 356, N'UT', N'Dadra & Nagar Haveli', N'Silvassa', N'DN', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (27, N'27', 356, N'State', N'Maharashtra', N'Mumbai', N'MH', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (28, N'28', 356, N'State', N'Andhra Pradesh', N'Hyderabad', N'AP', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (29, N'29', 356, N'State', N'Karnataka', N'Bangalore', N'KA', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (30, N'30', 356, N'State', N'Goa', N'Panaji', N'GA', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (31, N'31', 356, N'UT', N'Lakshadweep', N'Kavaratti', N'LD', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (32, N'32', 356, N'State', N'Kerala', N'Thiruvananthapuram', N'KL', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (33, N'33', 356, N'State', N'Tamil Nadu', N'Chennai', N'TN', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (34, N'34', 356, N'UT', N'Puducherry', N'Puducherry', N'PY', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (35, N'35', 356, N'UT', N'Andaman & Nicobar Islands', N'Port Blair', N'AN', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (36, N'36', 356, N'State', N'Telangana', N'Hyderabad', N'TL', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
INSERT [dbo].[GDMstState] ([StateID], [StateCode], [CountryCode], [StateType], [StateName], [StateCapital], [StateAbbr], [Status], [TransDate], [IsDeleted]) VALUES (99, N'99', 356, N'UT', N'Other Territories', N'Other Territories', N'OT', N'Active  ', CAST(N'2024-02-05T12:46:55.090' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[GDMstState] OFF
GO
SET IDENTITY_INSERT [dbo].[GDMstSubscType] ON 

INSERT [dbo].[GDMstSubscType] ([SubID], [SubsCName], [Status], [TransDate], [IsDeleted]) VALUES (1, N'Silver', N'Active  ', CAST(N'2024-02-07T10:16:36.193' AS DateTime), 0)
INSERT [dbo].[GDMstSubscType] ([SubID], [SubsCName], [Status], [TransDate], [IsDeleted]) VALUES (2, N'Gold', N'Active  ', CAST(N'2024-02-07T10:16:36.193' AS DateTime), 0)
INSERT [dbo].[GDMstSubscType] ([SubID], [SubsCName], [Status], [TransDate], [IsDeleted]) VALUES (3, N'Diamond', N'Active  ', CAST(N'2024-02-07T10:16:36.193' AS DateTime), 0)
INSERT [dbo].[GDMstSubscType] ([SubID], [SubsCName], [Status], [TransDate], [IsDeleted]) VALUES (4, N'Platinum', N'Active  ', CAST(N'2024-02-07T10:16:36.193' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[GDMstSubscType] OFF
GO
SET IDENTITY_INSERT [dbo].[GDMstUnit] ON 

INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (2, 1, N'BAG', N'BAG', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (3, 2, N'BGS', N'BAGS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (4, 3, N'BLS', N'BAILS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (5, 4, N'BTL', N'BOTTLES', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (6, 5, N'BOU', N'BOU', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (7, 6, N'BOX', N'BOXES', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (8, 7, N'BKL', N'BUCKLES', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (9, 8, N'BLK', N'BULK', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (10, 9, N'BUN', N'BUNCHES', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (11, 10, N'BDL', N'BUNDLES', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (12, 11, N'CAN', N'CANS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (13, 12, N'CTN', N'CARTONS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (14, 13, N'CAS', N'CASES', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (15, 14, N'CMS', N'CENTIMETER', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (16, 15, N'CHI', N'CHEST', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (17, 16, N'CLS', N'COILS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (18, 17, N'COL', N'COLLIES', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (19, 18, N'CRI', N'CRATES', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (20, 19, N'CCM', N'CUBIC CENTIMETER', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (21, 20, N'CIN', N'CUBIC INCHES', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (22, 21, N'CBM', N'CUBIC METER', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (23, 22, N'CQM', N'CUBIC METERS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (24, 23, N'CYL', N'CYLINDER', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (25, 24, N'SDM', N'DECAMETER SQUARE', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (26, 25, N'DAY', N'DAYS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (27, 26, N'DOZ', N'DOZEN', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (28, 27, N'DRM', N'DRUMS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (29, 28, N'FTS', N'FEET', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (30, 29, N'FLK', N'FLASKS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (31, 30, N'GMS', N'GRAMS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (32, 31, N'TON', N'GREAT BRITAIN TON', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (33, 32, N'GGR', N'GREAT GROSS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (34, 33, N'GRS', N'GROSS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (35, 34, N'GYD', N'GROSS YARDS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (36, 35, N'HBK', N'HABBUCK', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (37, 36, N'HKS', N'HANKS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (38, 37, N'HRS', N'HOURS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (39, 38, N'INC', N'INCHES', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (40, 39, N'JTA', N'JOTTA', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (41, 40, N'KGS', N'KILOGRAMS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (42, 41, N'KLR', N'KILOLITER', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (43, 42, N'KME', N'KILOMETERS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (44, 43, N'LTR', N'LITERS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (45, 44, N'LOG', N'LOGS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (46, 45, N'LOT', N'LOTS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (47, 46, N'MTR', N'METER', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (48, 47, N'MTS', N'METRIC TON', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (49, 48, N'MGS', N'MILLIGRAMS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (50, 49, N'MLT', N'MILLILITRE', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (51, 50, N'MMT', N'MILLIMETER', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (52, 51, N'NONE', N'NOT CHOSEN', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (53, 52, N'NOS', N'NUMBERS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (54, 53, N'ODD', N'ODDS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (55, 54, N'PAC', N'PACKS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (56, 55, N'PAI', N'PAILS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (57, 56, N'PRS', N'PAIRS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (58, 57, N'PLT', N'PALLETS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (59, 58, N'PCS', N'PIECES', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (60, 59, N'LBS', N'POUNDS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (61, 60, N'QTL', N'QUINTAL', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (62, 61, N'REL', N'REELS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (63, 62, N'ROL', N'ROLLS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (64, 63, N'SET', N'SETS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (65, 64, N'SHT', N'SHEETS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (66, 65, N'SLB', N'SLABS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (67, 66, N'SQF', N'SQUARE FEET', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (68, 67, N'SQI', N'SQUARE INCHES', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (69, 68, N'SQC', N'SQUARE CENTIMETERS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (70, 69, N'SQM', N'SQUARE METER', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (71, 70, N'SQY', N'SQUARE YARDS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (72, 71, N'BLO', N'STEEL BLOCKS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (73, 72, N'TBL', N'TABLES', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (74, 73, N'TBS', N'TABLETS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (75, 74, N'TGM', N'TEN GROSS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (76, 75, N'THD', N'THOUSANDS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (77, 76, N'TIN', N'TINS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (78, 77, N'TOL', N'TOLA', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (79, 78, N'TRK', N'TRUNK', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (80, 79, N'TUB', N'TUBES', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (81, 80, N'UNT', N'UNITS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (82, 81, N'UGS', N'US GALLONS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (83, 82, N'VLS', N'Vials', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (84, 83, N'CSK', N'WOODEN CASES', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (85, 84, N'YDS', N'YARDS', N'Active  ', CAST(N'2024-02-05T15:01:32.923' AS DateTime), 0)
INSERT [dbo].[GDMstUnit] ([UnitID], [UnitCode], [UnitName], [UnitDesc], [Status], [TransDate], [IsDeleted]) VALUES (86, 111, N'Checkings', N'Checkings', N'InActive', CAST(N'2024-03-02T11:56:11.700' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[GDMstUnit] OFF
GO
SET IDENTITY_INSERT [dbo].[GDMstUserType] ON 

INSERT [dbo].[GDMstUserType] ([UserTypeId], [UserTypeName], [Status], [TransDate], [IsDeleted]) VALUES (1, N'Employee', N'Active  ', CAST(N'2024-02-15T12:41:18.810' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[GDMstUserType] OFF
GO
SET IDENTITY_INSERT [dbo].[GDMstValidation] ON 

INSERT [dbo].[GDMstValidation] ([Id], [ValidationType], [ControlType], [TransDate], [IsDeleted]) VALUES (1, N'Aphanumeric', N'TextBox', CAST(N'2024-02-23T17:35:34.920' AS DateTime), 0)
INSERT [dbo].[GDMstValidation] ([Id], [ValidationType], [ControlType], [TransDate], [IsDeleted]) VALUES (2, N'Numeric', N'CheckBox', CAST(N'2024-02-23T17:37:28.700' AS DateTime), 0)
INSERT [dbo].[GDMstValidation] ([Id], [ValidationType], [ControlType], [TransDate], [IsDeleted]) VALUES (3, N'Alphabet', N'ReadioButton', CAST(N'2024-02-23T17:38:14.627' AS DateTime), 0)
INSERT [dbo].[GDMstValidation] ([Id], [ValidationType], [ControlType], [TransDate], [IsDeleted]) VALUES (4, N'Required', N'FileUpload', CAST(N'2024-02-24T09:56:22.447' AS DateTime), 0)
INSERT [dbo].[GDMstValidation] ([Id], [ValidationType], [ControlType], [TransDate], [IsDeleted]) VALUES (5, N'Email', N'ListBox ', CAST(N'2024-02-24T09:57:53.293' AS DateTime), 0)
INSERT [dbo].[GDMstValidation] ([Id], [ValidationType], [ControlType], [TransDate], [IsDeleted]) VALUES (6, N'PhoneNumber', N'DropDownList ', CAST(N'2024-02-24T10:21:47.310' AS DateTime), 0)
INSERT [dbo].[GDMstValidation] ([Id], [ValidationType], [ControlType], [TransDate], [IsDeleted]) VALUES (7, N'Alphabet', NULL, CAST(N'2024-02-24T13:01:46.637' AS DateTime), 0)
INSERT [dbo].[GDMstValidation] ([Id], [ValidationType], [ControlType], [TransDate], [IsDeleted]) VALUES (8, N'Web', NULL, CAST(N'2024-02-24T13:02:09.843' AS DateTime), 0)
INSERT [dbo].[GDMstValidation] ([Id], [ValidationType], [ControlType], [TransDate], [IsDeleted]) VALUES (9, N'pinCode', NULL, CAST(N'2024-02-24T13:02:13.450' AS DateTime), 0)
INSERT [dbo].[GDMstValidation] ([Id], [ValidationType], [ControlType], [TransDate], [IsDeleted]) VALUES (10, N'Demo1', N'Demo1', CAST(N'2024-02-24T18:04:14.283' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[GDMstValidation] OFF
GO
SET IDENTITY_INSERT [dbo].[MstCategory] ON 

INSERT [dbo].[MstCategory] ([CatId], [OrgCode], [CatCode], [CatName], [CatImg], [Status], [TransDate], [IsDeleted]) VALUES (1, 1004, N'C001', N'Candle Stand', N'CatImg-1004-1.jpg', N'Active  ', CAST(N'2024-04-05T09:59:01.963' AS DateTime), 0)
INSERT [dbo].[MstCategory] ([CatId], [OrgCode], [CatCode], [CatName], [CatImg], [Status], [TransDate], [IsDeleted]) VALUES (2, 1004, N'C002', N'Candle Stand two', N'CatImg-1004-2.jpg', N'Active  ', CAST(N'2024-04-05T09:59:17.430' AS DateTime), 0)
INSERT [dbo].[MstCategory] ([CatId], [OrgCode], [CatCode], [CatName], [CatImg], [Status], [TransDate], [IsDeleted]) VALUES (3, 1005, N'TB001', N'Table ', N'CatImg-1005-3.jpg', N'Active  ', CAST(N'2024-04-05T11:34:06.520' AS DateTime), 0)
INSERT [dbo].[MstCategory] ([CatId], [OrgCode], [CatCode], [CatName], [CatImg], [Status], [TransDate], [IsDeleted]) VALUES (4, 1005, N'CH001', N'Chair', N'CatImg-1005-4.jpg', N'Active  ', CAST(N'2024-04-05T11:34:34.210' AS DateTime), 0)
INSERT [dbo].[MstCategory] ([CatId], [OrgCode], [CatCode], [CatName], [CatImg], [Status], [TransDate], [IsDeleted]) VALUES (5, 1005, N'SC001', N'Sofa', N'CatImg-1005-5.jpg', N'Active  ', CAST(N'2024-04-05T11:35:05.590' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[MstCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[MstOrgAccess] ON 

INSERT [dbo].[MstOrgAccess] ([AccessID], [OrgCode], [ModStudentPrt], [ModParentPrt], [ModStaffPrt], [ModAlumniPrt], [Status], [TransDate], [IsDeleted]) VALUES (4, 1000, 1, 1, 1, 1, N'Active  ', CAST(N'2024-02-17T15:18:01.830' AS DateTime), 0)
INSERT [dbo].[MstOrgAccess] ([AccessID], [OrgCode], [ModStudentPrt], [ModParentPrt], [ModStaffPrt], [ModAlumniPrt], [Status], [TransDate], [IsDeleted]) VALUES (5, 1001, 1, 1, 1, 1, N'Active  ', CAST(N'2024-02-17T15:20:00.127' AS DateTime), 0)
INSERT [dbo].[MstOrgAccess] ([AccessID], [OrgCode], [ModStudentPrt], [ModParentPrt], [ModStaffPrt], [ModAlumniPrt], [Status], [TransDate], [IsDeleted]) VALUES (6, 1002, 0, 0, 0, 0, N'Active  ', CAST(N'2024-02-20T17:33:46.770' AS DateTime), 0)
INSERT [dbo].[MstOrgAccess] ([AccessID], [OrgCode], [ModStudentPrt], [ModParentPrt], [ModStaffPrt], [ModAlumniPrt], [Status], [TransDate], [IsDeleted]) VALUES (7, 1003, 0, 0, 0, 0, N'Active  ', CAST(N'2024-02-22T15:18:53.950' AS DateTime), 0)
INSERT [dbo].[MstOrgAccess] ([AccessID], [OrgCode], [ModStudentPrt], [ModParentPrt], [ModStaffPrt], [ModAlumniPrt], [Status], [TransDate], [IsDeleted]) VALUES (8, 1004, 0, 0, 0, 0, N'Active  ', CAST(N'2024-02-23T16:07:30.067' AS DateTime), 0)
INSERT [dbo].[MstOrgAccess] ([AccessID], [OrgCode], [ModStudentPrt], [ModParentPrt], [ModStaffPrt], [ModAlumniPrt], [Status], [TransDate], [IsDeleted]) VALUES (17, 1005, 1, 1, 1, 1, N'Active  ', CAST(N'2024-02-27T15:39:34.243' AS DateTime), 0)
INSERT [dbo].[MstOrgAccess] ([AccessID], [OrgCode], [ModStudentPrt], [ModParentPrt], [ModStaffPrt], [ModAlumniPrt], [Status], [TransDate], [IsDeleted]) VALUES (18, 1000, 1, 1, 1, 1, N'Active  ', CAST(N'2024-03-21T09:49:54.083' AS DateTime), 0)
INSERT [dbo].[MstOrgAccess] ([AccessID], [OrgCode], [ModStudentPrt], [ModParentPrt], [ModStaffPrt], [ModAlumniPrt], [Status], [TransDate], [IsDeleted]) VALUES (19, 1001, 1, 1, 1, 1, N'Active  ', CAST(N'2024-03-21T11:29:24.310' AS DateTime), 0)
INSERT [dbo].[MstOrgAccess] ([AccessID], [OrgCode], [ModStudentPrt], [ModParentPrt], [ModStaffPrt], [ModAlumniPrt], [Status], [TransDate], [IsDeleted]) VALUES (20, 1002, 0, 0, 0, 0, N'Active  ', CAST(N'2024-03-21T11:39:04.100' AS DateTime), 0)
INSERT [dbo].[MstOrgAccess] ([AccessID], [OrgCode], [ModStudentPrt], [ModParentPrt], [ModStaffPrt], [ModAlumniPrt], [Status], [TransDate], [IsDeleted]) VALUES (21, 1003, 0, 0, 0, 0, N'Active  ', CAST(N'2024-03-26T17:26:58.310' AS DateTime), 0)
INSERT [dbo].[MstOrgAccess] ([AccessID], [OrgCode], [ModStudentPrt], [ModParentPrt], [ModStaffPrt], [ModAlumniPrt], [Status], [TransDate], [IsDeleted]) VALUES (22, 1004, 0, 0, 0, 0, N'Active  ', CAST(N'2024-04-04T15:31:46.280' AS DateTime), 0)
INSERT [dbo].[MstOrgAccess] ([AccessID], [OrgCode], [ModStudentPrt], [ModParentPrt], [ModStaffPrt], [ModAlumniPrt], [Status], [TransDate], [IsDeleted]) VALUES (23, 1005, 1, 1, 1, 1, N'Active  ', CAST(N'2024-04-05T11:25:50.663' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[MstOrgAccess] OFF
GO
SET IDENTITY_INSERT [dbo].[MstOrganization] ON 

INSERT [dbo].[MstOrganization] ([OrgID], [OrgCode], [OrgType], [OrgName], [ContactPerson], [EstYear], [MultiBranch], [AffiliatedTo], [AffiliationNo], [SchoolMoto], [RegistrationNo], [BoardUniversity], [Web], [Logo], [Address1], [Address2], [Country], [State], [City], [PinNo], [Phone], [Mobile], [Email], [PANNo], [GSTINNo], [BankAccount], [BankCode], [BankBranch], [BankIFSC], [SubsType], [SubsFrom], [SubsTo], [AdminEmail], [AdminPwd], [PwdChangeDate], [WebAdminEmail], [WebAdminPwd], [WebPwdChangeDate], [AdminResetPasswordToken], [WebAdminResetPasswordToken], [WAMsgVisit], [WAMsgBusiness], [Status], [TransDate], [IsDeleted]) VALUES (1, 1000, N'One-Person Company (OPC)', N'Inventive Bizpro Pvt Ltd', N'Rakesh Sir', 2024, N'Yes', N'BNI', N'0000000', N'Proud BNI Member', N'0000', N'NA', N'https://localhost:44310/SystemAdmin/', N'Inventive_Bizpro_Pvt_Ltd-1000.jpg', N'Near Krishna Sweet', N'Ved ji ka Chauraha Jhotwara', N'356', N'8', N'1', 243005, N'9634030123', N'9634030123', N'rktworld@gmail.com', N'SSKSD6483C', N'22AAAAA0000A1Z8', N'989898981', N'11', N'Jhotwara', N'HDFC0001838', N'Diamond', CAST(N'2024-03-06' AS Date), CAST(N'2024-08-09' AS Date), N'rakesh@gmail.com', N'UmFrZXNoQDEyMyM=', CAST(N'2024-03-21T09:55:04.523' AS DateTime), N'webadmin@gmail.com', N'UmFrZXNoQDEyMyM=', CAST(N'2024-03-21T09:55:04.523' AS DateTime), N'', N'', N'Hello! Thank you for visiting us today. We appreciate your presence and hope you enjoyed your experience. Your support means a lot to us! We look forward to welcoming you back soon. Have a wonderful day!', N'Thank you for choosing Us! We''re delighted that you visited us today and hope you had a wonderful experience. Your support means the world to us and we truly appreciate it. We''re looking forward to serving you again soon. Have a fantastic day!', N'Active  ', CAST(N'2024-03-21T09:49:54.077' AS DateTime), 0)
INSERT [dbo].[MstOrganization] ([OrgID], [OrgCode], [OrgType], [OrgName], [ContactPerson], [EstYear], [MultiBranch], [AffiliatedTo], [AffiliationNo], [SchoolMoto], [RegistrationNo], [BoardUniversity], [Web], [Logo], [Address1], [Address2], [Country], [State], [City], [PinNo], [Phone], [Mobile], [Email], [PANNo], [GSTINNo], [BankAccount], [BankCode], [BankBranch], [BankIFSC], [SubsType], [SubsFrom], [SubsTo], [AdminEmail], [AdminPwd], [PwdChangeDate], [WebAdminEmail], [WebAdminPwd], [WebPwdChangeDate], [AdminResetPasswordToken], [WebAdminResetPasswordToken], [WAMsgVisit], [WAMsgBusiness], [Status], [TransDate], [IsDeleted]) VALUES (2, 1001, N'One-Person Company (OPC)', N'Four Cross Media Pvt Ltd', N'Sameer', 2024, N'Yes', N'Checking', N'dasd', N'Checking', N'9898989', N'Checking', N'www.fourcrossmedia.com', N'Four_Cross_Media_Pvt_Ltd-1001.png', N'', N'', N'', N'', N'', 0, N'', N'', N'', N'', N'', N'', N'14', N'', N'', N'Diamond', CAST(N'2024-03-06' AS Date), CAST(N'2024-04-26' AS Date), N'info@fourcrossmedia.com', N'dGFuemVlbUAxMjMj', CAST(N'2024-03-30T10:52:41.403' AS DateTime), N'info1@fourcrossmedia.com', N'dGFuemVlbUAxMjMj', CAST(N'2024-03-30T10:52:41.403' AS DateTime), N'', N'', N'Hello! Thank you for visiting us today. We appreciate your presence and hope you enjoyed your experience. Your support means a lot to us! We look forward to welcoming you back soon. Have a wonderful day!', N'Thank you for choosing Us! We''re delighted that you visited us today and hope you had a wonderful experience. Your support means the world to us and we truly appreciate it. We''re looking forward to serving you again soon. Have a fantastic day!', N'Active  ', CAST(N'2024-03-21T11:29:24.307' AS DateTime), 1)
INSERT [dbo].[MstOrganization] ([OrgID], [OrgCode], [OrgType], [OrgName], [ContactPerson], [EstYear], [MultiBranch], [AffiliatedTo], [AffiliationNo], [SchoolMoto], [RegistrationNo], [BoardUniversity], [Web], [Logo], [Address1], [Address2], [Country], [State], [City], [PinNo], [Phone], [Mobile], [Email], [PANNo], [GSTINNo], [BankAccount], [BankCode], [BankBranch], [BankIFSC], [SubsType], [SubsFrom], [SubsTo], [AdminEmail], [AdminPwd], [PwdChangeDate], [WebAdminEmail], [WebAdminPwd], [WebPwdChangeDate], [AdminResetPasswordToken], [WebAdminResetPasswordToken], [WAMsgVisit], [WAMsgBusiness], [Status], [TransDate], [IsDeleted]) VALUES (3, 1002, N'Proprietorship', N'Stellans', N'Maulik', 2024, N'No', N'', N'', N'', N'', N'', N'', N'as-1002.png', N'', N'', N'', N'', N'', 0, N'', N'', N'', N'', N'', N'', N'14', N'', N'', N'Platinum', CAST(N'2024-03-07' AS Date), CAST(N'2024-12-31' AS Date), N'info@Stellans.com', N'U3RlbGxhbkAxMjMj', CAST(N'2024-03-26T15:10:59.003' AS DateTime), N'info@Stellans.com', N'U3RlbGxhbkAxMjMj', CAST(N'2024-03-26T15:10:59.003' AS DateTime), N'', N'', N'Hello! Thank you for visiting us today. We appreciate your presence and hope you enjoyed your experience. Your support means a lot to us! We look forward to welcoming you back soon. Have a wonderful day!', N'Thank you for choosing Us! We''re delighted that you visited us today and hope you had a wonderful experience. Your support means the world to us and we truly appreciate it. We''re looking forward to serving you again soon. Have a fantastic day!', N'Active  ', CAST(N'2024-03-21T11:38:56.300' AS DateTime), 1)
INSERT [dbo].[MstOrganization] ([OrgID], [OrgCode], [OrgType], [OrgName], [ContactPerson], [EstYear], [MultiBranch], [AffiliatedTo], [AffiliationNo], [SchoolMoto], [RegistrationNo], [BoardUniversity], [Web], [Logo], [Address1], [Address2], [Country], [State], [City], [PinNo], [Phone], [Mobile], [Email], [PANNo], [GSTINNo], [BankAccount], [BankCode], [BankBranch], [BankIFSC], [SubsType], [SubsFrom], [SubsTo], [AdminEmail], [AdminPwd], [PwdChangeDate], [WebAdminEmail], [WebAdminPwd], [WebPwdChangeDate], [AdminResetPasswordToken], [WebAdminResetPasswordToken], [WAMsgVisit], [WAMsgBusiness], [Status], [TransDate], [IsDeleted]) VALUES (4, 1003, N'One-Person Company (OPC)', N'College Dekho', N'Raman Singh', 2021, N'No', N'College', N'0000000', N'Explore your new horizon', N'9898989', N'NA', N'collegedekho.com', N' ', N'', N'', N'', N'', N'', 0, N'', N'', N'', N'', N'', N'', N'14', N'', N'', N'Diamond', CAST(N'2024-03-01' AS Date), CAST(N'2024-03-30' AS Date), N'info@collegedekho.com', N'Q29sbGVnZUAxMjMj', CAST(N'2024-03-26T17:32:10.037' AS DateTime), N'info@collegedekho.com', N'Q29sbGVnZUAxMjMj', CAST(N'2024-03-26T17:32:10.037' AS DateTime), N'', N'', N'Hello! Thank you for visiting us today. We appreciate your presence and hope you enjoyed your experience. Your support means a lot to us! We look forward to welcoming you back soon. Have a wonderful day!', N'Thank you for choosing Us! We''re delighted that you visited us today and hope you had a wonderful experience. Your support means the world to us and we truly appreciate it. We''re looking forward to serving you again soon. Have a fantastic day!', N'Active  ', CAST(N'2024-03-26T17:26:58.310' AS DateTime), 1)
INSERT [dbo].[MstOrganization] ([OrgID], [OrgCode], [OrgType], [OrgName], [ContactPerson], [EstYear], [MultiBranch], [AffiliatedTo], [AffiliationNo], [SchoolMoto], [RegistrationNo], [BoardUniversity], [Web], [Logo], [Address1], [Address2], [Country], [State], [City], [PinNo], [Phone], [Mobile], [Email], [PANNo], [GSTINNo], [BankAccount], [BankCode], [BankBranch], [BankIFSC], [SubsType], [SubsFrom], [SubsTo], [AdminEmail], [AdminPwd], [PwdChangeDate], [WebAdminEmail], [WebAdminPwd], [WebPwdChangeDate], [AdminResetPasswordToken], [WebAdminResetPasswordToken], [WAMsgVisit], [WAMsgBusiness], [Status], [TransDate], [IsDeleted]) VALUES (5, 1004, N'Proprietorship', N'Shine Collection', N'Deepak', 2021, N'Yes', N'', N'', N'', N'', N'', N'', N' ', N'Ajmer Road', N'Sector 5', N'356', N'8', N'1', 302010, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Diamond', CAST(N'2024-04-04' AS Date), CAST(N'2025-04-04' AS Date), N'info@shinecollection.com', N'U2hpbmVAMTIzIw==', CAST(N'2024-04-04T15:32:53.023' AS DateTime), N'info@shinecollection.com', N'U2hpbmVAMTIzIw==', CAST(N'2024-04-04T15:32:53.023' AS DateTime), N'', N'', N'', N'', N'Active  ', CAST(N'2024-04-04T15:31:46.277' AS DateTime), 1)
INSERT [dbo].[MstOrganization] ([OrgID], [OrgCode], [OrgType], [OrgName], [ContactPerson], [EstYear], [MultiBranch], [AffiliatedTo], [AffiliationNo], [SchoolMoto], [RegistrationNo], [BoardUniversity], [Web], [Logo], [Address1], [Address2], [Country], [State], [City], [PinNo], [Phone], [Mobile], [Email], [PANNo], [GSTINNo], [BankAccount], [BankCode], [BankBranch], [BankIFSC], [SubsType], [SubsFrom], [SubsTo], [AdminEmail], [AdminPwd], [PwdChangeDate], [WebAdminEmail], [WebAdminPwd], [WebPwdChangeDate], [AdminResetPasswordToken], [WebAdminResetPasswordToken], [WAMsgVisit], [WAMsgBusiness], [Status], [TransDate], [IsDeleted]) VALUES (6, 1005, N'', N'Tara Furniture', N'Rahees', 1999, N'Yes', N'Own', N'Own', N'Test', N'9876467545667', N'UP', N'http://oms.50percent.com', N'Tara_Furniture-1005.png', N'Ejaz Nagar', N'Old City', N'356', N'9', N'48', 243006, N'9568499004', N'9568499005', N'rahees@gmail.com', N'hgtyk6765k', N'09AAACH7409R1ZZ', N'768678678768768', N'4', N'Baroda', N'BARB0BRGBXX', N'Diamond', CAST(N'2024-04-02' AS Date), CAST(N'2025-04-05' AS Date), N'rahees@gmail.com', N'cmFoZWVzQDEyMw==', CAST(N'2024-04-05T11:28:31.493' AS DateTime), N'rahees@gmail.com', N'cmFoZWVzQDEyMw==', CAST(N'2024-04-05T11:28:31.493' AS DateTime), N'', N'', N'', N'', N'Active  ', CAST(N'2024-04-05T11:25:50.653' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[MstOrganization] OFF
GO
SET IDENTITY_INSERT [dbo].[MstOrgLicense] ON 

INSERT [dbo].[MstOrgLicense] ([LicenseID], [LicenseName], [LicenseKey], [OrgCode], [MaxUsers], [MaxVisitors], [Status], [TransDate], [IsDeleted]) VALUES (1, N'Silver', N'93b9cee3-ab15-47de-940f-b1c99491fa0c', 1001, 10, 100, N'Active  ', CAST(N'2024-03-26T14:33:05.867' AS DateTime), 0)
INSERT [dbo].[MstOrgLicense] ([LicenseID], [LicenseName], [LicenseKey], [OrgCode], [MaxUsers], [MaxVisitors], [Status], [TransDate], [IsDeleted]) VALUES (2, N'Diamond', N'89d04c5b-7d3c-42e7-94da-d7e7dbcfd3cd', 1000, 10, 10, N'Active  ', CAST(N'2024-03-26T14:45:26.250' AS DateTime), 0)
INSERT [dbo].[MstOrgLicense] ([LicenseID], [LicenseName], [LicenseKey], [OrgCode], [MaxUsers], [MaxVisitors], [Status], [TransDate], [IsDeleted]) VALUES (3, N'Diamond', N'f5a51612-a34d-4302-9073-43a114c49db1', 1000, 10, 20, N'Active  ', CAST(N'2024-03-26T15:09:45.227' AS DateTime), 0)
INSERT [dbo].[MstOrgLicense] ([LicenseID], [LicenseName], [LicenseKey], [OrgCode], [MaxUsers], [MaxVisitors], [Status], [TransDate], [IsDeleted]) VALUES (4, N'Diamond', N'ab621840-98b7-495a-ae62-12d65f8d0609', 1004, 2, 5000, N'Active  ', CAST(N'2024-04-04T15:33:08.680' AS DateTime), 0)
INSERT [dbo].[MstOrgLicense] ([LicenseID], [LicenseName], [LicenseKey], [OrgCode], [MaxUsers], [MaxVisitors], [Status], [TransDate], [IsDeleted]) VALUES (5, N'Diamond', N'2c606ebb-5c65-4bd5-a975-a6332ca39696', 1005, 10, 5000, N'Active  ', CAST(N'2024-04-05T11:28:46.153' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[MstOrgLicense] OFF
GO
SET IDENTITY_INSERT [dbo].[MstProduct] ON 

INSERT [dbo].[MstProduct] ([ProdId], [OrgCode], [ProdCode], [CatCode], [SubCatCode], [Name], [Image], [UoM], [GSTRate], [Rate], [Status], [TransDate], [IsDeleted]) VALUES (1, 1004, N'PC001', N'C001', N'CS0011', N'bizproda', N'SubCat-1004-1.jpg', N'BGS', N'18', N'350', N'Active  ', CAST(N'2024-04-05T10:00:19.790' AS DateTime), 0)
INSERT [dbo].[MstProduct] ([ProdId], [OrgCode], [ProdCode], [CatCode], [SubCatCode], [Name], [Image], [UoM], [GSTRate], [Rate], [Status], [TransDate], [IsDeleted]) VALUES (2, 1004, N'PC002', N'C002', N'CS0012', N'trk', N'SubCat-1004-2.jpg', N'BTL', N'18', N'355', N'Active  ', CAST(N'2024-04-05T10:01:04.050' AS DateTime), 0)
INSERT [dbo].[MstProduct] ([ProdId], [OrgCode], [ProdCode], [CatCode], [SubCatCode], [Name], [Image], [UoM], [GSTRate], [Rate], [Status], [TransDate], [IsDeleted]) VALUES (3, 1004, N'MBP001', N'C002', N'CS0012', N'bizpro', N'SubCat-1004-3.jpg', N'BGS', N'18', N'780', N'Active  ', CAST(N'2024-04-05T10:01:59.730' AS DateTime), 0)
INSERT [dbo].[MstProduct] ([ProdId], [OrgCode], [ProdCode], [CatCode], [SubCatCode], [Name], [Image], [UoM], [GSTRate], [Rate], [Status], [TransDate], [IsDeleted]) VALUES (4, 1005, N'FTP001', N'TB001', N'TSC02', N'Table ', N'Prod-1005-4.jpg', N'BOX', N'18', N'250', N'Active  ', CAST(N'2024-04-05T11:40:35.017' AS DateTime), 0)
INSERT [dbo].[MstProduct] ([ProdId], [OrgCode], [ProdCode], [CatCode], [SubCatCode], [Name], [Image], [UoM], [GSTRate], [Rate], [Status], [TransDate], [IsDeleted]) VALUES (5, 1005, N'FTC002', N'TB001', N'TSC01', N'Folding Table ', N'SubCat-1005-5.jpg', N'BLK', N'18', N'550', N'Active  ', CAST(N'2024-04-05T11:41:25.430' AS DateTime), 0)
INSERT [dbo].[MstProduct] ([ProdId], [OrgCode], [ProdCode], [CatCode], [SubCatCode], [Name], [Image], [UoM], [GSTRate], [Rate], [Status], [TransDate], [IsDeleted]) VALUES (6, 1005, N'FCC001', N'CH001', N'CSC01', N'Folding Chair', N'SubCat-1005-6.jpg', N'BOX', N'18', N'355', N'Active  ', CAST(N'2024-04-05T11:42:25.697' AS DateTime), 0)
INSERT [dbo].[MstProduct] ([ProdId], [OrgCode], [ProdCode], [CatCode], [SubCatCode], [Name], [Image], [UoM], [GSTRate], [Rate], [Status], [TransDate], [IsDeleted]) VALUES (7, 1005, N'CWSC002', N'CH001', N'CSC02', N'Chair With Sofa ', N'SubCat-1005-7.jpg', N'BOX', N'18', N'1000', N'Active  ', CAST(N'2024-04-05T11:43:09.510' AS DateTime), 0)
INSERT [dbo].[MstProduct] ([ProdId], [OrgCode], [ProdCode], [CatCode], [SubCatCode], [Name], [Image], [UoM], [GSTRate], [Rate], [Status], [TransDate], [IsDeleted]) VALUES (8, 1005, N'SWBC01', N'SC001', N'SSC01', N'Sofa', N'SubCat-1005-8.jpg', N'BOU', N'18', N'1200', N'Active  ', CAST(N'2024-04-05T11:43:40.763' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[MstProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[MstSubCategory] ON 

INSERT [dbo].[MstSubCategory] ([SubCatId], [OrgCode], [SubCatCode], [CatCode], [SubCatName], [SubCatImg], [Status], [TransDate], [IsDeleted]) VALUES (1, 1004, N'CS0011', N'C001', N'Sub Candle Stand ', N'SubCat-1004-1.jpg', N'Active  ', CAST(N'2024-04-05T09:59:41.300' AS DateTime), 0)
INSERT [dbo].[MstSubCategory] ([SubCatId], [OrgCode], [SubCatCode], [CatCode], [SubCatName], [SubCatImg], [Status], [TransDate], [IsDeleted]) VALUES (2, 1004, N'CS0012', N'C002', N'Sub Candle Stand one', N'SubCat-1004-2.jpg', N'Active  ', CAST(N'2024-04-05T09:59:57.120' AS DateTime), 0)
INSERT [dbo].[MstSubCategory] ([SubCatId], [OrgCode], [SubCatCode], [CatCode], [SubCatName], [SubCatImg], [Status], [TransDate], [IsDeleted]) VALUES (3, 1005, N'TSC01', N'TB001', N'Folding Table ', N'SubCat-1005-3.jpg', N'Active  ', CAST(N'2024-04-05T11:36:12.260' AS DateTime), 0)
INSERT [dbo].[MstSubCategory] ([SubCatId], [OrgCode], [SubCatCode], [CatCode], [SubCatName], [SubCatImg], [Status], [TransDate], [IsDeleted]) VALUES (4, 1005, N'TSC02', N'TB001', N'Study Table', N'SubCat-1005-4.jpg', N'Active  ', CAST(N'2024-04-05T11:36:56.720' AS DateTime), 0)
INSERT [dbo].[MstSubCategory] ([SubCatId], [OrgCode], [SubCatCode], [CatCode], [SubCatName], [SubCatImg], [Status], [TransDate], [IsDeleted]) VALUES (5, 1005, N'CSC01', N'CH001', N'Folding Chair', N'SubCat-1005-5.jpg', N'Active  ', CAST(N'2024-04-05T11:37:39.160' AS DateTime), 0)
INSERT [dbo].[MstSubCategory] ([SubCatId], [OrgCode], [SubCatCode], [CatCode], [SubCatName], [SubCatImg], [Status], [TransDate], [IsDeleted]) VALUES (6, 1005, N'CSC02', N'CH001', N'Chair With Sofa ', N'SubCat-1005-6.jpg', N'Active  ', CAST(N'2024-04-05T11:38:18.803' AS DateTime), 0)
INSERT [dbo].[MstSubCategory] ([SubCatId], [OrgCode], [SubCatCode], [CatCode], [SubCatName], [SubCatImg], [Status], [TransDate], [IsDeleted]) VALUES (7, 1005, N'SSC01', N'SC001', N'Sofa with Bed', N'SubCat-1005-7.jpg', N'Active  ', CAST(N'2024-04-05T11:39:38.250' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[MstSubCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[MstUsers] ON 

INSERT [dbo].[MstUsers] ([UserId], [OrgCode], [CustCode], [UserName], [UserEmail], [UserDOB], [UserPhoto], [UserType], [LoginId], [LoginPwd], [SysPwd], [PwdChangeDate], [Mobile], [Address1], [Address2], [Country], [State], [City], [PinNo], [PAN], [GST], [TermPay], [TermDelivery], [Remarks], [AboutUs], [Status], [TransDate], [IsDeleted]) VALUES (1, 1000, N'CS002', N'Sameer', N'sameer@gmail.com', CAST(N'1999-02-14T00:00:00.000' AS DateTime), N'User-1.png', N'Employee', N'sameer@gmail.com', N'U2FtZWVyQDEyMyM=', N'SUJQVEAxMjMj', CAST(N'2024-03-21T14:00:52.917' AS DateTime), N'9634030123', N'
Ejaz Nagar Goitiya Old City Bareilly
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'I''m Sameer', N'Active  ', CAST(N'2024-03-21T14:00:52.920' AS DateTime), 0)
INSERT [dbo].[MstUsers] ([UserId], [OrgCode], [CustCode], [UserName], [UserEmail], [UserDOB], [UserPhoto], [UserType], [LoginId], [LoginPwd], [SysPwd], [PwdChangeDate], [Mobile], [Address1], [Address2], [Country], [State], [City], [PinNo], [PAN], [GST], [TermPay], [TermDelivery], [Remarks], [AboutUs], [Status], [TransDate], [IsDeleted]) VALUES (2, 1001, N'CS003', N'Tauheed', N'tauheed@gmail.com', CAST(N'2024-03-14T00:00:00.000' AS DateTime), N'User-2.jpg', N'Employee', N'tauheed@gmail.com', N'MTIx', N'SUJQVEAxMjMj', CAST(N'2024-03-21T14:19:03.763' AS DateTime), N'9808906154', N'
Ejaz Nagar Goitiya Old City Bareilly
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'I''m Tauheed', N'Active  ', CAST(N'2024-03-21T14:19:03.767' AS DateTime), 0)
INSERT [dbo].[MstUsers] ([UserId], [OrgCode], [CustCode], [UserName], [UserEmail], [UserDOB], [UserPhoto], [UserType], [LoginId], [LoginPwd], [SysPwd], [PwdChangeDate], [Mobile], [Address1], [Address2], [Country], [State], [City], [PinNo], [PAN], [GST], [TermPay], [TermDelivery], [Remarks], [AboutUs], [Status], [TransDate], [IsDeleted]) VALUES (3, 1000, N'CS004', N'Tanzeem Raza Khan', N'tanzeem@gmail.com', CAST(N'2024-03-26T00:00:00.000' AS DateTime), N'', N'Employee', N'tanzeem@gmail.com', N'VGFuemVlbUAxMjMj', N'SUJQVEAxMjMj', CAST(N'2024-03-26T15:42:48.100' AS DateTime), N'9874569874', N'
Ejaz Nagar Goitiya Old City Bareilly
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Not', N'Active  ', CAST(N'2024-03-26T15:42:48.100' AS DateTime), 0)
INSERT [dbo].[MstUsers] ([UserId], [OrgCode], [CustCode], [UserName], [UserEmail], [UserDOB], [UserPhoto], [UserType], [LoginId], [LoginPwd], [SysPwd], [PwdChangeDate], [Mobile], [Address1], [Address2], [Country], [State], [City], [PinNo], [PAN], [GST], [TermPay], [TermDelivery], [Remarks], [AboutUs], [Status], [TransDate], [IsDeleted]) VALUES (4, 1002, N'CS005', N'Aman Singh', N'aman@Stellans.com', CAST(N'2001-03-26T00:00:00.000' AS DateTime), N'', N'Employee', N'aman@Stellans.com', N'QW1hbkAxMjMj', N'SUJQVEAxMjMj', CAST(N'2024-03-26T16:26:42.630' AS DateTime), N'9214312200', N'
Ejaz Nagar Goitiya Old City Bareilly
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Aman is a very hardworking professional at Stellans. ', N'Active  ', CAST(N'2024-03-26T16:26:42.630' AS DateTime), 0)
INSERT [dbo].[MstUsers] ([UserId], [OrgCode], [CustCode], [UserName], [UserEmail], [UserDOB], [UserPhoto], [UserType], [LoginId], [LoginPwd], [SysPwd], [PwdChangeDate], [Mobile], [Address1], [Address2], [Country], [State], [City], [PinNo], [PAN], [GST], [TermPay], [TermDelivery], [Remarks], [AboutUs], [Status], [TransDate], [IsDeleted]) VALUES (5, 1001, N'CS001', N'tanzeem', N'tanzeem@gmail.com', CAST(N'2024-04-04T00:00:00.000' AS DateTime), N'User-5.jpg', N'Employee', N'tanzeem@gmail.com', N'VGFuemVlbUAxMjM=', N'SUJQVEAxMjMj', CAST(N'2024-03-30T11:08:05.520' AS DateTime), N'9560499004', N'sadas', N'Test Address', NULL, NULL, NULL, NULL, N'Texx Pan', N'text GST  ', N'Txt Pay amount', N'Text Delivry', N'dsfsdfs', N'sdfsdsdfasd', N'Active  ', CAST(N'2024-03-30T11:08:05.520' AS DateTime), 0)
INSERT [dbo].[MstUsers] ([UserId], [OrgCode], [CustCode], [UserName], [UserEmail], [UserDOB], [UserPhoto], [UserType], [LoginId], [LoginPwd], [SysPwd], [PwdChangeDate], [Mobile], [Address1], [Address2], [Country], [State], [City], [PinNo], [PAN], [GST], [TermPay], [TermDelivery], [Remarks], [AboutUs], [Status], [TransDate], [IsDeleted]) VALUES (6, 1000, N'TAN001', N'tanzeem', N'tanzeem@gmail.com', CAST(N'2024-04-12T00:00:00.000' AS DateTime), N'User-6.png', N'Employee', N'tanzeem@gmail.com', N'VGFuemVlbUAxMjM=', N'SUJQVEAxMjMj', CAST(N'2024-04-04T11:21:34.440' AS DateTime), N'9560499004', N'Krishna Sweet', N'Test Address', NULL, NULL, NULL, NULL, N'Hgyuk6767h', N'09AAACH7409R1ZZ', N'we', N'wer', N'dsfsdfs', N'sadfsgsdfgsdfgsfd', N'Active  ', CAST(N'2024-04-04T11:22:18.040' AS DateTime), 0)
INSERT [dbo].[MstUsers] ([UserId], [OrgCode], [CustCode], [UserName], [UserEmail], [UserDOB], [UserPhoto], [UserType], [LoginId], [LoginPwd], [SysPwd], [PwdChangeDate], [Mobile], [Address1], [Address2], [Country], [State], [City], [PinNo], [PAN], [GST], [TermPay], [TermDelivery], [Remarks], [AboutUs], [Status], [TransDate], [IsDeleted]) VALUES (7, 1000, N'Sma01', N'tanzeem', N'Sha@gmail.com', CAST(N'2024-04-26T00:00:00.000' AS DateTime), N'User-7.jpg', N'Employee', N'Sha@gmail.com', N'U2hhQDEyMzQ=', N'SUJQVEAxMjMj', CAST(N'2024-04-04T11:24:46.667' AS DateTime), N'9560499004', N'Krishna Sweet', N'Test Address', NULL, NULL, NULL, NULL, N'Hgyuk6767h', N'09AAACH7409R1ZZ', N'Txt Pay', N'Text Delivry', N'werwe', N'dsfsafsafsfsadf', N'Active  ', CAST(N'2024-04-04T11:24:46.667' AS DateTime), 0)
INSERT [dbo].[MstUsers] ([UserId], [OrgCode], [CustCode], [UserName], [UserEmail], [UserDOB], [UserPhoto], [UserType], [LoginId], [LoginPwd], [SysPwd], [PwdChangeDate], [Mobile], [Address1], [Address2], [Country], [State], [City], [PinNo], [PAN], [GST], [TermPay], [TermDelivery], [Remarks], [AboutUs], [Status], [TransDate], [IsDeleted]) VALUES (8, 1004, N'CUST001', N'Raj Kumar', N'raj@kumar.com', CAST(N'2001-04-04T00:00:00.000' AS DateTime), N'', N'Employee', N'raj@kumar.com', N'UmFqQDEyMyM=', N'SUJQVEAxMjMj', CAST(N'2024-04-04T15:53:06.750' AS DateTime), N'9876789870', N'Ajmer Road', N'Jaipur', NULL, NULL, NULL, NULL, N'Hgyuk6767h', N'09AAACH7409R1ZZ', N'15 Days', N'7 Days', N'New Customer', N'New Customer', N'Active  ', CAST(N'2024-04-04T15:53:06.753' AS DateTime), 0)
INSERT [dbo].[MstUsers] ([UserId], [OrgCode], [CustCode], [UserName], [UserEmail], [UserDOB], [UserPhoto], [UserType], [LoginId], [LoginPwd], [SysPwd], [PwdChangeDate], [Mobile], [Address1], [Address2], [Country], [State], [City], [PinNo], [PAN], [GST], [TermPay], [TermDelivery], [Remarks], [AboutUs], [Status], [TransDate], [IsDeleted]) VALUES (9, 1004, N'CUST002', N'Ravi', N'ravi@kumar.com', CAST(N'2001-04-04T00:00:00.000' AS DateTime), N'', N'Employee', N'ravi@kumar.com', N'UmF2aUAxMjMj', N'SUJQVEAxMjMj', CAST(N'2024-04-04T15:55:00.233' AS DateTime), N'9876543213', N'Alwar Road', N'Ajmer', NULL, NULL, NULL, NULL, N'Hgyuk6767h', N'09AAACH7409R1ZZ', N'7 Days', N'7 Days', N'Demo', N'Demo', N'Active  ', CAST(N'2024-04-04T15:55:00.240' AS DateTime), 0)
INSERT [dbo].[MstUsers] ([UserId], [OrgCode], [CustCode], [UserName], [UserEmail], [UserDOB], [UserPhoto], [UserType], [LoginId], [LoginPwd], [SysPwd], [PwdChangeDate], [Mobile], [Address1], [Address2], [Country], [State], [City], [PinNo], [PAN], [GST], [TermPay], [TermDelivery], [Remarks], [AboutUs], [Status], [TransDate], [IsDeleted]) VALUES (10, 1005, N'TA001', N'Tayyab', N'tayyab@gmail.com', CAST(N'2024-04-10T00:00:00.000' AS DateTime), N'User-10.png', N'Employee', N'tayyab@gmail.com', N'dGF5eWFiQDEyMw==', N'SUJQVEAxMjMj', CAST(N'2024-04-05T11:31:41.477' AS DateTime), N'9878998891', N'Ejaz Nagar', N'Near noori Masjid ', 356, 9, 48, N'243006', N'hujkf5656h', N'09AAACH7409R1ZZ', N'15 dayes', N'7 Days', N'Done', N'Hello My Name Is Tayyab ', N'Active  ', CAST(N'2024-04-05T11:31:41.483' AS DateTime), 0)
INSERT [dbo].[MstUsers] ([UserId], [OrgCode], [CustCode], [UserName], [UserEmail], [UserDOB], [UserPhoto], [UserType], [LoginId], [LoginPwd], [SysPwd], [PwdChangeDate], [Mobile], [Address1], [Address2], [Country], [State], [City], [PinNo], [PAN], [GST], [TermPay], [TermDelivery], [Remarks], [AboutUs], [Status], [TransDate], [IsDeleted]) VALUES (11, 1005, N'Sh001', N'Shazad Malik', N'shazad@gmail.com', CAST(N'2024-04-02T00:00:00.000' AS DateTime), N'User-11.jpg', N'Employee', N'shazad@gmail.com', N'c2hhemFkQDEyMw==', N'SUJQVEAxMjMj', CAST(N'2024-04-05T11:33:12.347' AS DateTime), N'9560499004', N'Ajaz Nagar Goutiya ', N'Near noori Masjid ', 356, 9, 48, N'243006', N'Hgyuk6767h', N'09AAACH7409R1ZZ', N'15 Days', N'7 Days', N'Done', N'i AM Shazad ', N'Active  ', CAST(N'2024-04-05T11:33:12.353' AS DateTime), 0)
INSERT [dbo].[MstUsers] ([UserId], [OrgCode], [CustCode], [UserName], [UserEmail], [UserDOB], [UserPhoto], [UserType], [LoginId], [LoginPwd], [SysPwd], [PwdChangeDate], [Mobile], [Address1], [Address2], [Country], [State], [City], [PinNo], [PAN], [GST], [TermPay], [TermDelivery], [Remarks], [AboutUs], [Status], [TransDate], [IsDeleted]) VALUES (12, 1005, N'SA001', N'Sameer Khan', N'sameer@gmail.com', CAST(N'2024-04-03T00:00:00.000' AS DateTime), N'', N'Employee', N'sameerkhan@gmail.com', N'c2FtZWVyQDEyMw==', N'SUJQVEAxMjMj', CAST(N'2024-04-06T13:16:07.957' AS DateTime), N'9560499004', N'Ajaz Nagar Goutiya ', N'Near noori Masjid', 356, 9, 48, N'243006', N'Hgyuk6767h', N'09AAACH7409R1ZZ', N'15 Days', N'7 Days', N'New Customer', N'New Customer Sameer ', N'Active  ', CAST(N'2024-04-06T13:16:07.967' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[MstUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[TranAANoti] ON 

INSERT [dbo].[TranAANoti] ([NotiId], [OrgCode], [NotiType], [UserId], [UserType], [NotiTitle], [ValidFrom], [ValidTo], [NotiFile], [NotiDesc], [TransDate], [IsDeleted]) VALUES (1, 1005, N'1', 0, N'Employee', N'Welcome', CAST(N'2024-04-06T00:00:00.000' AS DateTime), CAST(N'2024-04-06T00:00:00.000' AS DateTime), N'', N'Welcome', CAST(N'2024-04-06T11:46:41.057' AS DateTime), 0)
INSERT [dbo].[TranAANoti] ([NotiId], [OrgCode], [NotiType], [UserId], [UserType], [NotiTitle], [ValidFrom], [ValidTo], [NotiFile], [NotiDesc], [TransDate], [IsDeleted]) VALUES (2, 1005, N'2', 11, N'Employee', N'Message for Shahzad', CAST(N'2024-04-06T00:00:00.000' AS DateTime), CAST(N'2024-04-08T00:00:00.000' AS DateTime), N'', N'Message for Shahzad', CAST(N'2024-04-06T11:47:14.833' AS DateTime), 0)
INSERT [dbo].[TranAANoti] ([NotiId], [OrgCode], [NotiType], [UserId], [UserType], [NotiTitle], [ValidFrom], [ValidTo], [NotiFile], [NotiDesc], [TransDate], [IsDeleted]) VALUES (3, 1005, N'1', 0, N'Employee', N'New Message for All', CAST(N'2024-04-06T00:00:00.000' AS DateTime), CAST(N'2024-04-07T00:00:00.000' AS DateTime), N'', N'New Message for All', CAST(N'2024-04-06T15:53:30.283' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[TranAANoti] OFF
GO
SET IDENTITY_INSERT [dbo].[TranLoginAudit] ON 

INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (1, 1000, N'rakesh@gmail.com', N'DESKTOP-VCSBUDJ', N'192.168.1.38   ', 1, CAST(N'2024-03-27T13:14:32.897' AS DateTime), CAST(N'2024-03-27T13:14:32.897' AS DateTime), CAST(N'2024-03-27T13:14:32.897' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (2, 1000, N'rakesh@gmail.com', N'DESKTOP-VCSBUDJ', N'192.168.1.38   ', 1, CAST(N'2024-03-27T13:17:23.383' AS DateTime), CAST(N'2024-03-27T13:17:23.383' AS DateTime), CAST(N'2024-03-27T13:17:23.383' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (3, 1000, N'rakesh@gmail.com', N'DESKTOP-VCSBUDJ', N'192.168.1.38   ', 1, CAST(N'2024-03-27T13:36:06.427' AS DateTime), CAST(N'2024-03-27T13:36:06.427' AS DateTime), CAST(N'2024-03-27T13:36:06.427' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (4, 1000, N'rakesh@gmail.com', N'DESKTOP-VCSBUDJ', N'192.168.1.38   ', 1, CAST(N'2024-03-27T13:37:42.960' AS DateTime), CAST(N'2024-03-27T13:37:42.960' AS DateTime), CAST(N'2024-03-27T13:37:42.960' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (5, 1000, N'rakesh@gmail.com', N'DESKTOP-VCSBUDJ', N'192.168.1.38   ', 1, CAST(N'2024-03-27T13:44:06.597' AS DateTime), CAST(N'2024-03-27T13:44:06.597' AS DateTime), CAST(N'2024-03-27T13:44:06.597' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (6, 1000, N'rakesh@gmail.com', N'DESKTOP-VCSBUDJ', N'192.168.1.38   ', 1, CAST(N'2024-03-27T14:04:13.140' AS DateTime), CAST(N'2024-03-27T14:04:13.140' AS DateTime), CAST(N'2024-03-27T14:04:13.140' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (7, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-27T15:48:29.277' AS DateTime), CAST(N'2024-03-27T15:53:10.877' AS DateTime), CAST(N'2024-03-27T15:48:29.277' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (8, NULL, N'sa', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-27T15:53:27.273' AS DateTime), CAST(N'2024-03-27T15:54:16.887' AS DateTime), CAST(N'2024-03-27T15:53:27.273' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (9, NULL, N'sa', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-27T16:04:10.737' AS DateTime), CAST(N'2024-03-27T16:05:59.883' AS DateTime), CAST(N'2024-03-27T16:04:10.737' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (10, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-27T16:06:12.630' AS DateTime), CAST(N'2024-03-27T16:06:12.630' AS DateTime), CAST(N'2024-03-27T16:06:12.630' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (11, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-27T16:26:12.893' AS DateTime), CAST(N'2024-03-27T16:26:12.893' AS DateTime), CAST(N'2024-03-27T16:26:12.893' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (12, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-27T16:45:02.083' AS DateTime), CAST(N'2024-03-27T16:45:02.083' AS DateTime), CAST(N'2024-03-27T16:45:02.083' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (13, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-27T16:53:29.553' AS DateTime), CAST(N'2024-03-27T16:53:29.553' AS DateTime), CAST(N'2024-03-27T16:53:29.553' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (14, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-27T17:04:53.373' AS DateTime), CAST(N'2024-03-27T17:04:53.373' AS DateTime), CAST(N'2024-03-27T17:04:53.373' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (15, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-27T17:06:44.570' AS DateTime), CAST(N'2024-03-27T17:06:44.570' AS DateTime), CAST(N'2024-03-27T17:06:44.570' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (16, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-27T17:13:26.340' AS DateTime), CAST(N'2024-03-27T17:13:26.340' AS DateTime), CAST(N'2024-03-27T17:13:26.340' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (17, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-27T17:26:02.617' AS DateTime), CAST(N'2024-03-27T17:34:29.500' AS DateTime), CAST(N'2024-03-27T17:26:02.617' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (18, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-27T17:31:07.750' AS DateTime), CAST(N'2024-03-27T17:31:07.750' AS DateTime), CAST(N'2024-03-27T17:31:07.750' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (19, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-27T17:34:37.840' AS DateTime), CAST(N'2024-03-28T10:10:17.810' AS DateTime), CAST(N'2024-03-27T17:34:37.840' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (20, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T10:10:33.123' AS DateTime), CAST(N'2024-03-28T10:24:42.633' AS DateTime), CAST(N'2024-03-28T10:10:33.123' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (21, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T10:24:51.240' AS DateTime), CAST(N'2024-03-28T10:27:16.600' AS DateTime), CAST(N'2024-03-28T10:24:51.240' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (22, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T10:27:22.457' AS DateTime), CAST(N'2024-03-28T10:51:40.173' AS DateTime), CAST(N'2024-03-28T10:27:22.457' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (23, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T10:51:44.643' AS DateTime), CAST(N'2024-03-28T11:09:55.363' AS DateTime), CAST(N'2024-03-28T10:51:44.643' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (24, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T11:10:00.543' AS DateTime), CAST(N'2024-03-28T11:28:52.873' AS DateTime), CAST(N'2024-03-28T11:10:00.543' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (25, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T11:28:57.677' AS DateTime), CAST(N'2024-03-28T11:55:10.090' AS DateTime), CAST(N'2024-03-28T11:28:57.677' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (26, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T11:55:15.210' AS DateTime), CAST(N'2024-03-28T12:03:46.167' AS DateTime), CAST(N'2024-03-28T11:55:15.210' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (27, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T12:03:50.833' AS DateTime), CAST(N'2024-03-28T12:09:08.203' AS DateTime), CAST(N'2024-03-28T12:03:50.833' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (28, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T12:09:14.350' AS DateTime), CAST(N'2024-03-28T12:09:39.857' AS DateTime), CAST(N'2024-03-28T12:09:14.350' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (29, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T12:09:43.987' AS DateTime), CAST(N'2024-03-28T12:18:31.907' AS DateTime), CAST(N'2024-03-28T12:09:43.987' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (30, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T12:18:36.070' AS DateTime), CAST(N'2024-03-28T12:27:03.190' AS DateTime), CAST(N'2024-03-28T12:18:36.070' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (31, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T12:27:08.983' AS DateTime), CAST(N'2024-03-28T12:31:01.620' AS DateTime), CAST(N'2024-03-28T12:27:08.983' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (32, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T12:31:06.567' AS DateTime), CAST(N'2024-03-28T12:35:38.243' AS DateTime), CAST(N'2024-03-28T12:31:06.567' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (33, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T12:35:42.747' AS DateTime), CAST(N'2024-03-28T12:40:53.153' AS DateTime), CAST(N'2024-03-28T12:35:42.747' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (34, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T12:40:57.410' AS DateTime), CAST(N'2024-03-28T12:46:43.030' AS DateTime), CAST(N'2024-03-28T12:40:57.410' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (35, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T12:46:47.080' AS DateTime), CAST(N'2024-03-28T12:50:35.753' AS DateTime), CAST(N'2024-03-28T12:46:47.080' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (36, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T12:50:39.930' AS DateTime), CAST(N'2024-03-28T12:52:32.887' AS DateTime), CAST(N'2024-03-28T12:50:39.930' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (37, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T12:52:36.917' AS DateTime), CAST(N'2024-03-28T13:04:57.873' AS DateTime), CAST(N'2024-03-28T12:52:36.917' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (38, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T13:05:02.027' AS DateTime), CAST(N'2024-03-28T13:08:10.920' AS DateTime), CAST(N'2024-03-28T13:05:02.027' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (39, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T13:08:16.380' AS DateTime), CAST(N'2024-03-28T13:16:11.767' AS DateTime), CAST(N'2024-03-28T13:08:16.380' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (40, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T13:16:16.690' AS DateTime), CAST(N'2024-03-28T13:17:10.760' AS DateTime), CAST(N'2024-03-28T13:16:16.690' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (41, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T13:17:14.743' AS DateTime), CAST(N'2024-03-28T13:20:02.363' AS DateTime), CAST(N'2024-03-28T13:17:14.743' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (42, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T13:20:06.367' AS DateTime), CAST(N'2024-03-28T13:24:01.120' AS DateTime), CAST(N'2024-03-28T13:20:06.367' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (43, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T13:24:04.850' AS DateTime), CAST(N'2024-03-28T13:27:47.967' AS DateTime), CAST(N'2024-03-28T13:24:04.850' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (44, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T13:27:52.647' AS DateTime), CAST(N'2024-03-28T13:40:22.307' AS DateTime), CAST(N'2024-03-28T13:27:52.647' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (45, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T13:40:34.000' AS DateTime), CAST(N'2024-03-28T13:42:04.850' AS DateTime), CAST(N'2024-03-28T13:40:34.000' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (46, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T13:42:08.933' AS DateTime), CAST(N'2024-03-28T14:13:04.437' AS DateTime), CAST(N'2024-03-28T13:42:08.933' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (47, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T14:13:08.323' AS DateTime), CAST(N'2024-03-28T14:30:17.157' AS DateTime), CAST(N'2024-03-28T14:13:08.323' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (48, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T14:30:22.697' AS DateTime), CAST(N'2024-03-28T14:35:29.627' AS DateTime), CAST(N'2024-03-28T14:30:22.697' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (49, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T14:35:34.513' AS DateTime), CAST(N'2024-03-28T14:41:50.880' AS DateTime), CAST(N'2024-03-28T14:35:34.513' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (50, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T14:41:55.620' AS DateTime), CAST(N'2024-03-28T14:53:41.623' AS DateTime), CAST(N'2024-03-28T14:41:55.620' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (51, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T14:53:47.353' AS DateTime), CAST(N'2024-03-28T15:06:27.687' AS DateTime), CAST(N'2024-03-28T14:53:47.353' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (52, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T15:06:44.033' AS DateTime), CAST(N'2024-03-28T15:06:44.033' AS DateTime), CAST(N'2024-03-28T15:06:44.033' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (53, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T15:08:28.920' AS DateTime), CAST(N'2024-03-28T15:10:07.903' AS DateTime), CAST(N'2024-03-28T15:08:28.920' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (54, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T15:10:12.937' AS DateTime), CAST(N'2024-03-28T16:09:56.710' AS DateTime), CAST(N'2024-03-28T15:10:12.937' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (55, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T16:10:01.950' AS DateTime), CAST(N'2024-03-28T17:06:34.783' AS DateTime), CAST(N'2024-03-28T16:10:01.950' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (56, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T17:06:39.860' AS DateTime), CAST(N'2024-03-28T17:19:20.927' AS DateTime), CAST(N'2024-03-28T17:06:39.860' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (57, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-28T17:19:27.750' AS DateTime), CAST(N'2024-03-29T09:51:24.477' AS DateTime), CAST(N'2024-03-28T17:19:27.750' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (58, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T09:51:31.950' AS DateTime), CAST(N'2024-03-29T09:56:41.823' AS DateTime), CAST(N'2024-03-29T09:51:31.950' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (59, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T09:56:46.123' AS DateTime), CAST(N'2024-03-29T10:00:33.633' AS DateTime), CAST(N'2024-03-29T09:56:46.123' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (60, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T10:00:38.490' AS DateTime), CAST(N'2024-03-29T10:05:14.660' AS DateTime), CAST(N'2024-03-29T10:00:38.490' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (61, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T10:05:19.187' AS DateTime), CAST(N'2024-03-29T10:08:22.100' AS DateTime), CAST(N'2024-03-29T10:05:19.187' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (62, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T10:08:26.313' AS DateTime), CAST(N'2024-03-29T10:25:16.440' AS DateTime), CAST(N'2024-03-29T10:08:26.313' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (63, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T10:25:20.460' AS DateTime), CAST(N'2024-03-29T10:33:26.897' AS DateTime), CAST(N'2024-03-29T10:25:20.460' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (64, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T10:33:31.127' AS DateTime), CAST(N'2024-03-29T10:46:03.987' AS DateTime), CAST(N'2024-03-29T10:33:31.127' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (65, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T10:46:10.283' AS DateTime), CAST(N'2024-03-29T10:50:47.483' AS DateTime), CAST(N'2024-03-29T10:46:10.283' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (66, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T10:50:51.930' AS DateTime), CAST(N'2024-03-29T10:55:40.703' AS DateTime), CAST(N'2024-03-29T10:50:51.930' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (67, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T10:55:45.597' AS DateTime), CAST(N'2024-03-29T11:04:17.567' AS DateTime), CAST(N'2024-03-29T10:55:45.597' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (68, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T11:04:21.813' AS DateTime), CAST(N'2024-03-29T11:17:43.973' AS DateTime), CAST(N'2024-03-29T11:04:21.813' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (69, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T11:17:48.433' AS DateTime), CAST(N'2024-03-29T11:23:18.417' AS DateTime), CAST(N'2024-03-29T11:17:48.433' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (70, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T11:23:23.163' AS DateTime), CAST(N'2024-03-29T11:34:53.403' AS DateTime), CAST(N'2024-03-29T11:23:23.163' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (71, NULL, N'sa', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T11:35:12.463' AS DateTime), CAST(N'2024-03-29T11:35:12.463' AS DateTime), CAST(N'2024-03-29T11:35:12.463' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (72, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T11:35:59.753' AS DateTime), CAST(N'2024-03-29T11:35:59.753' AS DateTime), CAST(N'2024-03-29T11:35:59.753' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (73, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'               ', 1, CAST(N'2024-03-29T11:37:59.680' AS DateTime), CAST(N'2024-03-29T12:00:15.107' AS DateTime), CAST(N'2024-03-29T11:37:59.680' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (74, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'               ', 1, CAST(N'2024-03-29T12:00:19.383' AS DateTime), CAST(N'2024-03-29T12:03:26.633' AS DateTime), CAST(N'2024-03-29T12:00:19.383' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (75, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'               ', 1, CAST(N'2024-03-29T12:03:31.210' AS DateTime), CAST(N'2024-03-29T12:20:12.607' AS DateTime), CAST(N'2024-03-29T12:03:31.210' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (76, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'               ', 1, CAST(N'2024-03-29T12:20:17.293' AS DateTime), CAST(N'2024-03-29T12:34:36.827' AS DateTime), CAST(N'2024-03-29T12:20:17.293' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (77, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T12:34:41.817' AS DateTime), CAST(N'2024-03-29T12:36:47.427' AS DateTime), CAST(N'2024-03-29T12:34:41.817' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (78, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T12:36:52.323' AS DateTime), CAST(N'2024-03-29T12:41:54.013' AS DateTime), CAST(N'2024-03-29T12:36:52.323' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (79, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T12:41:58.817' AS DateTime), CAST(N'2024-03-29T12:45:26.703' AS DateTime), CAST(N'2024-03-29T12:41:58.817' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (80, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T12:45:31.447' AS DateTime), CAST(N'2024-03-29T12:51:45.717' AS DateTime), CAST(N'2024-03-29T12:45:31.447' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (81, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T12:51:50.173' AS DateTime), CAST(N'2024-03-29T14:30:54.893' AS DateTime), CAST(N'2024-03-29T12:51:50.173' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (82, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T14:30:58.710' AS DateTime), CAST(N'2024-03-29T15:05:43.957' AS DateTime), CAST(N'2024-03-29T14:30:58.710' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (83, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T15:05:49.917' AS DateTime), CAST(N'2024-03-29T15:23:30.113' AS DateTime), CAST(N'2024-03-29T15:05:49.917' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (84, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T15:23:35.140' AS DateTime), CAST(N'2024-03-29T15:30:37.377' AS DateTime), CAST(N'2024-03-29T15:23:35.140' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (85, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T15:30:42.393' AS DateTime), CAST(N'2024-03-29T15:41:58.780' AS DateTime), CAST(N'2024-03-29T15:30:42.393' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (86, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T15:42:02.773' AS DateTime), CAST(N'2024-03-29T16:12:14.463' AS DateTime), CAST(N'2024-03-29T15:42:02.773' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (87, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T16:12:18.533' AS DateTime), CAST(N'2024-03-29T16:17:01.890' AS DateTime), CAST(N'2024-03-29T16:12:18.533' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (88, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T16:17:08.297' AS DateTime), CAST(N'2024-03-29T16:20:23.630' AS DateTime), CAST(N'2024-03-29T16:17:08.297' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (89, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T16:20:27.813' AS DateTime), CAST(N'2024-03-29T16:25:21.370' AS DateTime), CAST(N'2024-03-29T16:20:27.813' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (90, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T16:25:27.453' AS DateTime), CAST(N'2024-03-29T16:47:33.853' AS DateTime), CAST(N'2024-03-29T16:25:27.453' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (91, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T16:47:37.970' AS DateTime), CAST(N'2024-03-29T17:09:26.727' AS DateTime), CAST(N'2024-03-29T16:47:37.970' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (92, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T17:09:34.860' AS DateTime), CAST(N'2024-03-29T17:18:33.567' AS DateTime), CAST(N'2024-03-29T17:09:34.860' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (93, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T17:18:38.323' AS DateTime), CAST(N'2024-03-29T17:25:44.820' AS DateTime), CAST(N'2024-03-29T17:18:38.323' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (94, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-29T17:26:08.840' AS DateTime), CAST(N'2024-03-30T08:32:40.780' AS DateTime), CAST(N'2024-03-29T17:26:08.840' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (95, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.243.252', 1, CAST(N'2024-03-30T08:32:50.940' AS DateTime), CAST(N'2024-03-30T08:38:18.577' AS DateTime), CAST(N'2024-03-30T08:32:50.940' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (96, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.243.252', 1, CAST(N'2024-03-30T08:38:24.050' AS DateTime), CAST(N'2024-03-30T08:46:56.623' AS DateTime), CAST(N'2024-03-30T08:38:24.050' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (97, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.243.252', 1, CAST(N'2024-03-30T08:47:08.080' AS DateTime), CAST(N'2024-03-30T09:01:24.890' AS DateTime), CAST(N'2024-03-30T08:47:08.080' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (98, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.243.252', 1, CAST(N'2024-03-30T09:01:31.233' AS DateTime), CAST(N'2024-03-30T09:07:02.917' AS DateTime), CAST(N'2024-03-30T09:01:31.233' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (99, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.243.252', 1, CAST(N'2024-03-30T09:07:08.560' AS DateTime), CAST(N'2024-03-30T09:12:40.647' AS DateTime), CAST(N'2024-03-30T09:07:08.560' AS DateTime), 0)
GO
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (100, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.243.252', 1, CAST(N'2024-03-30T09:12:46.623' AS DateTime), CAST(N'2024-03-30T09:20:20.787' AS DateTime), CAST(N'2024-03-30T09:12:46.623' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (101, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.243.252', 1, CAST(N'2024-03-30T09:21:30.940' AS DateTime), CAST(N'2024-03-30T09:33:39.450' AS DateTime), CAST(N'2024-03-30T09:21:30.940' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (102, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.243.252', 1, CAST(N'2024-03-30T09:33:45.670' AS DateTime), CAST(N'2024-03-30T09:36:49.120' AS DateTime), CAST(N'2024-03-30T09:33:45.670' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (103, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.243.252', 1, CAST(N'2024-03-30T09:36:56.860' AS DateTime), CAST(N'2024-03-30T09:41:27.137' AS DateTime), CAST(N'2024-03-30T09:36:56.860' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (104, NULL, N'sa', N'DESKTOP-82OSQ6M', N'192.168.243.252', 1, CAST(N'2024-03-30T09:41:42.767' AS DateTime), CAST(N'2024-03-30T09:41:42.767' AS DateTime), CAST(N'2024-03-30T09:41:42.767' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (105, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.243.252', 1, CAST(N'2024-03-30T09:42:32.263' AS DateTime), CAST(N'2024-03-30T09:42:32.263' AS DateTime), CAST(N'2024-03-30T09:42:32.263' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (106, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.243.252', 1, CAST(N'2024-03-30T09:49:15.507' AS DateTime), CAST(N'2024-03-30T09:58:11.667' AS DateTime), CAST(N'2024-03-30T09:49:15.507' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (107, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.243.252', 1, CAST(N'2024-03-30T09:58:18.210' AS DateTime), CAST(N'2024-03-30T10:07:45.910' AS DateTime), CAST(N'2024-03-30T09:58:18.210' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (108, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.243.252', 1, CAST(N'2024-03-30T10:08:18.353' AS DateTime), CAST(N'2024-03-30T10:13:25.303' AS DateTime), CAST(N'2024-03-30T10:08:18.353' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (109, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T10:13:29.953' AS DateTime), CAST(N'2024-03-30T11:22:54.873' AS DateTime), CAST(N'2024-03-30T10:13:29.953' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (110, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T10:24:17.883' AS DateTime), CAST(N'2024-03-30T10:24:17.883' AS DateTime), CAST(N'2024-03-30T10:24:17.883' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (111, NULL, N'sa', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T10:24:49.800' AS DateTime), CAST(N'2024-03-30T10:24:49.800' AS DateTime), CAST(N'2024-03-30T10:24:49.800' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (112, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T10:26:29.430' AS DateTime), CAST(N'2024-03-30T10:26:29.430' AS DateTime), CAST(N'2024-03-30T10:26:29.430' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (113, NULL, N'sa', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T10:26:53.987' AS DateTime), CAST(N'2024-03-30T10:26:53.987' AS DateTime), CAST(N'2024-03-30T10:26:53.987' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (114, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T10:28:16.853' AS DateTime), CAST(N'2024-03-30T10:28:16.853' AS DateTime), CAST(N'2024-03-30T10:28:16.853' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (115, NULL, N'sa', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T10:52:03.163' AS DateTime), CAST(N'2024-03-30T10:52:03.163' AS DateTime), CAST(N'2024-03-30T10:52:03.163' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (116, NULL, N'sa', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T10:53:43.347' AS DateTime), CAST(N'2024-03-30T10:53:43.347' AS DateTime), CAST(N'2024-03-30T10:53:43.347' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (117, 1001, N'info@fourcrossmedia.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T10:54:04.510' AS DateTime), CAST(N'2024-03-30T10:54:04.510' AS DateTime), CAST(N'2024-03-30T10:54:04.510' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (118, 1001, N'info@fourcrossmedia.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T11:03:41.673' AS DateTime), CAST(N'2024-03-30T11:03:41.673' AS DateTime), CAST(N'2024-03-30T11:03:41.673' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (119, 1001, N'info@fourcrossmedia.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T11:09:56.010' AS DateTime), CAST(N'2024-03-30T11:09:56.010' AS DateTime), CAST(N'2024-03-30T11:09:56.010' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (120, 1001, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T11:10:32.703' AS DateTime), CAST(N'2024-03-30T11:13:59.650' AS DateTime), CAST(N'2024-03-30T11:10:32.703' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (121, 1001, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T11:14:02.813' AS DateTime), CAST(N'2024-03-30T11:16:26.100' AS DateTime), CAST(N'2024-03-30T11:14:02.813' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (122, 1001, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T11:16:30.963' AS DateTime), CAST(N'2024-03-30T11:18:36.270' AS DateTime), CAST(N'2024-03-30T11:16:30.963' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (123, 1001, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T11:18:40.760' AS DateTime), CAST(N'2024-03-30T11:22:22.543' AS DateTime), CAST(N'2024-03-30T11:18:40.760' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (124, 1001, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T11:22:29.207' AS DateTime), CAST(N'2024-04-02T12:50:10.940' AS DateTime), CAST(N'2024-03-30T11:22:29.207' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (125, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T11:23:03.377' AS DateTime), CAST(N'2024-03-30T11:41:50.510' AS DateTime), CAST(N'2024-03-30T11:23:03.377' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (126, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T11:41:56.200' AS DateTime), CAST(N'2024-03-30T12:15:20.823' AS DateTime), CAST(N'2024-03-30T11:41:56.200' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (127, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T12:15:25.307' AS DateTime), CAST(N'2024-03-30T12:16:33.423' AS DateTime), CAST(N'2024-03-30T12:15:25.307' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (128, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T12:16:41.033' AS DateTime), CAST(N'2024-03-30T12:22:36.853' AS DateTime), CAST(N'2024-03-30T12:16:41.033' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (129, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T12:22:42.227' AS DateTime), CAST(N'2024-03-30T12:44:39.723' AS DateTime), CAST(N'2024-03-30T12:22:42.227' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (130, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T12:44:45.727' AS DateTime), CAST(N'2024-03-30T12:54:48.747' AS DateTime), CAST(N'2024-03-30T12:44:45.727' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (131, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T12:55:03.303' AS DateTime), CAST(N'2024-03-30T13:00:09.913' AS DateTime), CAST(N'2024-03-30T12:55:03.303' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (132, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T13:00:14.207' AS DateTime), CAST(N'2024-03-30T13:02:23.340' AS DateTime), CAST(N'2024-03-30T13:00:14.207' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (133, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T13:02:27.720' AS DateTime), CAST(N'2024-03-30T13:06:31.603' AS DateTime), CAST(N'2024-03-30T13:02:27.720' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (134, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T13:06:37.690' AS DateTime), CAST(N'2024-03-30T13:16:21.563' AS DateTime), CAST(N'2024-03-30T13:06:37.690' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (135, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T13:16:27.850' AS DateTime), CAST(N'2024-03-30T13:17:50.057' AS DateTime), CAST(N'2024-03-30T13:16:27.850' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (136, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T13:17:54.543' AS DateTime), CAST(N'2024-03-30T13:20:53.353' AS DateTime), CAST(N'2024-03-30T13:17:54.543' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (137, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T13:20:57.523' AS DateTime), CAST(N'2024-03-30T14:40:40.087' AS DateTime), CAST(N'2024-03-30T13:20:57.523' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (138, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T14:40:43.870' AS DateTime), CAST(N'2024-03-30T14:42:06.307' AS DateTime), CAST(N'2024-03-30T14:40:43.870' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (139, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T14:42:12.033' AS DateTime), CAST(N'2024-03-30T14:49:40.567' AS DateTime), CAST(N'2024-03-30T14:42:12.033' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (140, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T14:49:46.467' AS DateTime), CAST(N'2024-03-30T14:58:36.753' AS DateTime), CAST(N'2024-03-30T14:49:46.467' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (141, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T14:58:41.713' AS DateTime), CAST(N'2024-03-30T15:10:56.387' AS DateTime), CAST(N'2024-03-30T14:58:41.713' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (142, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T15:11:00.657' AS DateTime), CAST(N'2024-03-30T15:48:36.473' AS DateTime), CAST(N'2024-03-30T15:11:00.657' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (143, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T15:48:41.437' AS DateTime), CAST(N'2024-03-30T16:02:56.630' AS DateTime), CAST(N'2024-03-30T15:48:41.437' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (144, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T16:03:01.513' AS DateTime), CAST(N'2024-03-30T16:09:13.743' AS DateTime), CAST(N'2024-03-30T16:03:01.513' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (145, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T16:09:20.503' AS DateTime), CAST(N'2024-03-30T16:31:16.977' AS DateTime), CAST(N'2024-03-30T16:09:20.503' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (146, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T16:31:21.953' AS DateTime), CAST(N'2024-03-30T16:49:27.933' AS DateTime), CAST(N'2024-03-30T16:31:21.953' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (147, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-03-30T16:49:32.817' AS DateTime), CAST(N'2024-04-01T09:56:55.917' AS DateTime), CAST(N'2024-03-30T16:49:32.817' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (148, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T09:57:01.693' AS DateTime), CAST(N'2024-04-01T10:24:25.517' AS DateTime), CAST(N'2024-04-01T09:57:01.693' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (149, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T10:24:30.670' AS DateTime), CAST(N'2024-04-01T10:40:01.613' AS DateTime), CAST(N'2024-04-01T10:24:30.670' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (150, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T10:40:05.870' AS DateTime), CAST(N'2024-04-01T10:49:47.193' AS DateTime), CAST(N'2024-04-01T10:40:05.870' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (151, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T10:49:51.860' AS DateTime), CAST(N'2024-04-01T11:15:37.647' AS DateTime), CAST(N'2024-04-01T10:49:51.860' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (152, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T11:15:41.693' AS DateTime), CAST(N'2024-04-01T11:18:23.837' AS DateTime), CAST(N'2024-04-01T11:15:41.693' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (153, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T11:18:27.420' AS DateTime), CAST(N'2024-04-01T11:19:56.590' AS DateTime), CAST(N'2024-04-01T11:18:27.420' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (154, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T11:20:01.743' AS DateTime), CAST(N'2024-04-01T11:25:44.327' AS DateTime), CAST(N'2024-04-01T11:20:01.743' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (155, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T11:25:48.670' AS DateTime), CAST(N'2024-04-01T11:28:56.013' AS DateTime), CAST(N'2024-04-01T11:25:48.670' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (156, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T11:29:00.357' AS DateTime), CAST(N'2024-04-01T11:29:36.740' AS DateTime), CAST(N'2024-04-01T11:29:00.357' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (157, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T11:29:40.780' AS DateTime), CAST(N'2024-04-01T11:36:36.973' AS DateTime), CAST(N'2024-04-01T11:29:40.780' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (158, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T11:36:41.130' AS DateTime), CAST(N'2024-04-01T11:39:30.043' AS DateTime), CAST(N'2024-04-01T11:36:41.130' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (159, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T11:39:34.770' AS DateTime), CAST(N'2024-04-01T11:46:28.830' AS DateTime), CAST(N'2024-04-01T11:39:34.770' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (160, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T11:46:32.370' AS DateTime), CAST(N'2024-04-01T11:46:59.000' AS DateTime), CAST(N'2024-04-01T11:46:32.370' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (161, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T11:47:05.553' AS DateTime), CAST(N'2024-04-01T11:55:27.540' AS DateTime), CAST(N'2024-04-01T11:47:05.553' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (162, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T11:55:31.370' AS DateTime), CAST(N'2024-04-01T11:59:28.387' AS DateTime), CAST(N'2024-04-01T11:55:31.370' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (163, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T11:59:34.150' AS DateTime), CAST(N'2024-04-01T12:01:22.793' AS DateTime), CAST(N'2024-04-01T11:59:34.150' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (164, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T12:01:27.523' AS DateTime), CAST(N'2024-04-01T12:08:57.247' AS DateTime), CAST(N'2024-04-01T12:01:27.523' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (165, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T12:09:01.037' AS DateTime), CAST(N'2024-04-01T12:09:52.703' AS DateTime), CAST(N'2024-04-01T12:09:01.037' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (166, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T12:09:57.180' AS DateTime), CAST(N'2024-04-01T12:19:58.580' AS DateTime), CAST(N'2024-04-01T12:09:57.180' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (167, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T12:20:02.413' AS DateTime), CAST(N'2024-04-01T12:22:52.607' AS DateTime), CAST(N'2024-04-01T12:20:02.413' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (168, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T12:22:55.980' AS DateTime), CAST(N'2024-04-01T12:23:24.763' AS DateTime), CAST(N'2024-04-01T12:22:55.980' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (169, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T12:23:29.443' AS DateTime), CAST(N'2024-04-01T12:25:10.290' AS DateTime), CAST(N'2024-04-01T12:23:29.443' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (170, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T12:25:15.780' AS DateTime), CAST(N'2024-04-01T12:27:29.920' AS DateTime), CAST(N'2024-04-01T12:25:15.780' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (171, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T12:27:34.250' AS DateTime), CAST(N'2024-04-01T12:39:31.723' AS DateTime), CAST(N'2024-04-01T12:27:34.250' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (172, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T12:39:35.613' AS DateTime), CAST(N'2024-04-01T12:41:13.480' AS DateTime), CAST(N'2024-04-01T12:39:35.613' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (173, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T12:41:17.647' AS DateTime), CAST(N'2024-04-01T12:45:39.550' AS DateTime), CAST(N'2024-04-01T12:41:17.647' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (174, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T12:45:44.240' AS DateTime), CAST(N'2024-04-01T12:47:16.373' AS DateTime), CAST(N'2024-04-01T12:45:44.240' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (175, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T12:47:23.093' AS DateTime), CAST(N'2024-04-01T12:51:36.373' AS DateTime), CAST(N'2024-04-01T12:47:23.093' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (176, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T12:51:41.687' AS DateTime), CAST(N'2024-04-01T12:56:05.850' AS DateTime), CAST(N'2024-04-01T12:51:41.687' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (177, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T12:56:09.550' AS DateTime), CAST(N'2024-04-01T12:58:16.930' AS DateTime), CAST(N'2024-04-01T12:56:09.550' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (178, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T12:58:20.957' AS DateTime), CAST(N'2024-04-01T13:07:00.553' AS DateTime), CAST(N'2024-04-01T12:58:20.957' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (179, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T13:07:05.073' AS DateTime), CAST(N'2024-04-01T13:08:56.373' AS DateTime), CAST(N'2024-04-01T13:07:05.073' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (180, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T13:09:01.113' AS DateTime), CAST(N'2024-04-01T13:16:48.310' AS DateTime), CAST(N'2024-04-01T13:09:01.113' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (181, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T13:16:52.257' AS DateTime), CAST(N'2024-04-01T13:18:52.183' AS DateTime), CAST(N'2024-04-01T13:16:52.257' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (182, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T13:18:56.267' AS DateTime), CAST(N'2024-04-01T13:19:47.830' AS DateTime), CAST(N'2024-04-01T13:18:56.267' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (183, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T13:19:52.197' AS DateTime), CAST(N'2024-04-01T13:21:07.603' AS DateTime), CAST(N'2024-04-01T13:19:52.197' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (184, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T13:21:11.620' AS DateTime), CAST(N'2024-04-01T13:25:22.563' AS DateTime), CAST(N'2024-04-01T13:21:11.620' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (185, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T13:25:27.200' AS DateTime), CAST(N'2024-04-01T13:27:17.667' AS DateTime), CAST(N'2024-04-01T13:25:27.200' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (186, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T13:27:22.620' AS DateTime), CAST(N'2024-04-01T13:28:55.163' AS DateTime), CAST(N'2024-04-01T13:27:22.620' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (187, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T13:28:59.057' AS DateTime), CAST(N'2024-04-01T13:47:31.463' AS DateTime), CAST(N'2024-04-01T13:28:59.057' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (188, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T13:47:36.080' AS DateTime), CAST(N'2024-04-01T13:59:08.120' AS DateTime), CAST(N'2024-04-01T13:47:36.080' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (189, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T13:59:14.880' AS DateTime), CAST(N'2024-04-01T14:04:23.387' AS DateTime), CAST(N'2024-04-01T13:59:14.880' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (190, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T14:04:27.630' AS DateTime), CAST(N'2024-04-01T14:15:57.380' AS DateTime), CAST(N'2024-04-01T14:04:27.630' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (191, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T14:16:01.700' AS DateTime), CAST(N'2024-04-01T14:30:44.517' AS DateTime), CAST(N'2024-04-01T14:16:01.700' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (192, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T14:30:48.390' AS DateTime), CAST(N'2024-04-01T14:33:43.213' AS DateTime), CAST(N'2024-04-01T14:30:48.390' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (193, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T14:35:38.360' AS DateTime), CAST(N'2024-04-01T14:55:47.070' AS DateTime), CAST(N'2024-04-01T14:35:38.360' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (194, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T14:55:51.280' AS DateTime), CAST(N'2024-04-01T15:01:08.263' AS DateTime), CAST(N'2024-04-01T14:55:51.280' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (195, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T15:01:12.993' AS DateTime), CAST(N'2024-04-01T15:07:31.833' AS DateTime), CAST(N'2024-04-01T15:01:12.993' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (196, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T15:07:35.650' AS DateTime), CAST(N'2024-04-01T15:10:34.507' AS DateTime), CAST(N'2024-04-01T15:07:35.650' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (197, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T15:10:40.387' AS DateTime), CAST(N'2024-04-01T15:13:58.017' AS DateTime), CAST(N'2024-04-01T15:10:40.387' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (198, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T15:14:02.513' AS DateTime), CAST(N'2024-04-01T15:15:32.180' AS DateTime), CAST(N'2024-04-01T15:14:02.513' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (199, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T15:15:37.730' AS DateTime), CAST(N'2024-04-01T15:18:00.370' AS DateTime), CAST(N'2024-04-01T15:15:37.730' AS DateTime), 0)
GO
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (200, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T15:18:04.640' AS DateTime), CAST(N'2024-04-01T15:21:19.020' AS DateTime), CAST(N'2024-04-01T15:18:04.640' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (201, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T15:21:23.360' AS DateTime), CAST(N'2024-04-01T15:26:49.483' AS DateTime), CAST(N'2024-04-01T15:21:23.360' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (202, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T15:26:54.870' AS DateTime), CAST(N'2024-04-01T15:29:44.977' AS DateTime), CAST(N'2024-04-01T15:26:54.870' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (203, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T15:29:49.257' AS DateTime), CAST(N'2024-04-01T15:35:41.530' AS DateTime), CAST(N'2024-04-01T15:29:49.257' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (204, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T15:35:46.093' AS DateTime), CAST(N'2024-04-01T15:48:35.730' AS DateTime), CAST(N'2024-04-01T15:35:46.093' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (205, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T15:49:02.670' AS DateTime), CAST(N'2024-04-01T15:49:02.670' AS DateTime), CAST(N'2024-04-01T15:49:02.670' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (206, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T16:01:54.027' AS DateTime), CAST(N'2024-04-01T16:01:54.027' AS DateTime), CAST(N'2024-04-01T16:01:54.027' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (207, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T16:26:40.550' AS DateTime), CAST(N'2024-04-01T16:26:40.550' AS DateTime), CAST(N'2024-04-01T16:26:40.550' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (208, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T16:43:26.727' AS DateTime), CAST(N'2024-04-01T16:43:26.727' AS DateTime), CAST(N'2024-04-01T16:43:26.727' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (209, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T16:47:36.040' AS DateTime), CAST(N'2024-04-01T16:47:36.040' AS DateTime), CAST(N'2024-04-01T16:47:36.040' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (210, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T16:57:52.453' AS DateTime), CAST(N'2024-04-01T17:23:14.683' AS DateTime), CAST(N'2024-04-01T16:57:52.453' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (211, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T17:23:23.730' AS DateTime), CAST(N'2024-04-01T17:25:59.253' AS DateTime), CAST(N'2024-04-01T17:23:23.730' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (212, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T17:26:05.240' AS DateTime), CAST(N'2024-04-01T17:35:42.210' AS DateTime), CAST(N'2024-04-01T17:26:05.240' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (213, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T17:35:48.530' AS DateTime), CAST(N'2024-04-02T10:06:52.033' AS DateTime), CAST(N'2024-04-01T17:35:48.530' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (214, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-01T17:36:04.033' AS DateTime), CAST(N'2024-04-01T17:36:04.033' AS DateTime), CAST(N'2024-04-01T17:36:04.033' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (215, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T09:49:51.697' AS DateTime), CAST(N'2024-04-02T09:49:51.697' AS DateTime), CAST(N'2024-04-02T09:49:51.697' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (216, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T10:03:51.830' AS DateTime), CAST(N'2024-04-02T10:03:51.830' AS DateTime), CAST(N'2024-04-02T10:03:51.830' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (217, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T10:06:59.523' AS DateTime), CAST(N'2024-04-02T10:25:41.017' AS DateTime), CAST(N'2024-04-02T10:06:59.523' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (218, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T10:25:44.990' AS DateTime), CAST(N'2024-04-02T13:57:16.570' AS DateTime), CAST(N'2024-04-02T10:25:44.990' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (219, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T10:25:55.280' AS DateTime), CAST(N'2024-04-02T10:25:55.280' AS DateTime), CAST(N'2024-04-02T10:25:55.280' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (220, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T10:42:54.153' AS DateTime), CAST(N'2024-04-02T10:42:54.153' AS DateTime), CAST(N'2024-04-02T10:42:54.153' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (221, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T11:23:01.463' AS DateTime), CAST(N'2024-04-02T11:23:01.463' AS DateTime), CAST(N'2024-04-02T11:23:01.463' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (222, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T11:24:49.597' AS DateTime), CAST(N'2024-04-02T11:24:49.597' AS DateTime), CAST(N'2024-04-02T11:24:49.597' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (223, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T11:44:08.737' AS DateTime), CAST(N'2024-04-02T11:44:08.737' AS DateTime), CAST(N'2024-04-02T11:44:08.737' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (224, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T11:58:00.587' AS DateTime), CAST(N'2024-04-02T11:58:00.587' AS DateTime), CAST(N'2024-04-02T11:58:00.587' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (225, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T12:03:45.537' AS DateTime), CAST(N'2024-04-02T12:03:45.537' AS DateTime), CAST(N'2024-04-02T12:03:45.537' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (226, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T12:05:32.227' AS DateTime), CAST(N'2024-04-02T12:05:32.227' AS DateTime), CAST(N'2024-04-02T12:05:32.227' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (227, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T12:23:18.520' AS DateTime), CAST(N'2024-04-02T12:23:18.520' AS DateTime), CAST(N'2024-04-02T12:23:18.520' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (228, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T12:35:32.617' AS DateTime), CAST(N'2024-04-02T12:35:32.617' AS DateTime), CAST(N'2024-04-02T12:35:32.617' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (229, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T12:38:16.827' AS DateTime), CAST(N'2024-04-02T12:38:16.827' AS DateTime), CAST(N'2024-04-02T12:38:16.827' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (230, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T12:42:28.490' AS DateTime), CAST(N'2024-04-02T12:42:28.490' AS DateTime), CAST(N'2024-04-02T12:42:28.490' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (231, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T12:50:22.803' AS DateTime), CAST(N'2024-04-02T14:28:49.730' AS DateTime), CAST(N'2024-04-02T12:50:22.803' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (232, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T12:58:27.470' AS DateTime), CAST(N'2024-04-02T12:58:27.470' AS DateTime), CAST(N'2024-04-02T12:58:27.470' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (233, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T13:03:05.687' AS DateTime), CAST(N'2024-04-02T13:03:05.687' AS DateTime), CAST(N'2024-04-02T13:03:05.687' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (234, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T13:07:27.930' AS DateTime), CAST(N'2024-04-02T13:07:27.930' AS DateTime), CAST(N'2024-04-02T13:07:27.930' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (235, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T13:11:31.623' AS DateTime), CAST(N'2024-04-02T13:11:31.623' AS DateTime), CAST(N'2024-04-02T13:11:31.623' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (236, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T13:33:47.447' AS DateTime), CAST(N'2024-04-02T13:33:47.447' AS DateTime), CAST(N'2024-04-02T13:33:47.447' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (237, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T13:44:33.990' AS DateTime), CAST(N'2024-04-02T13:44:33.990' AS DateTime), CAST(N'2024-04-02T13:44:33.990' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (238, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T13:57:22.853' AS DateTime), CAST(N'2024-04-02T14:07:34.690' AS DateTime), CAST(N'2024-04-02T13:57:22.853' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (239, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T14:07:38.883' AS DateTime), CAST(N'2024-04-02T14:09:33.620' AS DateTime), CAST(N'2024-04-02T14:07:38.883' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (240, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T14:09:37.583' AS DateTime), CAST(N'2024-04-02T14:11:00.157' AS DateTime), CAST(N'2024-04-02T14:09:37.583' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (241, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T14:11:04.000' AS DateTime), CAST(N'2024-04-02T14:12:58.523' AS DateTime), CAST(N'2024-04-02T14:11:04.000' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (242, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T14:13:02.477' AS DateTime), CAST(N'2024-04-02T14:17:34.640' AS DateTime), CAST(N'2024-04-02T14:13:02.477' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (243, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T14:17:38.693' AS DateTime), CAST(N'2024-04-02T14:20:14.670' AS DateTime), CAST(N'2024-04-02T14:17:38.693' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (244, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T14:20:20.567' AS DateTime), CAST(N'2024-04-02T14:22:29.400' AS DateTime), CAST(N'2024-04-02T14:20:20.567' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (245, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T14:22:33.640' AS DateTime), CAST(N'2024-04-02T14:28:09.487' AS DateTime), CAST(N'2024-04-02T14:22:33.640' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (246, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T14:28:13.690' AS DateTime), CAST(N'2024-04-02T14:28:41.260' AS DateTime), CAST(N'2024-04-02T14:28:13.690' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (247, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T14:29:01.820' AS DateTime), CAST(N'2024-04-02T14:45:49.400' AS DateTime), CAST(N'2024-04-02T14:29:01.820' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (248, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T14:44:51.810' AS DateTime), CAST(N'2024-04-02T14:44:51.810' AS DateTime), CAST(N'2024-04-02T14:44:51.810' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (249, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T14:45:56.727' AS DateTime), CAST(N'2024-04-02T15:11:31.360' AS DateTime), CAST(N'2024-04-02T14:45:56.727' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (250, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T14:55:25.310' AS DateTime), CAST(N'2024-04-02T14:59:05.463' AS DateTime), CAST(N'2024-04-02T14:55:25.310' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (251, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T14:59:17.470' AS DateTime), CAST(N'2024-04-02T14:59:17.470' AS DateTime), CAST(N'2024-04-02T14:59:17.470' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (252, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T15:06:53.447' AS DateTime), CAST(N'2024-04-02T15:11:18.530' AS DateTime), CAST(N'2024-04-02T15:06:53.447' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (253, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T15:11:47.327' AS DateTime), CAST(N'2024-04-02T15:14:22.827' AS DateTime), CAST(N'2024-04-02T15:11:47.327' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (254, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T15:14:29.737' AS DateTime), CAST(N'2024-04-02T15:23:10.983' AS DateTime), CAST(N'2024-04-02T15:14:29.737' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (255, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T15:23:16.907' AS DateTime), CAST(N'2024-04-02T15:31:15.290' AS DateTime), CAST(N'2024-04-02T15:23:16.907' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (256, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T15:30:55.133' AS DateTime), CAST(N'2024-04-02T15:30:55.133' AS DateTime), CAST(N'2024-04-02T15:30:55.133' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (257, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T15:31:21.953' AS DateTime), CAST(N'2024-04-03T11:11:10.387' AS DateTime), CAST(N'2024-04-02T15:31:21.953' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (258, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T15:35:59.667' AS DateTime), CAST(N'2024-04-02T15:35:59.667' AS DateTime), CAST(N'2024-04-02T15:35:59.667' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (259, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T15:41:35.380' AS DateTime), CAST(N'2024-04-02T15:41:35.380' AS DateTime), CAST(N'2024-04-02T15:41:35.380' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (260, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T15:48:32.797' AS DateTime), CAST(N'2024-04-02T15:48:32.797' AS DateTime), CAST(N'2024-04-02T15:48:32.797' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (261, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T15:49:36.823' AS DateTime), CAST(N'2024-04-02T15:58:27.997' AS DateTime), CAST(N'2024-04-02T15:49:36.823' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (262, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T15:57:39.797' AS DateTime), CAST(N'2024-04-02T15:57:39.797' AS DateTime), CAST(N'2024-04-02T15:57:39.797' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (263, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T15:58:36.277' AS DateTime), CAST(N'2024-04-02T16:06:12.587' AS DateTime), CAST(N'2024-04-02T15:58:36.277' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (264, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:04:56.700' AS DateTime), CAST(N'2024-04-02T16:04:56.700' AS DateTime), CAST(N'2024-04-02T16:04:56.700' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (265, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:06:21.950' AS DateTime), CAST(N'2024-04-02T16:13:28.943' AS DateTime), CAST(N'2024-04-02T16:06:21.950' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (266, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:10:15.560' AS DateTime), CAST(N'2024-04-02T16:10:15.560' AS DateTime), CAST(N'2024-04-02T16:10:15.560' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (267, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:13:04.007' AS DateTime), CAST(N'2024-04-02T16:13:04.007' AS DateTime), CAST(N'2024-04-02T16:13:04.007' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (268, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:13:46.853' AS DateTime), CAST(N'2024-04-02T16:17:01.150' AS DateTime), CAST(N'2024-04-02T16:13:46.853' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (269, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:17:07.833' AS DateTime), CAST(N'2024-04-02T16:22:29.950' AS DateTime), CAST(N'2024-04-02T16:17:07.833' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (270, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:22:34.870' AS DateTime), CAST(N'2024-04-02T16:23:45.217' AS DateTime), CAST(N'2024-04-02T16:22:34.870' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (271, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:23:49.610' AS DateTime), CAST(N'2024-04-02T16:24:29.300' AS DateTime), CAST(N'2024-04-02T16:23:49.610' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (272, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:24:07.653' AS DateTime), CAST(N'2024-04-02T16:24:07.653' AS DateTime), CAST(N'2024-04-02T16:24:07.653' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (273, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:24:39.973' AS DateTime), CAST(N'2024-04-02T16:49:16.143' AS DateTime), CAST(N'2024-04-02T16:24:39.973' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (274, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:28:03.060' AS DateTime), CAST(N'2024-04-02T16:28:03.060' AS DateTime), CAST(N'2024-04-02T16:28:03.060' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (275, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:42:00.207' AS DateTime), CAST(N'2024-04-02T16:42:00.207' AS DateTime), CAST(N'2024-04-02T16:42:00.207' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (276, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:45:37.290' AS DateTime), CAST(N'2024-04-02T16:45:37.290' AS DateTime), CAST(N'2024-04-02T16:45:37.290' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (277, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:47:18.107' AS DateTime), CAST(N'2024-04-02T16:47:18.107' AS DateTime), CAST(N'2024-04-02T16:47:18.107' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (278, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:48:47.433' AS DateTime), CAST(N'2024-04-02T16:48:47.433' AS DateTime), CAST(N'2024-04-02T16:48:47.433' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (279, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:49:26.183' AS DateTime), CAST(N'2024-04-02T16:55:15.283' AS DateTime), CAST(N'2024-04-02T16:49:26.183' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (280, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:55:21.083' AS DateTime), CAST(N'2024-04-02T16:56:18.153' AS DateTime), CAST(N'2024-04-02T16:55:21.083' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (281, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:56:21.997' AS DateTime), CAST(N'2024-04-02T16:57:15.833' AS DateTime), CAST(N'2024-04-02T16:56:21.997' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (282, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T16:57:19.913' AS DateTime), CAST(N'2024-04-02T17:02:00.547' AS DateTime), CAST(N'2024-04-02T16:57:19.913' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (283, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T17:02:05.327' AS DateTime), CAST(N'2024-04-02T17:10:05.597' AS DateTime), CAST(N'2024-04-02T17:02:05.327' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (284, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T17:10:09.900' AS DateTime), CAST(N'2024-04-02T17:13:03.257' AS DateTime), CAST(N'2024-04-02T17:10:09.900' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (285, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T17:13:09.440' AS DateTime), CAST(N'2024-04-02T17:15:57.083' AS DateTime), CAST(N'2024-04-02T17:13:09.440' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (286, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T17:16:01.923' AS DateTime), CAST(N'2024-04-02T17:16:23.287' AS DateTime), CAST(N'2024-04-02T17:16:01.923' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (287, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T17:20:22.080' AS DateTime), CAST(N'2024-04-02T17:21:00.070' AS DateTime), CAST(N'2024-04-02T17:20:22.080' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (288, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T17:21:04.807' AS DateTime), CAST(N'2024-04-03T11:40:01.793' AS DateTime), CAST(N'2024-04-02T17:21:04.807' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (289, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T17:21:59.810' AS DateTime), CAST(N'2024-04-02T17:21:59.810' AS DateTime), CAST(N'2024-04-02T17:21:59.810' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (290, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T17:28:59.847' AS DateTime), CAST(N'2024-04-02T17:28:59.847' AS DateTime), CAST(N'2024-04-02T17:28:59.847' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (291, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-02T17:42:10.460' AS DateTime), CAST(N'2024-04-02T17:42:10.460' AS DateTime), CAST(N'2024-04-02T17:42:10.460' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (292, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T10:15:24.077' AS DateTime), CAST(N'2024-04-03T10:15:24.077' AS DateTime), CAST(N'2024-04-03T10:15:24.077' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (293, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T10:17:25.577' AS DateTime), CAST(N'2024-04-03T10:17:25.577' AS DateTime), CAST(N'2024-04-03T10:17:25.577' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (294, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T10:20:09.290' AS DateTime), CAST(N'2024-04-03T10:20:09.290' AS DateTime), CAST(N'2024-04-03T10:20:09.290' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (295, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T10:23:34.877' AS DateTime), CAST(N'2024-04-03T10:23:34.877' AS DateTime), CAST(N'2024-04-03T10:23:34.877' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (296, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T10:32:49.893' AS DateTime), CAST(N'2024-04-03T10:32:49.893' AS DateTime), CAST(N'2024-04-03T10:32:49.893' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (297, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T10:47:18.740' AS DateTime), CAST(N'2024-04-03T10:47:18.740' AS DateTime), CAST(N'2024-04-03T10:47:18.740' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (298, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T10:58:18.860' AS DateTime), CAST(N'2024-04-03T10:58:18.860' AS DateTime), CAST(N'2024-04-03T10:58:18.860' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (299, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T11:07:23.690' AS DateTime), CAST(N'2024-04-03T11:07:23.690' AS DateTime), CAST(N'2024-04-03T11:07:23.690' AS DateTime), 0)
GO
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (300, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T11:10:32.773' AS DateTime), CAST(N'2024-04-03T11:10:32.773' AS DateTime), CAST(N'2024-04-03T11:10:32.773' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (301, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T11:11:15.660' AS DateTime), CAST(N'2024-04-03T11:27:50.160' AS DateTime), CAST(N'2024-04-03T11:11:15.660' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (302, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T11:27:54.693' AS DateTime), CAST(N'2024-04-03T15:54:22.587' AS DateTime), CAST(N'2024-04-03T11:27:54.693' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (303, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T11:28:48.287' AS DateTime), CAST(N'2024-04-03T11:28:48.287' AS DateTime), CAST(N'2024-04-03T11:28:48.287' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (304, NULL, N'sa', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T11:29:13.677' AS DateTime), CAST(N'2024-04-03T11:29:13.677' AS DateTime), CAST(N'2024-04-03T11:29:13.677' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (305, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T11:40:10.310' AS DateTime), CAST(N'2024-04-03T11:51:10.597' AS DateTime), CAST(N'2024-04-03T11:40:10.310' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (306, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T11:51:15.987' AS DateTime), CAST(N'2024-04-03T12:05:10.407' AS DateTime), CAST(N'2024-04-03T11:51:15.987' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (307, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T12:03:44.927' AS DateTime), CAST(N'2024-04-03T12:03:44.927' AS DateTime), CAST(N'2024-04-03T12:03:44.927' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (308, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T12:05:17.483' AS DateTime), CAST(N'2024-04-03T12:12:01.517' AS DateTime), CAST(N'2024-04-03T12:05:17.483' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (309, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T12:11:26.297' AS DateTime), CAST(N'2024-04-03T12:11:26.297' AS DateTime), CAST(N'2024-04-03T12:11:26.297' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (310, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T12:12:11.590' AS DateTime), CAST(N'2024-04-03T12:23:54.347' AS DateTime), CAST(N'2024-04-03T12:12:11.590' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (311, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T12:17:03.330' AS DateTime), CAST(N'2024-04-03T12:17:03.330' AS DateTime), CAST(N'2024-04-03T12:17:03.330' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (312, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T12:24:00.343' AS DateTime), CAST(N'2024-04-03T12:41:13.280' AS DateTime), CAST(N'2024-04-03T12:24:00.343' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (313, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T12:41:21.470' AS DateTime), CAST(N'2024-04-03T13:25:59.047' AS DateTime), CAST(N'2024-04-03T12:41:21.470' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (314, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T12:51:22.537' AS DateTime), CAST(N'2024-04-03T12:51:22.537' AS DateTime), CAST(N'2024-04-03T12:51:22.537' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (315, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T13:25:28.910' AS DateTime), CAST(N'2024-04-03T13:25:28.910' AS DateTime), CAST(N'2024-04-03T13:25:28.910' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (316, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T13:26:06.100' AS DateTime), CAST(N'2024-04-03T14:05:23.907' AS DateTime), CAST(N'2024-04-03T13:26:06.100' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (317, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T14:05:27.860' AS DateTime), CAST(N'2024-04-03T14:40:38.193' AS DateTime), CAST(N'2024-04-03T14:05:27.860' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (318, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T14:40:42.740' AS DateTime), CAST(N'2024-04-03T14:58:38.043' AS DateTime), CAST(N'2024-04-03T14:40:42.740' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (319, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T14:41:28.210' AS DateTime), CAST(N'2024-04-03T14:41:28.210' AS DateTime), CAST(N'2024-04-03T14:41:28.210' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (320, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T14:42:21.550' AS DateTime), CAST(N'2024-04-03T14:42:21.550' AS DateTime), CAST(N'2024-04-03T14:42:21.550' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (321, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T14:47:01.840' AS DateTime), CAST(N'2024-04-03T14:47:01.840' AS DateTime), CAST(N'2024-04-03T14:47:01.840' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (322, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T14:58:03.713' AS DateTime), CAST(N'2024-04-03T14:58:03.713' AS DateTime), CAST(N'2024-04-03T14:58:03.713' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (323, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T14:58:45.650' AS DateTime), CAST(N'2024-04-03T15:16:48.637' AS DateTime), CAST(N'2024-04-03T14:58:45.650' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (324, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T15:15:16.757' AS DateTime), CAST(N'2024-04-03T15:15:16.757' AS DateTime), CAST(N'2024-04-03T15:15:16.757' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (325, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T15:16:56.927' AS DateTime), CAST(N'2024-04-03T15:31:02.397' AS DateTime), CAST(N'2024-04-03T15:16:56.927' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (326, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T15:21:28.770' AS DateTime), CAST(N'2024-04-03T15:21:33.120' AS DateTime), CAST(N'2024-04-03T15:21:28.770' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (327, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T15:21:38.633' AS DateTime), CAST(N'2024-04-03T15:21:38.633' AS DateTime), CAST(N'2024-04-03T15:21:38.633' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (328, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T15:31:15.993' AS DateTime), CAST(N'2024-04-03T15:32:09.323' AS DateTime), CAST(N'2024-04-03T15:31:15.993' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (329, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T15:32:16.950' AS DateTime), CAST(N'2024-04-03T15:33:47.730' AS DateTime), CAST(N'2024-04-03T15:32:16.950' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (330, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T15:32:30.800' AS DateTime), CAST(N'2024-04-03T15:32:30.800' AS DateTime), CAST(N'2024-04-03T15:32:30.800' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (331, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T15:33:05.403' AS DateTime), CAST(N'2024-04-03T15:33:05.403' AS DateTime), CAST(N'2024-04-03T15:33:05.403' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (332, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T15:33:54.053' AS DateTime), CAST(N'2024-04-03T15:49:43.883' AS DateTime), CAST(N'2024-04-03T15:33:54.053' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (333, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T15:49:49.263' AS DateTime), CAST(N'2024-04-03T15:55:54.577' AS DateTime), CAST(N'2024-04-03T15:49:49.263' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (334, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T15:50:03.173' AS DateTime), CAST(N'2024-04-03T15:50:03.173' AS DateTime), CAST(N'2024-04-03T15:50:03.173' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (335, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T15:54:28.403' AS DateTime), CAST(N'2024-04-03T15:55:50.453' AS DateTime), CAST(N'2024-04-03T15:54:28.403' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (336, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T15:56:02.450' AS DateTime), CAST(N'2024-04-03T16:56:36.040' AS DateTime), CAST(N'2024-04-03T15:56:02.450' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (337, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T16:56:43.167' AS DateTime), CAST(N'2024-04-03T16:57:17.880' AS DateTime), CAST(N'2024-04-03T16:56:43.167' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (338, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T16:57:22.383' AS DateTime), CAST(N'2024-04-03T16:58:08.300' AS DateTime), CAST(N'2024-04-03T16:57:22.383' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (339, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T16:58:39.993' AS DateTime), CAST(N'2024-04-03T16:58:39.993' AS DateTime), CAST(N'2024-04-03T16:58:39.993' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (340, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T17:07:42.720' AS DateTime), CAST(N'2024-04-03T17:09:29.593' AS DateTime), CAST(N'2024-04-03T17:07:42.720' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (341, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-03T17:09:34.810' AS DateTime), CAST(N'2024-04-04T10:03:58.267' AS DateTime), CAST(N'2024-04-03T17:09:34.810' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (342, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T09:35:19.867' AS DateTime), CAST(N'2024-04-04T09:35:19.867' AS DateTime), CAST(N'2024-04-04T09:35:19.867' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (343, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T10:04:03.787' AS DateTime), CAST(N'2024-04-04T10:05:00.693' AS DateTime), CAST(N'2024-04-04T10:04:03.787' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (344, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T10:05:04.627' AS DateTime), CAST(N'2024-04-04T10:07:32.443' AS DateTime), CAST(N'2024-04-04T10:05:04.627' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (345, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T10:07:36.983' AS DateTime), CAST(N'2024-04-04T10:11:51.043' AS DateTime), CAST(N'2024-04-04T10:07:36.983' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (346, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T10:11:55.337' AS DateTime), CAST(N'2024-04-04T10:15:39.407' AS DateTime), CAST(N'2024-04-04T10:11:55.337' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (347, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T10:15:43.907' AS DateTime), CAST(N'2024-04-04T10:25:49.267' AS DateTime), CAST(N'2024-04-04T10:15:43.907' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (348, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T10:25:53.173' AS DateTime), CAST(N'2024-04-04T10:31:44.597' AS DateTime), CAST(N'2024-04-04T10:25:53.173' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (349, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T10:31:48.563' AS DateTime), CAST(N'2024-04-04T10:34:27.747' AS DateTime), CAST(N'2024-04-04T10:31:48.563' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (350, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T10:34:32.093' AS DateTime), CAST(N'2024-04-04T10:38:31.383' AS DateTime), CAST(N'2024-04-04T10:34:32.093' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (351, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T10:37:09.420' AS DateTime), CAST(N'2024-04-04T10:37:09.420' AS DateTime), CAST(N'2024-04-04T10:37:09.420' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (352, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T10:38:40.770' AS DateTime), CAST(N'2024-04-04T10:42:48.003' AS DateTime), CAST(N'2024-04-04T10:38:40.770' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (353, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T10:42:53.377' AS DateTime), CAST(N'2024-04-04T10:46:42.513' AS DateTime), CAST(N'2024-04-04T10:42:53.377' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (354, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T10:46:46.853' AS DateTime), CAST(N'2024-04-04T10:49:41.600' AS DateTime), CAST(N'2024-04-04T10:46:46.853' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (355, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T10:49:46.413' AS DateTime), CAST(N'2024-04-04T10:55:43.973' AS DateTime), CAST(N'2024-04-04T10:49:46.413' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (356, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T10:55:47.730' AS DateTime), CAST(N'2024-04-04T11:01:02.757' AS DateTime), CAST(N'2024-04-04T10:55:47.730' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (357, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T11:01:08.893' AS DateTime), CAST(N'2024-04-04T11:18:27.783' AS DateTime), CAST(N'2024-04-04T11:01:08.893' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (358, NULL, N'sa', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T11:19:45.420' AS DateTime), CAST(N'2024-04-04T11:19:45.420' AS DateTime), CAST(N'2024-04-04T11:19:45.420' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (359, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T11:20:56.590' AS DateTime), CAST(N'2024-04-04T11:20:56.590' AS DateTime), CAST(N'2024-04-04T11:20:56.590' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (360, NULL, N'sa', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T11:48:05.540' AS DateTime), CAST(N'2024-04-04T11:48:05.540' AS DateTime), CAST(N'2024-04-04T11:48:05.540' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (361, 1001, N'info@fourcrossmedia.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T11:48:58.667' AS DateTime), CAST(N'2024-04-04T11:48:58.667' AS DateTime), CAST(N'2024-04-04T11:48:58.667' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (362, 1001, N'info@fourcrossmedia.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T12:11:39.747' AS DateTime), CAST(N'2024-04-04T12:11:39.747' AS DateTime), CAST(N'2024-04-04T12:11:39.747' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (363, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T12:19:29.333' AS DateTime), CAST(N'2024-04-04T12:19:29.333' AS DateTime), CAST(N'2024-04-04T12:19:29.333' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (364, 1000, N'rakesh@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T12:20:44.403' AS DateTime), CAST(N'2024-04-04T12:20:44.403' AS DateTime), CAST(N'2024-04-04T12:20:44.403' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (365, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T12:30:25.690' AS DateTime), CAST(N'2024-04-04T12:32:18.900' AS DateTime), CAST(N'2024-04-04T12:30:25.690' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (366, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T12:31:15.947' AS DateTime), CAST(N'2024-04-04T13:10:27.787' AS DateTime), CAST(N'2024-04-04T12:31:15.947' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (367, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T12:32:25.237' AS DateTime), CAST(N'2024-04-04T12:39:31.607' AS DateTime), CAST(N'2024-04-04T12:32:25.237' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (368, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T12:39:36.617' AS DateTime), CAST(N'2024-04-04T12:51:52.620' AS DateTime), CAST(N'2024-04-04T12:39:36.617' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (369, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T12:51:56.703' AS DateTime), CAST(N'2024-04-04T12:56:12.647' AS DateTime), CAST(N'2024-04-04T12:51:56.703' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (370, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T12:56:16.583' AS DateTime), CAST(N'2024-04-04T12:59:53.737' AS DateTime), CAST(N'2024-04-04T12:56:16.583' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (371, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T12:59:57.940' AS DateTime), CAST(N'2024-04-04T13:04:02.757' AS DateTime), CAST(N'2024-04-04T12:59:57.940' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (372, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T13:04:07.300' AS DateTime), CAST(N'2024-04-04T13:09:43.440' AS DateTime), CAST(N'2024-04-04T13:04:07.300' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (373, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T13:09:47.613' AS DateTime), CAST(N'2024-04-04T13:48:36.310' AS DateTime), CAST(N'2024-04-04T13:09:47.613' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (374, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T13:10:35.317' AS DateTime), CAST(N'2024-04-04T13:17:48.140' AS DateTime), CAST(N'2024-04-04T13:10:35.317' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (375, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T13:17:52.363' AS DateTime), CAST(N'2024-04-04T13:25:42.483' AS DateTime), CAST(N'2024-04-04T13:17:52.363' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (376, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T13:25:46.713' AS DateTime), CAST(N'2024-04-04T13:28:31.300' AS DateTime), CAST(N'2024-04-04T13:25:46.713' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (377, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T13:28:35.573' AS DateTime), CAST(N'2024-04-04T13:30:35.677' AS DateTime), CAST(N'2024-04-04T13:28:35.573' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (378, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T13:30:39.997' AS DateTime), CAST(N'2024-04-04T13:47:32.377' AS DateTime), CAST(N'2024-04-04T13:30:39.997' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (379, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T13:47:36.830' AS DateTime), CAST(N'2024-04-04T13:48:31.453' AS DateTime), CAST(N'2024-04-04T13:47:36.830' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (380, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T13:48:46.603' AS DateTime), CAST(N'2024-04-04T13:49:03.650' AS DateTime), CAST(N'2024-04-04T13:48:46.603' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (381, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T13:49:18.010' AS DateTime), CAST(N'2024-04-04T13:52:55.367' AS DateTime), CAST(N'2024-04-04T13:49:18.010' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (382, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T13:52:59.317' AS DateTime), CAST(N'2024-04-04T14:06:21.640' AS DateTime), CAST(N'2024-04-04T13:52:59.317' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (383, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T14:06:26.080' AS DateTime), CAST(N'2024-04-04T14:08:56.093' AS DateTime), CAST(N'2024-04-04T14:06:26.080' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (384, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T14:09:00.200' AS DateTime), CAST(N'2024-04-04T14:11:20.770' AS DateTime), CAST(N'2024-04-04T14:09:00.200' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (385, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T14:11:24.843' AS DateTime), CAST(N'2024-04-04T14:17:34.473' AS DateTime), CAST(N'2024-04-04T14:11:24.843' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (386, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T14:17:38.667' AS DateTime), CAST(N'2024-04-04T14:24:00.750' AS DateTime), CAST(N'2024-04-04T14:17:38.667' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (387, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T14:24:05.193' AS DateTime), CAST(N'2024-04-04T14:32:34.947' AS DateTime), CAST(N'2024-04-04T14:24:05.193' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (388, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T14:32:38.870' AS DateTime), CAST(N'2024-04-04T14:34:21.477' AS DateTime), CAST(N'2024-04-04T14:32:38.870' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (389, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T14:34:25.333' AS DateTime), CAST(N'2024-04-04T14:35:14.940' AS DateTime), CAST(N'2024-04-04T14:34:25.333' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (390, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T14:35:19.010' AS DateTime), CAST(N'2024-04-04T14:36:30.583' AS DateTime), CAST(N'2024-04-04T14:35:19.010' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (391, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T14:36:45.810' AS DateTime), CAST(N'2024-04-04T14:45:45.260' AS DateTime), CAST(N'2024-04-04T14:36:45.810' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (392, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T14:36:56.810' AS DateTime), CAST(N'2024-04-04T14:44:49.283' AS DateTime), CAST(N'2024-04-04T14:36:56.810' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (393, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T14:44:53.150' AS DateTime), CAST(N'2024-04-04T14:46:36.950' AS DateTime), CAST(N'2024-04-04T14:44:53.150' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (394, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T14:45:56.390' AS DateTime), CAST(N'2024-04-04T14:47:49.967' AS DateTime), CAST(N'2024-04-04T14:45:56.390' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (395, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T14:46:42.217' AS DateTime), CAST(N'2024-04-04T14:47:46.137' AS DateTime), CAST(N'2024-04-04T14:46:42.217' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (396, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T14:47:57.100' AS DateTime), CAST(N'2024-04-04T14:52:45.190' AS DateTime), CAST(N'2024-04-04T14:47:57.100' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (397, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T14:52:49.663' AS DateTime), CAST(N'2024-04-04T15:00:46.817' AS DateTime), CAST(N'2024-04-04T14:52:49.663' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (398, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T15:00:51.313' AS DateTime), CAST(N'2024-04-04T15:02:33.453' AS DateTime), CAST(N'2024-04-04T15:00:51.313' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (399, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T15:02:38.123' AS DateTime), CAST(N'2024-04-04T15:03:46.070' AS DateTime), CAST(N'2024-04-04T15:02:38.123' AS DateTime), 0)
GO
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (400, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T15:03:50.510' AS DateTime), CAST(N'2024-04-04T15:06:39.303' AS DateTime), CAST(N'2024-04-04T15:03:50.510' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (401, 1000, N'tanzeem@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T15:06:44.670' AS DateTime), CAST(N'2024-04-04T15:28:23.673' AS DateTime), CAST(N'2024-04-04T15:06:44.670' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (402, NULL, N'sa', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T15:28:34.947' AS DateTime), CAST(N'2024-04-04T15:28:34.947' AS DateTime), CAST(N'2024-04-04T15:28:34.947' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (403, NULL, N'sa', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T15:31:12.623' AS DateTime), CAST(N'2024-04-04T15:33:13.667' AS DateTime), CAST(N'2024-04-04T15:31:12.623' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (404, 1004, N'info@shinecollection.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T15:33:27.883' AS DateTime), CAST(N'2024-04-04T15:36:11.263' AS DateTime), CAST(N'2024-04-04T15:33:27.883' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (405, 1004, N'info@shinecollection.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T15:36:40.277' AS DateTime), CAST(N'2024-04-04T15:36:40.277' AS DateTime), CAST(N'2024-04-04T15:36:40.277' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (406, 1004, N'info@shinecollection.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T15:46:28.760' AS DateTime), CAST(N'2024-04-04T15:53:16.367' AS DateTime), CAST(N'2024-04-04T15:46:28.760' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (407, 1004, N'info@shinecollection.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T15:53:21.867' AS DateTime), CAST(N'2024-04-04T15:55:06.960' AS DateTime), CAST(N'2024-04-04T15:53:21.867' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (408, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T15:55:32.073' AS DateTime), CAST(N'2024-04-04T15:56:09.863' AS DateTime), CAST(N'2024-04-04T15:55:32.073' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (409, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T15:56:21.477' AS DateTime), CAST(N'2024-04-04T15:58:00.543' AS DateTime), CAST(N'2024-04-04T15:56:21.477' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (410, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T15:58:13.820' AS DateTime), CAST(N'2024-04-04T16:04:22.177' AS DateTime), CAST(N'2024-04-04T15:58:13.820' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (411, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T16:04:28.973' AS DateTime), CAST(N'2024-04-04T16:04:58.123' AS DateTime), CAST(N'2024-04-04T16:04:28.973' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (412, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T16:05:03.170' AS DateTime), CAST(N'2024-04-04T16:05:28.083' AS DateTime), CAST(N'2024-04-04T16:05:03.170' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (413, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T16:05:32.633' AS DateTime), CAST(N'2024-04-04T16:07:23.103' AS DateTime), CAST(N'2024-04-04T16:05:32.633' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (414, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T16:07:27.593' AS DateTime), CAST(N'2024-04-04T16:07:44.643' AS DateTime), CAST(N'2024-04-04T16:07:27.593' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (415, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T16:07:49.287' AS DateTime), CAST(N'2024-04-04T16:09:35.590' AS DateTime), CAST(N'2024-04-04T16:07:49.287' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (416, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T16:09:40.200' AS DateTime), CAST(N'2024-04-04T16:11:58.947' AS DateTime), CAST(N'2024-04-04T16:09:40.200' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (417, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T16:12:02.740' AS DateTime), CAST(N'2024-04-04T16:22:22.243' AS DateTime), CAST(N'2024-04-04T16:12:02.740' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (418, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T16:22:26.027' AS DateTime), CAST(N'2024-04-04T16:33:47.523' AS DateTime), CAST(N'2024-04-04T16:22:26.027' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (419, 1004, N'info@shinecollection.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T16:29:32.910' AS DateTime), CAST(N'2024-04-04T16:29:32.910' AS DateTime), CAST(N'2024-04-04T16:29:32.910' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (420, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T16:33:57.633' AS DateTime), CAST(N'2024-04-04T16:34:05.870' AS DateTime), CAST(N'2024-04-04T16:33:57.633' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (421, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T16:34:09.517' AS DateTime), CAST(N'2024-04-04T16:36:53.260' AS DateTime), CAST(N'2024-04-04T16:34:09.517' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (422, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T16:37:00.167' AS DateTime), CAST(N'2024-04-05T10:02:51.713' AS DateTime), CAST(N'2024-04-04T16:37:00.167' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (423, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T16:38:42.477' AS DateTime), CAST(N'2024-04-04T16:39:33.847' AS DateTime), CAST(N'2024-04-04T16:38:42.477' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (424, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T16:39:58.957' AS DateTime), CAST(N'2024-04-04T16:46:19.653' AS DateTime), CAST(N'2024-04-04T16:39:58.957' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (425, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-04T16:46:23.890' AS DateTime), CAST(N'2024-04-05T09:58:15.443' AS DateTime), CAST(N'2024-04-04T16:46:23.890' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (426, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T09:58:19.963' AS DateTime), CAST(N'2024-04-05T10:02:44.760' AS DateTime), CAST(N'2024-04-05T09:58:19.963' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (427, 1004, N'info@shinecollection.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T09:58:42.260' AS DateTime), CAST(N'2024-04-05T09:58:42.260' AS DateTime), CAST(N'2024-04-05T09:58:42.260' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (428, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:02:56.753' AS DateTime), CAST(N'2024-04-05T10:05:07.727' AS DateTime), CAST(N'2024-04-05T10:02:56.753' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (429, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:05:12.040' AS DateTime), CAST(N'2024-04-05T10:06:48.093' AS DateTime), CAST(N'2024-04-05T10:05:12.040' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (430, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:06:52.260' AS DateTime), CAST(N'2024-04-05T10:08:07.627' AS DateTime), CAST(N'2024-04-05T10:06:52.260' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (431, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:08:11.690' AS DateTime), CAST(N'2024-04-05T10:09:09.793' AS DateTime), CAST(N'2024-04-05T10:08:11.690' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (432, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:09:23.860' AS DateTime), CAST(N'2024-04-05T10:12:05.137' AS DateTime), CAST(N'2024-04-05T10:09:23.860' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (433, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:12:11.097' AS DateTime), CAST(N'2024-04-05T10:13:07.800' AS DateTime), CAST(N'2024-04-05T10:12:11.097' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (434, 1004, N'info@shinecollection.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:13:18.930' AS DateTime), CAST(N'2024-04-05T10:13:18.930' AS DateTime), CAST(N'2024-04-05T10:13:18.930' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (435, 1004, N'info@shinecollection.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:15:21.903' AS DateTime), CAST(N'2024-04-05T10:15:21.903' AS DateTime), CAST(N'2024-04-05T10:15:21.903' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (436, 1004, N'info@shinecollection.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:27:59.333' AS DateTime), CAST(N'2024-04-05T10:28:58.053' AS DateTime), CAST(N'2024-04-05T10:27:59.333' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (437, 1004, N'info@shinecollection.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:29:04.010' AS DateTime), CAST(N'2024-04-05T10:29:04.010' AS DateTime), CAST(N'2024-04-05T10:29:04.010' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (438, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:32:34.400' AS DateTime), CAST(N'2024-04-05T10:37:08.837' AS DateTime), CAST(N'2024-04-05T10:32:34.400' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (439, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:37:12.837' AS DateTime), CAST(N'2024-04-05T10:38:19.730' AS DateTime), CAST(N'2024-04-05T10:37:12.837' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (440, 1004, N'info@shinecollection.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:39:11.787' AS DateTime), CAST(N'2024-04-05T10:39:11.787' AS DateTime), CAST(N'2024-04-05T10:39:11.787' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (441, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:39:36.003' AS DateTime), CAST(N'2024-04-05T10:41:17.760' AS DateTime), CAST(N'2024-04-05T10:39:36.003' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (442, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:41:22.737' AS DateTime), CAST(N'2024-04-05T10:41:43.487' AS DateTime), CAST(N'2024-04-05T10:41:22.737' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (443, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:41:51.367' AS DateTime), CAST(N'2024-04-05T10:42:07.337' AS DateTime), CAST(N'2024-04-05T10:41:51.367' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (444, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:42:10.710' AS DateTime), CAST(N'2024-04-05T10:47:43.633' AS DateTime), CAST(N'2024-04-05T10:42:10.710' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (445, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:47:48.660' AS DateTime), CAST(N'2024-04-05T10:50:02.893' AS DateTime), CAST(N'2024-04-05T10:47:48.660' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (446, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:50:11.263' AS DateTime), CAST(N'2024-04-05T10:50:17.760' AS DateTime), CAST(N'2024-04-05T10:50:11.263' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (447, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:55:39.597' AS DateTime), CAST(N'2024-04-05T10:58:06.517' AS DateTime), CAST(N'2024-04-05T10:55:39.597' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (448, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T10:58:12.110' AS DateTime), CAST(N'2024-04-05T11:01:50.993' AS DateTime), CAST(N'2024-04-05T10:58:12.110' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (449, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:01:55.450' AS DateTime), CAST(N'2024-04-05T11:03:10.397' AS DateTime), CAST(N'2024-04-05T11:01:55.450' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (450, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:03:15.043' AS DateTime), CAST(N'2024-04-05T11:07:24.630' AS DateTime), CAST(N'2024-04-05T11:03:15.043' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (451, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:07:28.490' AS DateTime), CAST(N'2024-04-05T11:08:54.613' AS DateTime), CAST(N'2024-04-05T11:07:28.490' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (452, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:08:59.073' AS DateTime), CAST(N'2024-04-05T11:09:46.277' AS DateTime), CAST(N'2024-04-05T11:08:59.073' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (453, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:09:51.893' AS DateTime), CAST(N'2024-04-05T11:09:55.673' AS DateTime), CAST(N'2024-04-05T11:09:51.893' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (454, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:09:59.870' AS DateTime), CAST(N'2024-04-05T11:10:09.857' AS DateTime), CAST(N'2024-04-05T11:09:59.870' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (455, 1004, N'ravi@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:10:17.880' AS DateTime), CAST(N'2024-04-05T11:12:59.997' AS DateTime), CAST(N'2024-04-05T11:10:17.880' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (456, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:13:06.497' AS DateTime), CAST(N'2024-04-05T11:15:42.373' AS DateTime), CAST(N'2024-04-05T11:13:06.497' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (457, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:15:47.157' AS DateTime), CAST(N'2024-04-06T10:58:21.010' AS DateTime), CAST(N'2024-04-05T11:15:47.157' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (458, 1004, N'info@shinecollection.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:18:26.340' AS DateTime), CAST(N'2024-04-05T11:22:12.277' AS DateTime), CAST(N'2024-04-05T11:18:26.340' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (459, NULL, N'sa', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:23:14.787' AS DateTime), CAST(N'2024-04-05T11:29:01.103' AS DateTime), CAST(N'2024-04-05T11:23:14.787' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (460, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:29:25.847' AS DateTime), CAST(N'2024-04-05T11:43:55.903' AS DateTime), CAST(N'2024-04-05T11:29:25.847' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (461, 1005, N'tayyab@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:44:58.103' AS DateTime), CAST(N'2024-04-05T11:45:17.017' AS DateTime), CAST(N'2024-04-05T11:44:58.103' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (462, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:45:30.343' AS DateTime), CAST(N'2024-04-05T11:46:47.587' AS DateTime), CAST(N'2024-04-05T11:45:30.343' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (463, 1005, N'tayyab@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:46:57.470' AS DateTime), CAST(N'2024-04-05T11:48:03.010' AS DateTime), CAST(N'2024-04-05T11:46:57.470' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (464, 1005, N'tayyab@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:48:16.790' AS DateTime), CAST(N'2024-04-05T11:48:32.840' AS DateTime), CAST(N'2024-04-05T11:48:16.790' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (465, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:48:52.373' AS DateTime), CAST(N'2024-04-05T11:50:40.463' AS DateTime), CAST(N'2024-04-05T11:48:52.373' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (466, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:49:13.017' AS DateTime), CAST(N'2024-04-05T11:49:13.017' AS DateTime), CAST(N'2024-04-05T11:49:13.017' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (467, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T11:50:53.973' AS DateTime), CAST(N'2024-04-05T16:34:24.963' AS DateTime), CAST(N'2024-04-05T11:50:53.973' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (468, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T12:09:19.060' AS DateTime), CAST(N'2024-04-05T12:09:19.060' AS DateTime), CAST(N'2024-04-05T12:09:19.060' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (469, 1005, N'tayyab@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T12:12:38.557' AS DateTime), CAST(N'2024-04-05T15:13:43.637' AS DateTime), CAST(N'2024-04-05T12:12:38.557' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (470, 1005, N'tayyab@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T15:13:47.413' AS DateTime), CAST(N'2024-04-05T15:21:43.823' AS DateTime), CAST(N'2024-04-05T15:13:47.413' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (471, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T15:22:02.163' AS DateTime), CAST(N'2024-04-05T15:22:02.163' AS DateTime), CAST(N'2024-04-05T15:22:02.163' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (472, 1005, N'tayyab@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T15:23:21.493' AS DateTime), CAST(N'2024-04-05T15:35:20.077' AS DateTime), CAST(N'2024-04-05T15:23:21.493' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (473, 1005, N'tayyab@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T15:35:25.923' AS DateTime), CAST(N'2024-04-05T15:42:16.580' AS DateTime), CAST(N'2024-04-05T15:35:25.923' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (474, 1005, N'tayyab@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T15:42:21.747' AS DateTime), CAST(N'2024-04-05T16:34:15.323' AS DateTime), CAST(N'2024-04-05T15:42:21.747' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (475, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T16:35:44.850' AS DateTime), CAST(N'2024-04-05T16:56:44.110' AS DateTime), CAST(N'2024-04-05T16:35:44.850' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (476, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T16:56:48.413' AS DateTime), CAST(N'2024-04-05T17:25:34.453' AS DateTime), CAST(N'2024-04-05T16:56:48.413' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (477, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-05T17:25:38.600' AS DateTime), CAST(N'2024-04-06T09:42:42.770' AS DateTime), CAST(N'2024-04-05T17:25:38.600' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (478, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T09:42:48.207' AS DateTime), CAST(N'2024-04-06T09:45:25.520' AS DateTime), CAST(N'2024-04-06T09:42:48.207' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (479, 1005, N'tayyab@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T09:45:39.880' AS DateTime), CAST(N'2024-04-06T09:48:33.083' AS DateTime), CAST(N'2024-04-06T09:45:39.880' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (480, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T09:48:48.033' AS DateTime), CAST(N'2024-04-06T09:48:48.033' AS DateTime), CAST(N'2024-04-06T09:48:48.033' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (481, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T09:55:10.483' AS DateTime), CAST(N'2024-04-06T09:55:10.483' AS DateTime), CAST(N'2024-04-06T09:55:10.483' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (482, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T10:01:53.297' AS DateTime), CAST(N'2024-04-06T10:01:53.297' AS DateTime), CAST(N'2024-04-06T10:01:53.297' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (483, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T10:07:23.270' AS DateTime), CAST(N'2024-04-06T10:07:23.270' AS DateTime), CAST(N'2024-04-06T10:07:23.270' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (484, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T10:11:50.027' AS DateTime), CAST(N'2024-04-06T10:11:50.027' AS DateTime), CAST(N'2024-04-06T10:11:50.027' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (485, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T10:16:14.050' AS DateTime), CAST(N'2024-04-06T10:16:14.050' AS DateTime), CAST(N'2024-04-06T10:16:14.050' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (486, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T10:18:56.850' AS DateTime), CAST(N'2024-04-06T10:18:56.850' AS DateTime), CAST(N'2024-04-06T10:18:56.850' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (487, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T10:24:35.600' AS DateTime), CAST(N'2024-04-06T10:24:35.600' AS DateTime), CAST(N'2024-04-06T10:24:35.600' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (488, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T10:29:46.080' AS DateTime), CAST(N'2024-04-06T10:29:46.080' AS DateTime), CAST(N'2024-04-06T10:29:46.080' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (489, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T10:38:15.360' AS DateTime), CAST(N'2024-04-06T10:38:15.360' AS DateTime), CAST(N'2024-04-06T10:38:15.360' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (490, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T10:43:33.950' AS DateTime), CAST(N'2024-04-06T10:43:33.950' AS DateTime), CAST(N'2024-04-06T10:43:33.950' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (491, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T10:46:08.747' AS DateTime), CAST(N'2024-04-06T10:46:08.747' AS DateTime), CAST(N'2024-04-06T10:46:08.747' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (492, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T10:54:50.397' AS DateTime), CAST(N'2024-04-06T10:54:50.397' AS DateTime), CAST(N'2024-04-06T10:54:50.397' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (493, NULL, N'sa', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T10:55:05.517' AS DateTime), CAST(N'2024-04-06T10:56:42.670' AS DateTime), CAST(N'2024-04-06T10:55:05.517' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (494, 1000, N'sameer@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T10:57:31.257' AS DateTime), CAST(N'2024-04-06T10:58:06.583' AS DateTime), CAST(N'2024-04-06T10:57:31.257' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (495, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T10:58:29.280' AS DateTime), CAST(N'2024-04-06T11:01:26.240' AS DateTime), CAST(N'2024-04-06T10:58:29.280' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (496, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T11:02:04.237' AS DateTime), CAST(N'2024-04-06T11:07:32.697' AS DateTime), CAST(N'2024-04-06T11:02:04.237' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (497, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T11:07:43.327' AS DateTime), CAST(N'2024-04-06T11:08:22.350' AS DateTime), CAST(N'2024-04-06T11:07:43.327' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (498, 1004, N'raj@kumar.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T11:13:46.703' AS DateTime), CAST(N'2024-04-06T11:15:41.340' AS DateTime), CAST(N'2024-04-06T11:13:46.703' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (499, 1005, N'tayyab@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T11:19:17.257' AS DateTime), CAST(N'2024-04-09T10:58:30.760' AS DateTime), CAST(N'2024-04-06T11:19:17.257' AS DateTime), 0)
GO
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (500, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T11:45:14.190' AS DateTime), CAST(N'2024-04-06T11:45:14.190' AS DateTime), CAST(N'2024-04-06T11:45:14.190' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (501, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T11:56:14.630' AS DateTime), CAST(N'2024-04-06T11:56:14.630' AS DateTime), CAST(N'2024-04-06T11:56:14.630' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (502, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T12:13:20.520' AS DateTime), CAST(N'2024-04-06T12:13:20.520' AS DateTime), CAST(N'2024-04-06T12:13:20.520' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (503, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T12:38:06.160' AS DateTime), CAST(N'2024-04-06T12:38:06.160' AS DateTime), CAST(N'2024-04-06T12:38:06.160' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (504, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T12:41:01.040' AS DateTime), CAST(N'2024-04-06T12:41:01.040' AS DateTime), CAST(N'2024-04-06T12:41:01.040' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (505, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T12:43:43.290' AS DateTime), CAST(N'2024-04-06T12:43:43.290' AS DateTime), CAST(N'2024-04-06T12:43:43.290' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (506, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T12:46:03.767' AS DateTime), CAST(N'2024-04-06T12:46:03.767' AS DateTime), CAST(N'2024-04-06T12:46:03.767' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (507, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T13:10:15.553' AS DateTime), CAST(N'2024-04-06T13:10:15.553' AS DateTime), CAST(N'2024-04-06T13:10:15.553' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (508, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T13:13:59.080' AS DateTime), CAST(N'2024-04-06T13:13:59.080' AS DateTime), CAST(N'2024-04-06T13:13:59.080' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (509, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T13:47:08.633' AS DateTime), CAST(N'2024-04-06T13:47:08.633' AS DateTime), CAST(N'2024-04-06T13:47:08.633' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (510, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T13:51:53.123' AS DateTime), CAST(N'2024-04-06T13:51:53.123' AS DateTime), CAST(N'2024-04-06T13:51:53.123' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (511, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T14:11:42.277' AS DateTime), CAST(N'2024-04-06T14:11:42.277' AS DateTime), CAST(N'2024-04-06T14:11:42.277' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (512, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T14:14:03.330' AS DateTime), CAST(N'2024-04-06T14:14:03.330' AS DateTime), CAST(N'2024-04-06T14:14:03.330' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (513, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T14:25:16.217' AS DateTime), CAST(N'2024-04-06T14:28:59.187' AS DateTime), CAST(N'2024-04-06T14:25:16.217' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (514, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T14:29:03.520' AS DateTime), CAST(N'2024-04-06T14:47:08.793' AS DateTime), CAST(N'2024-04-06T14:29:03.520' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (515, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T14:47:13.207' AS DateTime), CAST(N'2024-04-06T15:54:06.580' AS DateTime), CAST(N'2024-04-06T14:47:13.207' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (516, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T14:48:12.653' AS DateTime), CAST(N'2024-04-06T14:48:12.653' AS DateTime), CAST(N'2024-04-06T14:48:12.653' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (517, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T15:00:13.580' AS DateTime), CAST(N'2024-04-06T15:00:33.087' AS DateTime), CAST(N'2024-04-06T15:00:13.580' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (518, NULL, N'sa', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T15:00:50.220' AS DateTime), CAST(N'2024-04-06T15:05:01.450' AS DateTime), CAST(N'2024-04-06T15:00:50.220' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (519, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T15:05:18.700' AS DateTime), CAST(N'2024-04-06T15:05:18.700' AS DateTime), CAST(N'2024-04-06T15:05:18.700' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (520, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T15:17:26.027' AS DateTime), CAST(N'2024-04-06T15:17:26.027' AS DateTime), CAST(N'2024-04-06T15:17:26.027' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (521, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T15:22:07.340' AS DateTime), CAST(N'2024-04-06T15:22:07.340' AS DateTime), CAST(N'2024-04-06T15:22:07.340' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (522, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T15:26:17.370' AS DateTime), CAST(N'2024-04-06T15:26:17.370' AS DateTime), CAST(N'2024-04-06T15:26:17.370' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (523, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T15:27:56.940' AS DateTime), CAST(N'2024-04-06T15:53:48.987' AS DateTime), CAST(N'2024-04-06T15:27:56.940' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (524, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T15:54:15.470' AS DateTime), CAST(N'2024-04-06T16:04:28.513' AS DateTime), CAST(N'2024-04-06T15:54:15.470' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (525, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T16:04:33.397' AS DateTime), CAST(N'2024-04-06T16:06:44.050' AS DateTime), CAST(N'2024-04-06T16:04:33.397' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (526, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T16:06:47.840' AS DateTime), CAST(N'2024-04-06T16:14:21.070' AS DateTime), CAST(N'2024-04-06T16:06:47.840' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (527, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T16:14:25.557' AS DateTime), CAST(N'2024-04-06T16:20:33.307' AS DateTime), CAST(N'2024-04-06T16:14:25.557' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (528, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T16:20:39.020' AS DateTime), CAST(N'2024-04-06T16:33:19.200' AS DateTime), CAST(N'2024-04-06T16:20:39.020' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (529, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T16:33:23.173' AS DateTime), CAST(N'2024-04-06T17:07:24.260' AS DateTime), CAST(N'2024-04-06T16:33:23.173' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (530, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T17:07:29.040' AS DateTime), CAST(N'2024-04-06T17:07:38.293' AS DateTime), CAST(N'2024-04-06T17:07:29.040' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (531, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T17:07:46.143' AS DateTime), CAST(N'2024-04-06T17:07:46.143' AS DateTime), CAST(N'2024-04-06T17:07:46.143' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (532, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T17:18:12.927' AS DateTime), CAST(N'2024-04-06T17:18:12.927' AS DateTime), CAST(N'2024-04-06T17:18:12.927' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (533, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T17:21:35.050' AS DateTime), CAST(N'2024-04-06T17:21:35.050' AS DateTime), CAST(N'2024-04-06T17:21:35.050' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (534, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T17:23:39.073' AS DateTime), CAST(N'2024-04-06T17:23:39.073' AS DateTime), CAST(N'2024-04-06T17:23:39.073' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (535, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T17:24:33.723' AS DateTime), CAST(N'2024-04-06T17:24:33.723' AS DateTime), CAST(N'2024-04-06T17:24:33.723' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (536, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.40   ', 1, CAST(N'2024-04-06T17:29:59.577' AS DateTime), CAST(N'2024-04-06T17:29:59.577' AS DateTime), CAST(N'2024-04-06T17:29:59.577' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (537, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'               ', 1, CAST(N'2024-04-08T10:22:05.817' AS DateTime), CAST(N'2024-04-08T10:22:05.817' AS DateTime), CAST(N'2024-04-08T10:22:05.817' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (538, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.39   ', 1, CAST(N'2024-04-08T17:24:25.103' AS DateTime), CAST(N'2024-04-08T17:24:25.103' AS DateTime), CAST(N'2024-04-08T17:24:25.103' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (539, 1005, N'rahees@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.39   ', 1, CAST(N'2024-04-08T17:29:01.530' AS DateTime), CAST(N'2024-04-08T17:29:01.530' AS DateTime), CAST(N'2024-04-08T17:29:01.530' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (540, 1005, N'tayyab@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.39   ', 1, CAST(N'2024-04-09T10:59:05.780' AS DateTime), CAST(N'2024-04-09T11:08:46.953' AS DateTime), CAST(N'2024-04-09T10:59:05.780' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (541, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.39   ', 1, CAST(N'2024-04-09T11:00:18.860' AS DateTime), CAST(N'2024-04-09T11:08:03.837' AS DateTime), CAST(N'2024-04-09T11:00:18.860' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (542, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.39   ', 1, CAST(N'2024-04-09T11:08:10.023' AS DateTime), CAST(N'2024-04-09T11:08:31.877' AS DateTime), CAST(N'2024-04-09T11:08:10.023' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (543, 1005, N'tayyab@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.39   ', 1, CAST(N'2024-04-09T11:08:58.447' AS DateTime), CAST(N'2024-04-09T11:17:31.597' AS DateTime), CAST(N'2024-04-09T11:08:58.447' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (544, 1005, N'tayyab@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.39   ', 1, CAST(N'2024-04-09T11:17:37.570' AS DateTime), CAST(N'2024-04-09T11:19:21.323' AS DateTime), CAST(N'2024-04-09T11:17:37.570' AS DateTime), 0)
INSERT [dbo].[TranLoginAudit] ([AuditLoginId], [OrgCode], [LoginId], [UserPCName], [IPAddress], [IsLogedSuccess], [LoginDate], [LogoutDate], [TransDate], [IsDeleted]) VALUES (545, 1005, N'shazad@gmail.com', N'DESKTOP-82OSQ6M', N'192.168.1.39   ', 1, CAST(N'2024-04-09T11:19:33.380' AS DateTime), CAST(N'2024-04-09T11:20:02.023' AS DateTime), CAST(N'2024-04-09T11:19:33.380' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[TranLoginAudit] OFF
GO
SET IDENTITY_INSERT [dbo].[TranSAUpdates] ON 

INSERT [dbo].[TranSAUpdates] ([NotiId], [NotiType], [OrgCode], [NotiTitle], [ValidFrom], [ValidTo], [NotiFile], [NotiDesc], [TransDate], [IsDeleted]) VALUES (1, 1, 1, N'Welcome All', CAST(N'2024-04-06T00:00:00.000' AS DateTime), CAST(N'2024-04-06T00:00:00.000' AS DateTime), N'', N'Welcome', CAST(N'2024-04-06T15:02:17.847' AS DateTime), 0)
INSERT [dbo].[TranSAUpdates] ([NotiId], [NotiType], [OrgCode], [NotiTitle], [ValidFrom], [ValidTo], [NotiFile], [NotiDesc], [TransDate], [IsDeleted]) VALUES (2, 2, 1005, N'Sys Update for Tara Furniture', CAST(N'2024-04-06T00:00:00.000' AS DateTime), CAST(N'2024-04-08T00:00:00.000' AS DateTime), N'', N'Sys Update for Tara Furniture', CAST(N'2024-04-06T15:02:57.407' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[TranSAUpdates] OFF
GO
SET IDENTITY_INSERT [dbo].[TranSOCart] ON 

INSERT [dbo].[TranSOCart] ([CartId], [ProdId], [OrgCode], [CustCode], [ProdCode], [CatName], [SubCatName], [Name], [Image], [UoM], [Rate], [Qty], [TransDate], [IsDeleted]) VALUES (5, 1, 1004, N'CUST001', N'PC001', N'Candle Stand', N'Sub Candle Stand ', N'bizproda', N'SubCat-1004-1.jpg', N'BGS', N'350', 1, CAST(N'2024-04-05T10:06:06.060' AS DateTime), 1)
INSERT [dbo].[TranSOCart] ([CartId], [ProdId], [OrgCode], [CustCode], [ProdCode], [CatName], [SubCatName], [Name], [Image], [UoM], [Rate], [Qty], [TransDate], [IsDeleted]) VALUES (9, 3, 1004, N'CUST002', N'MBP001', N'Candle Stand two', N'Sub Candle Stand one', N'bizpro', N'SubCat-1004-3.jpg', N'BGS', N'780', 1, CAST(N'2024-04-05T11:08:19.387' AS DateTime), 0)
INSERT [dbo].[TranSOCart] ([CartId], [ProdId], [OrgCode], [CustCode], [ProdCode], [CatName], [SubCatName], [Name], [Image], [UoM], [Rate], [Qty], [TransDate], [IsDeleted]) VALUES (10, 2, 1004, N'CUST002', N'PC002', N'Candle Stand two', N'Sub Candle Stand one', N'trk', N'SubCat-1004-2.jpg', N'BTL', N'355', 1, CAST(N'2024-04-05T11:12:50.793' AS DateTime), 0)
INSERT [dbo].[TranSOCart] ([CartId], [ProdId], [OrgCode], [CustCode], [ProdCode], [CatName], [SubCatName], [Name], [Image], [UoM], [Rate], [Qty], [TransDate], [IsDeleted]) VALUES (11, 1, 1004, N'CUST002', N'PC001', N'Candle Stand', N'Sub Candle Stand ', N'bizproda', N'SubCat-1004-1.jpg', N'BGS', N'350', 1, CAST(N'2024-04-05T11:12:52.060' AS DateTime), 0)
INSERT [dbo].[TranSOCart] ([CartId], [ProdId], [OrgCode], [CustCode], [ProdCode], [CatName], [SubCatName], [Name], [Image], [UoM], [Rate], [Qty], [TransDate], [IsDeleted]) VALUES (22, 8, 1005, N'TA001', N'SWBC01', N'Sofa', N'Sofa with Bed', N'Sofa', N'SubCat-1005-8.jpg', N'BOU', N'1200', 1, CAST(N'2024-04-09T10:59:18.090' AS DateTime), 0)
INSERT [dbo].[TranSOCart] ([CartId], [ProdId], [OrgCode], [CustCode], [ProdCode], [CatName], [SubCatName], [Name], [Image], [UoM], [Rate], [Qty], [TransDate], [IsDeleted]) VALUES (23, 7, 1005, N'TA001', N'CWSC002', N'Chair', N'Chair With Sofa ', N'Chair With Sofa ', N'SubCat-1005-7.jpg', N'BOX', N'1000', 1, CAST(N'2024-04-09T10:59:19.670' AS DateTime), 0)
INSERT [dbo].[TranSOCart] ([CartId], [ProdId], [OrgCode], [CustCode], [ProdCode], [CatName], [SubCatName], [Name], [Image], [UoM], [Rate], [Qty], [TransDate], [IsDeleted]) VALUES (24, 6, 1005, N'TA001', N'FCC001', N'Chair', N'Folding Chair', N'Folding Chair', N'SubCat-1005-6.jpg', N'BOX', N'355', 1, CAST(N'2024-04-09T10:59:22.093' AS DateTime), 0)
INSERT [dbo].[TranSOCart] ([CartId], [ProdId], [OrgCode], [CustCode], [ProdCode], [CatName], [SubCatName], [Name], [Image], [UoM], [Rate], [Qty], [TransDate], [IsDeleted]) VALUES (25, 5, 1005, N'TA001', N'FTC002', N'Table ', N'Folding Table ', N'Folding Table ', N'SubCat-1005-5.jpg', N'BLK', N'550', 1, CAST(N'2024-04-09T10:59:25.503' AS DateTime), 0)
INSERT [dbo].[TranSOCart] ([CartId], [ProdId], [OrgCode], [CustCode], [ProdCode], [CatName], [SubCatName], [Name], [Image], [UoM], [Rate], [Qty], [TransDate], [IsDeleted]) VALUES (26, 4, 1005, N'TA001', N'FTP001', N'Table ', N'Study Table', N'Table ', N'Prod-1005-4.jpg', N'BOX', N'250', 1, CAST(N'2024-04-09T10:59:39.120' AS DateTime), 0)
INSERT [dbo].[TranSOCart] ([CartId], [ProdId], [OrgCode], [CustCode], [ProdCode], [CatName], [SubCatName], [Name], [Image], [UoM], [Rate], [Qty], [TransDate], [IsDeleted]) VALUES (29, 8, 1005, N'Sh001', N'SWBC01', N'Sofa', N'Sofa with Bed', N'Sofa', N'SubCat-1005-8.jpg', N'BOU', N'1200', 1, CAST(N'2024-04-09T11:19:54.923' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[TranSOCart] OFF
GO
SET IDENTITY_INSERT [dbo].[TranSODetails] ON 

INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (1, 1000, 1, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-03T12:25:27.587' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (2, 1000, 1, 2, N'TEXT', N'780', N'1', N'780', N'25%', N'195', N'975', NULL, CAST(N'2024-04-03T12:25:27.593' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (3, 1000, 2, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T10:12:18.350' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (4, 1000, 3, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T10:18:34.520' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (5, 1000, 3, 2, N'TEXT', N'780', N'1', N'780', N'25%', N'195', N'975', NULL, CAST(N'2024-04-04T10:18:34.540' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (6, 1000, 4, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T10:26:34.300' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (7, 1000, 5, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T10:27:27.343' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (8, 1000, 6, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T10:27:53.090' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (9, 1000, 7, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T10:28:00.633' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (10, 1000, 8, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T10:28:39.707' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (11, 1000, 9, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T10:31:57.463' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (12, 1000, 10, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T10:32:23.153' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (13, 1000, 11, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T10:36:51.840' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (14, 1000, 12, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T10:43:53.237' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (15, 1000, 13, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T10:51:29.210' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (16, 1000, 13, 2, N'TEXT', N'780', N'1', N'780', N'25%', N'195', N'975', NULL, CAST(N'2024-04-04T10:51:29.210' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (17, 1000, 13, 1, N'Text', N'350', N'1', N'350', N'5%', N'17.5', N'367.5', NULL, CAST(N'2024-04-04T10:51:29.223' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (18, 1000, 14, 2, N'TEXT', N'780', N'1', N'780', N'25%', N'195', N'975', NULL, CAST(N'2024-04-04T10:55:55.277' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (19, 1000, 14, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T10:55:55.280' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (20, 1000, 15, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T10:56:10.997' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (21, 1000, 16, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T10:56:30.873' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (22, 1000, 17, 2, N'TEXT', N'780', N'1', N'780', N'25%', N'195', N'975', NULL, CAST(N'2024-04-04T11:01:26.147' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (23, 1000, 18, 2, N'TEXT', N'780', N'106', N'82680', N'25%', N'20670', N'103350', NULL, CAST(N'2024-04-04T11:02:18.713' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (24, 1000, 18, 1, N'Text', N'350', N'108', N'37800', N'5%', N'1890', N'39690', NULL, CAST(N'2024-04-04T11:02:18.720' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (25, 1000, 18, 3, N'qwe', N'250', N'19', N'4750', N'8%', N'380', N'5130', NULL, CAST(N'2024-04-04T11:02:18.727' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (26, 1000, 19, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T14:34:12.573' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (27, 1000, 19, 2, N'TEXT', N'780', N'1', N'780', N'25%', N'195', N'975', NULL, CAST(N'2024-04-04T14:34:12.577' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (28, 1000, 19, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T14:34:12.577' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (29, 1000, 19, 2, N'TEXT', N'780', N'1', N'780', N'25%', N'195', N'975', NULL, CAST(N'2024-04-04T14:34:12.577' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (30, 1000, 20, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T14:35:58.197' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (31, 1000, 20, 2, N'TEXT', N'780', N'1', N'780', N'25%', N'195', N'975', NULL, CAST(N'2024-04-04T14:35:58.200' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (32, 1000, 20, 3, N'qwe', N'250', N'1', N'250', N'8%', N'20', N'270', NULL, CAST(N'2024-04-04T14:35:58.200' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (33, 1000, 20, 2, N'TEXT', N'780', N'1', N'780', N'25%', N'195', N'975', NULL, CAST(N'2024-04-04T14:35:58.200' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (34, 1000, 20, 1, N'Text', N'350', N'1', N'350', N'5%', N'17.5', N'367.5', NULL, CAST(N'2024-04-04T14:35:58.210' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (35, 1000, 1, 1, N'Text', N'350', N'1', N'350', N'5%', N'17.5', N'367.5', NULL, CAST(N'2024-04-04T14:55:07.437' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (36, 1004, 2, 4, N'Box', N'550', N'2', N'1100', N'18%', N'198', N'1298', NULL, CAST(N'2024-04-04T15:57:08.710' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (37, 1004, 3, 4, N'Box', N'550', N'3', N'1650', N'18%', N'297', N'1947', NULL, CAST(N'2024-04-04T16:06:12.867' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (38, 1004, 4, 4, N'Box', N'550', N'2', N'1100', N'18%', N'198', N'1298', NULL, CAST(N'2024-04-04T16:37:54.277' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (39, 1004, 5, 4, N'Box', N'550', N'1', N'550', N'18%', N'99', N'649', NULL, CAST(N'2024-04-04T16:38:54.520' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (40, 1004, 1, 3, N'BGS', N'780', N'1', N'780', N'18%', N'140.4', N'920.4', NULL, CAST(N'2024-04-05T10:03:46.650' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (41, 1004, 1, 2, N'BTL', N'355', N'1', N'355', N'18%', N'63.9', N'418.9', NULL, CAST(N'2024-04-05T10:03:46.653' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (42, 1004, 2, 3, N'BGS', N'780', N'1', N'780', N'18%', N'140.4', N'920.4', NULL, CAST(N'2024-04-05T10:05:31.203' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (43, 1004, 2, 2, N'BTL', N'355', N'1', N'355', N'18%', N'63.9', N'418.9', NULL, CAST(N'2024-04-05T10:05:31.207' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (44, 1004, 3, 1, N'BGS', N'350', N'1', N'350', N'18%', N'63', N'413', NULL, CAST(N'2024-04-05T10:06:08.707' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (45, 1004, 4, 3, N'BGS', N'780', N'1', N'780', N'18%', N'140.4', N'920.4', NULL, CAST(N'2024-04-05T10:07:19.720' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (46, 1004, 4, 2, N'BTL', N'355', N'2', N'710', N'18%', N'127.8', N'837.8', NULL, CAST(N'2024-04-05T10:07:19.720' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (47, 1004, 4, 1, N'BGS', N'350', N'1', N'350', N'18%', N'63', N'413', NULL, CAST(N'2024-04-05T10:07:19.723' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (48, 1004, 5, 3, N'BGS', N'780', N'10', N'7800', N'18%', N'1404', N'9204', NULL, CAST(N'2024-04-05T10:08:31.450' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (49, 1004, 6, 3, N'BGS', N'780', N'1', N'780', N'18%', N'140.4', N'920.4', NULL, CAST(N'2024-04-05T11:10:20.230' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (50, 1005, 7, 4, N'BOX', N'250', N'1', N'250', N'18%', N'45', N'295', NULL, CAST(N'2024-04-05T11:46:35.590' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (51, 1005, 7, 7, N'BOX', N'1000', N'3', N'3000', N'18%', N'540', N'3540', NULL, CAST(N'2024-04-05T11:46:35.593' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (52, 1005, 8, 8, N'BOU', N'1200', N'1', N'1200', N'18%', N'216', N'1416', NULL, CAST(N'2024-04-05T11:47:10.140' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (53, 1005, 8, 6, N'BOX', N'355', N'1', N'355', N'18%', N'63.9', N'418.9', NULL, CAST(N'2024-04-05T11:47:10.143' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (54, 1005, 9, 8, N'BOU', N'1200', N'1', N'1200', N'18%', N'216', N'1416', NULL, CAST(N'2024-04-09T10:59:50.177' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (55, 1005, 9, 7, N'BOX', N'1000', N'1', N'1000', N'18%', N'180', N'1180', NULL, CAST(N'2024-04-09T10:59:50.180' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (56, 1005, 9, 6, N'BOX', N'355', N'1', N'355', N'18%', N'63.9', N'418.9', NULL, CAST(N'2024-04-09T10:59:50.180' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (57, 1005, 9, 5, N'BLK', N'550', N'1', N'550', N'18%', N'99', N'649', NULL, CAST(N'2024-04-09T10:59:50.187' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (58, 1005, 9, 4, N'BOX', N'250', N'1', N'250', N'18%', N'45', N'295', NULL, CAST(N'2024-04-09T10:59:50.187' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (59, 1005, 10, 4, N'BOX', N'250', N'1', N'250', N'18%', N'45', N'295', NULL, CAST(N'2024-04-09T11:00:58.277' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (60, 1005, 10, 7, N'BOX', N'1000', N'1', N'1000', N'18%', N'180', N'1180', NULL, CAST(N'2024-04-09T11:00:58.280' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (61, 1005, 10, 8, N'BOU', N'1200', N'1', N'1200', N'18%', N'216', N'1416', NULL, CAST(N'2024-04-09T11:00:58.280' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (62, 1005, 10, 5, N'BLK', N'550', N'1', N'550', N'18%', N'99', N'649', NULL, CAST(N'2024-04-09T11:00:58.280' AS DateTime), 0)
INSERT [dbo].[TranSODetails] ([SODetId], [OrgCode], [SOId], [ProdId], [UoM], [Rate], [Qty], [Amount], [GSTPercent], [GSTAmount], [GrossAmount], [Status], [TransDate], [IsDeleted]) VALUES (63, 1005, 10, 6, N'BOX', N'355', N'1', N'355', N'18%', N'63.9', N'418.9', NULL, CAST(N'2024-04-09T11:00:58.287' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[TranSODetails] OFF
GO
SET IDENTITY_INSERT [dbo].[TranSOHeader] ON 

INSERT [dbo].[TranSOHeader] ([SOId], [OrgCode], [Date], [Type], [CustCode], [OrderAmount], [GSTAmount], [NetAmount], [Remarks], [Status], [TransDate], [IsDeleted]) VALUES (1, 1004, CAST(N'2024-04-05T10:03:46.643' AS DateTime), N'', N'CUST002', N'1135', N'204.3', N'1339.3', N'', N'Cancelled           ', CAST(N'2024-04-05T10:03:46.643' AS DateTime), 0)
INSERT [dbo].[TranSOHeader] ([SOId], [OrgCode], [Date], [Type], [CustCode], [OrderAmount], [GSTAmount], [NetAmount], [Remarks], [Status], [TransDate], [IsDeleted]) VALUES (2, 1004, CAST(N'2024-04-05T10:05:31.200' AS DateTime), N'', N'CUST001', N'1135', N'204.3', N'1339.3', N'', N'Cancelled           ', CAST(N'2024-04-05T10:05:31.200' AS DateTime), 0)
INSERT [dbo].[TranSOHeader] ([SOId], [OrgCode], [Date], [Type], [CustCode], [OrderAmount], [GSTAmount], [NetAmount], [Remarks], [Status], [TransDate], [IsDeleted]) VALUES (3, 1004, CAST(N'2024-04-05T10:06:08.703' AS DateTime), N'', N'CUST001', N'350', N'63', N'413', N'', N'Complete            ', CAST(N'2024-04-05T10:06:08.703' AS DateTime), 0)
INSERT [dbo].[TranSOHeader] ([SOId], [OrgCode], [Date], [Type], [CustCode], [OrderAmount], [GSTAmount], [NetAmount], [Remarks], [Status], [TransDate], [IsDeleted]) VALUES (4, 1004, CAST(N'2024-04-05T10:07:19.717' AS DateTime), N'', N'CUST002', N'1840', N'331.2', N'2171.2', N'', N'InProcess           ', CAST(N'2024-04-05T10:07:19.717' AS DateTime), 0)
INSERT [dbo].[TranSOHeader] ([SOId], [OrgCode], [Date], [Type], [CustCode], [OrderAmount], [GSTAmount], [NetAmount], [Remarks], [Status], [TransDate], [IsDeleted]) VALUES (5, 1004, CAST(N'2024-04-05T10:08:31.447' AS DateTime), N'', N'CUST001', N'7800', N'1404', N'9204', N'', N'Complete            ', CAST(N'2024-04-05T10:08:31.447' AS DateTime), 0)
INSERT [dbo].[TranSOHeader] ([SOId], [OrgCode], [Date], [Type], [CustCode], [OrderAmount], [GSTAmount], [NetAmount], [Remarks], [Status], [TransDate], [IsDeleted]) VALUES (6, 1004, CAST(N'2024-04-05T11:10:20.227' AS DateTime), N'', N'CUST002', N'780', N'140.4', N'920.4', N'', N'InApproval          ', CAST(N'2024-04-05T11:10:20.227' AS DateTime), 0)
INSERT [dbo].[TranSOHeader] ([SOId], [OrgCode], [Date], [Type], [CustCode], [OrderAmount], [GSTAmount], [NetAmount], [Remarks], [Status], [TransDate], [IsDeleted]) VALUES (7, 1005, CAST(N'2024-04-05T11:46:35.590' AS DateTime), N'', N'Sh001', N'3250', N'585', N'3835', N'', N'InProcess           ', CAST(N'2024-04-05T11:46:35.590' AS DateTime), 0)
INSERT [dbo].[TranSOHeader] ([SOId], [OrgCode], [Date], [Type], [CustCode], [OrderAmount], [GSTAmount], [NetAmount], [Remarks], [Status], [TransDate], [IsDeleted]) VALUES (8, 1005, CAST(N'2024-04-05T11:47:10.137' AS DateTime), N'', N'TA001', N'1555', N'279.9', N'1834.9', N'', N'Complete            ', CAST(N'2024-04-05T11:47:10.137' AS DateTime), 0)
INSERT [dbo].[TranSOHeader] ([SOId], [OrgCode], [Date], [Type], [CustCode], [OrderAmount], [GSTAmount], [NetAmount], [Remarks], [Status], [TransDate], [IsDeleted]) VALUES (9, 1005, CAST(N'2024-04-09T10:59:50.170' AS DateTime), N'', N'TA001', N'3355', N'603.9', N'3958.9', N'', N'InApproval          ', CAST(N'2024-04-09T10:59:50.170' AS DateTime), 0)
INSERT [dbo].[TranSOHeader] ([SOId], [OrgCode], [Date], [Type], [CustCode], [OrderAmount], [GSTAmount], [NetAmount], [Remarks], [Status], [TransDate], [IsDeleted]) VALUES (10, 1005, CAST(N'2024-04-09T11:00:58.273' AS DateTime), N'', N'Sh001', N'3355', N'603.9', N'3958.9', N'', N'InApproval          ', CAST(N'2024-04-09T11:00:58.273' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[TranSOHeader] OFF
GO
SET IDENTITY_INSERT [dbo].[TranSOWaitList] ON 

INSERT [dbo].[TranSOWaitList] ([WaitListId], [ProdId], [OrgCode], [CustCode], [ProdCode], [CatName], [SubCatName], [Name], [Image], [UoM], [GSTRate], [Rate], [Qty], [TransDate], [IsDeleted]) VALUES (7, N'1         ', 1004, N'CUST002', N'PC001', N'Candle Stand', N'Sub Candle Stand ', N'bizproda', N'SubCat-1004-1.jpg', N'BGS', NULL, N'350', 1, CAST(N'2024-04-05T10:57:53.170' AS DateTime), 0)
INSERT [dbo].[TranSOWaitList] ([WaitListId], [ProdId], [OrgCode], [CustCode], [ProdCode], [CatName], [SubCatName], [Name], [Image], [UoM], [GSTRate], [Rate], [Qty], [TransDate], [IsDeleted]) VALUES (9, N'2         ', 1004, N'CUST001', N'PC002', N'Candle Stand two', N'Sub Candle Stand one', N'trk', N'SubCat-1004-2.jpg', N'BTL', NULL, N'355', 1, CAST(N'2024-04-05T10:58:20.620' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[TranSOWaitList] OFF
GO
SET IDENTITY_INSERT [dbo].[Wnn] ON 

INSERT [dbo].[Wnn] ([id], [UserName], [Password]) VALUES (1, N'sa', N'MTIz')
SET IDENTITY_INSERT [dbo].[Wnn] OFF
GO
ALTER TABLE [dbo].[GDMstBanks] ADD  CONSTRAINT [DF_GDMstBanks_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[GDMstBanks] ADD  CONSTRAINT [DF_GDMstBanks_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GDMstCity] ADD  CONSTRAINT [DF_GDMstCity_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[GDMstCity] ADD  CONSTRAINT [DF_GDMstCity_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GDMstCountry] ADD  CONSTRAINT [DF_GDMstCountry_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[GDMstCountry] ADD  CONSTRAINT [DF_GDMstCountry_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GDMstEmailConfig] ADD  CONSTRAINT [DF_MstEmailConfig_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[GDMstEmailConfig] ADD  CONSTRAINT [DF_MstEmailConfig_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GDMstOrgType] ADD  CONSTRAINT [DF_MstOrgType_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[GDMstOrgType] ADD  CONSTRAINT [DF_MstOrgType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GDMstState] ADD  CONSTRAINT [DF_GDMstState_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[GDMstState] ADD  CONSTRAINT [DF_GDMstState_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GDMstSubscType] ADD  CONSTRAINT [DF_MstSubscType_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[GDMstSubscType] ADD  CONSTRAINT [DF_MstSubscType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GDMstUnit] ADD  CONSTRAINT [DF_GDMstUnit_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[GDMstUnit] ADD  CONSTRAINT [DF_GDMstUnit_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GDMstUserType] ADD  CONSTRAINT [DF_MstUserType_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[GDMstUserType] ADD  CONSTRAINT [DF_MstUserType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GDMstValidation] ADD  CONSTRAINT [DF_GDMstValidation_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[GDMstValidation] ADD  CONSTRAINT [DF_GDMstValidation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MstCategory] ADD  CONSTRAINT [DF_MstCategory_TranDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[MstCategory] ADD  CONSTRAINT [DF_MstCategory_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MstCustomer] ADD  CONSTRAINT [DF_MstCustomer_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[MstCustomer] ADD  CONSTRAINT [DF_MstCustomer_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MstOrgAccess] ADD  CONSTRAINT [DF_MstAccess_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[MstOrgAccess] ADD  CONSTRAINT [DF_MstAccess_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MstOrganization] ADD  CONSTRAINT [DF_MstOrganization_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[MstOrganization] ADD  CONSTRAINT [DF_MstOrganization_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MstOrgLicense] ADD  CONSTRAINT [DF_MstOrgLicense_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[MstOrgLicense] ADD  CONSTRAINT [DF_MstOrgLicense_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MstProduct] ADD  CONSTRAINT [DF_MstProduct_TranDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[MstProduct] ADD  CONSTRAINT [DF_MstProduct_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MstSubCategory] ADD  CONSTRAINT [DF_MstSubCategory_TranDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[MstSubCategory] ADD  CONSTRAINT [DF_MstSubCategory_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MstUsers] ADD  CONSTRAINT [DF_MstUsers_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[MstUsers] ADD  CONSTRAINT [DF_MstUsers_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TranAANoti] ADD  CONSTRAINT [DF_TranAANoti_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[TranAANoti] ADD  CONSTRAINT [DF_TranAANoti_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TranErrorLog] ADD  CONSTRAINT [DF_TranErrorLog_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[TranErrorLog] ADD  CONSTRAINT [DF_TranErrorLog_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TranLoginAudit] ADD  CONSTRAINT [DF_TranLoginAudit_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[TranLoginAudit] ADD  CONSTRAINT [DF_TranLoginAudit_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TranSARaiseQuery] ADD  CONSTRAINT [DF_TranSARaiseQuery_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[TranSARaiseQuery] ADD  CONSTRAINT [DF_TranSARaiseQuery_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TranSAUpdates] ADD  CONSTRAINT [DF_TranSAUpdates_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[TranSAUpdates] ADD  CONSTRAINT [DF_TranSAUpdates_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TranSOCart] ADD  CONSTRAINT [DF_TranSOCart_TranDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[TranSOCart] ADD  CONSTRAINT [DF_TranSOCart_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TranSODetails] ADD  CONSTRAINT [DF_TranSODetails_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[TranSODetails] ADD  CONSTRAINT [DF_TranSODetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TranSOHeader] ADD  CONSTRAINT [DF_TranSOHeader_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[TranSOHeader] ADD  CONSTRAINT [DF_TranSOHeader_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TranSOWaitList] ADD  CONSTRAINT [DF_TranSOWaitList_TranDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[TranSOWaitList] ADD  CONSTRAINT [DF_TranSOWaitList_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TranVMSDept] ADD  CONSTRAINT [DF_TranVMSDept_TranDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[TranVMSDept] ADD  CONSTRAINT [DF_TranVMSDept_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TranVMSVisitor] ADD  CONSTRAINT [DF_TranVMSVisitor_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[TranVMSVisitor] ADD  CONSTRAINT [DF_TranVMSVisitor_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TranVMSVisits] ADD  CONSTRAINT [DF_TranVMSVisits_VisitDate]  DEFAULT (getdate()) FOR [VisitDate]
GO
ALTER TABLE [dbo].[TranVMSVisits] ADD  CONSTRAINT [DF_TranVMSVisits_TransDate]  DEFAULT (getdate()) FOR [TransDate]
GO
ALTER TABLE [dbo].[TranVMSVisits] ADD  CONSTRAINT [DF_TranVMSVisits_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GDMstValidation', @level2type=N'COLUMN',@level2name=N'TransDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GDMstValidation', @level2type=N'COLUMN',@level2name=N'IsDeleted'
GO
USE [master]
GO
ALTER DATABASE [IBPTSmartOMS] SET  READ_WRITE 
GO
