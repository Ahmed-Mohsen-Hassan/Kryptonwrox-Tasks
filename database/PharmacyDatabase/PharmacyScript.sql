USE [master]
GO
/****** Object:  Database [PharmacyDatabase]    Script Date: 13/08/2014 11:30:22 ص ******/
CREATE DATABASE [PharmacyDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PharmacyDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PharmacyDatabase.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PharmacyDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PharmacyDatabase_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PharmacyDatabase] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PharmacyDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PharmacyDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PharmacyDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PharmacyDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PharmacyDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PharmacyDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PharmacyDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [PharmacyDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [PharmacyDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PharmacyDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PharmacyDatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PharmacyDatabase', N'ON'
GO
USE [PharmacyDatabase]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 13/08/2014 11:30:22 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[IsMale] [binary](50) NULL,
	[PhonNumber] [nchar](20) NULL,
	[Address] [nvarchar](250) NULL,
	[IsActive] [binary](50) NOT NULL,
	[IsPatient] [binary](50) NOT NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DrugAndRequest]    Script Date: 13/08/2014 11:30:22 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugAndRequest](
	[DrugID] [bigint] NOT NULL,
	[RequestID] [bigint] NOT NULL,
	[TotalPrice] [decimal](18, 10) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_DrugAndRequest] PRIMARY KEY CLUSTERED 
(
	[DrugID] ASC,
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DrugAndStrores]    Script Date: 13/08/2014 11:30:22 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugAndStrores](
	[DrugID] [bigint] NOT NULL,
	[StroreID] [bigint] NOT NULL,
	[Notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_DrugAndStrores] PRIMARY KEY CLUSTERED 
(
	[DrugID] ASC,
	[StroreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Drugs]    Script Date: 13/08/2014 11:30:22 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Drugs](
	[DrugID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Price] [decimal](18, 10) NOT NULL,
	[IsActive] [binary](50) NOT NULL,
	[Note] [nvarchar](500) NULL,
	[ResourceID] [bigint] NOT NULL,
 CONSTRAINT [PK_Drugs] PRIMARY KEY CLUSTERED 
(
	[DrugID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DrugsAndPharmacies]    Script Date: 13/08/2014 11:30:22 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugsAndPharmacies](
	[DrugID] [bigint] NOT NULL,
	[PharmacyID] [bigint] NOT NULL,
 CONSTRAINT [PK_DrugsAndPharmacies] PRIMARY KEY CLUSTERED 
(
	[DrugID] ASC,
	[PharmacyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pharmacies]    Script Date: 13/08/2014 11:30:22 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pharmacies](
	[PharmacyID] [bigint] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
	[PhoneNumber] [nchar](20) NULL,
	[IsActive] [binary](50) NOT NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_Pharmacies] PRIMARY KEY CLUSTERED 
(
	[PharmacyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 13/08/2014 11:30:22 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[RequestID] [bigint] NOT NULL,
	[Note] [nvarchar](500) NULL,
	[ClientID] [bigint] NOT NULL,
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resources]    Script Date: 13/08/2014 11:30:22 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Resources](
	[ResourceID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[PhoneNumber] [nchar](20) NULL,
	[Address] [varchar](250) NULL,
	[IsActive] [binary](50) NOT NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_Resources] PRIMARY KEY CLUSTERED 
(
	[ResourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 13/08/2014 11:30:22 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[StoreID] [bigint] NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Clients] ADD  CONSTRAINT [DF_Clients_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Clients] ADD  CONSTRAINT [DF_Clients_IsPatient]  DEFAULT ((1)) FOR [IsPatient]
GO
ALTER TABLE [dbo].[Drugs] ADD  CONSTRAINT [DF_Drugs_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Pharmacies] ADD  CONSTRAINT [DF_Pharmacies_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Resources] ADD  CONSTRAINT [DF_Resources_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DrugAndRequest]  WITH CHECK ADD  CONSTRAINT [FK_DrugAndRequest_Drugs] FOREIGN KEY([DrugID])
REFERENCES [dbo].[Drugs] ([DrugID])
GO
ALTER TABLE [dbo].[DrugAndRequest] CHECK CONSTRAINT [FK_DrugAndRequest_Drugs]
GO
ALTER TABLE [dbo].[DrugAndRequest]  WITH CHECK ADD  CONSTRAINT [FK_DrugAndRequest_Requests] FOREIGN KEY([RequestID])
REFERENCES [dbo].[Requests] ([RequestID])
GO
ALTER TABLE [dbo].[DrugAndRequest] CHECK CONSTRAINT [FK_DrugAndRequest_Requests]
GO
ALTER TABLE [dbo].[DrugAndStrores]  WITH CHECK ADD  CONSTRAINT [FK_DrugAndStrores_Drugs] FOREIGN KEY([DrugID])
REFERENCES [dbo].[Drugs] ([DrugID])
GO
ALTER TABLE [dbo].[DrugAndStrores] CHECK CONSTRAINT [FK_DrugAndStrores_Drugs]
GO
ALTER TABLE [dbo].[DrugAndStrores]  WITH CHECK ADD  CONSTRAINT [FK_DrugAndStrores_Stores] FOREIGN KEY([StroreID])
REFERENCES [dbo].[Stores] ([StoreID])
GO
ALTER TABLE [dbo].[DrugAndStrores] CHECK CONSTRAINT [FK_DrugAndStrores_Stores]
GO
ALTER TABLE [dbo].[Drugs]  WITH CHECK ADD  CONSTRAINT [FK_Drugs_Resources] FOREIGN KEY([ResourceID])
REFERENCES [dbo].[Resources] ([ResourceID])
GO
ALTER TABLE [dbo].[Drugs] CHECK CONSTRAINT [FK_Drugs_Resources]
GO
ALTER TABLE [dbo].[DrugsAndPharmacies]  WITH CHECK ADD  CONSTRAINT [FK_DrugsAndPharmacies_Drugs] FOREIGN KEY([DrugID])
REFERENCES [dbo].[Drugs] ([DrugID])
GO
ALTER TABLE [dbo].[DrugsAndPharmacies] CHECK CONSTRAINT [FK_DrugsAndPharmacies_Drugs]
GO
ALTER TABLE [dbo].[DrugsAndPharmacies]  WITH CHECK ADD  CONSTRAINT [FK_DrugsAndPharmacies_Pharmacies1] FOREIGN KEY([PharmacyID])
REFERENCES [dbo].[Pharmacies] ([PharmacyID])
GO
ALTER TABLE [dbo].[DrugsAndPharmacies] CHECK CONSTRAINT [FK_DrugsAndPharmacies_Pharmacies1]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Clients] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Clients]
GO
USE [master]
GO
ALTER DATABASE [PharmacyDatabase] SET  READ_WRITE 
GO
