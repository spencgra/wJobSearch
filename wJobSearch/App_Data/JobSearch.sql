USE [master]
GO
/****** Object:  Database [JobSearch]    Script Date: 05/12/2022 23:12:14 ******/
CREATE DATABASE [JobSearch]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JobSearch', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JobSearch.mdf' , SIZE = 102400KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JobSearch_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JobSearch_log.ldf' , SIZE = 40960KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [JobSearch] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JobSearch].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JobSearch] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JobSearch] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JobSearch] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JobSearch] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JobSearch] SET ARITHABORT OFF 
GO
ALTER DATABASE [JobSearch] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JobSearch] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JobSearch] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JobSearch] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JobSearch] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JobSearch] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JobSearch] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JobSearch] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JobSearch] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JobSearch] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JobSearch] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JobSearch] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JobSearch] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JobSearch] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JobSearch] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JobSearch] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JobSearch] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JobSearch] SET RECOVERY FULL 
GO
ALTER DATABASE [JobSearch] SET  MULTI_USER 
GO
ALTER DATABASE [JobSearch] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JobSearch] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JobSearch] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JobSearch] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JobSearch] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JobSearch', N'ON'
GO
ALTER DATABASE [JobSearch] SET QUERY_STORE = OFF
GO

USE [JobSearch]
GO

