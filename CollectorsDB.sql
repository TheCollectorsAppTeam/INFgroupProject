USE [master]
GO
/****** Object:  Database [Collectors]    Script Date: 9/19/2019 7:47:43 AM ******/
CREATE DATABASE [Collectors]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Collectors', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Collectors.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Collectors_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Collectors_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Collectors] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Collectors].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Collectors] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Collectors] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Collectors] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Collectors] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Collectors] SET ARITHABORT OFF 
GO
ALTER DATABASE [Collectors] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Collectors] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Collectors] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Collectors] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Collectors] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Collectors] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Collectors] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Collectors] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Collectors] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Collectors] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Collectors] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Collectors] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Collectors] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Collectors] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Collectors] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Collectors] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Collectors] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Collectors] SET RECOVERY FULL 
GO
ALTER DATABASE [Collectors] SET  MULTI_USER 
GO
ALTER DATABASE [Collectors] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Collectors] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Collectors] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Collectors] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Collectors] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Collectors', N'ON'
GO
ALTER DATABASE [Collectors] SET QUERY_STORE = OFF
GO
USE [Collectors]
GO
/****** Object:  Table [dbo].[Collector]    Script Date: 9/19/2019 7:47:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collector](
	[Collector_ID] [int] IDENTITY(1,1) NOT NULL,
	[Collector_Name] [nchar](50) NOT NULL,
	[Collector_Surname] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Collector] PRIMARY KEY CLUSTERED 
(
	[Collector_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DLMaterial]    Script Date: 9/19/2019 7:47:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DLMaterial](
	[DLMaterial_ID] [int] IDENTITY(1,1) NOT NULL,
	[DLMaterial_Description] [nchar](100) NOT NULL,
	[Condition] [nchar](50) NOT NULL,
	[DL_ID] [int] NOT NULL,
	[Material_ID] [int] NULL,
 CONSTRAINT [PK_DLMaterial] PRIMARY KEY CLUSTERED 
(
	[DLMaterial_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donation]    Script Date: 9/19/2019 7:47:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donation](
	[Donation_ID] [int] IDENTITY(1,1) NOT NULL,
	[Donation_Date] [datetime] NOT NULL,
	[Donor_ID] [int] NOT NULL,
 CONSTRAINT [PK_Donation] PRIMARY KEY CLUSTERED 
(
	[Donation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donation_Line]    Script Date: 9/19/2019 7:47:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donation_Line](
	[DL_ID] [int] IDENTITY(1,1) NOT NULL,
	[DL_Description] [nchar](50) NOT NULL,
	[Donation_ID] [int] NOT NULL,
	[Payment_ID] [int] NULL,
 CONSTRAINT [PK_Donation_Line] PRIMARY KEY CLUSTERED 
(
	[DL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donor]    Script Date: 9/19/2019 7:47:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donor](
	[Donor_ID] [int] IDENTITY(1,1) NOT NULL,
	[Donor_Name] [nchar](50) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Gender_ID] [int] NOT NULL,
 CONSTRAINT [PK_Donor] PRIMARY KEY CLUSTERED 
(
	[Donor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/19/2019 7:47:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_ID] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Name] [nchar](50) NOT NULL,
	[Employee_Surname] [nchar](50) NOT NULL,
	[Employee_IDNumber] [nchar](13) NOT NULL,
	[Employee_Email] [nchar](50) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Gender_ID] [int] NOT NULL,
	[EmployeeType_ID] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeType]    Script Date: 9/19/2019 7:47:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeType](
	[EmployeeType_ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeType_Description] [nchar](50) NOT NULL,
 CONSTRAINT [PK_EmployeeType] PRIMARY KEY CLUSTERED 
(
	[EmployeeType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 9/19/2019 7:47:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Gender_ID] [int] IDENTITY(1,1) NOT NULL,
	[Gender_Description] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Gender_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 9/19/2019 7:47:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[Material_ID] [int] IDENTITY(1,1) NOT NULL,
	[Material_Description] [nchar](100) NOT NULL,
	[PricePerKilo] [float] NOT NULL,
	[MaterialType_ID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[Material_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material_type]    Script Date: 9/19/2019 7:47:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material_type](
	[MaterialType_ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialType_Description] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Material_type] PRIMARY KEY CLUSTERED 
(
	[MaterialType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 9/19/2019 7:47:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Payment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Amount_Paid] [float] NOT NULL,
	[Details] [nchar](50) NOT NULL,
	[Date_Paid] [datetime] NOT NULL,
	[PaymentType_ID] [int] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Payment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_Type]    Script Date: 9/19/2019 7:47:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Type](
	[PaymentType_ID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentType_Description] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Payment_Type] PRIMARY KEY CLUSTERED 
(
	[PaymentType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/19/2019 7:47:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nchar](50) NOT NULL,
	[Password] [nchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Walk_In]    Script Date: 9/19/2019 7:47:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Walk_In](
	[WalkIn_ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Material_Brought] [nchar](100) NOT NULL,
	[Remuneration] [float] NOT NULL,
	[Collector_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
 CONSTRAINT [PK_Walk_In] PRIMARY KEY CLUSTERED 
(
	[WalkIn_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WalkIn_Material]    Script Date: 9/19/2019 7:47:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WalkIn_Material](
	[Material_ID] [int] NOT NULL,
	[Collector_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[WalkIn_ID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DLMaterial]  WITH CHECK ADD  CONSTRAINT [FK_DLMaterial_Donation_Line] FOREIGN KEY([DL_ID])
REFERENCES [dbo].[Donation_Line] ([DL_ID])
GO
ALTER TABLE [dbo].[DLMaterial] CHECK CONSTRAINT [FK_DLMaterial_Donation_Line]
GO
ALTER TABLE [dbo].[DLMaterial]  WITH CHECK ADD  CONSTRAINT [FK_DLMaterial_Material] FOREIGN KEY([Material_ID])
REFERENCES [dbo].[Material] ([Material_ID])
GO
ALTER TABLE [dbo].[DLMaterial] CHECK CONSTRAINT [FK_DLMaterial_Material]
GO
ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [FK_Donation_Donor] FOREIGN KEY([Donor_ID])
REFERENCES [dbo].[Donor] ([Donor_ID])
GO
ALTER TABLE [dbo].[Donation] CHECK CONSTRAINT [FK_Donation_Donor]
GO
ALTER TABLE [dbo].[Donation_Line]  WITH CHECK ADD  CONSTRAINT [FK_Donation_Line_Donation] FOREIGN KEY([Donation_ID])
REFERENCES [dbo].[Donation] ([Donation_ID])
GO
ALTER TABLE [dbo].[Donation_Line] CHECK CONSTRAINT [FK_Donation_Line_Donation]
GO
ALTER TABLE [dbo].[Donation_Line]  WITH CHECK ADD  CONSTRAINT [FK_Donation_Line_Payment] FOREIGN KEY([Payment_ID])
REFERENCES [dbo].[Payment] ([Payment_ID])
GO
ALTER TABLE [dbo].[Donation_Line] CHECK CONSTRAINT [FK_Donation_Line_Payment]
GO
ALTER TABLE [dbo].[Donor]  WITH CHECK ADD  CONSTRAINT [FK_Donor_Gender] FOREIGN KEY([Gender_ID])
REFERENCES [dbo].[Gender] ([Gender_ID])
GO
ALTER TABLE [dbo].[Donor] CHECK CONSTRAINT [FK_Donor_Gender]
GO
ALTER TABLE [dbo].[Donor]  WITH CHECK ADD  CONSTRAINT [FK_Donor_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Donor] CHECK CONSTRAINT [FK_Donor_User]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_EmployeeType] FOREIGN KEY([EmployeeType_ID])
REFERENCES [dbo].[EmployeeType] ([EmployeeType_ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_EmployeeType]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Gender] FOREIGN KEY([Gender_ID])
REFERENCES [dbo].[Gender] ([Gender_ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Gender]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Material_type] FOREIGN KEY([MaterialType_ID])
REFERENCES [dbo].[Material_type] ([MaterialType_ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Material_type]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Payment_Type] FOREIGN KEY([PaymentType_ID])
REFERENCES [dbo].[Payment_Type] ([PaymentType_ID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Payment_Type]
GO
ALTER TABLE [dbo].[Walk_In]  WITH CHECK ADD  CONSTRAINT [FK_Walk_In_Collector] FOREIGN KEY([Collector_ID])
REFERENCES [dbo].[Collector] ([Collector_ID])
GO
ALTER TABLE [dbo].[Walk_In] CHECK CONSTRAINT [FK_Walk_In_Collector]
GO
ALTER TABLE [dbo].[Walk_In]  WITH CHECK ADD  CONSTRAINT [FK_Walk_In_Employee] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Employee] ([Employee_ID])
GO
ALTER TABLE [dbo].[Walk_In] CHECK CONSTRAINT [FK_Walk_In_Employee]
GO
ALTER TABLE [dbo].[WalkIn_Material]  WITH CHECK ADD  CONSTRAINT [FK_WalkIn_Material_Collector] FOREIGN KEY([Collector_ID])
REFERENCES [dbo].[Collector] ([Collector_ID])
GO
ALTER TABLE [dbo].[WalkIn_Material] CHECK CONSTRAINT [FK_WalkIn_Material_Collector]
GO
ALTER TABLE [dbo].[WalkIn_Material]  WITH CHECK ADD  CONSTRAINT [FK_WalkIn_Material_Employee] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Employee] ([Employee_ID])
GO
ALTER TABLE [dbo].[WalkIn_Material] CHECK CONSTRAINT [FK_WalkIn_Material_Employee]
GO
ALTER TABLE [dbo].[WalkIn_Material]  WITH CHECK ADD  CONSTRAINT [FK_WalkIn_Material_Material] FOREIGN KEY([Material_ID])
REFERENCES [dbo].[Material] ([Material_ID])
GO
ALTER TABLE [dbo].[WalkIn_Material] CHECK CONSTRAINT [FK_WalkIn_Material_Material]
GO
ALTER TABLE [dbo].[WalkIn_Material]  WITH CHECK ADD  CONSTRAINT [FK_WalkIn_Material_Walk_In] FOREIGN KEY([WalkIn_ID])
REFERENCES [dbo].[Walk_In] ([WalkIn_ID])
GO
ALTER TABLE [dbo].[WalkIn_Material] CHECK CONSTRAINT [FK_WalkIn_Material_Walk_In]
GO
USE [master]
GO
ALTER DATABASE [Collectors] SET  READ_WRITE 
GO
