USE [master]
GO
/****** Object:  Database [University_admission_counseling]    Script Date: 8/8/2018 5:40:41 PM ******/
CREATE DATABASE [University_admission_counseling]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'University_admission_counseling', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\University_admission_counseling.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'University_admission_counseling_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\University_admission_counseling_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [University_admission_counseling] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [University_admission_counseling].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [University_admission_counseling] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [University_admission_counseling] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [University_admission_counseling] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [University_admission_counseling] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [University_admission_counseling] SET ARITHABORT OFF 
GO
ALTER DATABASE [University_admission_counseling] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [University_admission_counseling] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [University_admission_counseling] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [University_admission_counseling] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [University_admission_counseling] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [University_admission_counseling] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [University_admission_counseling] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [University_admission_counseling] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [University_admission_counseling] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [University_admission_counseling] SET  DISABLE_BROKER 
GO
ALTER DATABASE [University_admission_counseling] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [University_admission_counseling] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [University_admission_counseling] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [University_admission_counseling] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [University_admission_counseling] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [University_admission_counseling] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [University_admission_counseling] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [University_admission_counseling] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [University_admission_counseling] SET  MULTI_USER 
GO
ALTER DATABASE [University_admission_counseling] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [University_admission_counseling] SET DB_CHAINING OFF 
GO
ALTER DATABASE [University_admission_counseling] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [University_admission_counseling] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [University_admission_counseling] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'University_admission_counseling', N'ON'
GO
ALTER DATABASE [University_admission_counseling] SET QUERY_STORE = OFF
GO
USE [University_admission_counseling]
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
USE [University_admission_counseling]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 8/8/2018 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[Id] [int] NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 8/8/2018 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ID] [int] NOT NULL,
	[UniversityId] [int] NOT NULL,
	[TagId] [int] NULL,
	[StaffId] [int] NULL,
	[ThumbnailUrl] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Block]    Script Date: 8/8/2018 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Block](
	[ID] [int] NOT NULL,
	[BlockName] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Block] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlockOfMajor]    Script Date: 8/8/2018 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlockOfMajor](
	[ID] [int] NOT NULL,
	[MajorId] [int] NULL,
	[BlockId] [int] NULL,
	[BaseScoreLastYear] [float] NULL,
	[Description] [nvarchar](255) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_BlockOfMajor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 8/8/2018 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] NOT NULL,
	[ArticleId] [int] NULL,
	[UserId] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 8/8/2018 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[ID] [int] NOT NULL,
	[LocationName] [nvarchar](255) NULL,
	[LocationCode] [nvarchar](255) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Major]    Script Date: 8/8/2018 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major](
	[ID] [int] NOT NULL,
	[UniversityId] [int] NULL,
	[MajorName] [nvarchar](max) NULL,
	[MajorCode] [nvarchar](50) NULL,
	[GradeToPass] [float] NULL,
	[Status] [bit] NULL,
	[Description] [nvarchar](max) NULL,
	[StudentFee] [nvarchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Major] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MajorOfMBTI]    Script Date: 8/8/2018 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MajorOfMBTI](
	[Id] [int] NOT NULL,
	[MajorId] [int] NULL,
	[MBTITypeId] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_MajorOfMBTI] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MBTIQuestion]    Script Date: 8/8/2018 5:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MBTIQuestion](
	[ID] [int] NOT NULL,
	[QuestionContent] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_MBTIQuestion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MBTIResult]    Script Date: 8/8/2018 5:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MBTIResult](
	[Id] [int] NOT NULL,
	[MBTIQuestionId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[MBTITypeId] [int] NULL,
	[CompletedDate] [datetime] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_MBTIResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MBTIType]    Script Date: 8/8/2018 5:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MBTIType](
	[Id] [int] NOT NULL,
	[MBTITypeName] [nchar](10) NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_MBTIType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 8/8/2018 5:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Id] [int] NOT NULL,
	[QuestionContent] [nvarchar](max) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[Activate] [bit] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 8/8/2018 5:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[Id] [int] NOT NULL,
	[Tittle] [nvarchar](255) NULL,
	[QuizType] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Activate] [bit] NULL,
 CONSTRAINT [PK_Quiz] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizContent]    Script Date: 8/8/2018 5:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizContent](
	[Id] [int] NOT NULL,
	[QuizId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[AnswerId] [int] NOT NULL,
 CONSTRAINT [PK_QuizContent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizResult]    Script Date: 8/8/2018 5:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizResult](
	[Id] [int] NOT NULL,
	[QuizId] [int] NULL,
	[CompletedDate] [datetime] NULL,
	[Score] [nvarchar](50) NULL,
	[StudentId] [int] NULL,
 CONSTRAINT [PK_UserQuiz] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RatingOfReview]    Script Date: 8/8/2018 5:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RatingOfReview](
	[Id] [int] NOT NULL,
	[NameOfRating] [nvarchar](max) NOT NULL,
	[Point] [float] NULL,
	[ReviewDetailId] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_RatingOfReview] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 8/8/2018 5:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[Id] [int] NOT NULL,
	[UserId] [int] NULL,
	[ReviewId] [int] NULL,
	[UniversityId] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewDetail]    Script Date: 8/8/2018 5:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewDetail](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[UserId] [int] NULL,
	[Agreement] [nvarchar](max) NULL,
	[Disagreement] [nvarchar](max) NULL,
	[Agree] [int] NULL,
	[Disagree] [int] NULL,
	[Status] [bit] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_ReviewDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 8/8/2018 5:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Id] [int] NOT NULL,
	[UniversityId] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 8/8/2018 5:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] NOT NULL,
	[FavoritedUniversityId] [int] NULL,
	[MBTITypeId] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 8/8/2018 5:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[Id] [int] NOT NULL,
	[TagName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Tag_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[University]    Script Date: 8/8/2018 5:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[University](
	[ID] [int] NOT NULL,
	[UniversityName] [nvarchar](255) NOT NULL,
	[LocationId] [int] NULL,
	[Email] [nvarchar](255) NULL,
	[Website] [nvarchar](255) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[LogoUrl] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Priority] [int] NULL,
	[Active] [bit] NULL,
	[Rating] [float] NULL,
	[CodeOfBlock] [nvarchar](255) NULL,
 CONSTRAINT [PK_University] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/8/2018 5:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[AvatarUrl] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 8/8/2018 5:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [int] NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_UserRole_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volunteer]    Script Date: 8/8/2018 5:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteer](
	[Id] [int] NOT NULL,
	[UniversityId] [int] NULL,
	[EarnType] [nvarchar](50) NULL,
	[EarnValue] [float] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Volunteer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Answer] ([Id], [Answer], [ImageUrl]) VALUES (1, N'ANS1', N'ANS')