/****** Object:  Table [dbo].[JobSiteDetails]    Script Date: 05/12/2022 23:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobSiteDetails](
	[SiteID] [int] IDENTITY(1,1) NOT NULL,
	[SiteName] [nvarchar](50) NULL,
	[SiteTopLink] [nvarchar](max) NULL,
 CONSTRAINT [PK_JobSiteDetails] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EmployerDatails]    Script Date: 05/12/2022 23:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployerDatails](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[EmployerName] [nvarchar](50) NULL,
	[EmployerSite] [nvarchar](max) NULL,
 CONSTRAINT [PK_EmployerDatails] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[InterviewTypeLookup]    Script Date: 05/12/2022 23:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterviewTypeLookup](
	[IntTypeID] [int] IDENTITY(1,1) NOT NULL,
	[InterviewType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_InterviewTypeLookup] PRIMARY KEY CLUSTERED 
(
	[IntTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterviewDetailes]    Script Date: 05/12/2022 23:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterviewDetailes](
	[JobID] [int] NOT NULL,
	[InterviewDate] [datetime] NOT NULL,
	[InterviewType] [int] NOT NULL,
	[InterviewLocation] [nvarchar](max) NOT NULL,
	[InterviewNotes] [nvarchar](max) NULL,
 CONSTRAINT [PK_InterviewDetailes] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[StatusLookup]    Script Date: 05/12/2022 23:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusLookup](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_StatusLookup] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[JobDetails]    Script Date: 05/12/2022 23:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobDetails](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[JobSite] [int] NOT NULL,
	[Employer] [int] NOT NULL,
	[JobTitle] [nvarchar](64) NOT NULL,
	[JobSiteLink] [nvarchar](max) NULL,
	[EmployerRef] [nvarchar](50) NULL,
	[ClosingDate] [date] NULL,
	[ContactName] [nvarchar](50) NULL,
	[ContactNumber] [nvarchar](50) NULL,
	[AddedToUC] [bit] NULL,
 CONSTRAINT [PK_JobDetails] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[JobSearchHistory]    Script Date: 05/12/2022 23:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobSearchHistory](
	[HistID] [int] IDENTITY(1,1) NOT NULL,
	[JobID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[StatusDate] [date] NOT NULL,
	[StatusDescription] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  View [dbo].[v_LastHistTransaction]    Script Date: 05/12/2022 23:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_LastHistTransaction]
AS
SELECT t.HistID, t.JobID, t.Status, t.StatusDate, t.StatusDescription
FROM   (SELECT MAX(HistID) AS HID, MAX(Status) AS mStatus
             FROM    dbo.JobSearchHistory
             GROUP BY JobID) AS i INNER JOIN
             dbo.JobSearchHistory AS t ON t.HistID = i.HID
GO

/****** Object:  View [dbo].[v_JobDetails]    Script Date: 05/12/2022 23:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_JobDetails]
AS
SELECT dbo.JobDetails.JobID, dbo.JobSiteDetails.SiteName AS [Job Site], dbo.EmployerDatails.EmployerName AS [Employer Name], dbo.JobDetails.JobTitle, dbo.JobDetails.JobSiteLink, dbo.StatusLookup.Status AS LastStatus, dbo.v_LastHistTransaction.StatusDate, 
             CASE WHEN AddedToUC = 1 THEN 'Yes' ELSE 'No' END AS InUC, dbo.JobDetails.ClosingDate, FORMAT(dbo.InterviewDetailes.InterviewDate, 'dd-MMM-yyyy HH:mm') AS [Interview Date], dbo.InterviewTypeLookup.InterviewType AS [Interview Type], 
             dbo.InterviewDetailes.InterviewLocation AS Location, CASE WHEN v_LastHistTransaction.Status IN (4, 5, 6) THEN 'N' ELSE 'Y' END AS Active
FROM   dbo.InterviewTypeLookup INNER JOIN
             dbo.InterviewDetailes ON dbo.InterviewTypeLookup.IntTypeID = dbo.InterviewDetailes.InterviewType RIGHT OUTER JOIN
             dbo.JobDetails INNER JOIN
             dbo.v_LastHistTransaction ON dbo.JobDetails.JobID = dbo.v_LastHistTransaction.JobID ON dbo.InterviewDetailes.JobID = dbo.JobDetails.JobID LEFT OUTER JOIN
             dbo.EmployerDatails ON dbo.JobDetails.Employer = dbo.EmployerDatails.EmpID LEFT OUTER JOIN
             dbo.StatusLookup ON dbo.v_LastHistTransaction.Status = dbo.StatusLookup.StatusID LEFT OUTER JOIN
             dbo.JobSiteDetails ON dbo.JobDetails.JobSite = dbo.JobSiteDetails.SiteID
GO

/****** Object:  View [dbo].[v_JobDetails_Active]    Script Date: 05/12/2022 23:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_JobDetails_Active]
AS
SELECT JobID, [Job Site], [Employer Name], JobTitle, JobSiteLink, LastStatus, StatusDate, InUC, ClosingDate, [Interview Date], [Interview Type], Location
FROM   dbo.v_JobDetails
WHERE (Active = 'Y')
GO

/****** Object:  Table [dbo].[Calendar]    Script Date: 05/12/2022 23:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendar](
	[Date] [date] NULL,
	[DAY] [int] NULL,
	[DaySuffix] [char](2) NULL,
	[DayName] [nvarchar](30) NULL,
	[ShortDayName] [nvarchar](3) NULL,
	[DayOfWeek] [int] NULL,
	[DayOfYear] [int] NULL,
	[IsWeekend] [int] NOT NULL,
	[Week] [int] NULL,
	[FirstOfWeek] [date] NULL,
	[LastOfWeek] [date] NULL,
	[WeekOfMonth] [tinyint] NULL,
	[TheMonth] [int] NULL,
	[MonthName] [nvarchar](30) NULL,
	[ShortMonthName] [nvarchar](3) NULL,
	[FirstOfMonth] [date] NULL,
	[LastOfMonth] [date] NULL,
	[FirstOfNextMonth] [date] NULL,
	[LastOfNextMonth] [date] NULL,
	[Quarter] [int] NULL,
	[YY-QQ] [varchar](5) NULL,
	[FirstOfQuarter] [date] NULL,
	[LastOfQuarter] [date] NULL,
	[Year] [int] NULL,
	[FirstOfYear] [date] NULL,
	[LastOfYear] [date] NULL,
	[IsLeapYear] [bit] NULL,
	[Has53Weeks] [int] NOT NULL
) ON [PRIMARY]
GO

/****** Object:  Index [PK_Calendar]    Script Date: 05/12/2022 23:12:14 ******/
CREATE UNIQUE CLUSTERED INDEX [PK_Calendar] ON [dbo].[Calendar]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[JobDetails] ADD  CONSTRAINT [DF_JobDetails_AddedToUC]  DEFAULT ((0)) FOR [AddedToUC]
GO
ALTER TABLE [dbo].[JobSearchHistory] ADD  CONSTRAINT [DF_JobSearchHistory_StatusDate]  DEFAULT (getdate()) FOR [StatusDate]
GO

/****** Object:  StoredProcedure [dbo].[ShowLookUp]    Script Date: 05/12/2022 23:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ShowLookUp] 
AS
BEGIN
	SELECT * FROM [dbo].[StatusLookup]
	SELECT * FROM [dbo].[InterviewTypeLookup]
END
GO
USE [master]
GO
ALTER DATABASE [JobSearch] SET  READ_WRITE 
GO
