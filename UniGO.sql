USE [master]
GO
/****** Object:  Database [University]    Script Date: 8/27/2018 10:38:39 AM ******/
CREATE DATABASE [University]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'University', FILENAME = N'D:\Quy\SQLDATA\University.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'University_log', FILENAME = N'D:\Quy\SQLDATA\University_log.ldf' , SIZE = 3136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [University] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [University].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [University] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [University] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [University] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [University] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [University] SET ARITHABORT OFF 
GO
ALTER DATABASE [University] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [University] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [University] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [University] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [University] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [University] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [University] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [University] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [University] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [University] SET  DISABLE_BROKER 
GO
ALTER DATABASE [University] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [University] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [University] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [University] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [University] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [University] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [University] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [University] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [University] SET  MULTI_USER 
GO
ALTER DATABASE [University] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [University] SET DB_CHAINING OFF 
GO
ALTER DATABASE [University] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [University] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [University] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'University', N'ON'
GO
ALTER DATABASE [University] SET QUERY_STORE = OFF
GO
USE [University]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [University]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 8/27/2018 10:38:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](255) NOT NULL,
	[Contents] [varchar](255) NOT NULL,
	[CreateDate] [datetime] NULL,
	[Description] [varchar](255) NULL,
	[Image] [varchar](255) NULL,
	[IsActive] [bit] NULL,
	[Title] [varchar](255) NOT NULL,
	[UniversityId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleTag]    Script Date: 8/27/2018 10:38:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleTag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NULL,
	[MajorUniId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Block]    Script Date: 8/27/2018 10:38:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Block](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BlockName] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
	[PreBlockId] [int] NULL,
 CONSTRAINT [PK__Block__3214EC0789D0127E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlockMajorUniversity]    Script Date: 8/27/2018 10:38:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlockMajorUniversity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NULL,
	[BLockId] [int] NOT NULL,
	[MajorUniversityID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlockOfMajor]    Script Date: 8/27/2018 10:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlockOfMajor](
	[Id] [int] NOT NULL,
	[isActive] [bit] NULL,
	[BlockId] [int] NULL,
	[MajorId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 8/27/2018 10:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MajorUniversityId] [int] NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMajor]    Script Date: 8/27/2018 10:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMajor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK__GroupMaj__3214EC07D54B7830] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HighSchool]    Script Date: 8/27/2018 10:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HighSchool](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[LocationId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 8/27/2018 10:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NULL,
	[LocationCode] [nvarchar](255) NULL,
	[LocationName] [nvarchar](255) NULL,
 CONSTRAINT [PK__Location__3214EC07A87B2D67] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Major]    Script Date: 8/27/2018 10:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[MajorName] [nvarchar](255) NOT NULL,
	[GroupMajorId] [int] NULL,
 CONSTRAINT [PK__Major__3214EC07AEDA8058] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MajorMBTI]    Script Date: 8/27/2018 10:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MajorMBTI](
	[Id] [int] NOT NULL,
	[isActive] [bit] NULL,
	[MajorId] [int] NULL,
	[MBTITypeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MajorUniversity]    Script Date: 8/27/2018 10:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MajorUniversity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NULL,
	[isActive] [bit] NULL,
	[NumberOfYear] [float] NULL,
	[Prospects] [varchar](255) NULL,
	[Requirement] [varchar](255) NULL,
	[MajorId] [int] NULL,
	[UniversityId] [int] NULL,
 CONSTRAINT [PK__MajorUni__3214EC07657BF0B8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MBTIGroup]    Script Date: 8/27/2018 10:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MBTIGroup](
	[Id] [int] NOT NULL,
	[isActive] [bit] NULL,
	[MBTIGroupName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MBTIQuestion]    Script Date: 8/27/2018 10:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MBTIQuestion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](255) NULL,
	[isActive] [bit] NULL,
	[Option1Name] [nvarchar](225) NULL,
	[Option2Name] [nvarchar](225) NULL,
	[QuestionContent] [nvarchar](225) NULL,
	[MBTIGroupId] [int] NULL,
 CONSTRAINT [PK__MBTIQues__3214EC073ADAF15D] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MBTIResult]    Script Date: 8/27/2018 10:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MBTIResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestDate] [datetime] NULL,
	[MBTITypeId] [int] NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MBTIType]    Script Date: 8/27/2018 10:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MBTIType](
	[Id] [int] NOT NULL,
	[contentType] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[isActive] [bit] NOT NULL,
	[MBTITypeName] [nvarchar](255) NULL,
 CONSTRAINT [PK__MBTIType__3214EC075EC0B771] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 8/27/2018 10:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ProviderID] [varchar](255) NOT NULL,
	[ProviderName] [varchar](255) NOT NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionAnswer]    Script Date: 8/27/2018 10:38:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionAnswer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Contents] [nvarchar](255) NOT NULL,
	[Count] [int] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[LastUpdatedTime] [datetime] NULL,
	[NumberOfReport] [int] NULL,
	[ParentId] [int] NOT NULL,
	[Status] [bit] NULL,
	[Title] [nvarchar](255) NULL,
	[Type] [int] NOT NULL,
	[Vote] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK__Question__3214EC079CF285B6] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionTag]    Script Date: 8/27/2018 10:38:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionTag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NULL,
	[TagId] [int] NULL,
 CONSTRAINT [PK__Question__3214EC075E2AFE2A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 8/27/2018 10:38:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionAnswerId] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK__Report__3214EC073FB48794] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 8/27/2018 10:38:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NULL,
	[IsActive] [bit] NULL,
	[IsRecomment] [bit] NULL,
	[StarCare] [int] NULL,
	[StarCareer] [int] NULL,
	[StarFacilities] [int] NULL,
	[StarSocieties] [int] NULL,
	[StarTeaching] [int] NULL,
	[Status] [bit] NULL,
	[Title] [varchar](255) NULL,
	[UniversityId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewAverage]    Script Date: 8/27/2018 10:38:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewAverage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AveRecomment] [float] NOT NULL,
	[AveStarCare] [float] NOT NULL,
	[AveStarCareer] [float] NOT NULL,
	[AveStarFacilities] [float] NOT NULL,
	[AveStarSocieties] [float] NOT NULL,
	[AveStarTeaching] [float] NOT NULL,
	[TotalReview] [int] NOT NULL,
	[UniversityId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewLike]    Script Date: 8/27/2018 10:38:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewLike](
	[Id] [int] NOT NULL,
	[isActive] [bit] NULL,
	[IsLike] [bit] NULL,
	[ReviewId] [int] NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewMajor]    Script Date: 8/27/2018 10:38:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewMajor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NULL,
	[IsRecomment] [bit] NULL,
	[StarCareer] [int] NULL,
	[StarTeaching] [int] NULL,
	[MajorUniId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewMajorAverage]    Script Date: 8/27/2018 10:38:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewMajorAverage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AveRecomment] [float] NOT NULL,
	[AveStarCareer] [float] NOT NULL,
	[AveStarTeaching] [float] NOT NULL,
	[TotalReview] [int] NOT NULL,
	[MajorUniversityId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/27/2018 10:38:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScoreHistory]    Script Date: 8/27/2018 10:38:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScoreHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Barem] [int] NULL,
	[Description] [varchar](255) NULL,
	[Score] [float] NULL,
	[Year] [int] NULL,
	[BlockMajorUniId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 8/27/2018 10:38:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[TagName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainSystem]    Script Date: 8/27/2018 10:38:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainSystem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__TrainSys__3214EC076FD78170] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[University]    Script Date: 8/27/2018 10:38:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[University](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Website] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[UniAddress] [nvarchar](max) NULL,
	[Logo] [nvarchar](max) NULL,
	[Phone] [nvarchar](255) NULL,
	[Priority] [int] NULL,
	[LocationId] [int] NULL,
	[TrainSystemId] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__Universi__3214EC07A4488F8A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/27/2018 10:38:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](255) NULL,
	[Image] [varchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [varchar](255) NULL,
	[Password] [varchar](255) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[HighSchoolId] [int] NULL,
	[RoleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vote]    Script Date: 8/27/2018 10:38:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionAnswerId] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK__Vote__3214EC07D44C77A9] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([Id], [Code], [Contents], [CreateDate], [Description], [Image], [IsActive], [Title], [UniversityId]) VALUES (7, N'AHNAAAAAAAAAAAAA', N'xzczxzxvzxczxczxczxczxczxczxczxczxxzczxzxvzxczxczxczxczxczxczxczxczxxzczxzxvzxczxczxczxczxczxczxczxczxxzczxzxvzxczxczxczxczxczxczxczxczx', CAST(N'2018-08-22T10:50:54.297' AS DateTime), N'ádasdasdczxczxczxc', NULL, 1, N'AAAAAAAAAAAAAAAAAA', 2)
INSERT [dbo].[Article] ([Id], [Code], [Contents], [CreateDate], [Description], [Image], [IsActive], [Title], [UniversityId]) VALUES (8, N'VVVVVVVVVVV', N'xzczxzxvzxczxczxczxczxczxczxczxczxxzczxzxvzxczxczxczxczxczxczxczxczxxzczxzxvzxczxczxczxczxczxczxczxczxxzczxzxvzxczxczxczxczxczxczxczxczx', CAST(N'2018-08-22T10:51:00.550' AS DateTime), N'ádasdasdczxczxczxc', NULL, 1, N'AAAAAAAAAAAAAAAAAA', 2)
INSERT [dbo].[Article] ([Id], [Code], [Contents], [CreateDate], [Description], [Image], [IsActive], [Title], [UniversityId]) VALUES (9, N'NNNN', N'xzczxzxvzxczxczxczxczxczxczxczxczxxzczxzxvzxczxczxczxczxczxczxczxczxxzczxzxvzxczxczxczxczxczxczxczxczxxzczxzxvzxczxczxczxczxczxczxczxczx', CAST(N'2018-08-22T10:51:06.480' AS DateTime), N'ádasdasdczxczxczxc', NULL, 1, N'AAAAAAAAAAAAAAAAAA', 2)
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[Block] ON 

INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (1, N'A', NULL, 1, NULL)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (2, N'B', NULL, 1, NULL)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (3, N'C', NULL, 1, NULL)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (4, N'D', NULL, 1, NULL)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (5, N'H', NULL, 1, NULL)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (6, N'K', NULL, 1, NULL)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (7, N'M', NULL, 1, NULL)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (8, N'R', NULL, 1, NULL)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (9, N'N', NULL, 1, NULL)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (10, N'S', NULL, 1, NULL)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (11, N'T', NULL, 1, NULL)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (12, N'V', NULL, 1, NULL)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (13, N'A00', N'Toán, Vật lí, Hóa học ', 1, 1)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (14, N'A01', N'Toán, Vật lí, Tiếng Anh ', 1, 1)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (15, N'A02', N'Toán, Vật lí, Sinh học ', 1, 1)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (16, N'A03', N'Toán, Vật lí, Lịch sử ', 1, 1)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (17, N'A04', N'Toán, Vật lí, Địa lí ', 1, 1)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (18, N'A05', N'Toán, Hóa học, Lịch sử ', 1, 1)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (19, N'A06', N'Toán, Hóa học, Địa lí ', 1, 1)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (20, N'A07', N'Toán, Lịch sử, Địa lí ', 1, 1)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (21, N'A08', N'Toán, Lịch sử, Giáo dục công dân ', 1, 1)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (22, N'A09', N'Toán, Địa lý, Giáo dục công dân ', 1, 1)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (23, N'A10', N'Toán, Lý, Giáo dục công dân ', 1, 1)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (24, N'A11', N'Toán, Hóa, Giáo dục công dân ', 1, 1)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (25, N'A12', N'Toán, Khoa học tự nhiên, KH xã hội ', 1, 1)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (26, N'A14', N'Toán, Khoa học tự nhiên, Địa lí ', 1, 1)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (27, N'A15', N'Toán, KH tự nhiên, Giáo dục công dân ', 1, 1)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (28, N'A16', N'Toán, Khoa học tự nhiên, Ngữ văn ', 1, 1)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (29, N'A17', N'Toán, Vật lý, Khoa học xã hội ', 1, 1)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (30, N'A18', N'Toán, Hoá học, Khoa học xã hội ', 1, 1)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (31, N'B00', N'Toán, Hóa học, Sinh học ', 1, 2)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (32, N'B01', N'Toán, Sinh học, Lịch sử ', 1, 2)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (33, N'B02', N'Toán, Sinh học, Địa lí ', 1, 2)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (34, N'B03', N'Toán, Sinh học, Ngữ văn ', 1, 2)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (35, N'B04', N'Toán, Sinh học, Giáo dục công dân ', 1, 2)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (36, N'B05', N'Toán, Sinh học, Khoa học xã hội ', 1, 2)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (37, N'B08', N'Toán, Sinh học, Tiếng Anh ', 1, 2)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (38, N'C00', N'Ngữ văn, Lịch sử, Địa lí ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (39, N'C01', N'Ngữ văn, Toán, Vật lí ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (40, N'C02', N'Ngữ văn, Toán, Hóa học ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (41, N'C03', N'Ngữ văn, Toán, Lịch sử ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (42, N'C04', N'Ngữ văn, Toán, Địa lí ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (43, N'C05', N'Ngữ văn, Vật lí, Hóa học ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (44, N'C06', N'Ngữ văn, Vật lí, Sinh học ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (45, N'C07', N'Ngữ văn, Vật lí, Lịch sử ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (46, N'C08', N'Ngữ văn, Hóa học, Sinh học ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (47, N'C09', N'Ngữ văn, Vật lí, Địa lí ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (48, N'C10', N'Ngữ văn, Hóa học, Lịch sử ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (49, N'C11', N'Ngữ văn, Hóa học, Địa lí', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (50, N'C12', N'Ngữ văn, Sinh học, Lịch sử ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (51, N'C13', N'Ngữ văn, Sinh học, Địa lí ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (52, N'C14', N'Ngữ văn, Toán, Giáo dục công dân ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (53, N'C15', N'Ngữ văn, Toán, Khoa học xã hội ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (54, N'C16', N'Ngữ văn, Vật lí, Giáo dục công dân ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (55, N'C17', N'Ngữ văn, Hóa học, Giáo dục công dân ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (56, N'C18', N'Ngữ văn, Sinh học, Giáo dục công dân', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (57, N'C19', N'Ngữ văn, Lịch sử, Giáo dục công dân ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (58, N'C20', N'Ngữ văn, Địa lí, Giáo dục công dân ', 1, 3)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (59, N'D01', N'Ngữ văn, Toán, Tiếng Anh ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (60, N'D02', N'Ngữ văn, Toán, Tiếng Nga ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (61, N'D03', N'Ngữ văn, Toán, Tiếng Pháp ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (62, N'D04', N'Ngữ văn, Toán, Tiếng Trung ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (63, N'D05', N'Ngữ văn, Toán, Tiếng Đức ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (64, N'D06', N'Ngữ văn, Toán, Tiếng Nhật ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (65, N'D07', N'Toán, Hóa học, Tiếng Anh ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (66, N'D08', N'Toán, Sinh học, Tiếng Anh ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (67, N'D09', N'Toán, Lịch sử, Tiếng Anh ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (68, N'D10', N'Toán, Địa lí, Tiếng Anh ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (69, N'D11', N'Ngữ văn, Vật lí, Tiếng Anh ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (70, N'D12', N'Ngữ văn, Hóa học, Tiếng Anh ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (71, N'D13', N'Ngữ văn, Sinh học, Tiếng Anh ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (72, N'D14', N'Ngữ văn, Lịch sử, Tiếng Anh ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (73, N'D15', N'Ngữ văn, Địa lí, Tiếng Anh ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (74, N'D16', N'Toán, Địa lí, Tiếng Đức ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (75, N'D17', N'Toán, Địa lí, Tiếng Nga ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (76, N'D18', N'Toán, Địa lí, Tiếng Nhật ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (77, N'D19', N'Toán, Địa lí, Tiếng Pháp ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (78, N'D20', N'Toán, Địa lí, Tiếng Trung ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (79, N'D21', N'Toán, Hóa học, Tiếng Đức ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (80, N'D22', N'Toán, Hóa học, Tiếng Nga ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (81, N'D23', N'Toán, Hóa học, Tiếng Nhật ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (82, N'D24', N'Toán, Hóa học, Tiếng Pháp ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (83, N'D25', N'Toán, Hóa học, Tiếng Trung ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (84, N'D26', N'Toán, Vật lí, Tiếng Đức ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (85, N'D27', N'Toán, Vật lí, Tiếng Nga ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (86, N'D28', N'Toán, Vật lí, Tiếng Nhật ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (87, N'D29', N'Toán, Vật lí, Tiếng Pháp ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (88, N'D30', N'Toán, Vật lí, Tiếng Trung ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (89, N'D31', N'Toán, Sinh học, Tiếng Đức ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (90, N'D32', N'Toán, Sinh học, Tiếng Nga ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (91, N'D33', N'Toán, Sinh học, Tiếng Nhật ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (92, N'D34', N'Toán, Sinh học, Tiếng Pháp ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (93, N'D35', N'Toán, Sinh học, Tiếng Trung ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (94, N'D41', N'Ngữ văn, Địa lí, Tiếng Đức ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (95, N'D42', N'Ngữ văn, Địa lí, Tiếng Nga ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (96, N'D43', N'Ngữ văn, Địa lí, Tiếng Nhật ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (97, N'D44', N'Ngữ văn, Địa lí, Tiếng Pháp ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (98, N'D45', N'Ngữ văn, Địa lí, Tiếng Trung ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (99, N'D52', N'Ngữ văn, Vật lí, Tiếng Nga ', 1, 4)
GO
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (100, N'D54', N'Ngữ văn, Vật lí, Tiếng Pháp ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (101, N'D55', N'Ngữ văn, Vật lí, Tiếng Trung ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (102, N'D61', N'Ngữ văn, Lịch sử, Tiếng Đức ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (103, N'D62', N'Ngữ văn, Lịch sử, Tiếng Nga ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (104, N'D63', N'Ngữ văn, Lịch sử, Tiếng Nhật ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (105, N'D64', N'Ngữ văn, Lịch sử, Tiếng Pháp ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (106, N'D65', N'Ngữ văn, Lịch sử, Tiếng Trung ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (107, N'D66', N'Ngữ văn, Giáo dục công dân, Tiếng Anh ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (108, N'D68', N'Ngữ văn, Giáo dục công dân, Tiếng Nga ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (109, N'D69', N'Ngữ Văn, Giáo dục công dân, Tiếng Nhật ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (110, N'D70', N'Ngữ Văn, Giáo dục công dân, Tiếng Pháp ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (111, N'D71', N'3 Ngữ văn, Giáo dục công dân, Tiếng Trung', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (112, N'D72', N'Ngữ văn, Khoa học tự nhiên, Tiếng Anh ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (113, N'D73', N'Ngữ văn, Khoa học tự nhiên, Tiếng Đức ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (114, N'D74', N'Ngữ văn, Khoa học tự nhiên, Tiếng Nga ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (115, N'D75', N'Ngữ văn, Khoa học tự nhiên, Tiếng Nhật ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (116, N'D76', N'Ngữ văn, Khoa học tự nhiên, Tiếng Pháp ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (117, N'D77', N'Ngữ văn, Khoa học tự nhiên, Tiếng Trung ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (118, N'D78', N'Ngữ văn, Khoa học xã hội, Tiếng Anh ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (119, N'D79', N'Ngữ văn, Khoa học xã hội, Tiếng Đức ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (120, N'D80', N'Ngữ văn, Khoa học xã hội, Tiếng Nga ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (121, N'D81', N'Ngữ văn, Khoa học xã hội, Tiếng Nhật ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (122, N'D82', N'Ngữ văn, Khoa học xã hội, Tiếng Pháp ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (123, N'D83', N'Ngữ văn, Khoa học xã hội, Tiếng Trung ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (124, N'D84', N'Toán, Giáo dục công dân, Tiếng Anh ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (125, N'D85', N'Toán, Giáo dục công dân, Tiếng Đức ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (126, N'D86', N'Toán, Giáo dục công dân, Tiếng Nga ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (127, N'D87', N'Toán, Giáo dục công dân, Tiếng Pháp ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (128, N'D88', N'Toán, Giáo dục công dân, Tiếng Nhật ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (129, N'D90', N'Toán, Khoa học tự nhiên, Tiếng Anh ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (130, N'D91', N'Toán, Khoa học tự nhiên, Tiếng Pháp ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (131, N'D92', N'Toán, Khoa học tự nhiên, Tiếng Đức ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (132, N'D93', N'Toán, Khoa học tự nhiên, Tiếng Nga ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (133, N'D94', N'Toán, Khoa học tự nhiên, Tiếng Nhật ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (134, N'D95', N'Toán, Khoa học tự nhiên, Tiếng Trung ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (135, N'D96', N'Toán, Khoa học xã hội, Anh ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (136, N'D97', N'Toán, Khoa học xã hội, Tiếng Pháp ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (137, N'D98', N'Toán, Khoa học xã hội, Tiếng Đức ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (138, N'D99', N'Toán, Khoa học xã hội, Tiếng Nga ', 1, 4)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (139, N'H00', N'Ngữ văn, Năng khiếu vẽ Nghệ thuật 1, Năng khiếu vẽ Nghệ thuật 2 ', 1, 5)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (140, N'H01', N'Toán, Ngữ văn, Vẽ ', 1, 5)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (141, N'H02', N'Toán, Vẽ Hình họa mỹ thuật, Vẽ trang trí màu ', 1, 5)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (142, N'H03', N'Toán, Khoa học tự nhiên, Vẽ Năng khiếu ', 1, 5)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (143, N'H04', N'Toán, Tiếng Anh, Vẽ Năng khiếu ', 1, 5)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (144, N'H05', N'Ngữ văn, Khoa học xã hội, Vẽ Năng khiếu ', 1, 5)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (145, N'H06', N'Ngữ văn, Tiếng Anh,Vẽ mỹ thuật ', 1, 5)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (146, N'H07', N'Toán, Hình họa, Trang trí ', 1, 5)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (147, N'H08', N'Ngữ văn, Lịch sử, Vẽ mỹ thuật ', 1, 5)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (148, N'K01', N'Toán, Tiếng Anh, Tin học ', 1, 6)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (149, N'M00', N'Ngữ văn, Toán, Đọc diễn cảm, Hát ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (150, N'M01', N'Ngữ văn, Lịch sử, Năng khiếu ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (151, N'M02', N'Toán, Năng khiếu 1, Năng khiếu 2 ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (152, N'M03', N'Văn, Năng khiếu 1, Năng khiếu 2 ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (153, N'M04', N'Toán, Đọc kể diễn cảm, Hát - Múa ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (154, N'M09', N'Toán, NK Mầm non 1( kể chuyện, đọc, diễn cảm), NK Mầm non 2 (Hát) ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (155, N'M10', N'Toán, Tiếng Anh, NK1 ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (156, N'M11', N'Ngữ văn, Năng khiếu báo chí, Tiếng Anh ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (157, N'M13', N'Toán, Sinh học, Năng khiếu ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (158, N'M14', N'Ngữ văn, Năng khiếu báo chí, Toán ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (159, N'M15', N'Ngữ văn, Năng khiếu báo chí, Tiếng Anh ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (160, N'M16', N'Ngữ văn, Năng khiếu báo chí, Vật lý ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (161, N'M17', N'Ngữ văn, Năng khiếu báo chí, Lịch sử ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (162, N'M18', N'Ngữ văn, Năng khiếu Ảnh báo chí, Toán ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (163, N'M19', N'Ngữ văn, Năng khiếu Ảnh báo chí, Tiếng Anh ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (164, N'M20', N'Ngữ văn, Năng khiếu Ảnh báo chí, Vật lý ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (165, N'M21', N'Ngữ văn, Năng khiếu Ảnh báo chí, Lịch sử ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (166, N'M22', N'Ngữ văn, Năng khiếu quay phim truyền hình, Toán ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (167, N'M23', N'Ngữ văn, Năng khiếu quay phim truyền hình, Tiếng Anh ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (168, N'M24', N'Ngữ văn, Năng khiếu quay phim truyền hình, Vật lý ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (169, N'M25', N'Ngữ văn, Năng khiếu quay phim truyền hình, Lịch sử ', 1, 7)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (170, N'N00', N'Ngữ văn, Năng khiếu Âm nhạc 1, Năng khiếu Âm nhạc 2 ', 1, 9)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (171, N'N01', N'Ngữ văn, xướng âm, biểu diễn nghệ thuật ', 1, 9)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (172, N'N02', N'Ngữ văn, Ký xướng âm, Hát hoặc biểu diễn nhạc cụ ', 1, 9)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (173, N'N03', N'Ngữ văn, Ghi âm- xướng âm, chuyên môn ', 1, 9)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (174, N'N04', N'Ngữ Văn, Năng khiếu thuyết trình, Năng khiếu ', 1, 9)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (175, N'N05', N'Ngữ Văn, Xây dựng kịch bản sự kiện, Năng khiếu ', 1, 9)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (176, N'N06', N'Ngữ văn, Ghi âm- xướng âm, chuyên môn ', 1, 9)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (177, N'N07', N'Ngữ văn, Ghi âm- xướng âm, chuyên môn ', 1, 9)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (178, N'N08', N'Ngữ văn , Hòa thanh, Phát triển chủ đề và phổ thơ ', 1, 9)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (179, N'N09', N'Ngữ văn, Hòa thanh, Bốc thăm đề- chỉ huy tại chỗ ', 1, 9)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (180, N'R00', N'Ngữ văn, Lịch sử, Năng khiếu báo chí ', 1, 8)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (181, N'R01', N'Ngữ văn, Địa lý, Năng khiếu Biểu diễn nghệ thuật ', 1, 8)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (182, N'R02', N'Ngữ văn, Toán, Năng khiếu Biểu diễn nghệ thuật ', 1, 8)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (183, N'R03', N'Ngữ văn, tiếng Anh, Năng khiếu Biểu diễn nghệ thuật ', 1, 8)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (184, N'R04', N'Ngữ văn, Năng khiếu Biểu diễn nghệ thuật, Năng khiếu Kiến thức văn hóa – xã hội – nghệ thuật', 1, 8)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (185, N'R05', N'Ngữ văn, tiếng Anh, Năng khiếu kiến thức truyền thông ', 1, 8)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (186, N'S00', N'Ngữ văn, Năng khiếu SKĐA 1, Năng khiếu SKĐA 2 ', 1, 10)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (187, N'S01', N'Toán, Năng khiếu 1, Năng khiếu 2 ', 1, 10)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (188, N'T00', N'Toán, Sinh học, Năng khiếu TDTT ', 1, 11)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (189, N'T01', N'Toán, Ngữ văn, Năng khiếu TDTT ', 1, 11)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (190, N'T02', N'Ngữ văn, Sinh, Năng khiếu TDTT ', 1, 11)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (191, N'T03', N'Ngữ văn, Địa, Năng khiếu TDTT ', 1, 11)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (192, N'T04', N'Toán, Lý, Năng khiếu TDTT ', 1, 11)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (193, N'T05', N'Ngữ văn, Giáo dục công dân, Năng kiếu ', 1, 11)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (194, N'V00', N'Toán, Vật lí, Vẽ Hình họa mỹ thuật ', 1, 12)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (195, N'V01', N'Toán, Ngữ văn, Vẽ Hình họa mỹ thuật ', 1, 12)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (196, N'V02', N'VẼ MT, Toán, Tiếng Anh ', 1, 12)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (197, N'V03', N'VẼ MT, Toán, Hóa ', 1, 12)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (198, N'V05', N'Ngữ văn, Vật lí, Vẽ mỹ thuật ', 1, 12)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (199, N'V06', N'Toán, Địa lí, Vẽ mỹ thuật ', 1, 12)
GO
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (200, N'V07', N'Toán, tiếng Đức, Vẽ mỹ thuật ', 1, 12)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (201, N'V08', N'Toán, tiếng Nga, Vẽ mỹ thuật ', 1, 12)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (202, N'V09', N'Toán, tiếng Nhật, Vẽ mỹ thuật ', 1, 12)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (203, N'V10', N'Toán, tiếng Pháp, Vẽ mỹ thuật ', 1, 12)
INSERT [dbo].[Block] ([Id], [BlockName], [Description], [IsActive], [PreBlockId]) VALUES (204, N'V11', N'Toán, tiếng Trung, Vẽ mỹ thuật ', 1, 12)
SET IDENTITY_INSERT [dbo].[Block] OFF
INSERT [dbo].[BlockOfMajor] ([Id], [isActive], [BlockId], [MajorId]) VALUES (1, 1, NULL, NULL)
INSERT [dbo].[BlockOfMajor] ([Id], [isActive], [BlockId], [MajorId]) VALUES (2, 1, NULL, NULL)
INSERT [dbo].[BlockOfMajor] ([Id], [isActive], [BlockId], [MajorId]) VALUES (3, 1, NULL, NULL)
INSERT [dbo].[BlockOfMajor] ([Id], [isActive], [BlockId], [MajorId]) VALUES (4, 1, NULL, NULL)
INSERT [dbo].[BlockOfMajor] ([Id], [isActive], [BlockId], [MajorId]) VALUES (5, 1, NULL, NULL)
INSERT [dbo].[BlockOfMajor] ([Id], [isActive], [BlockId], [MajorId]) VALUES (6, 1, NULL, NULL)
INSERT [dbo].[BlockOfMajor] ([Id], [isActive], [BlockId], [MajorId]) VALUES (7, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[GroupMajor] ON 

INSERT [dbo].[GroupMajor] ([Id], [IsActive], [Code], [Name]) VALUES (1, 1, N'457', N'Giao duc')
INSERT [dbo].[GroupMajor] ([Id], [IsActive], [Code], [Name]) VALUES (2, 1, N'4528', N'Kinh te')
INSERT [dbo].[GroupMajor] ([Id], [IsActive], [Code], [Name]) VALUES (3, 1, N'1245', N'Cong nghe ')
SET IDENTITY_INSERT [dbo].[GroupMajor] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (1, 1, N'01', N'Hà Nội')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (2, 1, N'02', N'Hà Giang')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (3, 1, N'04', N'Cao Bằng
')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (5, 1, N'06', N'Bắc Kạn')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (6, 1, N'08', N'Tuyên Quang')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (7, 1, N'10', N'Lào Cai')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (8, 1, N'11', N'Điện Biên')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (9, 1, N'12', N'Lai Châu')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (10, 1, N'14', N'Sơn La')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (11, 1, N'15', N'Yên Bái')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (12, 1, N'17', N'Hoà Bình')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (13, 1, N'19', N'Thái Nguyên')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (14, 1, N'20', N'Lạng Sơn')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (15, 1, N'22', N'Quảng Ninh')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (16, 1, N'24', N'Bắc Giang')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (17, 1, N'25', N'Phú Thọ')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (18, 1, N'26', N'Vĩnh Phúc')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (19, 1, N'27', N'Bắc Ninh')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (20, 1, N'30', N'Hải Dương')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (21, 1, N'31', N'Hải Phòng')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (22, 1, N'33', N'Hưng Yên')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (23, 1, N'34', N'Thái Bình')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (24, 1, N'35', N'Hà Nam')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (25, 1, N'36', N'Nam Định')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (26, 1, N'37', N'Ninh Bình')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (27, 1, N'38', N'Thanh Hoá')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (28, 1, N'40', N'Nghệ An')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (29, 1, N'42', N'Hà Tĩnh')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (30, 1, N'44', N'Quảng Bình')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (31, 1, N'45', N'Quảng Trị')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (32, 1, N'46', N'Thừa Thiên Huế')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (33, 1, N'48', N'Đà Nẵng')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (34, 1, N'49', N'Quảng Nam')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (35, 1, N'51', N'Quảng Ngãi')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (36, 1, N'52', N'Bình Định')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (37, 1, N'54', N'Phú Yên')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (38, 1, N'56', N'Khánh Hoà')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (39, 1, N'58', N'Ninh Thuận')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (40, 1, N'60', N'Bình Thuận')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (41, 1, N'62', N'Kon Tum')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (42, 1, N'64', N'Gia Lai')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (43, 1, N'66', N'Đắk Lắk')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (44, 1, N'67', N'Đắk Nông')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (45, 1, N'68', N'Lâm Đồng')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (46, 1, N'70', N'Bình Phước')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (47, 1, N'72', N'Tây Ninh')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (48, 1, N'74', N'Bình Dương')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (49, 1, N'75', N'Đồng Nai')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (50, 1, N'77', N'Bà Rịa - Vũng Tàu')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (51, 1, N'79', N'Thành phố Hồ Chí Minh')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (52, 1, N'80', N'Long An')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (53, 1, N'82', N'Tiền Giang')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (54, 1, N'83', N'Bến Tre')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (55, 1, N'84', N'Trà Vinh')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (56, 1, N'86', N'Vĩnh Long')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (57, 1, N'87', N'Đồng Tháp')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (58, 1, N'89', N'An Giang')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (59, 1, N'91', N'Kiên Giang')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (60, 1, N'92', N'Cần Thơ')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (61, 1, N'93', N'Hậu Giang')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (62, 1, N'94', N'Sóc Trăng')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (63, 1, N'95', N'Bạc Liêu')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (64, 1, N'96', N'Cà Mau')
INSERT [dbo].[Location] ([Id], [IsActive], [LocationCode], [LocationName]) VALUES (97, 1, N'00', N'unknow')
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[Major] ON 

INSERT [dbo].[Major] ([Id], [Description], [IsActive], [MajorName], [GroupMajorId]) VALUES (1, N'major1', 1, N'Giao viên', 1)
INSERT [dbo].[Major] ([Id], [Description], [IsActive], [MajorName], [GroupMajorId]) VALUES (2, N'major2', 1, N'Giáo sư', 1)
INSERT [dbo].[Major] ([Id], [Description], [IsActive], [MajorName], [GroupMajorId]) VALUES (3, N'major3', 1, N'Giáo viên mầm non', 1)
INSERT [dbo].[Major] ([Id], [Description], [IsActive], [MajorName], [GroupMajorId]) VALUES (4, N'major4', 1, N'QUản trị Kinh Doanh', 2)
INSERT [dbo].[Major] ([Id], [Description], [IsActive], [MajorName], [GroupMajorId]) VALUES (5, N'major5', 1, N'Marketing', 2)
INSERT [dbo].[Major] ([Id], [Description], [IsActive], [MajorName], [GroupMajorId]) VALUES (6, N'major6', 1, N'Quản lý nhân sự', 2)
INSERT [dbo].[Major] ([Id], [Description], [IsActive], [MajorName], [GroupMajorId]) VALUES (7, N'major7', 1, N'Công nghệ thông tin', 3)
INSERT [dbo].[Major] ([Id], [Description], [IsActive], [MajorName], [GroupMajorId]) VALUES (8, N'major8', 1, N'Kỹ sư phần mềm', 3)
INSERT [dbo].[Major] ([Id], [Description], [IsActive], [MajorName], [GroupMajorId]) VALUES (9, N'major9', 1, N'An toàn thông tin', 3)
INSERT [dbo].[Major] ([Id], [Description], [IsActive], [MajorName], [GroupMajorId]) VALUES (10, N'major10', 1, N'Kỹ sư cầu nối', 3)
SET IDENTITY_INSERT [dbo].[Major] OFF
INSERT [dbo].[MajorMBTI] ([Id], [isActive], [MajorId], [MBTITypeID]) VALUES (1, 1, 1, 1)
INSERT [dbo].[MajorMBTI] ([Id], [isActive], [MajorId], [MBTITypeID]) VALUES (2, 1, 2, 1)
INSERT [dbo].[MajorMBTI] ([Id], [isActive], [MajorId], [MBTITypeID]) VALUES (3, 1, 3, 1)
INSERT [dbo].[MajorMBTI] ([Id], [isActive], [MajorId], [MBTITypeID]) VALUES (4, 1, 4, 2)
INSERT [dbo].[MajorMBTI] ([Id], [isActive], [MajorId], [MBTITypeID]) VALUES (5, 1, 1, 15)
INSERT [dbo].[MajorMBTI] ([Id], [isActive], [MajorId], [MBTITypeID]) VALUES (6, 1, 2, 2)
INSERT [dbo].[MajorMBTI] ([Id], [isActive], [MajorId], [MBTITypeID]) VALUES (7, 1, 3, 2)
INSERT [dbo].[MajorMBTI] ([Id], [isActive], [MajorId], [MBTITypeID]) VALUES (8, 1, 4, 2)
INSERT [dbo].[MajorMBTI] ([Id], [isActive], [MajorId], [MBTITypeID]) VALUES (9, 1, 5, 3)
INSERT [dbo].[MajorMBTI] ([Id], [isActive], [MajorId], [MBTITypeID]) VALUES (10, 1, 8, 4)
INSERT [dbo].[MajorMBTI] ([Id], [isActive], [MajorId], [MBTITypeID]) VALUES (11, 1, 9, 11)
INSERT [dbo].[MajorMBTI] ([Id], [isActive], [MajorId], [MBTITypeID]) VALUES (12, 1, 8, 7)
INSERT [dbo].[MajorMBTI] ([Id], [isActive], [MajorId], [MBTITypeID]) VALUES (13, 1, 1, 7)
SET IDENTITY_INSERT [dbo].[MajorUniversity] ON 

INSERT [dbo].[MajorUniversity] ([Id], [Description], [isActive], [NumberOfYear], [Prospects], [Requirement], [MajorId], [UniversityId]) VALUES (11, N'1', 1, 3, N'1', N'1', 1, 1)
INSERT [dbo].[MajorUniversity] ([Id], [Description], [isActive], [NumberOfYear], [Prospects], [Requirement], [MajorId], [UniversityId]) VALUES (12, N'1', 1, 3, N'1', N'1', 1, 1)
INSERT [dbo].[MajorUniversity] ([Id], [Description], [isActive], [NumberOfYear], [Prospects], [Requirement], [MajorId], [UniversityId]) VALUES (13, N'1', 1, 4, N'1', N'1', 2, 1)
INSERT [dbo].[MajorUniversity] ([Id], [Description], [isActive], [NumberOfYear], [Prospects], [Requirement], [MajorId], [UniversityId]) VALUES (14, N'2', 1, 4, N'1', N'1', 2, 2)
INSERT [dbo].[MajorUniversity] ([Id], [Description], [isActive], [NumberOfYear], [Prospects], [Requirement], [MajorId], [UniversityId]) VALUES (15, N'1', 1, 4, N'1', N'1', 3, 3)
INSERT [dbo].[MajorUniversity] ([Id], [Description], [isActive], [NumberOfYear], [Prospects], [Requirement], [MajorId], [UniversityId]) VALUES (16, N'1', 1, 4, N'1', N'1', 3, 2)
INSERT [dbo].[MajorUniversity] ([Id], [Description], [isActive], [NumberOfYear], [Prospects], [Requirement], [MajorId], [UniversityId]) VALUES (17, N'1', 1, 4, N'1', N'1', 4, 3)
INSERT [dbo].[MajorUniversity] ([Id], [Description], [isActive], [NumberOfYear], [Prospects], [Requirement], [MajorId], [UniversityId]) VALUES (18, N'1', 1, 1, N'1', N'1', 8, 4)
INSERT [dbo].[MajorUniversity] ([Id], [Description], [isActive], [NumberOfYear], [Prospects], [Requirement], [MajorId], [UniversityId]) VALUES (19, N'1', 1, 1, N'1', N'1', 9, 200)
INSERT [dbo].[MajorUniversity] ([Id], [Description], [isActive], [NumberOfYear], [Prospects], [Requirement], [MajorId], [UniversityId]) VALUES (1011, N'1', 1, 3, N'1', N'1', 10, 11)
INSERT [dbo].[MajorUniversity] ([Id], [Description], [isActive], [NumberOfYear], [Prospects], [Requirement], [MajorId], [UniversityId]) VALUES (1013, N'1', 1, 4, N'1', N'1', 7, 11)
INSERT [dbo].[MajorUniversity] ([Id], [Description], [isActive], [NumberOfYear], [Prospects], [Requirement], [MajorId], [UniversityId]) VALUES (1014, N'1', 1, 1, N'1', N'1', 6, 11)
SET IDENTITY_INSERT [dbo].[MajorUniversity] OFF
INSERT [dbo].[MBTIGroup] ([Id], [isActive], [MBTIGroupName]) VALUES (1, 1, N'EI')
INSERT [dbo].[MBTIGroup] ([Id], [isActive], [MBTIGroupName]) VALUES (2, 1, N'SN')
INSERT [dbo].[MBTIGroup] ([Id], [isActive], [MBTIGroupName]) VALUES (3, 1, N'TF')
INSERT [dbo].[MBTIGroup] ([Id], [isActive], [MBTIGroupName]) VALUES (4, 1, N'JP')
SET IDENTITY_INSERT [dbo].[MBTIQuestion] ON 

INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (1, N'EI1', 1, N'Xã hội , Giao tiếp', N'Thiết kế , ngiên cứu', N'Bạn thích công việc kiểu :', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (2, N'EI2', 1, N'Khách Quan', N'Chủ Quan', N'Bạn tiếp xúc với một người theo xu hướng :', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (3, N'EI3', 1, N'Ý nghĩa , giá trị', N'Tính logic', N'Bạn đánh giá sự việc dựa trên :', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (4, N'EI4', 1, N'Thong thả , Thoải Mái', N'Nhanh nhẹn Đúng Giờ', N'Bạn là người có tác phong :', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (5, N'EI5', 1, N'Bắt đầu cho cuộc nói chuyện', N'Chỉ nói khi người khác bắt chuyện', N'Trong các cuộc giao tiếp, bạn là người:', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (6, N'EI6', 1, N'Là người có cái đầu lạnh.', N' Là người có trái tim ấm.', N'Bạn là người thế nào :', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (7, N'EI7', 1, N'Dễ chịu, thoải mái.', N'Nghiêm chỉnh, quả quyết.', N'Tính cách của bạn :', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (8, N'EI8', 1, N'Khá thú vị', N'Khó hiểu.', N'Những người có tầm nhìn xa thường:', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (9, N'EI9', 1, N'Dễ dàng bắt chuyện và trò chuyện nhiều điều cùng họ.', N'Cảm thấy khó khăn và không biết nên nói gì.', N'Đối với những người mới gặp, bàn thường :', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (10, N'EI10', 1, N'Không có quy trình cụ thể.', N'Thiếu tính sáng tạo.', N'Một công việc gây nhàm chán khi:', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (11, N'EI11', 1, N'Sự hòa hợp với mọi người.', N'Sự nhất quán trong suy nghĩ.', N'Bạn bị hấp dẫn bởi :', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (12, N'EI12', 1, N'Giàu trí tưởng tượng.', N'Nắm bắt tình huống tốt.  ', N'Bạn bị lôi cuốn bởi kiểu người :', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (13, N'EI13', 1, N'Dè dặt.', N'Thoải mái.', N'Trong các cuộc trò chuyện bạn thường :', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (14, N'EI14', 1, N'Tuân theo chuẩn mực.', N'Đôi lúc không hiểu rõ nguyên nhân.', N'Lựa chọn của bạn có xu hướng :', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (15, N'EI15', 1, N' Không công bằng.', N'Tàn nhẫn.', N'Trong hai điều sau, điều nào tồi tệ hơn:', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (16, N'EI16', 1, N'Kiên quyết.', N'Nhẹ nhàng.', N'Tính cách nào giống bạn hơn :', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (17, N'EI17', 1, N'Độc lập giải quyết.', N'Trao đổi với mọi người.', N'Đối với một vấn đề trong nhóm :', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (18, N'EI18', 1, N'Những điều bất ngờ không tính trước.', N'Những điều có kế hoặch trước.', N'Trong cuộc sống, bạn cảm thấy hứng thú với :', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (19, N'EI19', 1, N' Chắc chắn trong tư tưởng.', N'Cống hiến hết mình.', N'Bạn thấy tâm đắc với bản thân bởi sự', 1)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (20, N'SN1', 1, N'Khả năng lý luận phân tích.', N'Sự liên tưởng.', N'Bạn nhìn nhận một vấn đề với :', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (21, N'SN2', 1, N'Ở nhà cùng gia đình.', N'Đi du lịch cùng bạn bè.', N'Trong các kỳ nghỉ lễ bạn có xu hướng :', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (22, N'SN3', 1, N'Các ngụ ý, hàm ý, ẩn ý.', N'Các nguyên tắc, nguyên lý.', N'Bạn bị lôi cuốn bởi:', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (23, N'SN4', 1, N'Cảm nhận từ con tim.', N'Những quy tắc chung.', N'Khi quyết định việc gì bạn thường dựa vào :', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (24, N'SN5', 1, N'Làm việc có phương pháp, tổ chức tốt.', N'Ứng biến xoay trở tốt trước khó khăn.', N'Bạn thích làm việc với người Sếp :', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (25, N'SN6', 1, N'Sự chắc chắn.', N'Sự cởi mở.', N'Bạn nghiêng về :', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (26, N'SN7', 1, N'Công tư phân minh.', N'Bị tình cảm chi phối.', N'Bạn là người có tư tưởng :', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (27, N'SN8', 1, N'Nghệ thuật.', N'Khoa học.', N'Bạn thích học các môn :', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (28, N'SN9', 1, N'Trầm lặng, ít nói.', N'Hoạt bát, vui vẻ.', N'Trong một nhóm bạn bè bạn thường :', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (29, N'SN10', 1, N'Dựa vào vẻ ngoài của họ.', N'Dựa vào cảm nhận của bạn.', N'Khi đánh giá một người bạn thường :', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (30, N'SN11', 1, N'Quá nồng nhiệt, mong chờ.', N'Quá khách quan.', N'Sẽ thật tai hại khi bạn :', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (31, N'SN12', 1, N'Thích những thứ quen thuộc.', N'Thích những điều mới mẻ.', N'Phong cách của bạn :', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (32, N'SN13', 1, N'Tìm kiếm một cách làm mới.', N'Làm theo cách mọi người hay làm.', N'Khi giải quyết một công việc thông thường, bạn sẽ :', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (33, N'SN14', 1, N'Độc lập.', N'Theo nhóm.', N'Bạn thích làm việc :', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (34, N'SN15', 1, N'Hiếm khi.', N'Hay xảy ra.', N'Bạn có hành động theo bản năng :', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (35, N'SN16', 1, N'Giàu lý trí.', N'Giàu cảm xúc.', N'Trong cuộc sống, một người sẽ tốt hơn nếu :', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (36, N'SN17', 1, N'Theo thứ tự.', N'Phát ngẫu nhiên.', N'Khi nghe một album nhạc mới, bạn thường nghe :', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (37, N'SN18', 1, N'Khéo léo, lanh lợi.', N'Thẳng thắn, thực tế.', N'Bạn là người :', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (38, N'SN19', 1, N'Sử dụng người khác.', N'Hiểu và chia sẻ với người khác.', N'Sẽ khó khăn hơn khi bạn cố:', 2)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (39, N'TF1', 1, N'Diễn đạt trực tiếp nhất có thể.', N'Diễn đạt một cách gián tiếp.', N'Khi trình bày bạn thường :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (40, N'TF2', 1, N'Tìm bạn bè tâm sự hoặc đi chơi.', N'Muốn ở một mình cho khuây khỏa.', N'Khi cảm thấy buồn bạn thường :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (41, N'TF3', 1, N'Tham gia khi bị ép.', N'Năng nổ, tích cực.', N'Đối với các hoạt động của cơ quan, lớp học :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (42, N'TF4', 1, N'Những thứ không xác định.', N'Những thứ có logic.', N'Bạn cảm thấy thoái mái với :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (43, N'TF5', 1, N'Dễ dàng nắm bắt.', N'Giấu kín, khó nhận biết.', N'Cảm xúc của bạn thường được người khác :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (44, N'TF6', 1, N'Hành xử thiếu cân nhắc.', N'Chỉ trích, phê phán người khác.', N'Thật tồi tệ khi :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (45, N'TF7', 1, N'Chuẩn bị chu toàn trước.', N'Diễn ra tự nhiên.', N'Bạn muốn một sự kiện như thế nào :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (46, N'TF8', 1, N'Dễ gần, hòa đồng.', N'Thân thiện nhưng kín đáo.', N'Bạn là người có tình cách :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (47, N'TF9', 1, N'Trí tưởng tượng phong phú.', N'Sự quan sát thực tế.', N'Bạn có ưu điểm về :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (48, N'TF10', 1, N'Linh cảm.', N'Sự việc thực tế.', N'Khi quyết định điều gì đó, bạn tin vào :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (49, N'TF11', 1, N'Bạn là người có đầu óc suy luận.', N'Bạn là người giàu tình cảm và sự tinh tế.', N'Bạn muốn được người khác khen ngợi như thế nào :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (50, N'TF12', 1, N'Có chọn lựa và suy tính.', N'Một cách tự nhiên.', N'Bạn thích các sự việc xảy ra :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (51, N'TF13', 1, N'Bộc phát, linh hoạt.', N'Kỹ lưỡng, cẩn thận.', N'Bạn hay hành động một cách :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (52, N'TF14', 1, N'Tình cảm dồi dào.', N'Lý trí mạnh mẽ.', N'Bạn muốn bổ sung thêm điều gì ở bản thân :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (53, N'TF15', 1, N'Mơ mộng và tưởng tượng.', N'Thực tế và thực dụng.', N'Bạn là người :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (54, N'TF16', 1, N'Nhấc máy trước để nghe.', N'Để cho đồng nghiệp nhấc máy.', N'Khi điện thoại bàn trong văn phòng công ty đổ chuông :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (55, N'TF17', 1, N'Cố làm quen với nhiều người.', N'Chỉ nói chuyện với vài người.', N'Bạn mới tham gia một lớp Ngoại ngữ :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (56, N'TF18', 1, N'Bản thân nó giải thích cho chính nó.', N'Là bằng chứng giải thích cho các quy tắc, quy luật.', N'Theo bạn, các sự việc, sự kiện :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (57, N'TF19', 1, N'Đa sầu đa cảm.', N'Thực dụng, không bị chi phối bởi tình cảm.', N'Bạn là người :', 3)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (58, N'JP1', 1, N'Những suy nghĩ của họ.', N'Những gì họ làm được.', N'Bạn thường quan tâm tới người khác thông qua :', 4)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (59, N'JP2', 1, N'Thói quen.', N'Những điều mới mẻ.', N'Bạn nghiêng về điều nào sau đây :', 4)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (60, N'JP3', 1, N'Luôn được chuẩn bị kỹ lưỡng.', N'Tùy cơ ứng biến.', N'Mọi việc sẽ tôt hơn nếu :', 4)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (61, N'JP4', 1, N'Ít bạn nhưng chơi rất thân.', N'Nhiều bạn nhưng không thân thiết lắm.', N'Bạn thích mối quan hệ :', 4)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (62, N'JP5', 1, N'Diễn đạt lời văn qua các phép so sánh, ẩn dụ.', N'Nghĩ sao viết vậy, diễn đạt rõ ràng.', N'Nếu bạn là nhà văn, bạn sẽ viết bài theo cách :', 4)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (63, N'JP6', 1, N'Phụ thuộc vào tâm trạng.', N'Suy tính cẩn trọng.', N'Khi quyết định một việc :', 4)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (64, N'JP7', 1, N'Một cách chắn chắn.', N'Không chắc lắm, có thể thay đổi sau.', N'Bạn thường hay đưa ra quyết định :', 4)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (65, N'JP8', 1, N'Nguyên tắc, lý trí.', N'Cảm xúc, tình cảm.', N'Bạn là người sống thiên về :', 4)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (66, N'JP9', 1, N'Thực tế.', N'Bất ngờ, mới mẻ', N'Bạn thích thú với sự việc :', 4)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (67, N'JP10', 1, N'Không hứng thú.', N'Hào hứng.', N'Khi nói về một chủ đề mới lạ chưa gặp, bạn cảm thấy :', 4)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (68, N'JP11', 1, N'Kiểm tra lại trước khi áp dụng.', N'Tin tưởng và áp dụng theo.', N'Đối với một suy luận được nhiều người tin dùng, bạn sẽ :', 4)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (69, N'JP12', 1, N'Những thứ có tính logic cao.', N'Những thứ gây cảm động.', N'Điều gì làm cho bạn ấn tượng :', 4)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (70, N'JP13', 1, N'Những thứ thực tế và rõ ràng.', N'Những suy đoán.', N'Bạn là người có xu hướng thiên về :', 4)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (71, N'JP14', 1, N'Không thoải mái.', N'Thích thú.', N'Ở một nơi đông người làm bạn :', 4)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (72, N'JP15', 1, N'Hoàn cảnh nhất định.', N'Hoàn cảnh nhất định.', N'Bạn đánh giá một người dựa trên :', 4)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (73, N'JP16', 1, N'Ra về sớm vì không hào hứng lắm.', N'Vui chơi hết mình cho đến khi tàn tiệc.', N'Bạn được mời tới bữa tiệc của công ty :', 4)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (74, N'JP17', 1, N'Tuân thủ thời gian.', N'Làm việc tùy hứng.', N'Khi làm việc bạn sẽ :', 4)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (75, N'JP18', 1, N'Trò chuyện cùng nhiều người, quen hoặc không quen.', N'Chỉ trò chuyện với một số người quen.', N'Khi đi tham dự một buổi liên hoan/tiệc tùng, bạn sẽ :', 4)
INSERT [dbo].[MBTIQuestion] ([Id], [Code], [isActive], [Option1Name], [Option2Name], [QuestionContent], [MBTIGroupId]) VALUES (76, N'JP19', 1, N'Những thứ mơ hồ, không rõ ràng.', N'Những thứ nhàm chán, tẻ nhạt.', N'Điều gì làm bạn cảm thấy tồi tệ :', 4)
SET IDENTITY_INSERT [dbo].[MBTIQuestion] OFF
SET IDENTITY_INSERT [dbo].[MBTIResult] ON 

INSERT [dbo].[MBTIResult] ([Id], [TestDate], [MBTITypeId], [UserId]) VALUES (5, CAST(N'2018-08-14T09:34:41.097' AS DateTime), 15, 10)
SET IDENTITY_INSERT [dbo].[MBTIResult] OFF
INSERT [dbo].[MBTIType] ([Id], [contentType], [Description], [isActive], [MBTITypeName]) VALUES (1, N'Người trách nhiệm', N'type1', 1, N'ISTJ')
INSERT [dbo].[MBTIType] ([Id], [contentType], [Description], [isActive], [MBTITypeName]) VALUES (2, N'Người nuôi dưỡng', N'type2', 1, N'ISFJ ')
INSERT [dbo].[MBTIType] ([Id], [contentType], [Description], [isActive], [MBTITypeName]) VALUES (3, N'Người nghệ sĩ', N'type3', 1, N'ISFP')
INSERT [dbo].[MBTIType] ([Id], [contentType], [Description], [isActive], [MBTITypeName]) VALUES (4, N'Nhà kỹ thuật', N'type4', 1, N'ISTP')
INSERT [dbo].[MBTIType] ([Id], [contentType], [Description], [isActive], [MBTITypeName]) VALUES (5, N'Người lý tưởng hóa', N'type5', 1, N'INFP')
INSERT [dbo].[MBTIType] ([Id], [contentType], [Description], [isActive], [MBTITypeName]) VALUES (6, N'Người che chở', N'type6', 1, N'INFJ ')
INSERT [dbo].[MBTIType] ([Id], [contentType], [Description], [isActive], [MBTITypeName]) VALUES (7, N'Nhà khoa học', N'type7', 1, N'INTJ')
INSERT [dbo].[MBTIType] ([Id], [contentType], [Description], [isActive], [MBTITypeName]) VALUES (8, N'Nhà tư duy', N'type8', 1, N'INTP')
INSERT [dbo].[MBTIType] ([Id], [contentType], [Description], [isActive], [MBTITypeName]) VALUES (9, N'Người cho đi', N'type9', 1, N'ENFJ ')
INSERT [dbo].[MBTIType] ([Id], [contentType], [Description], [isActive], [MBTITypeName]) VALUES (10, N'Người truyền cảm hứng', N'type10', 1, N'ENFP')
INSERT [dbo].[MBTIType] ([Id], [contentType], [Description], [isActive], [MBTITypeName]) VALUES (11, N'Nhà điều hành', N'type11', 1, N'ENTJ')
INSERT [dbo].[MBTIType] ([Id], [contentType], [Description], [isActive], [MBTITypeName]) VALUES (12, N'Người nhìn xa', N'tyupe12', 1, N'ENTP')
INSERT [dbo].[MBTIType] ([Id], [contentType], [Description], [isActive], [MBTITypeName]) VALUES (13, N'Người quan tâm', N'type13', 1, N'ESFJ')
INSERT [dbo].[MBTIType] ([Id], [contentType], [Description], [isActive], [MBTITypeName]) VALUES (14, N'Người trình diễn', N'type14', 1, N'ESFP')
INSERT [dbo].[MBTIType] ([Id], [contentType], [Description], [isActive], [MBTITypeName]) VALUES (15, N'Người giám hộ', N'type15', 1, N'ESTJ')
INSERT [dbo].[MBTIType] ([Id], [contentType], [Description], [isActive], [MBTITypeName]) VALUES (16, N'Người thực thi', N'type16', 1, N'ESTP')
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [UserID]) VALUES (N'1', N'Pro1', 4)
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [UserID]) VALUES (N'109076235002763469215', N'google', 10)
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [UserID]) VALUES (N'116335321775286801383', N'google', 12)
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [UserID]) VALUES (N'2', N'Pro2', 5)
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [UserID]) VALUES (N'3', N'Pro3', 6)
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [UserID]) VALUES (N'4', N'Pro4', 7)
SET IDENTITY_INSERT [dbo].[QuestionAnswer] ON 

INSERT [dbo].[QuestionAnswer] ([Id], [Contents], [Count], [CreatedDateTime], [IsActive], [LastUpdatedTime], [NumberOfReport], [ParentId], [Status], [Title], [Type], [Vote], [UserId]) VALUES (1, N'Question1', 0, CAST(N'2018-08-14T00:00:00.000' AS DateTime), 1, CAST(N'2018-08-14T00:00:00.000' AS DateTime), 2, 1, 1, N'title1', 1, 1, 10)
INSERT [dbo].[QuestionAnswer] ([Id], [Contents], [Count], [CreatedDateTime], [IsActive], [LastUpdatedTime], [NumberOfReport], [ParentId], [Status], [Title], [Type], [Vote], [UserId]) VALUES (2, N'Question2', 0, CAST(N'2018-08-14T00:00:00.000' AS DateTime), 1, CAST(N'2018-08-14T00:00:00.000' AS DateTime), 0, 1, 1, N'title2', 1, 1, 10)
INSERT [dbo].[QuestionAnswer] ([Id], [Contents], [Count], [CreatedDateTime], [IsActive], [LastUpdatedTime], [NumberOfReport], [ParentId], [Status], [Title], [Type], [Vote], [UserId]) VALUES (3, N'<p>AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA</p>', 0, CAST(N'2018-08-14T10:15:25.980' AS DateTime), 1, CAST(N'2018-08-14T10:15:25.980' AS DateTime), 0, 1, 1, N'', 2, 0, 10)
INSERT [dbo].[QuestionAnswer] ([Id], [Contents], [Count], [CreatedDateTime], [IsActive], [LastUpdatedTime], [NumberOfReport], [ParentId], [Status], [Title], [Type], [Vote], [UserId]) VALUES (5, N'<p>AAAAAAAAAAAAAAAAAAAAAAAA22222232434534235235233234<br></p>', 0, CAST(N'2018-08-14T10:23:12.997' AS DateTime), 1, CAST(N'2018-08-14T10:23:12.997' AS DateTime), 0, 0, 1, N'AAAAAAAAAAAAAAAAAAAAAAAA222222', 1, 0, 10)
INSERT [dbo].[QuestionAnswer] ([Id], [Contents], [Count], [CreatedDateTime], [IsActive], [LastUpdatedTime], [NumberOfReport], [ParentId], [Status], [Title], [Type], [Vote], [UserId]) VALUES (6, N'<p>BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB<br></p>', 0, CAST(N'2018-08-14T10:23:41.053' AS DateTime), 1, CAST(N'2018-08-14T10:23:41.053' AS DateTime), 0, 0, 1, N'BBBBBBBBBBBBBBBBBBBBB', 1, 0, 10)
INSERT [dbo].[QuestionAnswer] ([Id], [Contents], [Count], [CreatedDateTime], [IsActive], [LastUpdatedTime], [NumberOfReport], [ParentId], [Status], [Title], [Type], [Vote], [UserId]) VALUES (7, N'<p>AAAAAAAAAAAA</p>', 0, CAST(N'2018-08-14T10:56:15.567' AS DateTime), 1, CAST(N'2018-08-14T10:56:15.567' AS DateTime), 0, 6, 1, N'', 2, 0, 10)
INSERT [dbo].[QuestionAnswer] ([Id], [Contents], [Count], [CreatedDateTime], [IsActive], [LastUpdatedTime], [NumberOfReport], [ParentId], [Status], [Title], [Type], [Vote], [UserId]) VALUES (8, N'CCCCCCCCCCC', 0, CAST(N'2018-08-14T10:56:40.277' AS DateTime), 0, CAST(N'2018-08-14T10:56:40.277' AS DateTime), 0, 6, 1, N'', 2, 0, 10)
INSERT [dbo].[QuestionAnswer] ([Id], [Contents], [Count], [CreatedDateTime], [IsActive], [LastUpdatedTime], [NumberOfReport], [ParentId], [Status], [Title], [Type], [Vote], [UserId]) VALUES (9, N'<p>tttttttttttttttttttttttttttt</p>', 0, CAST(N'2018-08-14T13:49:52.067' AS DateTime), 1, CAST(N'2018-08-14T13:49:52.067' AS DateTime), 0, 6, 1, N'', 2, 0, 10)
INSERT [dbo].[QuestionAnswer] ([Id], [Contents], [Count], [CreatedDateTime], [IsActive], [LastUpdatedTime], [NumberOfReport], [ParentId], [Status], [Title], [Type], [Vote], [UserId]) VALUES (10, N'<p>NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN</p>', 0, CAST(N'2018-08-16T11:13:07.703' AS DateTime), 1, CAST(N'2018-08-16T11:13:07.703' AS DateTime), 0, 0, 1, N'NNNNNNNNNNNNNNNNNNNNN', 1, 0, 10)
INSERT [dbo].[QuestionAnswer] ([Id], [Contents], [Count], [CreatedDateTime], [IsActive], [LastUpdatedTime], [NumberOfReport], [ParentId], [Status], [Title], [Type], [Vote], [UserId]) VALUES (11, N'<p>WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWQQ</p>', 0, CAST(N'2018-08-16T11:20:50.997' AS DateTime), 1, CAST(N'2018-08-16T11:20:50.997' AS DateTime), 0, 0, 0, N'WWWWWWWWWWWWWWWWWWWWWWWWWW', 1, 0, NULL)
INSERT [dbo].[QuestionAnswer] ([Id], [Contents], [Count], [CreatedDateTime], [IsActive], [LastUpdatedTime], [NumberOfReport], [ParentId], [Status], [Title], [Type], [Vote], [UserId]) VALUES (12, N'<p>AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA</p>', 0, CAST(N'2018-08-16T11:34:28.507' AS DateTime), 1, CAST(N'2018-08-16T11:34:28.507' AS DateTime), 0, 0, 0, N'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[QuestionAnswer] OFF
SET IDENTITY_INSERT [dbo].[QuestionTag] ON 

INSERT [dbo].[QuestionTag] ([Id], [QuestionId], [TagId]) VALUES (1, 1, 1)
INSERT [dbo].[QuestionTag] ([Id], [QuestionId], [TagId]) VALUES (2, 1, 2)
INSERT [dbo].[QuestionTag] ([Id], [QuestionId], [TagId]) VALUES (3, 2, 2)
SET IDENTITY_INSERT [dbo].[QuestionTag] OFF
SET IDENTITY_INSERT [dbo].[Report] ON 

INSERT [dbo].[Report] ([Id], [QuestionAnswerId], [UserId]) VALUES (1, 1, 10)
INSERT [dbo].[Report] ([Id], [QuestionAnswerId], [UserId]) VALUES (2, 2, 4)
INSERT [dbo].[Report] ([Id], [QuestionAnswerId], [UserId]) VALUES (6, 2, 5)
SET IDENTITY_INSERT [dbo].[Report] OFF
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([Id], [Description], [IsActive], [IsRecomment], [StarCare], [StarCareer], [StarFacilities], [StarSocieties], [StarTeaching], [Status], [Title], [UniversityId], [UserId]) VALUES (10, N'AAA', 1, 1, 4, 4, 4, 4, 4, 1, N'AA', 1, 10)
SET IDENTITY_INSERT [dbo].[Review] OFF
SET IDENTITY_INSERT [dbo].[ReviewAverage] ON 

INSERT [dbo].[ReviewAverage] ([Id], [AveRecomment], [AveStarCare], [AveStarCareer], [AveStarFacilities], [AveStarSocieties], [AveStarTeaching], [TotalReview], [UniversityId]) VALUES (8, 4.5, 4.5, 4.5, 4.5, 4.5, 4.5, 4, 1)
SET IDENTITY_INSERT [dbo].[ReviewAverage] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [IsActive], [Name]) VALUES (1, 1, N'ADMIN')
INSERT [dbo].[Role] ([Id], [IsActive], [Name]) VALUES (2, 1, N'USER')
INSERT [dbo].[Role] ([Id], [IsActive], [Name]) VALUES (3, 1, N'Role3')
INSERT [dbo].[Role] ([Id], [IsActive], [Name]) VALUES (4, 1, N'Role4')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([Id], [IsActive], [TagName]) VALUES (1, 1, N'Tag1')
INSERT [dbo].[Tag] ([Id], [IsActive], [TagName]) VALUES (2, 0, N'Tag2')
INSERT [dbo].[Tag] ([Id], [IsActive], [TagName]) VALUES (3, 1, N'Tag3')
INSERT [dbo].[Tag] ([Id], [IsActive], [TagName]) VALUES (4, 0, N'Tag4')
INSERT [dbo].[Tag] ([Id], [IsActive], [TagName]) VALUES (5, 1, N'Tag5')
INSERT [dbo].[Tag] ([Id], [IsActive], [TagName]) VALUES (6, 1, N'Tag6')
SET IDENTITY_INSERT [dbo].[Tag] OFF
SET IDENTITY_INSERT [dbo].[TrainSystem] ON 

INSERT [dbo].[TrainSystem] ([Id], [IsActive], [Name]) VALUES (1, 1, N'Công Lập')
INSERT [dbo].[TrainSystem] ([Id], [IsActive], [Name]) VALUES (2, 1, N'Dân Lập')
SET IDENTITY_INSERT [dbo].[TrainSystem] OFF
SET IDENTITY_INSERT [dbo].[University] ON 

INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (1, N'BVH', N'Học Viện Công Nghệ Bưu Chính Viễn Thông ( Phía Bắc )', NULL, NULL, N'http://portal.ptit.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'122 Hoàng Quốc Việt, Q.Cầu Giấy, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/6.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (2, N'BVS', N'Học Viện Công Nghệ Bưu Chính Viễn Thông (phía Nam)', NULL, NULL, N'http://hcm.ptit.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Km10 đường Trần Phú, Phường Mộ Lao, Quận Hà Đông, Thành phố Hà Nội, Việt Nam', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/7.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (3, N'CEA', N'Đại học Kinh Tế Nghệ An', NULL, NULL, N'http://dhktna.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 51 - Đường Lý Tự Trọng - Phường Hà Huy Tập - TP.Vinh - Nghệ An', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/logo.jpg', NULL, NULL, 28, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (4, N'DBG', N'Đại học Nông Lâm Bắc Giang', NULL, NULL, N'http://bafu.edu.vn/home/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'xã Bích Sơn - huyện Việt Yên - tỉnh Bắc Giang', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/16108508293430737830883302193200450163718n.jpg', NULL, NULL, 16, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (5, N'DBL', N'Đại Học Bạc Liêu', NULL, NULL, N'http://blu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 178 đường Võ Thị Sáu, Phường 8,TP Bạc Liêu, Tỉnh Bạc Liêu.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/bac-lieu.jpg', NULL, NULL, 63, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (6, N'DDL', N'Đại Học Điện Lực', NULL, NULL, N'http://epu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'235 Hoàng Quốc Việt, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/dien-luc.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (7, N'DDM', N'Đại Học Công Nghiệp Quảng Ninh', NULL, NULL, N'http://qui.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Trường đại học công nghiệp Quảng Ninh, Yên Thọ, Đông Triều, Quảng Ninh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/33.jpg', NULL, NULL, 30, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (8, N'DFA', N'Đại học Tài Chính – Quản Trị Kinh Doanh', NULL, NULL, N'http://tcqtkd.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Trưng Trắc - Văn Lâm - Hưng Yên', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-tai-chinh-qun-tr-kinh-doanh.jpg', NULL, NULL, 22, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (9, N'DHP', N'Đại Học Dân Lập Hải Phòng', NULL, NULL, N'http://www.hpu.edu.vn/home/trangchu.html?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 36 - Đường Dân Lập - Phường Dư Hàng Kênh - Quận Lê Chân - TP Hải Phòng', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/dan-lap-hai-phong.jpg', NULL, NULL, 21, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (10, N'DKB', N'Đại Học Kinh Tế Kỹ Thuật Bình Dương', NULL, NULL, N'http://www.ktkt.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'530 Đại Lộ Bình Dương, P Hiệp Thành, TP Thủ Dầu Một, Tỉnh Bình Dương', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/kinh-te-ky-thuat-binh-duong.jpg', NULL, NULL, 48, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (11, N'DKQ', N'Đại học Tài Chính Kế Toán', NULL, NULL, N'http://tckt.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Thị Trấn La Hà, Tư Nghĩa Tỉnh Quảng Ngãi', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/tai-chinh-ke-toan.jpg', NULL, NULL, 35, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (12, N'DLA', N'Đại Học Kinh Tế Công Nghiệp Long An', NULL, NULL, N'http://www.daihoclongan.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Quốc lộ 1, Khánh Hậu, Tân An, Phường 4', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/62.jpg', NULL, NULL, 52, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (13, N'DLH', N'Đại Học Lạc Hồng', NULL, NULL, N'https://lhu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 10, Huỳnh Văn Nghệ, P. Bửu Long, Tp. Biên Hòa - Tỉnh Đồng Nai', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-lc-hng.jpg', NULL, NULL, 49, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (14, N'DLS', N'Đại Học Lao Động – Xã Hội ( Cơ sở phía Nam)', NULL, NULL, N'http://ldxh.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 1018 Tô Ký, phường Tân Chánh Hiệp, quận 12, Tp.Hồ Chí Minh.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/lao-dong-xa-hoi-phia-nam.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (15, N'DLT', N'Đại Học Lao Động – Xã Hội ( Cơ sở Sơn Tây )', NULL, NULL, N'http://ulsasontay.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Phố Hữu Nghị, Phường Xuân Khanh, Sơn Tây, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/dai-hoc-lao-dong-xa-hoi-co-so-son-tay.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (16, N'DLX', N'Đại Học Lao Động – Xã Hội ( Cơ sở Hà Nội )', NULL, NULL, N'http://ulsa.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 43, đường Trần Duy Hưng, phường Trung Hoà, Q.Cầu Giấy, Tp.Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/dai-hoc-lao-dong-xa-hoi-co-so-ha-noi.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (17, N'DNB', N'Đại Học Hoa Lư', NULL, NULL, N'http://hluv.edu.vn/vi?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'thôn Kỳ Vĩ, xã Ninh Nhất, thành phố Ninh Bình, tỉnh Ninh Bình', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hoa-lu.jpg', NULL, NULL, 26, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (18, N'DPD', N'Đại Học Dân Lập Phương Đông', NULL, NULL, N'http://phuongdong.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'171 Trung Kính, Yên Hòa, Cầu Giấy, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/logopd.png', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (19, N'DPQ', N'Đại Học Phạm Văn Đồng', NULL, NULL, N'http://www.pdu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'509 Phan Đình Phùng, TP Quảng Ngãi', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/logo1809x996.jpg', NULL, NULL, 35, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (20, N'DPT', N'Đại Học Phan Thiết', NULL, NULL, N'http://upt.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'225 Nguyễn Thông, Phú Hài, Phan Thiết, Bình Thuận', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/ewfw.jpg', NULL, NULL, 40, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (21, N'DQB', N'Đại Học Quảng Bình', NULL, NULL, N'http://quangbinhuni.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'312 Lý Thường Kiệt - Phường Bắc Lý - Thành phố Đồng Hới - Quảng Bình', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/qd.png', NULL, NULL, 30, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (22, N'DQN', N'Đại Học Quy Nhơn', NULL, NULL, N'http://www.qnu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'170 An Dương Vương, Tp. Quy Nhơn', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/quy-nhon.jpg', NULL, NULL, 36, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (23, N'DQT', N'Đại Học Quang Trung', NULL, NULL, N'http://www.quangtrung.edu.vn/page/dhqt.php?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Đào Tấn, Nhơn Phú, Thành phố Qui Nhơn, Bình Định', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/85.jpg', NULL, NULL, 36, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (24, N'DQU', N'Đại Học Quảng Nam', NULL, NULL, N'http://www.qnamuni.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'102 Hùng Vương - Thành phố Tam Kỳ - Quảng Nam.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/quang-nam.jpg', NULL, NULL, 34, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (25, N'DTA', N'Đại Học Thành Tây', NULL, NULL, N'http://thanhtay.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Phường Yên Nghĩa - Quận Hà Đông - Hà Nội.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/dai-hoc-thanh-tay.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (26, N'BVH', N'Học Viện Công Nghệ Bưu Chính Viễn Thông ( Phía Bắc )', NULL, NULL, N'http://portal.ptit.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'122 Hoàng Quốc Việt, Q.Cầu Giấy, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/6.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (27, N'BVS', N'Học Viện Công Nghệ Bưu Chính Viễn Thông (phía Nam)', NULL, NULL, N'http://hcm.ptit.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Km10 đường Trần Phú, Phường Mộ Lao, Quận Hà Đông, Thành phố Hà Nội, Việt Nam', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/7.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (28, N'CEA', N'Đại học Kinh Tế Nghệ An', NULL, NULL, N'http://dhktna.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 51 - Đường Lý Tự Trọng - Phường Hà Huy Tập - TP.Vinh - Nghệ An', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/logo.jpg', NULL, NULL, 28, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (29, N'DBG', N'Đại học Nông Lâm Bắc Giang', NULL, NULL, N'http://bafu.edu.vn/home/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'xã Bích Sơn - huyện Việt Yên - tỉnh Bắc Giang', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/16108508293430737830883302193200450163718n.jpg', NULL, NULL, 16, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (30, N'DBL', N'Đại Học Bạc Liêu', NULL, NULL, N'http://blu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 178 đường Võ Thị Sáu, Phường 8,TP Bạc Liêu, Tỉnh Bạc Liêu.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/bac-lieu.jpg', NULL, NULL, 63, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (31, N'DDL', N'Đại Học Điện Lực', NULL, NULL, N'http://epu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'235 Hoàng Quốc Việt, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/dien-luc.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (32, N'DDM', N'Đại Học Công Nghiệp Quảng Ninh', NULL, NULL, N'http://qui.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Trường đại học công nghiệp Quảng Ninh, Yên Thọ, Đông Triều, Quảng Ninh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/33.jpg', NULL, NULL, 30, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (33, N'DFA', N'Đại học Tài Chính – Quản Trị Kinh Doanh', NULL, NULL, N'http://tcqtkd.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Trưng Trắc - Văn Lâm - Hưng Yên', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-tai-chinh-qun-tr-kinh-doanh.jpg', NULL, NULL, 22, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (34, N'DHP', N'Đại Học Dân Lập Hải Phòng', NULL, NULL, N'http://www.hpu.edu.vn/home/trangchu.html?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 36 - Đường Dân Lập - Phường Dư Hàng Kênh - Quận Lê Chân - TP Hải Phòng', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/dan-lap-hai-phong.jpg', NULL, NULL, 21, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (35, N'DKB', N'Đại Học Kinh Tế Kỹ Thuật Bình Dương', NULL, NULL, N'http://www.ktkt.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'530 Đại Lộ Bình Dương, P Hiệp Thành, TP Thủ Dầu Một, Tỉnh Bình Dương', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/kinh-te-ky-thuat-binh-duong.jpg', NULL, NULL, 48, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (36, N'DKQ', N'Đại học Tài Chính Kế Toán', NULL, NULL, N'http://tckt.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Thị Trấn La Hà, Tư Nghĩa Tỉnh Quảng Ngãi', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/tai-chinh-ke-toan.jpg', NULL, NULL, 35, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (37, N'DLA', N'Đại Học Kinh Tế Công Nghiệp Long An', NULL, NULL, N'http://www.daihoclongan.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Quốc lộ 1, Khánh Hậu, Tân An, Phường 4', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/62.jpg', NULL, NULL, 52, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (38, N'DLH', N'Đại Học Lạc Hồng', NULL, NULL, N'https://lhu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 10, Huỳnh Văn Nghệ, P. Bửu Long, Tp. Biên Hòa - Tỉnh Đồng Nai', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-lc-hng.jpg', NULL, NULL, 49, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (39, N'DLS', N'Đại Học Lao Động – Xã Hội ( Cơ sở phía Nam)', NULL, NULL, N'http://ldxh.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 1018 Tô Ký, phường Tân Chánh Hiệp, quận 12, Tp.Hồ Chí Minh.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/lao-dong-xa-hoi-phia-nam.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (40, N'DLT', N'Đại Học Lao Động – Xã Hội ( Cơ sở Sơn Tây )', NULL, NULL, N'http://ulsasontay.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Phố Hữu Nghị, Phường Xuân Khanh, Sơn Tây, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/dai-hoc-lao-dong-xa-hoi-co-so-son-tay.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (41, N'DLX', N'Đại Học Lao Động – Xã Hội ( Cơ sở Hà Nội )', NULL, NULL, N'http://ulsa.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 43, đường Trần Duy Hưng, phường Trung Hoà, Q.Cầu Giấy, Tp.Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/dai-hoc-lao-dong-xa-hoi-co-so-ha-noi.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (42, N'DNB', N'Đại Học Hoa Lư', NULL, NULL, N'http://hluv.edu.vn/vi?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'thôn Kỳ Vĩ, xã Ninh Nhất, thành phố Ninh Bình, tỉnh Ninh Bình', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hoa-lu.jpg', NULL, NULL, 26, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (43, N'DPD', N'Đại Học Dân Lập Phương Đông', NULL, NULL, N'http://phuongdong.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'171 Trung Kính, Yên Hòa, Cầu Giấy, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/logopd.png', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (44, N'DPQ', N'Đại Học Phạm Văn Đồng', NULL, NULL, N'http://www.pdu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'509 Phan Đình Phùng, TP Quảng Ngãi', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/logo1809x996.jpg', NULL, NULL, 35, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (45, N'DPT', N'Đại Học Phan Thiết', NULL, NULL, N'http://upt.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'225 Nguyễn Thông, Phú Hài, Phan Thiết, Bình Thuận', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/ewfw.jpg', NULL, NULL, 40, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (46, N'DQB', N'Đại Học Quảng Bình', NULL, NULL, N'http://quangbinhuni.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'312 Lý Thường Kiệt - Phường Bắc Lý - Thành phố Đồng Hới - Quảng Bình', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/qd.png', NULL, NULL, 30, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (47, N'DQN', N'Đại Học Quy Nhơn', NULL, NULL, N'http://www.qnu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'170 An Dương Vương, Tp. Quy Nhơn', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/quy-nhon.jpg', NULL, NULL, 36, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (48, N'DQT', N'Đại Học Quang Trung', NULL, NULL, N'http://www.quangtrung.edu.vn/page/dhqt.php?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Đào Tấn, Nhơn Phú, Thành phố Qui Nhơn, Bình Định', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/85.jpg', NULL, NULL, 36, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (49, N'DQU', N'Đại Học Quảng Nam', NULL, NULL, N'http://www.qnamuni.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'102 Hùng Vương - Thành phố Tam Kỳ - Quảng Nam.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/quang-nam.jpg', NULL, NULL, 34, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (50, N'DTA', N'Đại Học Thành Tây', NULL, NULL, N'http://thanhtay.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Phường Yên Nghĩa - Quận Hà Đông - Hà Nội.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/dai-hoc-thanh-tay.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (51, N'SPS', N'Đại Học Sư Phạm TPHCM', NULL, NULL, N'http://www.hcmup.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'280 An Dương Vương, Phường 4, Quận 5, TP.HCM', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-s-phm-tphcm.png', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (52, N'TAG', N'Đại Học An Giang', NULL, NULL, N'https://www.agu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 18 Ung Văn Khiêm, Phường Đông Xuyên, TP Long Xuyên - Tỉnh An Giang', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/an-gian.jpg', NULL, NULL, 58, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (53, N'TCT', N'Đại Học Cần Thơ', NULL, NULL, N'https://www.ctu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Khu II, đường 3/2, P. Xuân Khánh, Q. Ninh Kiều, TP. Cần Thơ.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-cn-th.png', NULL, NULL, 60, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (54, N'TDM', N'Đại học Thủ Dầu Một', NULL, NULL, N'https://tdmu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 06, Trần Văn Ơn, Phú Hòa, Thủ Dầu Một, Bình Dương', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-th-du-mt.png', NULL, NULL, 48, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (55, N'TDV', N'Đại Học Vinh', NULL, NULL, N'http://vinhuni.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'182 Lê Duẩn - Thành Phố Vinh - tỉnh Nghệ An', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-vinh.gif', NULL, NULL, 28, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (56, N'DDT', N'Đại Học Dân Lập Duy Tân', NULL, NULL, N'http://duytan.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'254 Nguyễn Văn Linh, Thạc Gián, Q. Thanh Khê, Đà Nẵng', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/38.jpg', NULL, NULL, 33, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (57, N'DHV', N'Đại học Hùng Vương - TPHCM', NULL, NULL, N'http://hvuh.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'736 Nguyễn Trãi , P11 , Q.5', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/dqq.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (58, N'DKH', N'Đại Học Dược Hà Nội', NULL, NULL, N'http://www.hup.edu.vn/Pages/default.aspx#section=generalw?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'13-15 Lê Thánh Tông Quận Hoàn Kiếm TP Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-dc-ha-ni.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (59, N'DKK', N'Đại Học Kinh Tế Kỹ Thuật Công Nghiệp', NULL, NULL, N'http://uneti.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'456 - Minh Khai, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/kinh-te-ky-thuat-cong-nghiep.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (60, N'DKS', N'Đại học Kiểm Sát Hà Nội', NULL, NULL, N'http://tks.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Phường Dương Nội - Quận Hà Đông - TP.Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/kiem-sat-hn.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (61, N'DKY', N'Đại Học Kỹ Thuật Y Tế Hải Dương', NULL, NULL, N'http://www.hmtu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 1, Đường Vũ Hựu, thành phố Hải Dương tỉnh Hải Dương, Việt Nam', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/ky-thuat-y-te-hai-duong.jpg', NULL, NULL, 20, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (62, N'DMS', N'Đại Học Tài Chính Marketing', NULL, NULL, N'http://ufm.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 2/4 Trần Xuân Soạn, Phường Tân Thuận Tây, Quận 7, TP. Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/logotrngihctaichinhmarketing.png', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (63, N'DMT', N'Đại học Tài Nguyên và Môi Trường Hà Nội', NULL, NULL, N'http://hunre.edu.vn/hre/trang-chu?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 41A đường Phú Diễn, Q. Bắc Từ Liêm, TP. Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/tai-nguyen-va-moi-truong-hn.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (64, N'DNT', N'Đại Học Ngoại Ngữ – Tin Học TPHCM', NULL, NULL, N'http://huflit.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'155 Sư Vạn Hạnh (nd), Phường 13, Quận 10, TP.HCM', N'https://media.kenhtuyensinh.vn/images/cms/2018/07/index.png', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (65, N'DNU', N'Đại Học Đồng Nai', NULL, NULL, N'http://www.dnpu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 4, Lê Quý Đôn, P.Tân Hiệp, TP Biên Hòa, Đồng Nai', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/dong-nai.jpg', NULL, NULL, 49, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (66, N'DNV', N'Đại Học Nội Vụ', NULL, NULL, N'http://truongnoivu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'số 36 Xuân La, quận Tây Hồ, Tp. Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-ni-v.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (67, N'DPY', N'Đại Học Phú Yên', NULL, NULL, N'http://www.pyu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'18 Trần Phú - Phường 7 - Thành phố Tuy Hòa - Tỉnh Phú Yên', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/phu-yen.jpg', NULL, NULL, 37, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (68, N'DQK', N'Đại Học Kinh Doanh và Công Nghệ Hà Nội', NULL, NULL, N'http://hubt.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Lầu 7, Toà nhà PHL, 109 Cộng Hoà, phường 12, quận Tân Bình, TP. HCM', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-kinh-doanh-va-cong-ngh-ha-ni.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (69, N'DSG', N'Đại Học Công Nghệ Sài Gòn', NULL, NULL, N'http://www.stu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'180 Cao Lỗ, Phường 4, Quận 8, Tp. Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/cong-nghe-sai-gon.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (70, N'DTH', N'Đại Học Hoa Sen', NULL, NULL, N'https://www.hoasen.edu.vn/vi?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'P.M101, 08 Nguyễn Văn Tráng, P. Bến Thành, Q.1, Tp.HCM', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-hoa-sen.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (71, N'DTM', N'ĐH Tài Nguyên môi trường TPHCM', NULL, NULL, N'http://www.hcmunre.edu.vn/hcmunre/trang-chu/index?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'236B Lê Văn Sỹ, phường 1, quận Tân Bình, Thành phố Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/98.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (72, N'DTP', N'Phân Hiệu Đại Học Thái Nguyên Tại Lào Cai', NULL, NULL, N'http://laocai.tnu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Tổ 13 - Phường Bình Minh - Thành phố Lào Cai - Tỉnh Lào Cai', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/phan-hieu-dai-hoc-thai-nguyen-tai-lao-cai.jpg', NULL, NULL, 7, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (73, N'DTT', N'Đại Học Tôn Đức Thắng', NULL, NULL, N'http://www.tdtu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'số 19, đường Nguyễn Hữu Thọ, Phường Tân Phong, Quận 7, Thành phố Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-ton-c-thng.png', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (74, N'DTZ', N'Đại Học Khoa Học – Đại Học Thái Nguyên', NULL, NULL, N'http://us.tnu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Phường Tân Thịnh - TP. Thái Nguyên - Thái Nguyên', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/105.jpg', NULL, NULL, 13, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (75, N'GTA', N'Đại học Công nghệ Giao thông vận tải', NULL, NULL, N'http://utt.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 54 Triều Khúc, Thanh Xuân, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-cong-ngh-giao-thong-vn-ti.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (76, N'HBU', N'Đại Học Quốc Tế Hồng Bàng', NULL, NULL, N'http://hiu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'215 Điện Biên Phủ, P.15, Q. Bình Thạnh, TP.HCM', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-quc-t-hng-bang.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (77, N'HCP', N'Học Viên Chính Sách và Phát Triển', NULL, NULL, N'http://apd.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Tòa nhà Bộ KH&ĐT - Ngõ 7 - Tôn Thất Thuyết - Cầu Giấy - Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hoc-vien-chinh-sach-va-phat-trien.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (78, N'HDT', N'Đại Học Hồng Đức', NULL, NULL, N'http://www.hdu.edu.vn/default.aspx?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 565 Quang Trung - Phường Đông Vệ - Tp.Thanh Hóa', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-hng-c.jpg', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (79, N'HHA', N'Đại Học Hàng Hải', NULL, NULL, N'http://www.vimaru.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'484 Lạch Tray, Lê Chân, Hải Phòng', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-hang-hi.jpg', NULL, NULL, 21, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (80, N'HLU', N'Đại Học Hạ Long', NULL, NULL, N'http://daihochalong.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 258, đường Bạch Đằng, phường Nam Khê - thành phố Uông Bí - tỉnh Quảng Ninh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/ha-long.jpg', NULL, NULL, 15, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (81, N'HNM', N'Đại học Thủ Đô Hà Nội', NULL, NULL, N'https://daihocthudo.edu.vn/vi/trang-chu?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 98, Dương Quảng Hàm, Quan Hoa, Cầu Giấy, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-th-o-ha-ni.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (82, N'HPN', N'Học Viện Phụ Nữ Việt Nam', NULL, NULL, N'http://hvpnvn.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Địa chỉ: 68 Nguyễn Chí Thanh, Q.Đống Đa, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hoc-vien-phu-nu-vn.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (83, N'HQT', N'Học Viện Ngoại Giao', NULL, NULL, N'https://www.dav.edu.vn/vi/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'69 Phố Chùa Láng, Đống Đa, Hà Nội, Việt Nam', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hoc-vien-ngoai-giao.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (84, N'HTA', N'Học viện Tòa án', NULL, NULL, N'http://hvta.toaan.gov.vn/portal/page/portal/hvta?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Đường 282 Kim Sơn, Gia Lâm, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hc-vin-toa-an.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (85, N'HTC', N'Học Viện Tài Chính', NULL, NULL, N'https://hvtc.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 58 (số 1 cũ) Lê Văn Hiến, Phường Đức Thắng, Quận Bắc Từ Liêm, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hocvientaichinh.jpeg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (86, N'HVN', N'Học Viện Nông Nghiệp Việt Nam', NULL, NULL, N'http://www.vnua.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Trâu Quỳ - Gia Lâm - Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hc-vin-nong-nghip-vit-nam.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (87, N'HYD', N'Học Viện Y Dược Học Cổ Truyền Việt Nam', NULL, NULL, N'http://vutm.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 2 - Trần Phú - Hà Đông - Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hoc-vien-y-duoc-hoc-co-truyen-vn.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (88, N'KCC', N'Đại học Kỹ Thuật Công Nghệ Cần Thơ', NULL, NULL, N'https://www.ctuet.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'256 Nguyễn Văn Cừ, Quận Ninh Kiều, Thành phố Cần Thơ', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/ky-thuat-cong-nghe-can-tho.jpg', NULL, NULL, 60, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (89, N'KGH', N'Trường Sĩ Quan Không Quân - Hệ Đại học', NULL, NULL, N'http://www.tsqkq.vn?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Cổng số 03 - Đường Biệt Thự - Tân Lập - Tp. Nha Trang - Khánh Hòa', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/si-quan-khong-quan-he-dai-hoc.jpg', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (90, N'KMA', N'Học Viện Kỹ Thuật Mật Mã', NULL, NULL, N'http://actvn.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'141 đường Chiến Thắng, Tân Triều, Thanh Trì, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hc-vin-k-thut-mt-ma.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (91, N'KQH', N'Học Viện Kỹ Thuật Quân Sự - Hệ Quân sự', NULL, NULL, N'http://mta.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 236 - Hoàng Quốc Việt - Bắc Từ Liêm - Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hoc-vien-ki-thuat-quan-su-he-quan-su.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (92, N'KTA', N'Đại Học Kiến Trúc Hà Nội', NULL, NULL, N'http://hau.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Km 10, Đường Nguyễn Trãi, Quận Thanh Xuân , TP Hà Nội, Việt Nam', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-kin-truc-ha-ni.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (93, N'KTS', N'Đại Học Kiến Trúc TPHCM', NULL, NULL, N'http://www.uah.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 196 Pasteur - Phường 6 - Quận 3 - Thành phố Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/kien-truc-hcm.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (94, N'LDA', N'Đại Học Công Đoàn', NULL, NULL, N'http://www.dhcd.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'169 - Tây Sơn - Đống Đa - Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-cong-oan.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (95, N'LPH', N'Đại Học Luật Hà Nội', NULL, NULL, N'http://hlu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'87 Nguyễn Chí Thanh, Q. Đống Đa, HN', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-lut-ha-ni.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (96, N'MDA', N'Đại Học Mỏ Địa Chất', NULL, NULL, N'http://humg.edu.vn/Pages/home.aspx?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 18 Phố Viên - Phường Đức Thắng - Quận Bắc Từ Liêm - Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/mo-dia-chat.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (97, N'MHN', N'Viện Đại Học Mở Hà Nội', NULL, NULL, N'https://www.hou.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Nhà B101, đường Nguyễn Hiền, quận Hai Bà Trưng, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/vin-i-hc-m-ha-ni.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (98, N'NHF', N'Đại Học Hà Nội', NULL, NULL, N'http://www.hanu.vn/vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Km 9, đường Nguyễn Trãi, quận Thanh Xuân, Hà Nội, Việt Nam', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-ha-ni.png', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (99, N'NQH', N'Học Viện Khoa Học Quân Sự - Hệ Quân sự', NULL, NULL, N'http://hvkhqs.edu.vn/vi/trang-chu.aspx?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Cộng hòa xã hội chủ nghĩa Việt Nam Việt Nam Địa chỉ số 322, đường Lê Trọng Tấn, phường Định Công, quận Hoàng Mai, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/182.jpg', NULL, NULL, 1, NULL, 1)
GO
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (100, N'NTS', N'Đại Học Ngoại Thương (phía Nam)', NULL, NULL, N'http://cs2.ftu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 15, Đường D5, Khu Văn Thánh Bắc, Phường 25, Quận Bình Thạnh, Thành phố Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/ftuslogo.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (101, N'PCH', N'Đại Học Phòng Cháy Chữa Cháy ( Phía Bắc )', NULL, NULL, N'http://daihocpccc.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 243, đường Khuất duy Tiến, quận Thanh Xuân, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/pccc-phia-bac.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (102, N'PCS', N'Đại Học Phòng Cháy Chữa Cháy (phía Nam)', NULL, NULL, N'http://aum.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 243, đường Khuất duy Tiến, quận Thanh Xuân, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/190.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (103, N'QHE', N'Đại Học Kinh Tế – Đại Học Quốc Gia Hà Nội', NULL, NULL, N'http://ueb.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 144 đường Xuân Thủy, Cầu Giấy, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-kinh-t-i-hc-quc-gia-ha-ni.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (104, N'QHF', N'Đại Học Ngoại Ngữ – Đại Học Quốc Gia Hà Nội', NULL, NULL, N'http://ulis.vnu.edu.vn?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Đường Phạm Văn Đồng - Quận Cầu Giấy - Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/ulis-logo.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (105, N'QHI', N'Đại Học Công Nghệ – Đại Học Quốc Gia Hà Nội', NULL, NULL, N'https://uet.vnu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'E3, 144 Xuân Thủy, Cầu Giấy, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/cong-nghe-qg-hn.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (106, N'QHL', N'Khoa Luật – Đại Học Quốc Gia Hà Nội', NULL, NULL, N'http://law.vnu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Nhà E1, 144 đường Xuân Thủy - Cầu Giấy - Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/khoa-luat-qg-hn.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (107, N'QHQ', N'Khoa Quốc Tế – Đại Học Quốc Gia Hà Nội', NULL, NULL, N'http://www.is.vnu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Nhà G7-G8, 144 Xuân Thuỷ, Cầu Giấy, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/khoa-quoc-te-qg-hn.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (108, N'QHS', N'Đại Học Giáo Dục - Đại học Quốc Gia Hà Nội', NULL, NULL, N'http://www.education.vnu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'G7 Đại học Quốc gia Hà Nội, Mai Dịch, Cầu Giấy, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/198.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (109, N'QHT', N'Đại Học Khoa Học Tự Nhiên – Đại Học Quốc Gia Hà Nội', NULL, NULL, N'http://www.hus.vnu.edu.vn/vi?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'334 đường Nguyễn Trãi, Thanh Xuân, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/khoa-hoc-tu-nhien-hn.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (110, N'QHX', N'Đại Học Khoa Học Xã Hội và Nhân Văn – Đại Học Quốc Gia Hà Nội', NULL, NULL, N'http://ussh.vnu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 336 Nguyễn Trãi, quận Thanh Xuân, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/200.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (111, N'QHY', N'Khoa Y Dược - Đại học Quốc Gia Hà Nội', NULL, NULL, N'http://smp.vnu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Nhà Y1, 144 Xuân Thủy, Cầu Giấy, TP. Hà Nội.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/khoa-y-duoc-qg-hn.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (112, N'QSC', N'Đại Học Công Nghệ Thông Tin', NULL, NULL, N'https://www.uit.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Khu phố 6, P.Linh Trung, Q.Thủ Đức, Tp.Hồ Chí Minh.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/cntt-hcm.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (113, N'QST', N'Đại Học Khoa Học Tự Nhiên', NULL, NULL, N'https://www.hcmus.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'227 Nguyễn Văn Cừ, Quận 05, Thành phố Hồ Chí Minh & Thủ Đức', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/logo-khtn.png', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (114, N'QSY', N'Khoa Y - Đại học Quốc Gia TPHCM', NULL, NULL, N'http://www.pdt-medvnu.info/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'phường Linh Trung, quận Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/208.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (115, N'SDU', N'Đại học Sao Đỏ', NULL, NULL, N'http://saodo.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 24, phố Thái Học II, phường Sao Đỏ, thị xã Chí Linh, tỉnh Hải Dương', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/sao-do.jpg', NULL, NULL, 20, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (116, N'SGD', N'Đại Học Sài Gòn', NULL, NULL, N'https://sgu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'273 An Dương Vương – Phường 3 – Quận 5', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/images.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (117, N'SKH', N'Đại Học Sư Phạm Kỹ Thuật Hưng Yên', NULL, NULL, N'http://www.utehy.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Khoái Châu - Hưng Yên', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/su-pham-ky-thuat-hung-yen.jpg', NULL, NULL, 20, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (118, N'SP2', N'Đại Học Sư Phạm Hà Nội 2', NULL, NULL, N'http://www.hpu2.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 32 đường Nguyễn Văn Linh, phường Xuân Hoà, thị xã Phúc Yên, tỉnh Vĩnh Phúc', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/su-pham-hn-2.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (119, N'DPC', N'Đại học Phan Châu Trinh', NULL, NULL, N'http://pctu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'02 Trần Hưng Đạo, P.Sơn Phong, TP. Hội An, Quảng Nam', N'https://media.kenhtuyensinh.vn/images/cms/2018/07/phan-chau-trinh.png', NULL, NULL, 34, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (120, N'GNT', N'Đại Học Sư Phạm Nghệ Thuật Trung Ương', NULL, NULL, N'http://www.spnttw.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 18, Ngõ 55, Đường Trần Phú, Quận Hà Đông, TP.Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/07/truong-dhspnttw.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (121, N'DDC', N'Khoa Công Nghệ – Đại Học Đà Nẵng', NULL, NULL, N'http://ute.udn.vn/default.aspx?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Khu C Q., 48 Cao Thắng, Thanh Bình, Hải Châu, Đà Nẵng', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/khoa-cong-nghe-dh-dn.jpg', NULL, NULL, 33, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (122, N'DDK', N'Đại Học Bách Khoa – Đại Học Đà Nẵng', NULL, NULL, N'http://www.dut.udn.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'54 Nguyễn Lương Bằng, Hoà Khánh Bắc, Liên Chiểu, Đà Nẵng', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/31.jpg', NULL, NULL, 33, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (123, N'DDN', N'Đại Học Đại Nam', NULL, NULL, N'http://dainam.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Phú Lãm, Hà Đông, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/dai-nam.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (124, N'DDP', N'Phân Hiệu Đại Học Đà Nẵng tại Kon Tum', NULL, NULL, N'http://www.kontum.udn.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 704 Phan Đình Phùng, TP Kon Tum, Tỉnh Kon Tum', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/phan-hieu-dh-da-nang-tai-kon-tum.jpg', NULL, NULL, 41, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (125, N'DDQ', N'Đại Học Kinh Tế – Đại Học Đà Nẵng', NULL, NULL, N'http://due.udn.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'71 Ngũ Hành Sơn Đà Nẵng', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/logokinhtanng.jpg', NULL, NULL, 33, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (126, N'DDS', N'Đại Học Sư Phạm – Đại Học Đà Nẵng', NULL, NULL, N'http://ued.udn.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 459, đường Tôn Đức Thắng, phường Hòa Khánh Nam, quận Liên Chiểu, Thành phố Đà Nẵng, Việt Nam', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/37.jpg', NULL, NULL, 33, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (127, N'ANH', N'Học Viện An Ninh Nhân Dân', NULL, NULL, N'https://hvannd.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'125 Trần Phú, Văn Quán, Hà Đông, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hc-vin-an-ninh-nhan-dan.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (128, N'ANS', N'Đại Học An Ninh Nhân Dân', NULL, NULL, N'https://www.facebook.com/AnNinhNhanDanTPHCM/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Km 18 xa lộ Hà Nội đi Biên Hòa; phường Linh Trung, Q.Thủ Đức, TP Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/an-ninh-nhan-dan.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (129, N'BPH', N'Học Viện Biên Phòng', NULL, NULL, N'http://www.hvbp.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Sơn Lộc - Sơn Tây - Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hoc-vien-bien-phong.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (130, N'CSH', N'Học Viện Cảnh Sát Nhân Dân', NULL, NULL, N'http://www.hvcsnd.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Phường Cổ Nhuế 2, quận Bắc Từ Liêm, thành phố Hà Nội.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hc-vin-cnh-sat-nhan-dan.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (131, N'CSS', N'Đại Học Cảnh Sát Nhân Dân', NULL, NULL, N'http://pup.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'36 Nguyễn Hữu Thọ - Phường Tân Phong - Quận 7 - TP. Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/canh-sat-nhan-dan.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (132, N'DCD', N'Đại Học Công Nghệ Đồng Nai', NULL, NULL, N'http://dntu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Đường Nguyễn Khuyến, KP5, phường Trảng Dài, TP. Biên Hòa, Tỉnh Đồng Nai', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/cong-nghe-dong-nai.jpg', NULL, NULL, 49, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (133, N'DCH', N'Trường Sĩ Quan Đặc Công', NULL, NULL, N'http://tsqdc.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'TT Xuân Mai - Chương Mỹ - Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/si-quan-dac-cong.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (134, N'DDF', N'Đại Học Ngoại Ngữ – Đại Học Đà Nẵng', NULL, NULL, N'http://ufl.udn.vn/vie/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'131 Lương Nhữ Hộc, Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/29.jpg', NULL, NULL, 33, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (135, N'DHA', N'Đại học Luật - Đại Học Huế', NULL, NULL, N'http://www.hul.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Đường Võ Văn Kiệt, Phường An Tây, Thành phố Huế.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/41.jpg', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (136, N'DHC', N'Khoa Giáo Dục Thể Chất – Đại Học Huế', NULL, NULL, N'http://fpe.hueuni.edu.vn/index.php/vi?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'52 phường, Hồ Đắc Di, An Cựu, Thành phố Huế, Thừa Thiên Huế', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/42.jpg', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (137, N'DHD', N'Khoa Du Lịch – Đại Học Huế', NULL, NULL, N'http://hat.hueuni.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'22 - Lâm Hoằng - TP. Huế', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/khoa-du-lich-hue.jpg', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (138, N'DHF', N'Đại Học Ngoại Ngữ – Đại Học Huế', NULL, NULL, N'http://hucfl.edu.vn/vi/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'57 Nguyễn Khoa Chiêm, phường An Cựu, TP Huế', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/44.jpg', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (139, N'DHK', N'Đại Học Kinh Tế – Đại Học Huế', NULL, NULL, N'http://www.hce.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'100 Phùng Hưng - TP Huế.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/45.jpg', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (140, N'DHL', N'Đại Học Nông Lâm – Đại Học Huế', NULL, NULL, N'http://www.huaf.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 102 Phùng Hưng, Phường Thuận Thành, Thành phố Huế.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/nong-lam-hue.jpg', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (141, N'DHN', N'Đại Học Nghệ Thuật – Đại Học Huế', NULL, NULL, N'http://hufa.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'10 Tô Ngọc Vân, Thuận Thành, Thành phố Huế, Thừa Thiên Huế', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/nghe-thuat-hue.jpg', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (142, N'DHQ', N'Phân Hiệu Đại Học Huế tại Quảng Trị', NULL, NULL, N'http://qtb.hueuni.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Đường Điện Biên Phủ - Phường Đông Lương – TP Đông Hà – Tỉnh Quảng Trị', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/phan-hieu-dh-hue-tai-quang-tri.jpg', NULL, NULL, 31, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (143, N'DHS', N'Đại Học Sư Phạm – Đại Học Huế', NULL, NULL, N'http://www.dhsphue.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 32 Lê Lợi, Phường Phú Hội, Thành phố Huế', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/su-pham-hue.jpg', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (144, N'DHT', N'Đại Học Khoa Học – Đại Học Huế', NULL, NULL, N'http://www.husc.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'77 Nguyễn Huệ, Phú Nhuận, Thành phố Huế, Thừa Thiên Huế', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/51.jpg', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (145, N'DHY', N'Đại Học Y Dược – Đại Học Huế', NULL, NULL, N'http://huemed-univ.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 06 Ngô Quyền, Phường Vĩnh Ninh, Thành phố Huế.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/y-duoc-hue.jpg', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (146, N'KSA', N'Đại Học Kinh Tế TPHCM', NULL, NULL, N'http://www.ueh.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'59C Nguyễn Đình Chiểu, quận 3, TP. Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/logotrnghkinhttphcm.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (147, N'NLG', N'Phân hiệu Đại học Nông Lâm TP. HCM tại Gia Lai', NULL, NULL, N'https://phgl.hcmuaf.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'126 Lê Thánh Tôn, Tp. Pleiku, tỉnh Gia Lai', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/phan-hieu-dh-nong-lam-hcm-tai-gia-lai.jpg', NULL, NULL, 42, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (148, N'NLN', N'Phân hiệu Đại học Nông Lâm TP. HCM tại Ninh Thuận', NULL, NULL, N'http://phnt.hcmuaf.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Thị trấn Khánh Hải, Huyện Ninh Hải, Tỉnh Ninh Thuận', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/phan-hieu-dh-nong-lam-hcm-tai-ninh-thuan.jpg', NULL, NULL, 39, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (149, N'NLS', N'Đại Học Nông Lâm TPHCM', NULL, NULL, N'http://www.hcmuaf.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'KP6, Phường Linh Trung, Quận Thủ Đức, TP. Hồ Chí Minh, Việt Nam', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/phan-hieu-dh-nong-lam-hcm-tai-gia-lai.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (150, N'YHB', N'Đại Học Y Hà Nội', NULL, NULL, N'http://www.hmu.edu.vn/news/default.aspx?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'01 Tôn Thất Tùng-Đống Đa-Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-y-ha-ni.png', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (151, N'NHH', N'Học Viện Ngân Hàng', NULL, NULL, N'http://www.hvnh.edu.vn/hvnh/vi/home.html?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 12, đường Chùa Bộ', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hoc-vien-ngan-hang.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (152, N'MTH', N'Đại Học Mỹ Thuật Việt Nam', NULL, NULL, N'http://mythuatvietnam.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'42 Yết Kiêu, phường Cửa Nam, quận Hoàn Kiếm, thành phố Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/dai-hoc-my-thuat-viet-nam-310x205.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (153, N'NHS', N'Đại Học Ngân Hàng TPHCM', NULL, NULL, N'http://buh.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'36 Tôn Thất Đạm, Quận 1, TP.Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/ngan-hang-hcm.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (154, N'PBH', N'Trường Sĩ Quan Pháo Binh', NULL, NULL, N'http://tsqpb.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Xã Thanh Mỹ, Sơn Tây, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/si-quan-phao-binh.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (155, N'PKH', N'Học Viện Phòng Không – Không Quân', NULL, NULL, N'http://hocvienpkkq.com/tin/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'xã Kim Sơn và xã Trung Sơn Trầm, ngoại ô thị xã Sơn Tây, Hà Nội.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hoc-vien-phong-khong-khong-quan.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (156, N'QSB', N'Đại Học Bách Khoa – Đại Học Quốc Gia TPHCM', NULL, NULL, N'http://www.hcmut.edu.vn/vi?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'268 Lý Thường Kiệt, phường 14, quận 10, TP.Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/bach-khoa-hcm.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (157, N'QSX', N'Đại Học Khoa Học Xã Hội và Nhân Văn', NULL, NULL, N'http://hcmussh.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'10-12 Đinh Tiên Hoàng, Bến Nghé, Quận 1, Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/khoa-hoc-xa-hoi-va-nhan-van-hcm.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (158, N'THP', N'Đại Học Hải Phòng', NULL, NULL, N'http://dhhp.edu.vn/vi/trang-chu/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 171 Phan Đăng Lưu - Kiến An - Hải Phòng', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hai-phong.jpg', NULL, NULL, 21, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (159, N'TMA', N'Đại Học Thương Mại', NULL, NULL, N'https://tmu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'79 Hồ Tùng Mậu, Cầu Giấy, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/ihcthngmi.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (160, N'TSN', N'Đại Học Nha Trang', NULL, NULL, N'http://www.ntu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'số 02 Nguyễn Đình Chiểu - Nha Trang - Khánh Hòa', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-nha-trang.jpg', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (161, N'VHH', N'Đại Học Văn Hóa Hà Nội', NULL, NULL, N'http://huc.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'418 Đê la Thành, Chợ Dừa, Đống Đa, Chợ Dừa Đống Đa Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-vn-hoa-ha-ni.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (162, N'VPH', N'Trường Sĩ Quan Kĩ Thuật Quân Sự - Hệ Quân sự', NULL, NULL, N'http://tdnu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'189 Nguyễn Oanh, Phường 10, Quân Gò Vấp, Tp. Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/si-quan-ki-thuat-quan-su-he-quan-su.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (163, N'YQH', N'Học Viện Quân Y - Hệ Quân sự', NULL, NULL, N'http://hocvienquany.vn/Portal/TrangChu.html?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 160 - Đường Phùng Hưng - Phường Phúc La - Quận Hà Đông - Thành phố Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hocvienquany.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (164, N'BKA', N'Đại Học Bách Khoa Hà Nội', NULL, NULL, N'https://www.hust.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 1 Đại Cồ Việt, Hai Bà Trưng, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/bach-khoa-hn.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (165, N'DCT', N'Đại Học Công Nghiệp Thực Phẩm TP HCM', NULL, NULL, N'http://hufi.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'140 Lê Trọng Tấn, P. Tây Thạnh, Q. Tân Phú, Tp.HCM', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/cong-nghiep-thuc-pham-hcm.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (166, N'GTS', N'Đại Học Giao Thông Vận Tải TPHCM', NULL, NULL, N'https://ut.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 2, Đường D3, P.25, Q. Bình Thạnh, Thành Phố Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-giao-thong-vn-ti-tphcm.png', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (167, N'KHA', N'Đại Học Kinh Tế Quốc Dân', NULL, NULL, N'https://www.neu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'207 Giải Phóng, Đồng Tâm, Quận Hai Bà Trưng, Hà Nội, Vietnam', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-kinh-t-quc-dan.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (168, N'NTH', N'Đại Học Ngoại Thương ( Cơ sở phía Bắc )', NULL, NULL, N'http://www.ftu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'91 Phố Chùa Láng, Đống Đa, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/ngoai-thuong-cs-phia-bac.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (169, N'YTC', N'Đại Học Y Tế Công Cộng', NULL, NULL, N'http://www.huph.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 1A, đường Đức Thắng, phường Đức Thắng, quận Bắc Từ Liêm, thành phố Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/y-te-cong-cong.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (170, N'HVC', N'Học viện cán bộ TPHCM', NULL, NULL, N'http://www.hocviencanbo.hochiminhcity.gov.vn?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'324 Chu Văn An, phường 12, quận Bình Thạnh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hoc-vien-can-bo-hcm.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (171, N'SKN', N'Đại Học Sư Phạm Kỹ Thuật Nam Định', NULL, NULL, N'http://nute.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Đường Phù Nghĩa, Phường Lộc Hạ, Thành phố Nam Định, Tỉnh Nam Định', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/213.jpg', NULL, NULL, 25, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (172, N'TKG', N'Đại học Kiên Giang', NULL, NULL, N'http://www.vnkgu.edu.vn?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'320A Quốc lộ 61, Thị trấn Minh Lương, Huyện Châu Thành, Tỉnh Kiên Giang', N'https://media.kenhtuyensinh.vn/images/cms/2018/07/kien-giang.jpg', NULL, NULL, 59, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (173, N'LPS', N'Đại học Luật TP.HCM', NULL, NULL, N'http://www.hcmulaw.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 02, Nguyễn Tất Thành, phường 12, quận 4, Tp. Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/07/luat-tphcm.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (174, N'RMU', N'Đại học RMIT Việt Nam', NULL, NULL, N'https://www.rmit.edu.vn/vi/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'702 đại lộ Nguyễn Văn Linh, quận 7, Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/daihocrmit.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (175, N'DTS', N'Đại Học Sư Phạm – Đại Học Thái Nguyên', NULL, NULL, N'http://dhsptn.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 20 – Lương Ngọc Quyến – TP Thái Nguyên – Thái Nguyên', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/su-pham-thai-nguyen.jpg', NULL, NULL, 13, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (176, N'TTN', N'Đại Học Tây Nguyên', NULL, NULL, N'https://www.ttn.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'567 Lê Duẩn TP. Buôn Ma Thuột - Đăk Lăk', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-tay-nguyen.jpg', NULL, NULL, 43, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (177, N'DDI', N'Cao Đẳng Công Nghệ Thông Tin – Đại Học Đà Nẵng', NULL, NULL, N'http://www.cit.udn.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Đường Nam Kỳ Khởi Nghĩa, P. Hòa Quý, Q. Ngũ Hành Sơn, Tp. Đà Nẵng', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/cnnt-da-nang.jpg', NULL, NULL, 33, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (178, N'DDY', N'Khoa Y Dược – Đại Học Đà Nẵng', NULL, NULL, N'http://smp.udn.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Khu đô thị Đại học Đà Nẵng, Hòa Quý, Ngũ Hành Sơn, Đà Nẵng', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/khoa-y-duoc-dn.jpg', NULL, NULL, 33, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (179, N'QSQ', N'Đại Học Quốc Tế – Đại Học Quốc Gia TPHCM', NULL, NULL, N'https://www.hcmiu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Khu phố 6, Thủ Đức, Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/295.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (180, N'YDS', N'Đại Học Y Dược TPHCM', NULL, NULL, N'http://www.yds.edu.vn/yds2/?Content=Home?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'217 Hồng Bàng, Phường 11, Quận 5, Tp.HCM', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/y-duoc-hcm.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (181, N'XDA', N'Đại Học Xây Dựng Hà Nội', NULL, NULL, N'http://nuce.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 55 đường Giải Phóng, Q. Hai Bà Trưng, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-xay-dng-ha-ni.png', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (182, N'DQH', N'Học Viện Kĩ Thuật Quân Sự - Hệ Dân sự', NULL, NULL, N'http://mta.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/fwewfibewf.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (183, N'TDL', N'Đại Học Đà Lạt', NULL, NULL, N'http://www.dlu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'01 Phù Đổng Thiên Vương, Tp. Đà Lạt, Lâm Đồng', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-a-lt.jpg', NULL, NULL, 45, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (184, N'VGU', N'Đại Học Việt Đức', NULL, NULL, N'http://vgu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Đường Lê Lai, Phường Hòa Phú, TP. Thủ Dầu Một, Tỉnh Bình Dương', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/viet-duc.jpg', NULL, NULL, 48, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (185, N'TLA', N'Đại Học Thủy Lợi ( Cơ sở 1 )', NULL, NULL, N'http://www.tlu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'175 Tây Sơn, Đống Đa, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/233.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (186, N'TLS', N'Đại Học Thủy Lợi ( Cơ sở 2 )', NULL, NULL, N'http://cs2.tlu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 2 Trường Sa, P.17, Q. Bình Thạnh, Tp. Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/truongdaihocthuyloi.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (187, N'DTK', N'Đại Học Kỹ Thuật Công Nghiệp – Đại Học Thái Nguyên', NULL, NULL, N'http://www.tnut.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 666 Đường 3-2, P.Tích Lương, TP Thái Nguyên - Tỉnh Thái Nguyên', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/ky-thuat-cong-nghiep-thai-nguyen.jpg', NULL, NULL, 13, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (188, N'LNH', N'Đại Học Lâm Nghiệp ( Cơ sở 1 )', NULL, NULL, N'http://vnuf.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Thị trấn Xuân Mai, huyện Chương Mỹ, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/163.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (189, N'LNS', N'Đại Học Lâm Nghiệp ( Cơ sở 2 )', NULL, NULL, N'http://vnuf2.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Thị Trấn Trảng Bom, Huyện Trảng Bom, Tỉnh Đồng Nai', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/164.jpg', NULL, NULL, 49, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (190, N'TYS', N'Đại Học Y Khoa Phạm Ngọc Thạch', NULL, NULL, N'https://www.pnt.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'86/2 Thành Thái, Q.10 TPHCM', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/y-khoa-pham-ngoc-thach.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (191, N'QSK', N'Đại học Kinh Tế – Luật -Đại Học Quốc Gia TPHCM', NULL, NULL, N'https://www.uel.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Khu phố 3, Phường Linh Xuân, Quận Thủ Đức, Thành Phố Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/logoihckinht-lut.png', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (192, N'MTS', N'Đại Học Mỹ Thuật TPHCM', NULL, NULL, N'http://hcmufa.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'05 Phan Đăng Lưu, Phường 3, Quận Bình Thạnh, TPHCM', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/my-thuat-hcm.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (193, N'BVU', N'Đại Học Bà Rịa – Vũng Tàu', NULL, NULL, N'http://bvu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'80 Trương Công Định, Phường 3, Tp.Vũng Tàu', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/ba-ria-vung-tau.jpg', NULL, NULL, 50, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (194, N'DBD', N'Đại Học Bình Dương', NULL, NULL, N'http://www.bdu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 504 Đại lộ Bình Dương – P.Hiệp thành – TP.Thủ Dầu Một – Bình Dương', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-binh-dng.jpg', NULL, NULL, 48, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (195, N'HCH', N'Học Viện Hành Chính Quốc Gia ( phía Bắc )', NULL, NULL, N'http://www1.napa.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'77 Nguyễn Chí Thanh, Q. Đống Đa, Hà Nội.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hoc-vien-hanh-chinh-quoc-gia-phia-bac.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (196, N'HCS', N'Học Viện Hành Chính Quốc Gia (phía Nam)', NULL, NULL, N'http://www1.napa.vn/hcm/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 10 đường 3 tháng 2, Q. 10, TP. Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/126.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (197, N'DCL', N'Đại Học Cửu Long', NULL, NULL, N'http://www.mku.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Quốc lộ 1A, Huyện Long Hồ, Tỉnh Vĩnh Long', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/cuu-long.jpg', NULL, NULL, 56, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (198, N'DSD', N'Đại Học Sân Khấu, Điện Ảnh TPHCM', NULL, NULL, N'http://skdahcm.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'125 Cống Quỳnh, quận 1, TP. Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/san-khau-dien-anh.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (199, N'HCB', N'Đại Học Kỹ Thuật - Hậu Cần Công An Nhân Dân ( Phía Bắc )', NULL, NULL, N'http://truongt36.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Thị trấn Hồ, Thuận Thành, Bắc Ninh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/ky-thuat-hau-can-cong-an-nhan-dan-phia-bac.jpg', NULL, NULL, 19, NULL, 1)
GO
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (200, N'HCN', N'Đại Học Kỹ Thuật - Hậu Cần Công An Nhân Dân ( Phía Nam )', NULL, NULL, N'http://truongt36.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Thị trấn Hồ, Thuận Thành, Bắc Ninh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/ky-thuat-hau-can-cong-an-nhan-dan-phia-nam.jpg', NULL, NULL, 19, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (201, N'HCA', N'Học Viện Chính Trị Công An Nhân Dân', NULL, NULL, N'http://hvctcand.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Địa chỉ: Số 29 đường Lê Văn Hiến, phường Đức Thắng, quận Bắc Từ Liêm, Hà Nội.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hoc-vien-chinh-tri-cong-an-nhan-dan.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (202, N'MTC', N'Đại Học Mỹ Thuật Công Nghiệp', NULL, NULL, N'http://mythuatcongnghiep.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'360 La Thành, Quận Đống Đa, Hà Nội, Việt Nam', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/my-thuat-cong-nghiep.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (203, N'ZNH', N'Đại Học Văn Hóa – Nghệ Thuật Quân Đội', NULL, NULL, N'http://www.vnq.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'101 Nguyễn Chí Thanh - Phường Láng Hạ - Đống Đa - Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/van-hoa-nghe-thuat-quan-doi.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (204, N'VHS', N'Đại Học Văn Hóa TPHCM', NULL, NULL, N'http://www.hcmuc.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'51 Quốc Hương, Thảo Điền, Quận 2, TP.HCM', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-vn-hoa.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (205, N'SKD', N'Đại Học Sân Khấu Điện Ảnh', NULL, NULL, N'http://skda.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Khu Văn hóa nghệ thuật Mai Dịch, phường Mai Dịch, Cầu Giấy, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/san-khau-dien-anh.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (206, N'HHK', N'Học Viện Hàng Không Việt Nam', NULL, NULL, N'http://vaa.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'104 Nguyễn Văn Trỗi, Phường 8, Quận Phú Nhuận, Tp.Hồ Chí Minh, Việt Nam', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hoc-vien-hang-khong-vn.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (207, N'NVS', N'Nhạc Viện TPHCM', NULL, NULL, N'http://www.hcmcons.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'112 Nguyễn Du st, Q.1, Tp.Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/nhac-vien-hcm.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (208, N'STS', N'Đại Học Sư Phạm Thể Dục Thể Thao TPHCM', NULL, NULL, N'http://www.upes.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'639 Nguyễn Trãi, Phường 11, Quận 5, Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/su-pham-the-duc-the-thao-hcm.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (209, N'TTQ', N'Đại Học Quốc Tế Sài Gòn', NULL, NULL, N'http://www.siu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'8C & 16 Tống Hữu Định, P.Thảo Điền, Q.2, Tp.HCM', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/quoc-te-sg.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (210, N'ZPH', N'Trường Sĩ Quan Kĩ Thuật Quân Sự - Hệ Dân sự', NULL, NULL, N'http://tdnu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'189 Nguyễn Oanh, Phường 10, Quân Gò Vấp, Tp. Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/si-quan-ki-thuat-quan-su-he-dan-su.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (211, N'DYH', N'Học Viện Quân Y - Hệ Dân sự', NULL, NULL, N'http://hocvienquany.vn/Portal/TrangChu.html?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 160 - Đường Phùng Hưng - Phường Phúc La - Quận Hà Đông - Thành phố Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/kdkf.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (212, N'HFH', N'Học Viện Hậu Cần - Hệ Dân sự', NULL, NULL, N'http://hocvienhaucan.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Ngọc Thụy - Long Biên - Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/129.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (213, N'CKC', N'Cao Đẳng Kỹ Thuật Cao Thắng', NULL, NULL, N'http://www.caothang.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'65 Huỳnh Thúc Kháng, P.Bến Nghé, Q.1, Tp.HCM.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/cao-dang-ky-thuat-cao-thang.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (214, N'HGH', N'Trường Sĩ Quan Phòng Hóa', NULL, NULL, N'http://www.siquanphonghoa.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Xã Sơn Động, Thị Xã Sơn Tây, Thành Phố Hà Nội, Sơn Đông, Sơn Tây, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/130.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (215, N'NHB', N'Học Viện Ngân Hàng Phân Viện Bắc Ninh', NULL, NULL, N'http://bacninh.hvnh.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'331 Ngô Gia Tự, P.Tiền An, Bắc Ninh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/174.jpg', NULL, NULL, 19, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (216, N'NHP', N'Học Viên Ngân Hàng ( Phân Viện Phú Yên )', NULL, NULL, N'http://phanviennganhangphuyen.edu.vn/index.php?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'441 đường Nguyễn Huệ, thành phố Tuy Hòa, tỉnh Phú Yên.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hoc-vien-ngan-hang-phan-hieu-phu-yen.jpg', NULL, NULL, 37, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (217, N'HVQ', N'Học Viện Quản Lý Giáo Dục', NULL, NULL, N'http://www.naem.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'31 Phan Đình Giót - Thanh Xuân - Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hoc-vien-quan-ly-giao-duc.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (218, N'KTD', N'Đại Học Kiến Trúc Đà Nẵng', NULL, NULL, N'http://www.dau.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'566 Núi Thành, Quận Hải Châu,TP. Đà Nẵng', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/kien-truc-da-nang.jpg', NULL, NULL, 33, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (219, N'YPB', N'Đại Học Y Hải Phòng', NULL, NULL, N'http://hpmu.edu.vn/hpmu/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 72A Nguyễn Bỉnh Khiêm, Ngô Quyền, Hải Phòng', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/y-hai-phong.jpg', NULL, NULL, 21, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (220, N'TTD', N'Đại Học Thể DụcThể Thao Đà Nẵng', NULL, NULL, N'http://www.upes3.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'44 Dũng sỹ Thanh khê, Quận Thanh khê, Thành phố Đà Nẵng', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/239.jpg', NULL, NULL, 33, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (221, N'YCT', N'Đại Học Y Dược Cần Thơ', NULL, NULL, N'http://www.ctump.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 179, đường Nguyễn Văn Cừ, P. An Khánh, Q. Ninh Kiều, TP. Cần Thơ', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-y-dc-cn-th.gif', NULL, NULL, 60, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (222, N'LCS', N'Trường Sĩ quan Chính trị (hệ dân sự)', NULL, NULL, N'http://daihocchinhtri.edu.vn?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Phòng Khoa học quân sự - Trường Sĩ quan Chính trị', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/161.jpg', NULL, NULL, 19, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (223, N'TDS', N'Đại Học Thể Dục Thể Thao TPHCM', NULL, NULL, N'http://ush.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Phường Linh Trung, Thu Duc District, Ho Chi Minh City', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/dai-hoc-the-duc-the-thao-tp-hcm.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (224, N'TGH', N'Trường Sĩ Quan Tăng – Thiết Giáp', NULL, NULL, N'http://siquantangthietgiap.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Xã Kim Long - Huyện Tam Dương - Tỉnh Vĩnh Phúc', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/12213123.jpg', NULL, NULL, 18, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (225, N'TTH', N'Trường Sĩ Quan Thông Tin - Hệ Quân sự - Đại Học Thông Tin Liên Lạc', NULL, NULL, N'http://www.tcu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 101, Mai Xuân Thưởng, Nha Trang, Khánh Hòa', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/si-quan-thong-tin-he-quan-su.jpg', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (226, N'VHD', N'Đại Học Công Nghiệp Việt Hung', NULL, NULL, N'http://daotao.viu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 16 Hữu Nghị - Xuân Khanh - Sơn Tây - TP.Hà Nội - Việt Nam', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/cong-nghiep-viet-trung.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (227, N'YDN', N'Đại học Kỹ thuật Y Dược Đà Nẵng', NULL, NULL, N'http://dhktyduocdn.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 99 - Hùng Vương - Hải Châu - Đà Nẵng', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/ky-thuat-y-duoc-da-nang.jpg', NULL, NULL, 33, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (228, N'YKV', N'Đại Học Y Khoa Vinh', NULL, NULL, N'http://vmu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'161 Nguyễn Phong Sắc - TP Vinh - Nghệ An', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/y-khoa-vinh.jpg', NULL, NULL, 28, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (229, N'YTB', N'Đại Học Y Dược Thái Bình', NULL, NULL, N'http://tbump.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'373 Lý Bôn, TP. Thái Bình, tỉnh Thái Bình', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/y-thai-binh.jpg', NULL, NULL, 23, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (230, N'ZCH', N'Trường Sĩ Quan Công Binh - Hệ Dân sự', NULL, NULL, N'http://www.tsqcb.edu.vn/tsqcb/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'229B, Đường Bạch Đằng, Phú Cường, TP.Thủ Dầu Một, Bình Dương', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/si-quan-cong-binh-he-dan-su.jpg', NULL, NULL, 48, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (231, N'MTU', N'Đại Học Xây Dựng Miền Tây', NULL, NULL, N'http://www.mtu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 20B Phó Cơ Điều, Phường 3, Thành phố Vĩnh Long, Tỉnh Vĩnh Long', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/xay-dung-mien-tay.jpg', NULL, NULL, 56, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (232, N'MTU', N'Đại Học Xây Dựng Miền Tây', NULL, NULL, N'http://www.mtu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 20B Phó Cơ Điều, Phường 3, Thành phố Vĩnh Long, Tỉnh Vĩnh Long', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/xay-dung-mien-tay.jpg', NULL, NULL, 56, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (233, N'TTB', N'Đại Học Tây Bắc', NULL, NULL, N'http://www.utb.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Phường Quyết Tâm - TP. Sơn La', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/tay-bac.jpg', NULL, NULL, 10, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (234, N'DAD', N'Đại Học Đông Á', NULL, NULL, N'http://donga.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'33 Xô Viết Nghệ Tĩnh - Q. Hải Châu - TP. Đà Nẵng', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-ong-a.jpg', NULL, NULL, 33, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (235, N'DCG', N'Đại Học Tư Thục Công Nghệ Thông Tin Gia Định', NULL, NULL, N'www.giadinh.edu.vn?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'A15-19 Nguyễn Hữu Thọ, Phường Tân Phong, Quận 7, Tp. Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/truong-dai-hoc-cong-nghe-thong-tin-gia-dinh-cs-quan-10-0-d2kr1p.jpg', NULL, NULL, 51, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (236, N'DVD', N'Đại Học Văn Hóa, Thể Thao Và Du Lịch Thanh Hóa', NULL, NULL, N'http://www.dvtdt.edu.vn?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 561 Quang Trung 3, P. Đông Vệ, TP. Thanh Hóa', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/the-thao-va-du-lich-thanh-hoa.jpg', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (237, N'UKH', N'Đại học Khánh Hòa', NULL, NULL, N'http://ukh.edu.vn/vi-vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'số 01 Nguyễn Chánh, phường Lộc Thọ, Tp. Nha Trang', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/khanh-hoa.jpg', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (238, N'DCV', N'Đại học Công nghiệp Vinh', NULL, NULL, N'http://www.iuv.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'26, Đường Nguyễn Thái Học, TP Vinh, Nghệ An', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/25.jpg', NULL, NULL, 28, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (239, N'DKT', N'Đại Học Hải Dương', NULL, NULL, N'http://www.uhd.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Khu Đô thị phía Nam, Thành phố Hải Dương (Liên Hồng - Gia Lộc - Hải Dương).', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/c5d1289dedd5716dfeeaf487452ef629.jpg', NULL, NULL, 20, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (240, N'DTB', N'Đại Học Thái Bình', NULL, NULL, N'http://tbu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Tân Bình, thành phố Thái Bình', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/tuyen-sinh-dai-hoc-thai-binh-2015-1.jpg', NULL, NULL, 23, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (241, N'BMU', N'Đại học Buôn Ma Thuột', NULL, NULL, N'https://bmtu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'298 Hà Huy Tập P. Tân An TP. Buôn Ma Thuột Tỉnh Đắk Lắk', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/buon-ma-thuot.jpg', NULL, NULL, 43, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (242, N'DCA', N'Đại Học Chu Văn An', NULL, NULL, N'http://www.cvauni.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'85 Tân Vĩnh, Phường 6, Quận 4, Hồ Chí Minh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/18.jpg', NULL, NULL, 22, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (243, N'DDB', N'Đại Học Thành Đông', NULL, NULL, N'http://thanhdong.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 3 Vũ Công Đán, P. Tứ Minh, TP Hải Dương', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/thanh-dong.jpg', NULL, NULL, 20, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (244, N'DDD', N'Đại Học Dân Lập Đông Đô', NULL, NULL, N'http://www.hdiu.edu.vn/home?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 1 Hoàng Đạo Thúy, Thanh Xuân, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/28.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (245, N'DMD', N'Đại học Công nghệ Miền Đông', NULL, NULL, N'http://mut.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Nút giao đường cao tốc - Quốc lộ 1A, xã Xuân Thạnh, huyện Thống Nhất, tỉnh Đồng Nai', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/qqeqe.jpg', NULL, NULL, 49, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (246, N'DNC', N'Đại học Nam Cần Thơ', NULL, NULL, N'https://www.nctu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'168, Nguyễn Văn Cừ (nối dài), P. An Bình, Quận Ninh Kiều, Thành phố Cần Thơ.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/i-hc-nam-cn-th.jpg', NULL, NULL, 60, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (247, N'DPX', N'Đại Học Dân Lập Phú Xuân', NULL, NULL, N'http://www.phuxuanuni.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'28 Nguyễn Tri Phương, Thành phố Huế', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/dan-lap-phu-xuan.jpg', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (248, N'LBS', N'Đại học Nguyễn Huệ', NULL, NULL, N'http://daihocnguyenhue.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Xã Tam Phước, TP Biên Hoà, Tỉnh Đồng Nai', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/159.jpg', NULL, NULL, 49, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (249, N'MCA', N'Đại Học Mỹ Thuật Công Nghiệp Á Châu', NULL, NULL, N'http://auad.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 88 Đường Mạc Thái Tổ, Nam Trung Yên, Yên Hòa, Cầu Giấy, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/167.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (250, N'SNH', N'Trường Sĩ Quan Công Binh - Hệ Quân sự', NULL, NULL, N'http://www.tsqcb.edu.vn/tsqcb/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'229B, Đường Bạch Đằng, Phú Cường, TP.Thủ Dầu Một, Bình Dương', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/si-quan-cong-binh-he-quan-su.jpg', NULL, NULL, 48, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (251, N'TBD', N'Đại Học Thái Bình Dương', NULL, NULL, N'http://pou.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'79 Mai Thị Dõng, Vĩnh Ngọc, Nha Trang, Khánh Hòa', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/thai-binh-duong.jpg', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (252, N'TDB', N'Đại Học Thể Dục Thể Thao Bắc Ninh', NULL, NULL, N'http://www.upes1.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Từ Sơn, Bắc Ninh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/244.jpg', NULL, NULL, 19, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (253, N'TDD', N'Đại học Thành Đô', NULL, NULL, N'http://thanhdo.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Kim Chung - Hoài Đức - Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/thanh-do.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (254, N'THV', N'Đại Học Hùng Vương', NULL, NULL, N'http://www.hvu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'+ Cơ sở Việt Trì: Phường Nông Trang, thành phố Việt Trì, tỉnh Phú Thọ + Cơ sở Phú Thọ: Phường Hùng Vương, thị xã Phú Thọ, tỉnh Phú Thọ', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/hung-vuong.jpg', NULL, NULL, 17, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (255, N'TQU', N'Đại học Tân Trào', NULL, NULL, N'http://daihoctantrao.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Km 6, xã Trung Môn, huyện Yên Sơn, tỉnh Tuyên Quang', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/tan-trao.jpg', NULL, NULL, 6, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (256, N'TTG', N'Đại Học Tiền Giang', NULL, NULL, N'http://www.tgu.edu.vn/#popup1?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'119 Ấp Bắc - Phường 05 - Thành phố Mỹ Tho - Tỉnh Tiền Giang.', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/tien-gian.jpg', NULL, NULL, 53, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (257, N'UKB', N'Đại Học Kinh Bắc', NULL, NULL, N'http://daihockinhbac.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Phố Phúc Sơn - Phường Vũ Ninh - TP.Bắc Ninh', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/kinh-bac.jpg', NULL, NULL, 19, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (258, N'VLU', N'Đại Học Sư Phạm Kỹ Thuật Vĩnh Long', NULL, NULL, N'http://www.vlute.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'73 Nguyễn Huệ, Phường 2, Vĩnh Long', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/251.jpg', NULL, NULL, 56, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (259, N'VTT', N'Đại Học Võ Trường Toản', NULL, NULL, N'http://www.vttu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Quốc Lộ 1A, Tân Phú Thạnh, Châu Thành A, Hậu Giang', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/vo-truong-toan.jpg', NULL, NULL, 61, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (260, N'VUI', N'Đại Học Công Nghiệp Việt Trì', NULL, NULL, N'http://vui.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Lâm Thao, Phú Thọ; Việt Trì, Phú Thọ', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/ewewe.jpg', NULL, NULL, 17, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (261, N'YDD', N'Đại Học Điều Dưỡng Nam Định', NULL, NULL, N'http://www.ndun.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 257 Đường Hàn Thuyên - Thành phố Nam Định', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/dieu-duong-nam-dinh.jpg', NULL, NULL, 25, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (262, N'FPT', N'Đại học FPT', NULL, NULL, N'http://daihoc.fpt.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Khu Giáo dục và Đào tạo – Khu Công nghệ cao Hòa Lạc – Km29 Đại lộ Thăng Long, Thạch Thất, TP. Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/06/dai-hoc-fpt.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (263, N'DBH', N'Đại học Quốc tế Bắc Hà', NULL, NULL, N'http://www.bhiu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 15 đường Nguyễn Văn Cừ, phường Ninh Xá, thành phố Bắc Ninh', N'https://media.kenhtuyensinh.vn/images/cms/2018/07/dai-hoc-quoc-te-bac-ha.jpg', NULL, NULL, 19, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (264, N'DCQ', N'Đại Học Công Nghệ và Quản Lý Hữu Nghị', NULL, NULL, N'http://utm.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Lô 1-4, số 431 Tam Trinh, Hoàng Mai, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/07/utm.png', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (265, N'DDA', N'Đại học Công nghệ Đông Á', NULL, NULL, N'https://eaut.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Trần Hữu Dực, Nam Từ Liêm, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/07/eaut.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (266, N'DVB', N'Đại Học Việt Bắc', NULL, NULL, N'http://www.vietbac.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Đường 1B- Phường Đồng Bẩm- Thành phố Thái Nguyên', N'https://media.kenhtuyensinh.vn/images/cms/2018/07/viet-bac.jpg', NULL, NULL, 13, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (267, N'DTV', N'Đại học Dân lập Lương Thế Vinh', NULL, NULL, N'http://www.ltvu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Phường Lộc Vượng - Thành Phố Nam Định', N'https://media.kenhtuyensinh.vn/images/cms/2018/07/luong-the-vinh.png', NULL, NULL, 25, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (268, N'DVP', N'Đại học Trưng Vương', NULL, NULL, N'https://daihoctrungvuong.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Tầng 1, Tòa nhà N06B1, Phố Thành Thái, Cầu Giấy, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/07/trung-vuong.png', NULL, NULL, 18, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (269, N'DYD', N'Đại học Yersin Đà Lạt', NULL, NULL, N'http://www.yersin.edu.vn?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'27 Tôn Thất Tùng - P8 - TP. Đà Lạt', N'https://media.kenhtuyensinh.vn/images/cms/2018/07/yersin-da-lat.png', NULL, NULL, 45, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (270, N'ETU', N'Đại học Hòa Bình', NULL, NULL, N'http://daihochoabinh.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 8 Bùi Xuân Phái, Mỹ Đình II, Nam Từ Liêm, Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/07/hoa-binh.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (271, N'TCU', N'Trường Sĩ quan Thông tin - Hệ Dân sự - Đại học Thông tin liên lạc', NULL, NULL, N'http://www.tcu.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Số 101, Mai Xuân Thưởng, Nha Trang, Khánh Hòa', N'https://media.kenhtuyensinh.vn/images/cms/2018/07/thongtinlienlac.png', NULL, NULL, 97, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (272, N'TDH', N'Đại Học Sư Phạm Thể Dục Thể Thao Hà Nội', NULL, NULL, N'http://dhsptdtthanoi.edu.vn/?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Phụng Châu - Chương Mỹ - Hà Nội', N'https://media.kenhtuyensinh.vn/images/cms/2018/07/sp-tdtt-ha-noi.jpg', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[University] ([Id], [Code], [Name], [Description], [Email], [Website], [Image], [UniAddress], [Logo], [Phone], [Priority], [LocationId], [TrainSystemId], [IsActive]) VALUES (273, N'zz01', N'Trường Fast Tarck SE', NULL, NULL, N'https://www.fasttrack.edu.vn?utm_source=KenhTuyenSinh&utm_medium=Article&utm_campaign=UniversityInfo', NULL, N'Toà nhà FPT, Đường Số 1, KCN An Đồn, An Hải Bắc, Sơn Trà, Đà Nẵng, Việt Nam', N'https://media.kenhtuyensinh.vn/images/cms/2018/07/ftse.jpg', NULL, NULL, 33, NULL, 1)
SET IDENTITY_INSERT [dbo].[University] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [Image], [IsActive], [Name], [Password], [Username], [HighSchoolId], [RoleID]) VALUES (4, N'asd', N'asd', 1, N'User1', N'abc123', N'admin', NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Image], [IsActive], [Name], [Password], [Username], [HighSchoolId], [RoleID]) VALUES (5, N'qwe', N'qwe', 0, N'User2', N'123', N'User2', NULL, 2)
INSERT [dbo].[Users] ([Id], [Email], [Image], [IsActive], [Name], [Password], [Username], [HighSchoolId], [RoleID]) VALUES (6, N'zxc', N'zxc', 1, N'User3', N'123', N'User3', NULL, 3)
INSERT [dbo].[Users] ([Id], [Email], [Image], [IsActive], [Name], [Password], [Username], [HighSchoolId], [RoleID]) VALUES (7, N'frt', N'ftr', 0, N'User4', N'123', N'User4', NULL, 4)
INSERT [dbo].[Users] ([Id], [Email], [Image], [IsActive], [Name], [Password], [Username], [HighSchoolId], [RoleID]) VALUES (10, N'quypcse62249@fpt.edu.vn', N'https://lh4.googleusercontent.com/-jgu3lbKzEXk/AAAAAAAAAAI/AAAAAAAAAAA/AAnnY7pK1A_mMdj5KL0_nUTZHYTuLtCUWQ/s96-c/photo.jpg', 1, N'Quy Pham Chanh', N'$2a$10$k9f96.Nc6bRTgoIu5E14Quk1vlJIyLkcXppTPF7Hta7GQ3S/C3vgq', N'quypcse62249@fpt.edu.vn', NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Image], [IsActive], [Name], [Password], [Username], [HighSchoolId], [RoleID]) VALUES (11, N'aaaaaa@gmail.com', NULL, 1, NULL, N'$2a$10$k9f96.Nc6bRTgoIu5E14Quk1vlJIyLkcXppTPF7Hta7GQ3S/C3vgq', N'user111', NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Image], [IsActive], [Name], [Password], [Username], [HighSchoolId], [RoleID]) VALUES (12, N'quy.pham@wisky.vn', N'https://lh3.googleusercontent.com/-jJwMjm4JkLM/AAAAAAAAAAI/AAAAAAAAAAA/APUIFaPtvfmxEsrxI16kRGdfWL6cxEtABA/s96-c/photo.jpg', 1, N'Quy Ph?m Chánh', N'12345678', N'quy.pham@wisky.vn', NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Vote] ON 

INSERT [dbo].[Vote] ([Id], [QuestionAnswerId], [UserId]) VALUES (1, 1, 10)
INSERT [dbo].[Vote] ([Id], [QuestionAnswerId], [UserId]) VALUES (2, 2, 5)
INSERT [dbo].[Vote] ([Id], [QuestionAnswerId], [UserId]) VALUES (3, 1, 4)
INSERT [dbo].[Vote] ([Id], [QuestionAnswerId], [UserId]) VALUES (4, 1, 6)
SET IDENTITY_INSERT [dbo].[Vote] OFF
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FKmo1dhnc1v579su2ots5c9cost] FOREIGN KEY([UniversityId])
REFERENCES [dbo].[University] ([Id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FKmo1dhnc1v579su2ots5c9cost]
GO
ALTER TABLE [dbo].[ArticleTag]  WITH CHECK ADD  CONSTRAINT [FK9ka23sfw16dlc91doym7teo5a] FOREIGN KEY([MajorUniId])
REFERENCES [dbo].[MajorUniversity] ([Id])
GO
ALTER TABLE [dbo].[ArticleTag] CHECK CONSTRAINT [FK9ka23sfw16dlc91doym7teo5a]
GO
ALTER TABLE [dbo].[ArticleTag]  WITH CHECK ADD  CONSTRAINT [FKdq8n6fx6k0le144monv9fgbmy] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Article] ([Id])
GO
ALTER TABLE [dbo].[ArticleTag] CHECK CONSTRAINT [FKdq8n6fx6k0le144monv9fgbmy]
GO
ALTER TABLE [dbo].[BlockMajorUniversity]  WITH CHECK ADD  CONSTRAINT [FKhbhqrjhc0l8m7frq4bxr5n251] FOREIGN KEY([BLockId])
REFERENCES [dbo].[Block] ([Id])
GO
ALTER TABLE [dbo].[BlockMajorUniversity] CHECK CONSTRAINT [FKhbhqrjhc0l8m7frq4bxr5n251]
GO
ALTER TABLE [dbo].[BlockMajorUniversity]  WITH CHECK ADD  CONSTRAINT [FKtojafyp8ffurwafroqvpayfs1] FOREIGN KEY([MajorUniversityID])
REFERENCES [dbo].[MajorUniversity] ([Id])
GO
ALTER TABLE [dbo].[BlockMajorUniversity] CHECK CONSTRAINT [FKtojafyp8ffurwafroqvpayfs1]
GO
ALTER TABLE [dbo].[BlockOfMajor]  WITH CHECK ADD  CONSTRAINT [FK1br58v5jstrt3eud31a8sgyv8] FOREIGN KEY([MajorId])
REFERENCES [dbo].[Major] ([Id])
GO
ALTER TABLE [dbo].[BlockOfMajor] CHECK CONSTRAINT [FK1br58v5jstrt3eud31a8sgyv8]
GO
ALTER TABLE [dbo].[BlockOfMajor]  WITH CHECK ADD  CONSTRAINT [FK6299ybajyhmtj4yp4jhirv5vp] FOREIGN KEY([BlockId])
REFERENCES [dbo].[Block] ([Id])
GO
ALTER TABLE [dbo].[BlockOfMajor] CHECK CONSTRAINT [FK6299ybajyhmtj4yp4jhirv5vp]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FKn090x5xhb8gjl7s1eui9kvm3e] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FKn090x5xhb8gjl7s1eui9kvm3e]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FKrk3rqr7t04vdm17ju5otuaqkm] FOREIGN KEY([MajorUniversityId])
REFERENCES [dbo].[MajorUniversity] ([Id])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FKrk3rqr7t04vdm17ju5otuaqkm]
GO
ALTER TABLE [dbo].[HighSchool]  WITH CHECK ADD  CONSTRAINT [FKq9c7st28dl5vc2glkws50ftnd] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[HighSchool] CHECK CONSTRAINT [FKq9c7st28dl5vc2glkws50ftnd]
GO
ALTER TABLE [dbo].[Major]  WITH CHECK ADD  CONSTRAINT [FKd1k67uuvuf846cy3j3h21x8j6] FOREIGN KEY([GroupMajorId])
REFERENCES [dbo].[GroupMajor] ([Id])
GO
ALTER TABLE [dbo].[Major] CHECK CONSTRAINT [FKd1k67uuvuf846cy3j3h21x8j6]
GO
ALTER TABLE [dbo].[MajorMBTI]  WITH CHECK ADD  CONSTRAINT [FK4nmrhriaxyb2tgew75sxks0hd] FOREIGN KEY([MBTITypeID])
REFERENCES [dbo].[MBTIType] ([Id])
GO
ALTER TABLE [dbo].[MajorMBTI] CHECK CONSTRAINT [FK4nmrhriaxyb2tgew75sxks0hd]
GO
ALTER TABLE [dbo].[MajorMBTI]  WITH CHECK ADD  CONSTRAINT [FKgr0avqnjr6p63sybqdmdk0wtj] FOREIGN KEY([MajorId])
REFERENCES [dbo].[Major] ([Id])
GO
ALTER TABLE [dbo].[MajorMBTI] CHECK CONSTRAINT [FKgr0avqnjr6p63sybqdmdk0wtj]
GO
ALTER TABLE [dbo].[MajorUniversity]  WITH CHECK ADD  CONSTRAINT [FK8m1odgweofkd7qwuarrxebbw1] FOREIGN KEY([MajorId])
REFERENCES [dbo].[Major] ([Id])
GO
ALTER TABLE [dbo].[MajorUniversity] CHECK CONSTRAINT [FK8m1odgweofkd7qwuarrxebbw1]
GO
ALTER TABLE [dbo].[MajorUniversity]  WITH CHECK ADD  CONSTRAINT [FKbkd2o6cpws7ic9c1jh0rswmau] FOREIGN KEY([UniversityId])
REFERENCES [dbo].[University] ([Id])
GO
ALTER TABLE [dbo].[MajorUniversity] CHECK CONSTRAINT [FKbkd2o6cpws7ic9c1jh0rswmau]
GO
ALTER TABLE [dbo].[MBTIQuestion]  WITH CHECK ADD  CONSTRAINT [FKbhjyj7pvdleatj5obvgcrieej] FOREIGN KEY([MBTIGroupId])
REFERENCES [dbo].[MBTIGroup] ([Id])
GO
ALTER TABLE [dbo].[MBTIQuestion] CHECK CONSTRAINT [FKbhjyj7pvdleatj5obvgcrieej]
GO
ALTER TABLE [dbo].[MBTIResult]  WITH CHECK ADD  CONSTRAINT [FKf5ct0yodcuw19w5fq28f0wlt2] FOREIGN KEY([MBTITypeId])
REFERENCES [dbo].[MBTIType] ([Id])
GO
ALTER TABLE [dbo].[MBTIResult] CHECK CONSTRAINT [FKf5ct0yodcuw19w5fq28f0wlt2]
GO
ALTER TABLE [dbo].[MBTIResult]  WITH CHECK ADD  CONSTRAINT [FKt1apxjg9kdox0a5f46xeyx825] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[MBTIResult] CHECK CONSTRAINT [FKt1apxjg9kdox0a5f46xeyx825]
GO
ALTER TABLE [dbo].[Provider]  WITH CHECK ADD  CONSTRAINT [FK3fhul5218f9fp2f1i6g6idl8h] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Provider] CHECK CONSTRAINT [FK3fhul5218f9fp2f1i6g6idl8h]
GO
ALTER TABLE [dbo].[QuestionAnswer]  WITH CHECK ADD  CONSTRAINT [FKjfkby03ajnm4toegfys3b9qh5] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[QuestionAnswer] CHECK CONSTRAINT [FKjfkby03ajnm4toegfys3b9qh5]
GO
ALTER TABLE [dbo].[QuestionTag]  WITH CHECK ADD  CONSTRAINT [FKepwb69i433v9ha83p0a1qegq6] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[QuestionAnswer] ([Id])
GO
ALTER TABLE [dbo].[QuestionTag] CHECK CONSTRAINT [FKepwb69i433v9ha83p0a1qegq6]
GO
ALTER TABLE [dbo].[QuestionTag]  WITH CHECK ADD  CONSTRAINT [FKgjcx4rtx7ntjf6qaw9yeo0gu1] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tag] ([Id])
GO
ALTER TABLE [dbo].[QuestionTag] CHECK CONSTRAINT [FKgjcx4rtx7ntjf6qaw9yeo0gu1]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK6stiy9qma5dhj7yyp29j3dl92] FOREIGN KEY([QuestionAnswerId])
REFERENCES [dbo].[QuestionAnswer] ([Id])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK6stiy9qma5dhj7yyp29j3dl92]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FKafq3uyf4n6qvyrlfkps203sph] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FKafq3uyf4n6qvyrlfkps203sph]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK8pn6ya44x8djuydyd0rneqegj] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK8pn6ya44x8djuydyd0rneqegj]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FKtl3frq5v4i0xhnif76ocdhr7n] FOREIGN KEY([UniversityId])
REFERENCES [dbo].[University] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FKtl3frq5v4i0xhnif76ocdhr7n]
GO
ALTER TABLE [dbo].[ReviewAverage]  WITH CHECK ADD  CONSTRAINT [FKpq3fl1jnw5ceyshe8no8qqh2m] FOREIGN KEY([UniversityId])
REFERENCES [dbo].[University] ([Id])
GO
ALTER TABLE [dbo].[ReviewAverage] CHECK CONSTRAINT [FKpq3fl1jnw5ceyshe8no8qqh2m]
GO
ALTER TABLE [dbo].[ReviewLike]  WITH CHECK ADD  CONSTRAINT [FKd8sc25trge36yo9ik5ie59jq3] FOREIGN KEY([ReviewId])
REFERENCES [dbo].[Review] ([Id])
GO
ALTER TABLE [dbo].[ReviewLike] CHECK CONSTRAINT [FKd8sc25trge36yo9ik5ie59jq3]
GO
ALTER TABLE [dbo].[ReviewLike]  WITH CHECK ADD  CONSTRAINT [FKeubxp6h29d4320thm5qyx4n5s] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ReviewLike] CHECK CONSTRAINT [FKeubxp6h29d4320thm5qyx4n5s]
GO
ALTER TABLE [dbo].[ReviewMajor]  WITH CHECK ADD  CONSTRAINT [FK6baw6a2vct3nk5n44ei4hqc7y] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ReviewMajor] CHECK CONSTRAINT [FK6baw6a2vct3nk5n44ei4hqc7y]
GO
ALTER TABLE [dbo].[ReviewMajor]  WITH CHECK ADD  CONSTRAINT [FKqlb1pm06xd6qxk44yat07najk] FOREIGN KEY([MajorUniId])
REFERENCES [dbo].[MajorUniversity] ([Id])
GO
ALTER TABLE [dbo].[ReviewMajor] CHECK CONSTRAINT [FKqlb1pm06xd6qxk44yat07najk]
GO
ALTER TABLE [dbo].[ReviewMajorAverage]  WITH CHECK ADD  CONSTRAINT [FKd7safbn153e348e7ejgpnxw1u] FOREIGN KEY([MajorUniversityId])
REFERENCES [dbo].[MajorUniversity] ([Id])
GO
ALTER TABLE [dbo].[ReviewMajorAverage] CHECK CONSTRAINT [FKd7safbn153e348e7ejgpnxw1u]
GO
ALTER TABLE [dbo].[ScoreHistory]  WITH CHECK ADD  CONSTRAINT [FK853e6si7uyli7aremfcdx0c1k] FOREIGN KEY([BlockMajorUniId])
REFERENCES [dbo].[BlockMajorUniversity] ([Id])
GO
ALTER TABLE [dbo].[ScoreHistory] CHECK CONSTRAINT [FK853e6si7uyli7aremfcdx0c1k]
GO
ALTER TABLE [dbo].[University]  WITH CHECK ADD  CONSTRAINT [FK8yht6iofa42oox0qod4x8eocr] FOREIGN KEY([TrainSystemId])
REFERENCES [dbo].[TrainSystem] ([Id])
GO
ALTER TABLE [dbo].[University] CHECK CONSTRAINT [FK8yht6iofa42oox0qod4x8eocr]
GO
ALTER TABLE [dbo].[University]  WITH CHECK ADD  CONSTRAINT [FKscy503mjibxor51f669y23vai] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[University] CHECK CONSTRAINT [FKscy503mjibxor51f669y23vai]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK98ltbnnq69up18kfeilxjkhck] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK98ltbnnq69up18kfeilxjkhck]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FKgqe15n3e71m26d2s97cfayxf6] FOREIGN KEY([HighSchoolId])
REFERENCES [dbo].[HighSchool] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FKgqe15n3e71m26d2s97cfayxf6]
GO
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD  CONSTRAINT [FKodekqw2k07fh1e516bgu9s9s4] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Vote] CHECK CONSTRAINT [FKodekqw2k07fh1e516bgu9s9s4]
GO
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD  CONSTRAINT [FKp31ymwpob4v1c2prdu5281elp] FOREIGN KEY([QuestionAnswerId])
REFERENCES [dbo].[QuestionAnswer] ([Id])
GO
ALTER TABLE [dbo].[Vote] CHECK CONSTRAINT [FKp31ymwpob4v1c2prdu5281elp]
GO
USE [master]
GO
ALTER DATABASE [University] SET  READ_WRITE 
GO
