USE [master]
GO
/****** Object:  Database [MortgageCalculator]    Script Date: 23.10.23 21:33:51 ******/
CREATE DATABASE [MortgageCalculator]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MortgageCalculator', FILENAME = N'D:\дждлтиш\MSSQL15.SQLEXPRESS\MSSQL\DATA\MortgageCalculator.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MortgageCalculator_log', FILENAME = N'D:\дждлтиш\MSSQL15.SQLEXPRESS\MSSQL\DATA\MortgageCalculator_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MortgageCalculator] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MortgageCalculator].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MortgageCalculator] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MortgageCalculator] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MortgageCalculator] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MortgageCalculator] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MortgageCalculator] SET ARITHABORT OFF 
GO
ALTER DATABASE [MortgageCalculator] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MortgageCalculator] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MortgageCalculator] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MortgageCalculator] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MortgageCalculator] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MortgageCalculator] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MortgageCalculator] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MortgageCalculator] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MortgageCalculator] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MortgageCalculator] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MortgageCalculator] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MortgageCalculator] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MortgageCalculator] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MortgageCalculator] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MortgageCalculator] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MortgageCalculator] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MortgageCalculator] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MortgageCalculator] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MortgageCalculator] SET  MULTI_USER 
GO
ALTER DATABASE [MortgageCalculator] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MortgageCalculator] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MortgageCalculator] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MortgageCalculator] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MortgageCalculator] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MortgageCalculator] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MortgageCalculator] SET QUERY_STORE = OFF
GO
USE [MortgageCalculator]
GO
/****** Object:  Table [dbo].[CreditPrograms]    Script Date: 23.10.23 21:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditPrograms](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[LoanTerm] [int] NULL,
	[InterestRate] [decimal](5, 2) NULL,
	[DownPayment] [decimal](18, 2) NULL,
	[MonthlyPayment] [decimal](18, 2) NULL,
	[LifeInsurance] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credits]    Script Date: 23.10.23 21:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credits](
	[BankName] [nvarchar](100) NULL,
	[StartDate] [datetime] NULL,
	[BorrowerName] [nvarchar](100) NULL,
	[CreditProgramId] [int] NULL,
	[PropertyId] [int] NULL,
	[AdditionalConditions] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Properties]    Script Date: 23.10.23 21:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Properties](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[PropertyType] [nvarchar](100) NULL,
	[Category] [nvarchar](100) NULL,
	[Price] [decimal](18, 2) NULL,
	[Address] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regist]    Script Date: 23.10.23 21:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regist](
	[id_user] [int] NOT NULL,
	[login_user] [varchar](50) NULL,
	[password_user] [varchar](50) NULL,
	[is_admin] [bit] NULL,
 CONSTRAINT [PK_regist] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Credits]  WITH CHECK ADD FOREIGN KEY([CreditProgramId])
REFERENCES [dbo].[CreditPrograms] ([Id])
GO
ALTER TABLE [dbo].[Credits]  WITH CHECK ADD FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Properties] ([Id])
GO
USE [master]
GO
ALTER DATABASE [MortgageCalculator] SET  READ_WRITE 
GO
