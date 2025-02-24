USE [master]
GO
/****** Object:  Database [Esercizio1]    Script Date: 24/02/2025 15:03:38 ******/
CREATE DATABASE [Esercizio1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Esercizio1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Esercizio1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Esercizio1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Esercizio1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Esercizio1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Esercizio1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Esercizio1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Esercizio1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Esercizio1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Esercizio1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Esercizio1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Esercizio1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Esercizio1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Esercizio1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Esercizio1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Esercizio1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Esercizio1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Esercizio1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Esercizio1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Esercizio1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Esercizio1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Esercizio1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Esercizio1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Esercizio1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Esercizio1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Esercizio1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Esercizio1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Esercizio1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Esercizio1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Esercizio1] SET  MULTI_USER 
GO
ALTER DATABASE [Esercizio1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Esercizio1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Esercizio1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Esercizio1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Esercizio1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Esercizio1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Esercizio1] SET QUERY_STORE = ON
GO
ALTER DATABASE [Esercizio1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Esercizio1]
GO
/****** Object:  Table [dbo].[Cantiere]    Script Date: 24/02/2025 15:03:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cantiere](
	[IdCantiere] [uniqueidentifier] NOT NULL,
	[DenominazioneCantiere] [varchar](50) NOT NULL,
	[Indirizzo] [varchar](50) NOT NULL,
	[Citta] [varchar](20) NOT NULL,
	[CAP] [char](5) NOT NULL,
	[PersonaRiferimento] [varbinary](50) NOT NULL,
	[DataInizioLavori] [datetime] NOT NULL,
	[DataFineLavori] [datetime] NULL,
	[LavoriTerminati] [bit] NOT NULL,
 CONSTRAINT [PK_Cantiere] PRIMARY KEY CLUSTERED 
(
	[IdCantiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 24/02/2025 15:03:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [uniqueidentifier] NOT NULL,
	[Nome] [varchar](20) NOT NULL,
	[Cognome] [varchar](20) NOT NULL,
	[DataNascita] [datetime] NOT NULL,
	[Sesso] [varchar](10) NOT NULL,
	[CF] [char](16) NOT NULL,
	[P_IVA] [int] NOT NULL,
	[Attivo] [bit] NOT NULL,
	[Saldo] [money] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operaio]    Script Date: 24/02/2025 15:03:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operaio](
	[IdDipendente] [uniqueidentifier] NOT NULL,
	[Nome] [varchar](20) NOT NULL,
	[Cognome] [varchar](20) NOT NULL,
	[CF] [char](16) NOT NULL,
	[FigliACarico] [int] NULL,
	[Sposato] [bit] NOT NULL,
	[LivelloLavorativo] [varchar](30) NOT NULL,
	[DescrizioneMansione] [varchar](100) NOT NULL,
	[Salario] [money] NOT NULL,
 CONSTRAINT [PK_Operaio] PRIMARY KEY CLUSTERED 
(
	[IdDipendente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Esercizio1] SET  READ_WRITE 
GO
