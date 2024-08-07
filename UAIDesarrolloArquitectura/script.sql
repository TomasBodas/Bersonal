USE [master]
GO
/****** Object:  Database [Bersonal]    Script Date: 22/07/2024 15:19:07 ******/
CREATE DATABASE [Bersonal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bersonal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Bersonal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bersonal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Bersonal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Bersonal] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bersonal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bersonal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bersonal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bersonal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bersonal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bersonal] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bersonal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bersonal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bersonal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bersonal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bersonal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bersonal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bersonal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bersonal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bersonal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bersonal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bersonal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bersonal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bersonal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bersonal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bersonal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bersonal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bersonal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bersonal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bersonal] SET  MULTI_USER 
GO
ALTER DATABASE [Bersonal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bersonal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bersonal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bersonal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bersonal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bersonal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bersonal', N'ON'
GO
ALTER DATABASE [Bersonal] SET QUERY_STORE = OFF
GO
USE [Bersonal]
GO
/****** Object:  Table [dbo].[bitacora]    Script Date: 22/07/2024 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[FK_usuario_bitacora] [int] NULL,
	[modulo] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[dvh] [nvarchar](50) NULL,
 CONSTRAINT [PK_bitacora] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dvv]    Script Date: 22/07/2024 15:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dvv](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dvv] [varchar](100) NULL,
	[nombreTabla] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 22/07/2024 15:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[DNI] [int] NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[contrasena] [nvarchar](150) NOT NULL,
	[dvh] [nvarchar](100) NULL,
	[isAdmin] [bit] NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bitacora] ON 

INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (59, CAST(N'2024-07-21T17:27:52.000' AS DateTime), 12, N'Registro', N'Se creó una cuenta', N'150316756')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (61, CAST(N'2024-07-21T17:28:22.000' AS DateTime), 12, N'Cierre de sesión', N'Se cerró sesión', N'1268765571')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (62, CAST(N'2024-07-21T17:28:41.000' AS DateTime), 13, N'Registro', N'Se creó una cuenta', N'481024694')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (63, CAST(N'2024-07-21T17:28:48.000' AS DateTime), 13, N'fghfghfg', N'Se inició sesión', N'853088750')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (64, CAST(N'2024-07-21T18:04:17.000' AS DateTime), 13, N'Inicio de sesión', N'Se inició sesión', N'-941236487')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (65, CAST(N'2024-07-21T18:05:38.000' AS DateTime), 13, N'Inicio de sesión', N'Se inició sesión', N'-1242576742')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (67, CAST(N'2024-07-21T20:24:40.000' AS DateTime), 13, N'Inicio de sesión', N'Se inició sesión', N'-227102276')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (68, CAST(N'2024-07-21T20:58:07.000' AS DateTime), 14, N'Registro', N'Se creó una cuenta', N'1674932290')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (69, CAST(N'2024-07-21T20:58:12.000' AS DateTime), 14, N'Inicio de sesión', N'Se inició sesión', N'-1663023075')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (70, CAST(N'2024-07-21T20:59:07.000' AS DateTime), 14, N'Inicio de sesión', N'Se inició sesión', N'1137614696')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (71, CAST(N'2024-07-21T21:03:06.000' AS DateTime), 14, N'Inicio de sesión', N'Se inició sesión', N'-1943813306')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (72, CAST(N'2024-07-21T21:06:12.000' AS DateTime), 14, N'Inicio de sesión', N'Se inició sesión', N'624258053')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (73, CAST(N'2024-07-21T21:08:39.000' AS DateTime), 14, N'Inicio de sesión', N'Se inició sesión', N'646356061')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (74, CAST(N'2024-07-21T21:38:20.000' AS DateTime), 14, N'Inicio de sesión', N'Se inició sesión', N'-1512696830')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (75, CAST(N'2024-07-21T21:42:17.000' AS DateTime), 14, N'Inicio de sesión', N'Se inició sesión', N'127570292')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (76, CAST(N'2024-07-21T21:43:00.000' AS DateTime), 14, N'Inicio de sesión', N'Se inició sesión', N'-218563565')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (77, CAST(N'2024-07-22T12:51:01.000' AS DateTime), 15, N'Registro', N'Se creó una cuenta', N'749583289')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (78, CAST(N'2024-07-22T12:54:08.000' AS DateTime), 12, N'Inicio de sesión', N'Se inició sesión', N'1421657579')
SET IDENTITY_INSERT [dbo].[bitacora] OFF
GO
SET IDENTITY_INSERT [dbo].[dvv] ON 

INSERT [dbo].[dvv] ([id], [dvv], [nombreTabla]) VALUES (5, N'1652703299', N'bitacora')
INSERT [dbo].[dvv] ([id], [dvv], [nombreTabla]) VALUES (6, N'-788105141', N'usuario')
SET IDENTITY_INSERT [dbo].[dvv] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([id], [nombre], [apellido], [DNI], [email], [contrasena], [dvh], [isAdmin]) VALUES (12, N'user', N'user', 12345678, N'1hJfgNqgbaZPFTkQ/lmx+w==', N'04f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb', N'-432348114', 0)
INSERT [dbo].[usuario] ([id], [nombre], [apellido], [DNI], [email], [contrasena], [dvh], [isAdmin]) VALUES (13, N'admin', N'admin', 87654321, N'+t7clkZ2Umu/ThS4rgC3Vw==', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'462840262', 0)
INSERT [dbo].[usuario] ([id], [nombre], [apellido], [DNI], [email], [contrasena], [dvh], [isAdmin]) VALUES (14, N'webmaster', N'webmaster', 32165498, N'hx3soRzQ0O8DjT+JaTPWE1fCPqO+U67BnhjZDwDytNc=', N'8294547e9fe9367f291a22598513d897928d1a0eeb713ca2b41f31977192c5d1', N'-738861912', 1)
INSERT [dbo].[usuario] ([id], [nombre], [apellido], [DNI], [email], [contrasena], [dvh], [isAdmin]) VALUES (15, N'otro', N'otrousuario', 45632198, N'bQyfce3FkWdwS+Ymj91Nkg==', N'c63a855fcfec62cc64a47280a4f51d052b67930873906af30aa92de2ce160c06', N'-1377283840', 0)
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
ALTER TABLE [dbo].[bitacora]  WITH CHECK ADD  CONSTRAINT [FK_bitacora_usuario] FOREIGN KEY([FK_usuario_bitacora])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[bitacora] CHECK CONSTRAINT [FK_bitacora_usuario]
GO
USE [master]
GO
ALTER DATABASE [Bersonal] SET  READ_WRITE 
GO
