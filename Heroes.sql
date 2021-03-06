USE [master]
GO
/****** Object:  Database [Heroes]    Script Date: 22/03/2021 23:22:32 ******/
CREATE DATABASE [Heroes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Heroes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Heroes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Heroes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Heroes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Heroes] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Heroes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Heroes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Heroes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Heroes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Heroes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Heroes] SET ARITHABORT OFF 
GO
ALTER DATABASE [Heroes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Heroes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Heroes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Heroes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Heroes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Heroes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Heroes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Heroes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Heroes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Heroes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Heroes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Heroes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Heroes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Heroes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Heroes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Heroes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Heroes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Heroes] SET RECOVERY FULL 
GO
ALTER DATABASE [Heroes] SET  MULTI_USER 
GO
ALTER DATABASE [Heroes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Heroes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Heroes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Heroes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Heroes] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Heroes', N'ON'
GO
ALTER DATABASE [Heroes] SET QUERY_STORE = OFF
GO
USE [Heroes]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 22/03/2021 23:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ColorID] [int] IDENTITY(1,1) NOT NULL,
	[ColorDescription] [nvarchar](30) NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Heroes]    Script Date: 22/03/2021 23:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Heroes](
	[HeroID] [uniqueidentifier] NOT NULL,
	[TrainerID] [int] NULL,
	[HeroFirstName] [nvarchar](20) NOT NULL,
	[HeroLastName] [nvarchar](20) NOT NULL,
	[HeroAbility] [nvarchar](10) NOT NULL,
	[HeroStartTrainingDate] [date] NOT NULL,
	[HeroSuitColorsID] [int] NOT NULL,
	[HeroStartingPower] [decimal](18, 0) NOT NULL,
	[HeroCurrentPower] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK__Heroes__333632434C381A65] PRIMARY KEY CLUSTERED 
(
	[HeroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainers]    Script Date: 22/03/2021 23:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainers](
	[TrainerID] [int] IDENTITY(1,1) NOT NULL,
	[TrainerUsername] [nvarchar](10) NOT NULL,
	[TrainerPassword] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Trainers] PRIMARY KEY CLUSTERED 
(
	[TrainerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([ColorID], [ColorDescription]) VALUES (1, N'Red')
INSERT [dbo].[Colors] ([ColorID], [ColorDescription]) VALUES (2, N'Red and Black')
INSERT [dbo].[Colors] ([ColorID], [ColorDescription]) VALUES (3, N'Yellow')
INSERT [dbo].[Colors] ([ColorID], [ColorDescription]) VALUES (4, N'Green & Blue')
INSERT [dbo].[Colors] ([ColorID], [ColorDescription]) VALUES (5, N'White')
INSERT [dbo].[Colors] ([ColorID], [ColorDescription]) VALUES (6, N'Red and Blue')
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
INSERT [dbo].[Heroes] ([HeroID], [TrainerID], [HeroFirstName], [HeroLastName], [HeroAbility], [HeroStartTrainingDate], [HeroSuitColorsID], [HeroStartingPower], [HeroCurrentPower]) VALUES (N'effc4ade-112d-4532-8e06-628da46c8696', 29, N'Jim', N'Viles', N'Atacker', CAST(N'2019-02-01' AS Date), 6, CAST(12 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[Heroes] ([HeroID], [TrainerID], [HeroFirstName], [HeroLastName], [HeroAbility], [HeroStartTrainingDate], [HeroSuitColorsID], [HeroStartingPower], [HeroCurrentPower]) VALUES (N'adf54c68-56ab-4e3e-9d33-847c9c75d715', NULL, N'Jack', N'Kimberly', N'Defender', CAST(N'2019-01-01' AS Date), 1, CAST(9 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[Heroes] ([HeroID], [TrainerID], [HeroFirstName], [HeroLastName], [HeroAbility], [HeroStartTrainingDate], [HeroSuitColorsID], [HeroStartingPower], [HeroCurrentPower]) VALUES (N'd49f8c27-8b1d-491d-9585-bc04da835224', NULL, N'Jacob', N'Wilmington', N'Atacker', CAST(N'2021-01-01' AS Date), 2, CAST(6 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[Heroes] ([HeroID], [TrainerID], [HeroFirstName], [HeroLastName], [HeroAbility], [HeroStartTrainingDate], [HeroSuitColorsID], [HeroStartingPower], [HeroCurrentPower]) VALUES (N'04512bd3-20bd-450f-bb9c-f3539e2b68fc', 29, N'Mat', N'Smith', N'Defender', CAST(N'2019-03-02' AS Date), 3, CAST(3 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Trainers] ON 

INSERT [dbo].[Trainers] ([TrainerID], [TrainerUsername], [TrainerPassword]) VALUES (29, N'rherman', N'71C3DEC8045C2611E4960F6776A7C7C567826EAB')
SET IDENTITY_INSERT [dbo].[Trainers] OFF
GO
ALTER TABLE [dbo].[Heroes] ADD  CONSTRAINT [DF__Heroes__HeroID__398D8EEE]  DEFAULT (newid()) FOR [HeroID]
GO
ALTER TABLE [dbo].[Heroes]  WITH CHECK ADD  CONSTRAINT [FK_Heroes_Colors] FOREIGN KEY([HeroSuitColorsID])
REFERENCES [dbo].[Colors] ([ColorID])
GO
ALTER TABLE [dbo].[Heroes] CHECK CONSTRAINT [FK_Heroes_Colors]
GO
ALTER TABLE [dbo].[Heroes]  WITH CHECK ADD  CONSTRAINT [FK_Heroes_Trainers] FOREIGN KEY([TrainerID])
REFERENCES [dbo].[Trainers] ([TrainerID])
GO
ALTER TABLE [dbo].[Heroes] CHECK CONSTRAINT [FK_Heroes_Trainers]
GO
USE [master]
GO
ALTER DATABASE [Heroes] SET  READ_WRITE 
GO
