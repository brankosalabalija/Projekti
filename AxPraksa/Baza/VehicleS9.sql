USE [master]
GO
/****** Object:  Database [VehicleSetup]    Script Date: 12/12/2018 12:17:20 PM ******/
CREATE DATABASE [VehicleSetup] ON  PRIMARY 
( NAME = N'VehicleSetup', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\VehicleSetup.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VehicleSetup_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\VehicleSetup_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VehicleSetup] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VehicleSetup].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VehicleSetup] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VehicleSetup] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VehicleSetup] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VehicleSetup] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VehicleSetup] SET ARITHABORT OFF 
GO
ALTER DATABASE [VehicleSetup] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VehicleSetup] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VehicleSetup] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VehicleSetup] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VehicleSetup] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VehicleSetup] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VehicleSetup] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VehicleSetup] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VehicleSetup] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VehicleSetup] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VehicleSetup] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VehicleSetup] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VehicleSetup] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VehicleSetup] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VehicleSetup] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VehicleSetup] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VehicleSetup] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VehicleSetup] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VehicleSetup] SET  MULTI_USER 
GO
ALTER DATABASE [VehicleSetup] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VehicleSetup] SET DB_CHAINING OFF 
GO
USE [VehicleSetup]
GO
/****** Object:  Table [dbo].[AdditionalFields]    Script Date: 12/12/2018 12:17:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdditionalFields](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FleetNo] [nvarchar](8) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Value] [nvarchar](50) NULL,
 CONSTRAINT [PK_AdditionalFields_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetSubType]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetSubType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubType] [nvarchar](15) NOT NULL,
	[AssetTypeID] [int] NOT NULL,
 CONSTRAINT [PK_AssetSubType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetType]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](20) NOT NULL,
	[IsVehicle] [bit] NOT NULL,
 CONSTRAINT [PK_AssetType_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attachments]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FleetNo] [nvarchar](8) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Extension] [nvarchar](5) NOT NULL,
	[Size] [nvarchar](10) NOT NULL,
	[Path] [nvarchar](200) NOT NULL,
	[Image] [image] NULL,
	[IsDefaultImage] [bit] NOT NULL,
 CONSTRAINT [PK_Attachments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Capacity]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Capacity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FleetNo] [nvarchar](8) NOT NULL,
	[Pallets] [int] NULL,
	[Spaces] [int] NULL,
	[CubicSpace] [decimal](9, 2) NULL,
	[InternalHeight] [decimal](7, 2) NULL,
	[InternalWidht] [decimal](7, 2) NULL,
	[InternalLenght] [decimal](7, 2) NULL,
	[Tare] [decimal](10, 3) NULL,
	[GVM] [decimal](10, 3) NULL,
	[GCM] [decimal](10, 3) NULL,
	[IsMainCapacity] [bit] NOT NULL,
	[AxelWeight1] [decimal](10, 3) NULL,
	[AxelWeight2] [decimal](10, 3) NULL,
	[AxelWeight3] [decimal](10, 3) NULL,
 CONSTRAINT [PK_Capacity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complience]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complience](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FleetNo] [nvarchar](8) NOT NULL,
	[ComplienceTypeID] [int] NOT NULL,
	[SubTypeID] [int] NOT NULL,
	[LicenceClass] [nvarchar](30) NULL,
	[LicenseNo] [nvarchar](12) NULL,
	[DateObtained] [date] NULL,
	[ValidFromDate] [date] NULL,
	[ExpiryDate] [date] NULL,
	[AlertOperation] [nvarchar](max) NULL,
 CONSTRAINT [PK_License] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComplienceSubType]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplienceSubType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_ComplienceSubType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComplienceType]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplienceType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Class] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_LiscenceClass] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FleetAsset]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FleetAsset](
	[FleetNo] [nvarchar](8) NOT NULL,
	[RegistrationNo] [nvarchar](12) NOT NULL,
	[Depot] [nvarchar](20) NOT NULL,
	[Year] [nvarchar](4) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[FleetAssetMakeID] [int] NOT NULL,
	[FleetAssetModelID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[SubTypeID] [int] NOT NULL,
	[FuelTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Details] PRIMARY KEY CLUSTERED 
(
	[FleetNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FleetAssetMake]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FleetAssetMake](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Specification] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FleetAssetModel]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FleetAssetModel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[FleetAssetMakeID] [int] NOT NULL,
 CONSTRAINT [PK_FleetAssetModel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FuelType]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuelType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fuel] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_FuelType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AccredDriverView]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AccredDriverView]
AS
SELECT        dbo.ComplienceType.Class, dbo.ComplienceSubType.Name, dbo.Complience.FleetNo, dbo.Complience.DateObtained, dbo.Complience.ValidFromDate, 
                         dbo.Complience.ExpiryDate
FROM            dbo.ComplienceType INNER JOIN
                         dbo.Complience ON dbo.ComplienceType.ID = dbo.Complience.ComplienceTypeID INNER JOIN
                         dbo.ComplienceSubType ON dbo.Complience.SubTypeID = dbo.ComplienceSubType.ID
WHERE        (dbo.Complience.ComplienceTypeID = 4) AND (dbo.Complience.SubTypeID = 1)
GO
/****** Object:  View [dbo].[AccredSubcontView]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AccredSubcontView]
AS
SELECT        dbo.Complience.FleetNo, dbo.ComplienceSubType.Name, dbo.ComplienceType.Class, dbo.Complience.ValidFromDate, dbo.Complience.ExpiryDate, 
                         dbo.Complience.AlertOperation, dbo.Complience.DateObtained, dbo.Complience.ID
FROM            dbo.Complience INNER JOIN
                         dbo.ComplienceSubType ON dbo.Complience.SubTypeID = dbo.ComplienceSubType.ID INNER JOIN
                         dbo.ComplienceType ON dbo.Complience.ComplienceTypeID = dbo.ComplienceType.ID
WHERE        (dbo.Complience.ComplienceTypeID = 4) AND (dbo.Complience.SubTypeID = 2)
GO
/****** Object:  View [dbo].[AccredTrailerView]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AccredTrailerView]
AS
SELECT        dbo.Complience.FleetNo, dbo.ComplienceSubType.Name, dbo.ComplienceType.Class, dbo.Complience.ValidFromDate, dbo.Complience.ExpiryDate, 
                         dbo.Complience.AlertOperation, dbo.Complience.DateObtained, dbo.Complience.ID
FROM            dbo.Complience INNER JOIN
                         dbo.ComplienceSubType ON dbo.Complience.SubTypeID = dbo.ComplienceSubType.ID INNER JOIN
                         dbo.ComplienceType ON dbo.Complience.ComplienceTypeID = dbo.ComplienceType.ID
WHERE        (dbo.Complience.ComplienceTypeID = 4) AND (dbo.Complience.SubTypeID = 4)
GO
/****** Object:  View [dbo].[InductionDriverView]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[InductionDriverView]
AS
SELECT        dbo.Complience.FleetNo, dbo.ComplienceSubType.Name, dbo.ComplienceType.Class, dbo.Complience.AlertOperation, dbo.Complience.ID
FROM            dbo.Complience INNER JOIN
                         dbo.ComplienceSubType ON dbo.Complience.SubTypeID = dbo.ComplienceSubType.ID INNER JOIN
                         dbo.ComplienceType ON dbo.Complience.ComplienceTypeID = dbo.ComplienceType.ID
WHERE        (dbo.Complience.ComplienceTypeID = 6) AND (dbo.Complience.SubTypeID = 1)
GO
/****** Object:  View [dbo].[InductionSubcontractorView]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[InductionSubcontractorView]
AS
SELECT        dbo.Complience.FleetNo, dbo.ComplienceSubType.Name, dbo.ComplienceType.Class, dbo.Complience.AlertOperation, dbo.Complience.ID
FROM            dbo.Complience INNER JOIN
                         dbo.ComplienceSubType ON dbo.Complience.SubTypeID = dbo.ComplienceSubType.ID INNER JOIN
                         dbo.ComplienceType ON dbo.Complience.ComplienceTypeID = dbo.ComplienceType.ID
WHERE        (dbo.Complience.ComplienceTypeID = 6) AND (dbo.Complience.SubTypeID = 2)
GO
/****** Object:  View [dbo].[InsuranceView]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[InsuranceView]
AS
SELECT        dbo.Complience.FleetNo, dbo.ComplienceSubType.Name, dbo.ComplienceType.Class, dbo.Complience.ValidFromDate, dbo.Complience.ExpiryDate, 
                         dbo.Complience.DateObtained, dbo.Complience.ID
FROM            dbo.Complience INNER JOIN
                         dbo.ComplienceSubType ON dbo.Complience.SubTypeID = dbo.ComplienceSubType.ID INNER JOIN
                         dbo.ComplienceType ON dbo.Complience.ComplienceTypeID = dbo.ComplienceType.ID
WHERE        (dbo.Complience.ComplienceTypeID = 2) AND (dbo.Complience.SubTypeID = 3)
GO
/****** Object:  View [dbo].[LicenceView]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LicenceView]
AS
SELECT        dbo.Complience.FleetNo, dbo.ComplienceSubType.Name, dbo.ComplienceType.Class, dbo.Complience.LicenceClass, dbo.Complience.LicenseNo, 
                         dbo.Complience.ValidFromDate, dbo.Complience.ExpiryDate, dbo.Complience.AlertOperation, dbo.Complience.ID
FROM            dbo.Complience INNER JOIN
                         dbo.ComplienceSubType ON dbo.Complience.SubTypeID = dbo.ComplienceSubType.ID INNER JOIN
                         dbo.ComplienceType ON dbo.Complience.ComplienceTypeID = dbo.ComplienceType.ID
WHERE        (dbo.Complience.ComplienceTypeID = 1) AND (dbo.Complience.SubTypeID = 1)
GO
/****** Object:  View [dbo].[RatingTrailerView]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RatingTrailerView]
AS
SELECT        dbo.Complience.FleetNo, dbo.ComplienceSubType.Name, dbo.ComplienceType.Class, dbo.Complience.AlertOperation, dbo.Complience.ID
FROM            dbo.Complience INNER JOIN
                         dbo.ComplienceSubType ON dbo.Complience.SubTypeID = dbo.ComplienceSubType.ID INNER JOIN
                         dbo.ComplienceType ON dbo.Complience.ComplienceTypeID = dbo.ComplienceType.ID
WHERE        (dbo.Complience.ComplienceTypeID = 5) AND (dbo.Complience.SubTypeID = 4)
GO
/****** Object:  View [dbo].[RatingVehicleView]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RatingVehicleView]
AS
SELECT        dbo.Complience.FleetNo, dbo.ComplienceSubType.Name, dbo.ComplienceType.Class, dbo.Complience.AlertOperation, dbo.Complience.ID
FROM            dbo.Complience INNER JOIN
                         dbo.ComplienceSubType ON dbo.Complience.SubTypeID = dbo.ComplienceSubType.ID INNER JOIN
                         dbo.ComplienceType ON dbo.Complience.ComplienceTypeID = dbo.ComplienceType.ID
WHERE        (dbo.Complience.ComplienceTypeID = 5) AND (dbo.Complience.SubTypeID = 3)
GO
/****** Object:  View [dbo].[RegTrailerView]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RegTrailerView]
AS
SELECT        dbo.Complience.FleetNo, dbo.ComplienceSubType.Name, dbo.ComplienceType.Class, dbo.Complience.ValidFromDate, dbo.Complience.ExpiryDate, 
                         dbo.Complience.AlertOperation, dbo.Complience.DateObtained, dbo.Complience.LicenseNo, dbo.Complience.ID
FROM            dbo.Complience INNER JOIN
                         dbo.ComplienceSubType ON dbo.Complience.SubTypeID = dbo.ComplienceSubType.ID INNER JOIN
                         dbo.ComplienceType ON dbo.Complience.ComplienceTypeID = dbo.ComplienceType.ID
WHERE        (dbo.Complience.ComplienceTypeID = 3) AND (dbo.Complience.SubTypeID = 4)
GO
/****** Object:  View [dbo].[RegVehicleView]    Script Date: 12/12/2018 12:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RegVehicleView]
AS
SELECT        dbo.Complience.FleetNo, dbo.ComplienceSubType.Name, dbo.ComplienceType.Class, dbo.Complience.ValidFromDate, dbo.Complience.ExpiryDate, 
                         dbo.Complience.AlertOperation, dbo.Complience.DateObtained, dbo.Complience.LicenseNo, dbo.Complience.ID
FROM            dbo.Complience INNER JOIN
                         dbo.ComplienceSubType ON dbo.Complience.SubTypeID = dbo.ComplienceSubType.ID INNER JOIN
                         dbo.ComplienceType ON dbo.Complience.ComplienceTypeID = dbo.ComplienceType.ID
WHERE        (dbo.Complience.ComplienceTypeID = 3) AND (dbo.Complience.SubTypeID = 3)
GO
SET IDENTITY_INSERT [dbo].[AssetSubType] ON 

INSERT [dbo].[AssetSubType] ([ID], [SubType], [AssetTypeID]) VALUES (1, N'Prime Mover', 1)
INSERT [dbo].[AssetSubType] ([ID], [SubType], [AssetTypeID]) VALUES (2, N'Rigid', 1)
INSERT [dbo].[AssetSubType] ([ID], [SubType], [AssetTypeID]) VALUES (3, N'Truck', 1)
INSERT [dbo].[AssetSubType] ([ID], [SubType], [AssetTypeID]) VALUES (4, N'A Trailer', 2)
INSERT [dbo].[AssetSubType] ([ID], [SubType], [AssetTypeID]) VALUES (5, N'B Trailer', 2)
SET IDENTITY_INSERT [dbo].[AssetSubType] OFF
SET IDENTITY_INSERT [dbo].[AssetType] ON 

INSERT [dbo].[AssetType] ([ID], [Type], [IsVehicle]) VALUES (1, N'Vehicle', 1)
INSERT [dbo].[AssetType] ([ID], [Type], [IsVehicle]) VALUES (2, N'Trailer', 0)
SET IDENTITY_INSERT [dbo].[AssetType] OFF
SET IDENTITY_INSERT [dbo].[Capacity] ON 

INSERT [dbo].[Capacity] ([ID], [FleetNo], [Pallets], [Spaces], [CubicSpace], [InternalHeight], [InternalWidht], [InternalLenght], [Tare], [GVM], [GCM], [IsMainCapacity], [AxelWeight1], [AxelWeight2], [AxelWeight3]) VALUES (1, N'TRA-001', 24, 24, CAST(52.54 AS Decimal(9, 2)), CAST(1.43 AS Decimal(7, 2)), CAST(2.46 AS Decimal(7, 2)), CAST(14.63 AS Decimal(7, 2)), CAST(5670.000 AS Decimal(10, 3)), CAST(37422.000 AS Decimal(10, 3)), CAST(56133.000 AS Decimal(10, 3)), 1, CAST(11340.000 AS Decimal(10, 3)), CAST(11340.000 AS Decimal(10, 3)), NULL)
INSERT [dbo].[Capacity] ([ID], [FleetNo], [Pallets], [Spaces], [CubicSpace], [InternalHeight], [InternalWidht], [InternalLenght], [Tare], [GVM], [GCM], [IsMainCapacity], [AxelWeight1], [AxelWeight2], [AxelWeight3]) VALUES (2, N'TRA-002', 23, 23, CAST(114.68 AS Decimal(9, 2)), CAST(2.79 AS Decimal(7, 2)), CAST(2.59 AS Decimal(7, 2)), CAST(16.00 AS Decimal(7, 2)), CAST(6441.120 AS Decimal(10, 3)), CAST(30844.800 AS Decimal(10, 3)), CAST(46267.200 AS Decimal(10, 3)), 1, CAST(10206.000 AS Decimal(10, 3)), CAST(10206.000 AS Decimal(10, 3)), NULL)
INSERT [dbo].[Capacity] ([ID], [FleetNo], [Pallets], [Spaces], [CubicSpace], [InternalHeight], [InternalWidht], [InternalLenght], [Tare], [GVM], [GCM], [IsMainCapacity], [AxelWeight1], [AxelWeight2], [AxelWeight3]) VALUES (3, N'TRA-003', 22, 22, CAST(106.01 AS Decimal(9, 2)), CAST(2.73 AS Decimal(7, 2)), CAST(2.47 AS Decimal(7, 2)), CAST(15.89 AS Decimal(7, 2)), CAST(5692.680 AS Decimal(10, 3)), CAST(29484.000 AS Decimal(10, 3)), CAST(44262.000 AS Decimal(10, 3)), 1, CAST(10206.000 AS Decimal(10, 3)), CAST(10206.000 AS Decimal(10, 3)), NULL)
INSERT [dbo].[Capacity] ([ID], [FleetNo], [Pallets], [Spaces], [CubicSpace], [InternalHeight], [InternalWidht], [InternalLenght], [Tare], [GVM], [GCM], [IsMainCapacity], [AxelWeight1], [AxelWeight2], [AxelWeight3]) VALUES (4, N'TRA-002', 20, 23, NULL, NULL, NULL, NULL, CAST(6500.000 AS Decimal(10, 3)), CAST(30844.800 AS Decimal(10, 3)), CAST(46267.200 AS Decimal(10, 3)), 0, CAST(10206.000 AS Decimal(10, 3)), CAST(10206.000 AS Decimal(10, 3)), NULL)
SET IDENTITY_INSERT [dbo].[Capacity] OFF
SET IDENTITY_INSERT [dbo].[Complience] ON 

INSERT [dbo].[Complience] ([ID], [FleetNo], [ComplienceTypeID], [SubTypeID], [LicenceClass], [LicenseNo], [DateObtained], [ValidFromDate], [ExpiryDate], [AlertOperation]) VALUES (1, N'VEPM-001', 2, 3, NULL, NULL, CAST(N'2018-06-20' AS Date), CAST(N'2018-06-20' AS Date), CAST(N'2020-06-20' AS Date), NULL)
INSERT [dbo].[Complience] ([ID], [FleetNo], [ComplienceTypeID], [SubTypeID], [LicenceClass], [LicenseNo], [DateObtained], [ValidFromDate], [ExpiryDate], [AlertOperation]) VALUES (2, N'VEPM-001', 5, 3, NULL, NULL, NULL, NULL, NULL, N'Good')
INSERT [dbo].[Complience] ([ID], [FleetNo], [ComplienceTypeID], [SubTypeID], [LicenceClass], [LicenseNo], [DateObtained], [ValidFromDate], [ExpiryDate], [AlertOperation]) VALUES (3, N'VEPM-001', 3, 3, NULL, N'DL 1Y A355', CAST(N'2018-06-20' AS Date), CAST(N'2018-06-20' AS Date), CAST(N'2019-06-20' AS Date), NULL)
INSERT [dbo].[Complience] ([ID], [FleetNo], [ComplienceTypeID], [SubTypeID], [LicenceClass], [LicenseNo], [DateObtained], [ValidFromDate], [ExpiryDate], [AlertOperation]) VALUES (5, N'TRA-001', 3, 4, NULL, N'A 798 AP', CAST(N'2018-01-01' AS Date), CAST(N'2018-01-01' AS Date), CAST(N'2019-01-01' AS Date), NULL)
INSERT [dbo].[Complience] ([ID], [FleetNo], [ComplienceTypeID], [SubTypeID], [LicenceClass], [LicenseNo], [DateObtained], [ValidFromDate], [ExpiryDate], [AlertOperation]) VALUES (6, N'TRA-001', 4, 4, NULL, NULL, CAST(N'2018-01-01' AS Date), CAST(N'2018-01-01' AS Date), CAST(N'2018-03-01' AS Date), N'Allowed for urban area')
INSERT [dbo].[Complience] ([ID], [FleetNo], [ComplienceTypeID], [SubTypeID], [LicenceClass], [LicenseNo], [DateObtained], [ValidFromDate], [ExpiryDate], [AlertOperation]) VALUES (7, N'TRA-001', 5, 4, NULL, NULL, NULL, NULL, NULL, N'Good')
INSERT [dbo].[Complience] ([ID], [FleetNo], [ComplienceTypeID], [SubTypeID], [LicenceClass], [LicenseNo], [DateObtained], [ValidFromDate], [ExpiryDate], [AlertOperation]) VALUES (8, N'TRA-002', 3, 4, NULL, N'DE 57 UGK', CAST(N'2018-03-30' AS Date), CAST(N'2018-03-30' AS Date), CAST(N'2019-03-30' AS Date), NULL)
INSERT [dbo].[Complience] ([ID], [FleetNo], [ComplienceTypeID], [SubTypeID], [LicenceClass], [LicenseNo], [DateObtained], [ValidFromDate], [ExpiryDate], [AlertOperation]) VALUES (9, N'TRA-002', 4, 4, NULL, NULL, CAST(N'2018-03-30' AS Date), CAST(N'2018-03-30' AS Date), CAST(N'2018-05-30' AS Date), N'Allowed on highway')
INSERT [dbo].[Complience] ([ID], [FleetNo], [ComplienceTypeID], [SubTypeID], [LicenceClass], [LicenseNo], [DateObtained], [ValidFromDate], [ExpiryDate], [AlertOperation]) VALUES (10, N'TRA-002', 5, 4, NULL, NULL, NULL, NULL, NULL, N'Excellent')
INSERT [dbo].[Complience] ([ID], [FleetNo], [ComplienceTypeID], [SubTypeID], [LicenceClass], [LicenseNo], [DateObtained], [ValidFromDate], [ExpiryDate], [AlertOperation]) VALUES (11, N'TRA-003', 3, 4, NULL, N'BD 779 A6', CAST(N'2018-10-10' AS Date), CAST(N'2018-10-10' AS Date), CAST(N'2019-10-10' AS Date), NULL)
INSERT [dbo].[Complience] ([ID], [FleetNo], [ComplienceTypeID], [SubTypeID], [LicenceClass], [LicenseNo], [DateObtained], [ValidFromDate], [ExpiryDate], [AlertOperation]) VALUES (12, N'TRA-003', 4, 4, NULL, NULL, CAST(N'2018-10-10' AS Date), CAST(N'2018-10-10' AS Date), CAST(N'2018-12-10' AS Date), N'For something')
INSERT [dbo].[Complience] ([ID], [FleetNo], [ComplienceTypeID], [SubTypeID], [LicenceClass], [LicenseNo], [DateObtained], [ValidFromDate], [ExpiryDate], [AlertOperation]) VALUES (13, N'TRA-003', 5, 4, NULL, NULL, NULL, NULL, NULL, N'Excellent')
SET IDENTITY_INSERT [dbo].[Complience] OFF
SET IDENTITY_INSERT [dbo].[ComplienceSubType] ON 

INSERT [dbo].[ComplienceSubType] ([ID], [Name]) VALUES (1, N'Driver')
INSERT [dbo].[ComplienceSubType] ([ID], [Name]) VALUES (2, N'Subcontractor')
INSERT [dbo].[ComplienceSubType] ([ID], [Name]) VALUES (3, N'Vehicle')
INSERT [dbo].[ComplienceSubType] ([ID], [Name]) VALUES (4, N'Trailer')
SET IDENTITY_INSERT [dbo].[ComplienceSubType] OFF
SET IDENTITY_INSERT [dbo].[ComplienceType] ON 

INSERT [dbo].[ComplienceType] ([ID], [Class]) VALUES (1, N'License')
INSERT [dbo].[ComplienceType] ([ID], [Class]) VALUES (2, N'Incuranse')
INSERT [dbo].[ComplienceType] ([ID], [Class]) VALUES (3, N'Registration')
INSERT [dbo].[ComplienceType] ([ID], [Class]) VALUES (4, N'Accreditation')
INSERT [dbo].[ComplienceType] ([ID], [Class]) VALUES (5, N'Rating')
INSERT [dbo].[ComplienceType] ([ID], [Class]) VALUES (6, N'Induction')
SET IDENTITY_INSERT [dbo].[ComplienceType] OFF
INSERT [dbo].[FleetAsset] ([FleetNo], [RegistrationNo], [Depot], [Year], [Description], [FleetAssetMakeID], [FleetAssetModelID], [TypeID], [SubTypeID], [FuelTypeID]) VALUES (N'TRA-001', N'A 798 AP', N'In England', N'2004', N'0', 6, 9, 2, 4, 1)
INSERT [dbo].[FleetAsset] ([FleetNo], [RegistrationNo], [Depot], [Year], [Description], [FleetAssetMakeID], [FleetAssetModelID], [TypeID], [SubTypeID], [FuelTypeID]) VALUES (N'TRA-002', N'DE 57 UGK', N'In England', N'2010', N'0', 7, 8, 2, 4, 1)
INSERT [dbo].[FleetAsset] ([FleetNo], [RegistrationNo], [Depot], [Year], [Description], [FleetAssetMakeID], [FleetAssetModelID], [TypeID], [SubTypeID], [FuelTypeID]) VALUES (N'TRA-003', N'BD 779 A6', N'In Germany', N'2007', N'0', 7, 10, 2, 4, 1)
INSERT [dbo].[FleetAsset] ([FleetNo], [RegistrationNo], [Depot], [Year], [Description], [FleetAssetMakeID], [FleetAssetModelID], [TypeID], [SubTypeID], [FuelTypeID]) VALUES (N'VEPM-001', N'DL 1Y A355', N'In England', N'2008', N'0', 1, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[FleetAssetMake] ON 

INSERT [dbo].[FleetAssetMake] ([ID], [Manufacturer]) VALUES (1, N'Volvo')
INSERT [dbo].[FleetAssetMake] ([ID], [Manufacturer]) VALUES (2, N'Mercedes Benz')
INSERT [dbo].[FleetAssetMake] ([ID], [Manufacturer]) VALUES (3, N'Iveco')
INSERT [dbo].[FleetAssetMake] ([ID], [Manufacturer]) VALUES (4, N'Kamaz')
INSERT [dbo].[FleetAssetMake] ([ID], [Manufacturer]) VALUES (5, N'Man')
INSERT [dbo].[FleetAssetMake] ([ID], [Manufacturer]) VALUES (6, N'Felling Trailer')
INSERT [dbo].[FleetAssetMake] ([ID], [Manufacturer]) VALUES (7, N'Hyundai Translead')
SET IDENTITY_INSERT [dbo].[FleetAssetMake] OFF
SET IDENTITY_INSERT [dbo].[FleetAssetModel] ON 

INSERT [dbo].[FleetAssetModel] ([ID], [Name], [FleetAssetMakeID]) VALUES (1, N'FH16', 1)
INSERT [dbo].[FleetAssetModel] ([ID], [Name], [FleetAssetMakeID]) VALUES (2, N'FH', 1)
INSERT [dbo].[FleetAssetModel] ([ID], [Name], [FleetAssetMakeID]) VALUES (3, N'Actros', 2)
INSERT [dbo].[FleetAssetModel] ([ID], [Name], [FleetAssetMakeID]) VALUES (4, N'NG', 2)
INSERT [dbo].[FleetAssetModel] ([ID], [Name], [FleetAssetMakeID]) VALUES (5, N'Zeta', 3)
INSERT [dbo].[FleetAssetModel] ([ID], [Name], [FleetAssetMakeID]) VALUES (6, N'6560', 4)
INSERT [dbo].[FleetAssetModel] ([ID], [Name], [FleetAssetMakeID]) VALUES (7, N'TGL', 5)
INSERT [dbo].[FleetAssetModel] ([ID], [Name], [FleetAssetMakeID]) VALUES (8, N'HY-Cube', 7)
INSERT [dbo].[FleetAssetModel] ([ID], [Name], [FleetAssetMakeID]) VALUES (9, N'FT-70-2 HX', 6)
INSERT [dbo].[FleetAssetModel] ([ID], [Name], [FleetAssetMakeID]) VALUES (10, N'TermoTech SP', 7)
SET IDENTITY_INSERT [dbo].[FleetAssetModel] OFF
SET IDENTITY_INSERT [dbo].[FuelType] ON 

INSERT [dbo].[FuelType] ([ID], [Fuel]) VALUES (1, N'Diesel')
INSERT [dbo].[FuelType] ([ID], [Fuel]) VALUES (2, N'Off-Road Diesel')
INSERT [dbo].[FuelType] ([ID], [Fuel]) VALUES (3, N'Bio-Diesel')
SET IDENTITY_INSERT [dbo].[FuelType] OFF
ALTER TABLE [dbo].[AdditionalFields]  WITH CHECK ADD  CONSTRAINT [FK_AdditionalFields_Details] FOREIGN KEY([FleetNo])
REFERENCES [dbo].[FleetAsset] ([FleetNo])
GO
ALTER TABLE [dbo].[AdditionalFields] CHECK CONSTRAINT [FK_AdditionalFields_Details]
GO
ALTER TABLE [dbo].[AssetSubType]  WITH CHECK ADD  CONSTRAINT [FK_AssetSubType_AssetType] FOREIGN KEY([AssetTypeID])
REFERENCES [dbo].[AssetType] ([ID])
GO
ALTER TABLE [dbo].[AssetSubType] CHECK CONSTRAINT [FK_AssetSubType_AssetType]
GO
ALTER TABLE [dbo].[Attachments]  WITH CHECK ADD  CONSTRAINT [FK_Attachments_Details] FOREIGN KEY([FleetNo])
REFERENCES [dbo].[FleetAsset] ([FleetNo])
GO
ALTER TABLE [dbo].[Attachments] CHECK CONSTRAINT [FK_Attachments_Details]
GO
ALTER TABLE [dbo].[Capacity]  WITH CHECK ADD  CONSTRAINT [FK_Capacity_Details] FOREIGN KEY([FleetNo])
REFERENCES [dbo].[FleetAsset] ([FleetNo])
GO
ALTER TABLE [dbo].[Capacity] CHECK CONSTRAINT [FK_Capacity_Details]
GO
ALTER TABLE [dbo].[Complience]  WITH CHECK ADD  CONSTRAINT [FK_Complience_ComplienceSubType] FOREIGN KEY([SubTypeID])
REFERENCES [dbo].[ComplienceSubType] ([ID])
GO
ALTER TABLE [dbo].[Complience] CHECK CONSTRAINT [FK_Complience_ComplienceSubType]
GO
ALTER TABLE [dbo].[Complience]  WITH CHECK ADD  CONSTRAINT [FK_Complience_ComplienceType] FOREIGN KEY([ComplienceTypeID])
REFERENCES [dbo].[ComplienceType] ([ID])
GO
ALTER TABLE [dbo].[Complience] CHECK CONSTRAINT [FK_Complience_ComplienceType]
GO
ALTER TABLE [dbo].[Complience]  WITH CHECK ADD  CONSTRAINT [FK_Complience_Details] FOREIGN KEY([FleetNo])
REFERENCES [dbo].[FleetAsset] ([FleetNo])
GO
ALTER TABLE [dbo].[Complience] CHECK CONSTRAINT [FK_Complience_Details]
GO
ALTER TABLE [dbo].[FleetAsset]  WITH CHECK ADD  CONSTRAINT [FK_Details_AssetSubType] FOREIGN KEY([SubTypeID])
REFERENCES [dbo].[AssetSubType] ([ID])
GO
ALTER TABLE [dbo].[FleetAsset] CHECK CONSTRAINT [FK_Details_AssetSubType]
GO
ALTER TABLE [dbo].[FleetAsset]  WITH CHECK ADD  CONSTRAINT [FK_Details_AssetType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[AssetType] ([ID])
GO
ALTER TABLE [dbo].[FleetAsset] CHECK CONSTRAINT [FK_Details_AssetType]
GO
ALTER TABLE [dbo].[FleetAsset]  WITH CHECK ADD  CONSTRAINT [FK_Details_FleetAssetMake] FOREIGN KEY([FleetAssetMakeID])
REFERENCES [dbo].[FleetAssetMake] ([ID])
GO
ALTER TABLE [dbo].[FleetAsset] CHECK CONSTRAINT [FK_Details_FleetAssetMake]
GO
ALTER TABLE [dbo].[FleetAsset]  WITH CHECK ADD  CONSTRAINT [FK_Details_FleetAssetModel] FOREIGN KEY([FleetAssetModelID])
REFERENCES [dbo].[FleetAssetModel] ([ID])
GO
ALTER TABLE [dbo].[FleetAsset] CHECK CONSTRAINT [FK_Details_FleetAssetModel]
GO
ALTER TABLE [dbo].[FleetAsset]  WITH CHECK ADD  CONSTRAINT [FK_Details_FuelType] FOREIGN KEY([FuelTypeID])
REFERENCES [dbo].[FuelType] ([ID])
GO
ALTER TABLE [dbo].[FleetAsset] CHECK CONSTRAINT [FK_Details_FuelType]
GO
ALTER TABLE [dbo].[FleetAssetModel]  WITH CHECK ADD  CONSTRAINT [FK_FleetAssetModel_FleetAssetMake] FOREIGN KEY([FleetAssetMakeID])
REFERENCES [dbo].[FleetAssetMake] ([ID])
GO
ALTER TABLE [dbo].[FleetAssetModel] CHECK CONSTRAINT [FK_FleetAssetModel_FleetAssetMake]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ComplienceType"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 101
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Complience"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 135
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceSubType"
            Begin Extent = 
               Top = 6
               Left = 474
               Bottom = 101
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccredDriverView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccredDriverView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Complience"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceSubType"
            Begin Extent = 
               Top = 6
               Left = 266
               Bottom = 101
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceType"
            Begin Extent = 
               Top = 6
               Left = 474
               Bottom = 101
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccredSubcontView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccredSubcontView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Complience"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceSubType"
            Begin Extent = 
               Top = 6
               Left = 266
               Bottom = 101
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceType"
            Begin Extent = 
               Top = 6
               Left = 474
               Bottom = 101
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccredTrailerView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccredTrailerView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Complience"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceSubType"
            Begin Extent = 
               Top = 6
               Left = 266
               Bottom = 101
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceType"
            Begin Extent = 
               Top = 6
               Left = 474
               Bottom = 101
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'InductionDriverView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'InductionDriverView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Complience"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceSubType"
            Begin Extent = 
               Top = 6
               Left = 266
               Bottom = 101
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceType"
            Begin Extent = 
               Top = 6
               Left = 474
               Bottom = 101
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'InductionSubcontractorView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'InductionSubcontractorView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Complience"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceSubType"
            Begin Extent = 
               Top = 6
               Left = 266
               Bottom = 101
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceType"
            Begin Extent = 
               Top = 6
               Left = 474
               Bottom = 101
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'InsuranceView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'InsuranceView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Complience"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceSubType"
            Begin Extent = 
               Top = 6
               Left = 266
               Bottom = 101
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceType"
            Begin Extent = 
               Top = 6
               Left = 474
               Bottom = 101
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LicenceView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LicenceView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Complience"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceSubType"
            Begin Extent = 
               Top = 6
               Left = 266
               Bottom = 101
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceType"
            Begin Extent = 
               Top = 6
               Left = 474
               Bottom = 101
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RatingTrailerView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RatingTrailerView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Complience"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceSubType"
            Begin Extent = 
               Top = 6
               Left = 266
               Bottom = 101
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceType"
            Begin Extent = 
               Top = 6
               Left = 474
               Bottom = 101
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RatingVehicleView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RatingVehicleView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Complience"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceSubType"
            Begin Extent = 
               Top = 6
               Left = 266
               Bottom = 101
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceType"
            Begin Extent = 
               Top = 6
               Left = 474
               Bottom = 101
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RegTrailerView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RegTrailerView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Complience"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceSubType"
            Begin Extent = 
               Top = 6
               Left = 266
               Bottom = 101
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplienceType"
            Begin Extent = 
               Top = 6
               Left = 474
               Bottom = 101
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RegVehicleView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RegVehicleView'
GO
USE [master]
GO
ALTER DATABASE [VehicleSetup] SET  READ_WRITE 
GO