INSERT [dbo].[Answer] ([Id], [Answer], [ImageUrl]) VALUES (2, N'ANS2', N'ANS2')
INSERT [dbo].[Answer] ([Id], [Answer], [ImageUrl]) VALUES (3, N'ANS3', N'ANS3')
INSERT [dbo].[Answer] ([Id], [Answer], [ImageUrl]) VALUES (4, N'ANS4', N'ANS4')
INSERT [dbo].[Answer] ([Id], [Answer], [ImageUrl]) VALUES (5, N'ANS5', N'ANS5')
INSERT [dbo].[Article] ([ID], [UniversityId], [TagId], [StaffId], [ThumbnailUrl], [Description], [Active]) VALUES (1, 1, 1, 1, N'1', N'1', 1)
INSERT [dbo].[Article] ([ID], [UniversityId], [TagId], [StaffId], [ThumbnailUrl], [Description], [Active]) VALUES (2, 1, 1, 1, N'1', N'1', 1)
INSERT [dbo].[Article] ([ID], [UniversityId], [TagId], [StaffId], [ThumbnailUrl], [Description], [Active]) VALUES (3, 1, 2, 2, N'2', N'2', 1)
INSERT [dbo].[Article] ([ID], [UniversityId], [TagId], [StaffId], [ThumbnailUrl], [Description], [Active]) VALUES (4, 1, 3, 3, N'3', N'3', 1)
INSERT [dbo].[Article] ([ID], [UniversityId], [TagId], [StaffId], [ThumbnailUrl], [Description], [Active]) VALUES (5, 2, 1, 1, N'1', N'1', 1)
INSERT [dbo].[Article] ([ID], [UniversityId], [TagId], [StaffId], [ThumbnailUrl], [Description], [Active]) VALUES (6, 3, 2, 1, N'2', N'1', 1)
INSERT [dbo].[Article] ([ID], [UniversityId], [TagId], [StaffId], [ThumbnailUrl], [Description], [Active]) VALUES (7, 4, 1, 1, N'1', N'1', 1)
INSERT [dbo].[Article] ([ID], [UniversityId], [TagId], [StaffId], [ThumbnailUrl], [Description], [Active]) VALUES (8, 4, 2, 1, N'1', N'1', 1)
INSERT [dbo].[Comment] ([Id], [ArticleId], [UserId], [Description], [Active]) VALUES (1, 1, 1, N'article1', 1)
INSERT [dbo].[Comment] ([Id], [ArticleId], [UserId], [Description], [Active]) VALUES (2, 2, 2, N'articl2', 1)
INSERT [dbo].[Comment] ([Id], [ArticleId], [UserId], [Description], [Active]) VALUES (3, 3, 3, N'articl3', 1)
INSERT [dbo].[Comment] ([Id], [ArticleId], [UserId], [Description], [Active]) VALUES (4, 4, 4, N'articl4', 1)
INSERT [dbo].[Comment] ([Id], [ArticleId], [UserId], [Description], [Active]) VALUES (5, 1, 1, N'articl2', 1)
INSERT [dbo].[Location] ([ID], [LocationName], [LocationCode]) VALUES (1, N'HCM', N'001')
INSERT [dbo].[Location] ([ID], [LocationName], [LocationCode]) VALUES (2, N'HN', N'002')
INSERT [dbo].[Location] ([ID], [LocationName], [LocationCode]) VALUES (3, N'DN', N'003')
INSERT [dbo].[Location] ([ID], [LocationName], [LocationCode]) VALUES (4, N'Hue', N'004')
INSERT [dbo].[Location] ([ID], [LocationName], [LocationCode]) VALUES (5, N'Can Tho', N'005')
INSERT [dbo].[Major] ([ID], [UniversityId], [MajorName], [MajorCode], [GradeToPass], [Status], [Description], [StudentFee], [Active]) VALUES (1, 1, N'major1', N'001', 8, 1, N'mahor1', N'5', 1)
INSERT [dbo].[Major] ([ID], [UniversityId], [MajorName], [MajorCode], [GradeToPass], [Status], [Description], [StudentFee], [Active]) VALUES (2, 2, N'major2', N'002', 9, 1, N'major2', N'9', 1)
INSERT [dbo].[Major] ([ID], [UniversityId], [MajorName], [MajorCode], [GradeToPass], [Status], [Description], [StudentFee], [Active]) VALUES (3, 3, N'major3', N'003', 7, 1, N'major3', N'8', 1)
INSERT [dbo].[Major] ([ID], [UniversityId], [MajorName], [MajorCode], [GradeToPass], [Status], [Description], [StudentFee], [Active]) VALUES (4, 4, N'major', N'004', 8, 1, N'major4', N'7', 1)
INSERT [dbo].[MBTIQuestion] ([ID], [QuestionContent], [Description], [Active]) VALUES (1, N'mbitQues1', N'mbitQues1', 1)
INSERT [dbo].[MBTIQuestion] ([ID], [QuestionContent], [Description], [Active]) VALUES (2, N'mbitQues2', N'mbitQues2', 1)
INSERT [dbo].[MBTIQuestion] ([ID], [QuestionContent], [Description], [Active]) VALUES (3, N'mbitQues3', N'mbitQues3', 1)
INSERT [dbo].[MBTIQuestion] ([ID], [QuestionContent], [Description], [Active]) VALUES (4, N'mbitQues4', N'mbitQues4', 1)
INSERT [dbo].[MBTIQuestion] ([ID], [QuestionContent], [Description], [Active]) VALUES (5, N'mbitQues5', N'mbitQues5', 1)
INSERT [dbo].[MBTIType] ([Id], [MBTITypeName], [Description], [Active]) VALUES (1, N'MBTI1     ', N'MBTI1', 1)
INSERT [dbo].[MBTIType] ([Id], [MBTITypeName], [Description], [Active]) VALUES (2, N'MBTI2     ', N'MBTI2', 1)
INSERT [dbo].[MBTIType] ([Id], [MBTITypeName], [Description], [Active]) VALUES (3, N'MBTI3     ', N'MBTI3', 1)
INSERT [dbo].[MBTIType] ([Id], [MBTITypeName], [Description], [Active]) VALUES (4, N'MBTI4     ', N'MBTI4', 1)
INSERT [dbo].[Question] ([Id], [QuestionContent], [ImageUrl], [Activate]) VALUES (1, N'QUES1', N'QUES1', 1)
INSERT [dbo].[Question] ([Id], [QuestionContent], [ImageUrl], [Activate]) VALUES (2, N'QUES2', N'QUES2', 1)
INSERT [dbo].[Question] ([Id], [QuestionContent], [ImageUrl], [Activate]) VALUES (3, N'QUES3', N'QUES3', 1)
INSERT [dbo].[Question] ([Id], [QuestionContent], [ImageUrl], [Activate]) VALUES (4, N'QUES4', N'QUES4', 1)
INSERT [dbo].[Question] ([Id], [QuestionContent], [ImageUrl], [Activate]) VALUES (5, N'QUES5', N'QUES5', 1)
INSERT [dbo].[Quiz] ([Id], [Tittle], [QuizType], [Description], [Activate]) VALUES (1, N'QUIZ1', N'1', N'QUIZ1', 1)
INSERT [dbo].[Quiz] ([Id], [Tittle], [QuizType], [Description], [Activate]) VALUES (2, N'QUIZ2', N'1', N'QUIZ2', 1)
INSERT [dbo].[Quiz] ([Id], [Tittle], [QuizType], [Description], [Activate]) VALUES (3, N'QUIZ3', N'1', N'QUIZ3', 1)
INSERT [dbo].[Quiz] ([Id], [Tittle], [QuizType], [Description], [Activate]) VALUES (4, N'QUIZ4', N'1', N'QUIZ4', 1)
INSERT [dbo].[Quiz] ([Id], [Tittle], [QuizType], [Description], [Activate]) VALUES (5, N'QUIZ5', N'1', N'QUIZ5', 1)
INSERT [dbo].[QuizContent] ([Id], [QuizId], [QuestionId], [AnswerId]) VALUES (1, 1, 1, 1)
INSERT [dbo].[QuizContent] ([Id], [QuizId], [QuestionId], [AnswerId]) VALUES (2, 2, 2, 2)
INSERT [dbo].[QuizContent] ([Id], [QuizId], [QuestionId], [AnswerId]) VALUES (3, 1, 1, 2)
INSERT [dbo].[QuizContent] ([Id], [QuizId], [QuestionId], [AnswerId]) VALUES (4, 2, 4, 1)
INSERT [dbo].[QuizContent] ([Id], [QuizId], [QuestionId], [AnswerId]) VALUES (5, 3, 2, 1)
INSERT [dbo].[QuizContent] ([Id], [QuizId], [QuestionId], [AnswerId]) VALUES (6, 1, 2, 4)
INSERT [dbo].[QuizContent] ([Id], [QuizId], [QuestionId], [AnswerId]) VALUES (7, 5, 2, 1)
INSERT [dbo].[QuizResult] ([Id], [QuizId], [CompletedDate], [Score], [StudentId]) VALUES (1, 1, CAST(N'2018-06-06T00:00:00.000' AS DateTime), N'9', 1)
INSERT [dbo].[QuizResult] ([Id], [QuizId], [CompletedDate], [Score], [StudentId]) VALUES (2, 2, CAST(N'2018-06-08T00:00:00.000' AS DateTime), N'10', 2)
INSERT [dbo].[QuizResult] ([Id], [QuizId], [CompletedDate], [Score], [StudentId]) VALUES (3, 1, CAST(N'2018-06-09T00:00:00.000' AS DateTime), N'8', 1)
INSERT [dbo].[QuizResult] ([Id], [QuizId], [CompletedDate], [Score], [StudentId]) VALUES (4, 3, CAST(N'2018-06-10T00:00:00.000' AS DateTime), N'9', 3)
INSERT [dbo].[QuizResult] ([Id], [QuizId], [CompletedDate], [Score], [StudentId]) VALUES (5, 4, CAST(N'2018-06-08T00:00:00.000' AS DateTime), N'7', 4)
INSERT [dbo].[RatingOfReview] ([Id], [NameOfRating], [Point], [ReviewDetailId], [Active]) VALUES (1, N'NAME1', 9, 1, 1)
INSERT [dbo].[RatingOfReview] ([Id], [NameOfRating], [Point], [ReviewDetailId], [Active]) VALUES (2, N'NAME2', 8, 2, 1)
INSERT [dbo].[RatingOfReview] ([Id], [NameOfRating], [Point], [ReviewDetailId], [Active]) VALUES (3, N'NAME3', 9, 3, 1)
INSERT [dbo].[RatingOfReview] ([Id], [NameOfRating], [Point], [ReviewDetailId], [Active]) VALUES (4, N'NAME4', 10, 1, 1)
INSERT [dbo].[RatingOfReview] ([Id], [NameOfRating], [Point], [ReviewDetailId], [Active]) VALUES (5, N'NAME5', 9, 2, 1)
INSERT [dbo].[Review] ([Id], [UserId], [ReviewId], [UniversityId], [Active]) VALUES (1, 1, 1, 1, 1)
INSERT [dbo].[Review] ([Id], [UserId], [ReviewId], [UniversityId], [Active]) VALUES (2, 1, 1, 2, 1)
INSERT [dbo].[Review] ([Id], [UserId], [ReviewId], [UniversityId], [Active]) VALUES (3, 1, 1, 3, 1)
INSERT [dbo].[Review] ([Id], [UserId], [ReviewId], [UniversityId], [Active]) VALUES (4, 1, 1, 4, 1)
INSERT [dbo].[Review] ([Id], [UserId], [ReviewId], [UniversityId], [Active]) VALUES (5, 1, 2, 1, 1)
INSERT [dbo].[Review] ([Id], [UserId], [ReviewId], [UniversityId], [Active]) VALUES (6, 1, 3, 1, 1)
INSERT [dbo].[Review] ([Id], [UserId], [ReviewId], [UniversityId], [Active]) VALUES (7, 1, 4, 1, 1)
INSERT [dbo].[Review] ([Id], [UserId], [ReviewId], [UniversityId], [Active]) VALUES (8, 2, 1, 1, 1)
INSERT [dbo].[Review] ([Id], [UserId], [ReviewId], [UniversityId], [Active]) VALUES (9, 3, 1, 1, 1)
INSERT [dbo].[Review] ([Id], [UserId], [ReviewId], [UniversityId], [Active]) VALUES (10, 4, 1, 1, 1)
INSERT [dbo].[Review] ([Id], [UserId], [ReviewId], [UniversityId], [Active]) VALUES (11, 2, 2, 2, 1)
INSERT [dbo].[Review] ([Id], [UserId], [ReviewId], [UniversityId], [Active]) VALUES (12, 1, 2, 2, 1)
INSERT [dbo].[Review] ([Id], [UserId], [ReviewId], [UniversityId], [Active]) VALUES (13, 2, 1, 2, 1)
INSERT [dbo].[Review] ([Id], [UserId], [ReviewId], [UniversityId], [Active]) VALUES (14, 3, 3, 2, 1)
INSERT [dbo].[Review] ([Id], [UserId], [ReviewId], [UniversityId], [Active]) VALUES (15, 2, 3, 4, 1)
INSERT [dbo].[ReviewDetail] ([Id], [Title], [UserId], [Agreement], [Disagreement], [Agree], [Disagree], [Status], [Active]) VALUES (1, N'RWDetail1', 1, N'A', N'A', 1, 1, 1, 1)
INSERT [dbo].[ReviewDetail] ([Id], [Title], [UserId], [Agreement], [Disagreement], [Agree], [Disagree], [Status], [Active]) VALUES (2, N'RWDetail2', 2, N'A', N'A', 2, 2, 1, 1)
INSERT [dbo].[ReviewDetail] ([Id], [Title], [UserId], [Agreement], [Disagreement], [Agree], [Disagree], [Status], [Active]) VALUES (3, N'RWDetail2', 3, N'B', N'AB', 3, 3, 1, 1)
INSERT [dbo].[ReviewDetail] ([Id], [Title], [UserId], [Agreement], [Disagreement], [Agree], [Disagree], [Status], [Active]) VALUES (4, N'RWDetail4', 4, N'C', N'C', 4, 4, 1, 1)
INSERT [dbo].[Staff] ([Id], [UniversityId], [Active]) VALUES (1, 1, 1)
INSERT [dbo].[Staff] ([Id], [UniversityId], [Active]) VALUES (2, 1, 1)
INSERT [dbo].[Staff] ([Id], [UniversityId], [Active]) VALUES (3, 1, 1)
INSERT [dbo].[Staff] ([Id], [UniversityId], [Active]) VALUES (4, 2, 1)
INSERT [dbo].[Staff] ([Id], [UniversityId], [Active]) VALUES (5, 2, 1)
INSERT [dbo].[Staff] ([Id], [UniversityId], [Active]) VALUES (6, 3, 1)
INSERT [dbo].[Staff] ([Id], [UniversityId], [Active]) VALUES (7, 4, 1)
INSERT [dbo].[Staff] ([Id], [UniversityId], [Active]) VALUES (8, 3, 1)
INSERT [dbo].[Staff] ([Id], [UniversityId], [Active]) VALUES (9, 4, 1)
INSERT [dbo].[Student] ([Id], [FavoritedUniversityId], [MBTITypeId], [Active]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Student] ([Id], [FavoritedUniversityId], [MBTITypeId], [Active]) VALUES (2, 1, 2, 1)
INSERT [dbo].[Student] ([Id], [FavoritedUniversityId], [MBTITypeId], [Active]) VALUES (3, 2, 1, 1)
INSERT [dbo].[Student] ([Id], [FavoritedUniversityId], [MBTITypeId], [Active]) VALUES (4, 1, 3, 1)
INSERT [dbo].[Student] ([Id], [FavoritedUniversityId], [MBTITypeId], [Active]) VALUES (5, 2, 1, 1)
INSERT [dbo].[Student] ([Id], [FavoritedUniversityId], [MBTITypeId], [Active]) VALUES (6, 3, 1, 1)
INSERT [dbo].[Student] ([Id], [FavoritedUniversityId], [MBTITypeId], [Active]) VALUES (7, 1, 3, 1)
INSERT [dbo].[Tag] ([Id], [TagName], [Description], [Active]) VALUES (1, N'tag1', N'tag1', 1)
INSERT [dbo].[Tag] ([Id], [TagName], [Description], [Active]) VALUES (2, N'tag2', N'tag2', 0)
INSERT [dbo].[Tag] ([Id], [TagName], [Description], [Active]) VALUES (3, N'tag3', N'tag3', 1)
INSERT [dbo].[Tag] ([Id], [TagName], [Description], [Active]) VALUES (4, N'tag4', N'tag4', 1)
INSERT [dbo].[Tag] ([Id], [TagName], [Description], [Active]) VALUES (5, N'tag5', N'tag5', 1)
INSERT [dbo].[University] ([ID], [UniversityName], [LocationId], [Email], [Website], [PhoneNumber], [LogoUrl], [Description], [Priority], [Active], [Rating], [CodeOfBlock]) VALUES (1, N'FPT', 1, N'asd@mail', N'fpt.com', N'2164532186', N'AAAA', N'sdkfjsdkj', 1, 1, 5, N'1')
INSERT [dbo].[University] ([ID], [UniversityName], [LocationId], [Email], [Website], [PhoneNumber], [LogoUrl], [Description], [Priority], [Active], [Rating], [CodeOfBlock]) VALUES (2, N'Hoa SEN', 2, N'hoasen@mail', N'hoasen.com', N'2165312', N'BBBBB', N'8586', 1, 1, 4, N'2')
INSERT [dbo].[University] ([ID], [UniversityName], [LocationId], [Email], [Website], [PhoneNumber], [LogoUrl], [Description], [Priority], [Active], [Rating], [CodeOfBlock]) VALUES (3, N'Rmit', 1, N'rmit@mail', N'rmit.com', N'543248', N'CCCCC', N'8431856', 2, 1, 3, N'1')
INSERT [dbo].[University] ([ID], [UniversityName], [LocationId], [Email], [Website], [PhoneNumber], [LogoUrl], [Description], [Priority], [Active], [Rating], [CodeOfBlock]) VALUES (4, N'Poly', 3, N'poly@mail', N'poly.com', N'56412184888999', N'EEEEEE', N'sadasxvxcvxv', 1, 1, 5, N'1')
INSERT [dbo].[User] ([Id], [Username], [Password], [AvatarUrl], [Name], [Phone], [Email], [Description], [CreatedDate], [LastLoginDate]) VALUES (1, N'admin', N'123', N'AAAAA', N'admin', N'2165431', N'admin@mail', N'213121', CAST(N'2018-06-30T00:00:00.000' AS DateTime), CAST(N'2018-08-08T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([Id], [Username], [Password], [AvatarUrl], [Name], [Phone], [Email], [Description], [CreatedDate], [LastLoginDate]) VALUES (2, N'user', N'123', N'AAZZZZ', N'user', N'32312123', N'user@mail', N'231321231', CAST(N'2018-06-05T00:00:00.000' AS DateTime), CAST(N'2018-08-07T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([Id], [Username], [Password], [AvatarUrl], [Name], [Phone], [Email], [Description], [CreatedDate], [LastLoginDate]) VALUES (3, N'quy', N'123', N'QQQQQQ', N'quy', N'654798789', N'quy@mail', N'3216584132181', CAST(N'2018-07-07T00:00:00.000' AS DateTime), CAST(N'2018-09-08T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([Id], [Username], [Password], [AvatarUrl], [Name], [Phone], [Email], [Description], [CreatedDate], [LastLoginDate]) VALUES (4, N'user1', N'123', N'123', N'user1', N'57979654654', N'user1@mail', N'23121318', CAST(N'2018-08-04T00:00:00.000' AS DateTime), CAST(N'2018-04-08T00:00:00.000' AS DateTime))
INSERT [dbo].[UserRole] ([UserId], [Role]) VALUES (1, 1)
INSERT [dbo].[UserRole] ([UserId], [Role]) VALUES (2, 2)
INSERT [dbo].[UserRole] ([UserId], [Role]) VALUES (3, 1)
INSERT [dbo].[UserRole] ([UserId], [Role]) VALUES (4, 2)
INSERT [dbo].[Volunteer] ([Id], [UniversityId], [EarnType], [EarnValue], [Active]) VALUES (1, 1, N'1', 2200000, 1)
INSERT [dbo].[Volunteer] ([Id], [UniversityId], [EarnType], [EarnValue], [Active]) VALUES (2, 2, N'3', 353535, 1)
INSERT [dbo].[Volunteer] ([Id], [UniversityId], [EarnType], [EarnValue], [Active]) VALUES (3, 3, N'2', 32151231561, 1)
INSERT [dbo].[Volunteer] ([Id], [UniversityId], [EarnType], [EarnValue], [Active]) VALUES (4, 4, N'4', 32185341, 1)
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([Id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Staff]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Tag] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tag] ([Id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Tag]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_University] FOREIGN KEY([UniversityId])
REFERENCES [dbo].[University] ([ID])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_University]
GO
ALTER TABLE [dbo].[BlockOfMajor]  WITH CHECK ADD  CONSTRAINT [FK_BlockOfMajor_Block] FOREIGN KEY([BlockId])
REFERENCES [dbo].[Block] ([ID])
GO
ALTER TABLE [dbo].[BlockOfMajor] CHECK CONSTRAINT [FK_BlockOfMajor_Block]
GO
ALTER TABLE [dbo].[BlockOfMajor]  WITH CHECK ADD  CONSTRAINT [FK_BlockOfMajor_Major] FOREIGN KEY([MajorId])
REFERENCES [dbo].[Major] ([ID])
GO
ALTER TABLE [dbo].[BlockOfMajor] CHECK CONSTRAINT [FK_BlockOfMajor_Major]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Article] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Article] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Article]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Major]  WITH CHECK ADD  CONSTRAINT [FK_Major_University] FOREIGN KEY([UniversityId])
REFERENCES [dbo].[University] ([ID])
GO
ALTER TABLE [dbo].[Major] CHECK CONSTRAINT [FK_Major_University]
GO
ALTER TABLE [dbo].[MajorOfMBTI]  WITH CHECK ADD  CONSTRAINT [FK_MajorOfMBTI_Major] FOREIGN KEY([MajorId])
REFERENCES [dbo].[Major] ([ID])
GO
ALTER TABLE [dbo].[MajorOfMBTI] CHECK CONSTRAINT [FK_MajorOfMBTI_Major]
GO
ALTER TABLE [dbo].[MajorOfMBTI]  WITH CHECK ADD  CONSTRAINT [FK_MajorOfMBTI_MBTIType] FOREIGN KEY([MBTITypeId])
REFERENCES [dbo].[MBTIType] ([Id])
GO
ALTER TABLE [dbo].[MajorOfMBTI] CHECK CONSTRAINT [FK_MajorOfMBTI_MBTIType]
GO
ALTER TABLE [dbo].[MBTIResult]  WITH CHECK ADD  CONSTRAINT [FK_MBTIResult_MBTIQuestion] FOREIGN KEY([MBTIQuestionId])
REFERENCES [dbo].[MBTIQuestion] ([ID])
GO
ALTER TABLE [dbo].[MBTIResult] CHECK CONSTRAINT [FK_MBTIResult_MBTIQuestion]
GO
ALTER TABLE [dbo].[MBTIResult]  WITH CHECK ADD  CONSTRAINT [FK_MBTIResult_MBTIType] FOREIGN KEY([MBTITypeId])
REFERENCES [dbo].[MBTIType] ([Id])
GO
ALTER TABLE [dbo].[MBTIResult] CHECK CONSTRAINT [FK_MBTIResult_MBTIType]
GO
ALTER TABLE [dbo].[MBTIResult]  WITH CHECK ADD  CONSTRAINT [FK_MBTIResult_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[MBTIResult] CHECK CONSTRAINT [FK_MBTIResult_User]
GO
ALTER TABLE [dbo].[QuizContent]  WITH CHECK ADD  CONSTRAINT [FK_QuizContent_Answer] FOREIGN KEY([AnswerId])
REFERENCES [dbo].[Answer] ([Id])
GO
ALTER TABLE [dbo].[QuizContent] CHECK CONSTRAINT [FK_QuizContent_Answer]
GO
ALTER TABLE [dbo].[QuizContent]  WITH CHECK ADD  CONSTRAINT [FK_QuizContent_Question] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[QuizContent] CHECK CONSTRAINT [FK_QuizContent_Question]
GO
ALTER TABLE [dbo].[QuizContent]  WITH CHECK ADD  CONSTRAINT [FK_QuizContent_Quiz] FOREIGN KEY([QuizId])
REFERENCES [dbo].[Quiz] ([Id])
GO
ALTER TABLE [dbo].[QuizContent] CHECK CONSTRAINT [FK_QuizContent_Quiz]
GO
ALTER TABLE [dbo].[QuizResult]  WITH CHECK ADD  CONSTRAINT [FK_QuizResult_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[QuizResult] CHECK CONSTRAINT [FK_QuizResult_Student]
GO
ALTER TABLE [dbo].[QuizResult]  WITH CHECK ADD  CONSTRAINT [FK_QuizResult_Student1] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[QuizResult] CHECK CONSTRAINT [FK_QuizResult_Student1]
GO
ALTER TABLE [dbo].[QuizResult]  WITH CHECK ADD  CONSTRAINT [FK_UserQuiz_Quiz] FOREIGN KEY([QuizId])
REFERENCES [dbo].[Quiz] ([Id])
GO
ALTER TABLE [dbo].[QuizResult] CHECK CONSTRAINT [FK_UserQuiz_Quiz]
GO
ALTER TABLE [dbo].[RatingOfReview]  WITH CHECK ADD  CONSTRAINT [FK_RatingOfReview_ReviewDetail] FOREIGN KEY([ReviewDetailId])
REFERENCES [dbo].[ReviewDetail] ([Id])
GO
ALTER TABLE [dbo].[RatingOfReview] CHECK CONSTRAINT [FK_RatingOfReview_ReviewDetail]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_ReviewDetail] FOREIGN KEY([ReviewId])
REFERENCES [dbo].[ReviewDetail] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_ReviewDetail]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_University] FOREIGN KEY([UniversityId])
REFERENCES [dbo].[University] ([ID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_University]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_User]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_University] FOREIGN KEY([UniversityId])
REFERENCES [dbo].[University] ([ID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_University]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_MBTIType] FOREIGN KEY([MBTITypeId])
REFERENCES [dbo].[MBTIType] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_MBTIType]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_University] FOREIGN KEY([FavoritedUniversityId])
REFERENCES [dbo].[University] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_University]
GO
ALTER TABLE [dbo].[University]  WITH CHECK ADD  CONSTRAINT [FK_University_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([ID])
GO
ALTER TABLE [dbo].[University] CHECK CONSTRAINT [FK_University_Location]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User1] FOREIGN KEY([Role])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User1]
GO
ALTER TABLE [dbo].[Volunteer]  WITH CHECK ADD  CONSTRAINT [FK_Volunteer_University] FOREIGN KEY([UniversityId])
REFERENCES [dbo].[University] ([ID])
GO
ALTER TABLE [dbo].[Volunteer] CHECK CONSTRAINT [FK_Volunteer_University]
GO
USE [master]
GO
ALTER DATABASE [University_admission_counseling] SET  READ_WRITE 
GO
