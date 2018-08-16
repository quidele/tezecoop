USE [master]
GO

/****** Object:  Database [FacturaElectronica_Prueba]    Script Date: 13/08/2018 14:22:02 ******/
CREATE DATABASE [FacturaElectronica_Prueba]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FacturaElectronica_Prueba', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FacturaElectronica_Prueba.mdf' , SIZE = 19456KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FacturaElectronica_Prueba_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FacturaElectronica_Prueba_log.ldf' , SIZE = 13632KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FacturaElectronica_Prueba].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET ARITHABORT OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET  DISABLE_BROKER 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET  MULTI_USER 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET DB_CHAINING OFF 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [FacturaElectronica_Prueba] SET  READ_WRITE 
GO


