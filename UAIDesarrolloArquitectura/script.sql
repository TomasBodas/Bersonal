USE [master]
GO
/****** Object:  Database [Bersonal]    Script Date: 07/11/2024 17:17:14 ******/
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
/****** Object:  Table [dbo].[bitacora]    Script Date: 07/11/2024 17:17:14 ******/
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
/****** Object:  Table [dbo].[dvv]    Script Date: 07/11/2024 17:17:14 ******/
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
/****** Object:  Table [dbo].[idioma]    Script Date: 07/11/2024 17:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idioma](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_idioma] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[perfil]    Script Date: 07/11/2024 17:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfil](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_perfil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[perfil_permiso]    Script Date: 07/11/2024 17:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfil_permiso](
	[Id_Perfil] [int] NOT NULL,
	[Id_Permiso] [int] NOT NULL,
 CONSTRAINT [PK_perfil_permiso] PRIMARY KEY CLUSTERED 
(
	[Id_Perfil] ASC,
	[Id_Permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permiso]    Script Date: 07/11/2024 17:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permiso](
	[Nombre] [nvarchar](50) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PermisoAtomico] [int] NULL,
 CONSTRAINT [PK_permiso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permiso_permiso]    Script Date: 07/11/2024 17:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permiso_permiso](
	[Id_Permiso_Padre] [int] NOT NULL,
	[Id_Permiso_Hijo] [int] NOT NULL,
 CONSTRAINT [PK_permiso_permiso] PRIMARY KEY CLUSTERED 
(
	[Id_Permiso_Padre] ASC,
	[Id_Permiso_Hijo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[traduccion]    Script Date: 07/11/2024 17:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[traduccion](
	[IdiomaId] [int] NOT NULL,
	[Tag] [nvarchar](50) NULL,
	[Texto] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 07/11/2024 17:17:14 ******/
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
	[ID_Perfil] [int] NULL,
	[idiomaId] [int] NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bitacora] ON 

INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4224, CAST(N'2024-11-05T12:52:08.000' AS DateTime), 1018, N'Registro', N'Se creó una cuenta', N'896687707')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4225, CAST(N'2024-11-05T12:52:13.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-1082702626')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4226, CAST(N'2024-11-05T12:55:47.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'786899564')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4227, CAST(N'2024-11-05T12:56:39.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'1405546509')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4228, CAST(N'2024-11-05T13:03:23.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-639610585')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4229, CAST(N'2024-11-05T13:08:40.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'2016996166')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4230, CAST(N'2024-11-05T13:09:47.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'44011615')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4231, CAST(N'2024-11-05T13:17:41.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-442599462')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4232, CAST(N'2024-11-05T13:22:59.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'147084277')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4233, CAST(N'2024-11-05T13:27:04.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'1269814691')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4234, CAST(N'2024-11-05T13:31:38.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-791032483')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4235, CAST(N'2024-11-05T13:33:14.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-56848260')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4236, CAST(N'2024-11-05T13:43:32.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'1950629547')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4237, CAST(N'2024-11-05T13:46:41.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'200872225')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4238, CAST(N'2024-11-05T13:52:26.000' AS DateTime), 1018, N'Cierre de sesión', N'Se cerró sesión', N'-1698337454')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4239, CAST(N'2024-11-05T13:52:34.000' AS DateTime), 1022, N'Inicio de sesión', N'Se inició sesión', N'-1874290215')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4240, CAST(N'2024-11-05T13:52:56.000' AS DateTime), 1022, N'Cierre de sesión', N'Se cerró sesión', N'1694394258')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4241, CAST(N'2024-11-05T13:53:53.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'65973904')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4242, CAST(N'2024-11-05T14:19:31.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-1234617494')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4243, CAST(N'2024-11-05T15:11:56.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'271440989')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4244, CAST(N'2024-11-05T15:12:40.000' AS DateTime), 1018, N'Cierre de sesión', N'Se cerró sesión', N'-762214065')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4245, CAST(N'2024-11-05T15:12:47.000' AS DateTime), 1023, N'Inicio de sesión', N'Se inició sesión', N'1768059969')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4246, CAST(N'2024-11-05T15:14:32.000' AS DateTime), 1023, N'Inicio de sesión', N'Se inició sesión', N'-358783242')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4247, CAST(N'2024-11-05T15:17:04.000' AS DateTime), 1023, N'Inicio de sesión', N'Se inició sesión', N'-853843313')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4248, CAST(N'2024-11-05T15:17:52.000' AS DateTime), 1023, N'Cierre de sesión', N'Se cerró sesión', N'557559527')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4249, CAST(N'2024-11-05T15:38:46.000' AS DateTime), 1023, N'Inicio de sesión', N'Se inició sesión', N'-1629763703')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4250, CAST(N'2024-11-07T12:48:11.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-1910759730')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4251, CAST(N'2024-11-07T12:50:24.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-1400715401')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4252, CAST(N'2024-11-07T12:52:28.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-2041427273')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4253, CAST(N'2024-11-07T13:09:01.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-819468815')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4254, CAST(N'2024-11-07T13:42:32.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-594682467')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4255, CAST(N'2024-11-07T13:44:37.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'2088910036')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4256, CAST(N'2024-11-07T13:47:14.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-676539796')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4257, CAST(N'2024-11-07T13:48:44.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'222714472')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4258, CAST(N'2024-11-07T13:50:32.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'644339765')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4259, CAST(N'2024-11-07T13:51:14.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-506235646')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4260, CAST(N'2024-11-07T13:56:20.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-2080601863')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4261, CAST(N'2024-11-07T14:00:41.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-1404021344')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4262, CAST(N'2024-11-07T14:07:33.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'1664548213')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4263, CAST(N'2024-11-07T14:15:42.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'2103589402')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4264, CAST(N'2024-11-07T14:19:42.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-1919377814')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4265, CAST(N'2024-11-07T14:27:01.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'1593010855')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4266, CAST(N'2024-11-07T14:45:49.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-1088595169')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4267, CAST(N'2024-11-07T14:49:26.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-296602344')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4268, CAST(N'2024-11-07T14:49:49.000' AS DateTime), 1018, N'Cierre de sesión', N'Se cerró sesión', N'-1548471070')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4269, CAST(N'2024-11-07T14:49:55.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-250602176')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4270, CAST(N'2024-11-07T14:50:01.000' AS DateTime), 1018, N'Cierre de sesión', N'Se cerró sesión', N'-1266543136')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4271, CAST(N'2024-11-07T14:50:10.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'246109453')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4272, CAST(N'2024-11-07T14:51:06.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'215640045')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4273, CAST(N'2024-11-07T14:53:31.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'2018633515')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4274, CAST(N'2024-11-07T14:55:59.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-799096301')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4275, CAST(N'2024-11-07T15:03:12.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'1237903030')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4276, CAST(N'2024-11-07T15:22:17.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-1752265968')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4277, CAST(N'2024-11-07T16:52:03.000' AS DateTime), 1023, N'Inicio de sesión', N'Se inició sesión', N'840440537')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4278, CAST(N'2024-11-07T16:56:18.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'1949071025')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4279, CAST(N'2024-11-07T16:59:44.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-1565130532')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4280, CAST(N'2024-11-07T17:08:37.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-156726230')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4281, CAST(N'2024-11-07T17:15:30.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'547843079')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (4282, CAST(N'2024-11-07T17:16:12.000' AS DateTime), 1018, N'Inicio de sesión', N'Se inició sesión', N'-381606772')
SET IDENTITY_INSERT [dbo].[bitacora] OFF
GO
SET IDENTITY_INSERT [dbo].[dvv] ON 

INSERT [dbo].[dvv] ([id], [dvv], [nombreTabla]) VALUES (7, N'-2034183173', N'usuario')
INSERT [dbo].[dvv] ([id], [dvv], [nombreTabla]) VALUES (8, N'1445821861', N'bitacora')
SET IDENTITY_INSERT [dbo].[dvv] OFF
GO
SET IDENTITY_INSERT [dbo].[idioma] ON 

INSERT [dbo].[idioma] ([Id], [Nombre]) VALUES (1, N'Spanish')
INSERT [dbo].[idioma] ([Id], [Nombre]) VALUES (2, N'English')
SET IDENTITY_INSERT [dbo].[idioma] OFF
GO
SET IDENTITY_INSERT [dbo].[perfil] ON 

INSERT [dbo].[perfil] ([Id], [Nombre]) VALUES (1, N'Administrador')
INSERT [dbo].[perfil] ([Id], [Nombre]) VALUES (2, N'Web Master')
INSERT [dbo].[perfil] ([Id], [Nombre]) VALUES (3, N'Cliente')
INSERT [dbo].[perfil] ([Id], [Nombre]) VALUES (1006, N'Nuevo')
INSERT [dbo].[perfil] ([Id], [Nombre]) VALUES (1007, N'PerfilNuevo')
SET IDENTITY_INSERT [dbo].[perfil] OFF
GO
INSERT [dbo].[perfil_permiso] ([Id_Perfil], [Id_Permiso]) VALUES (1, 4)
INSERT [dbo].[perfil_permiso] ([Id_Perfil], [Id_Permiso]) VALUES (2, 5)
INSERT [dbo].[perfil_permiso] ([Id_Perfil], [Id_Permiso]) VALUES (1006, 1)
INSERT [dbo].[perfil_permiso] ([Id_Perfil], [Id_Permiso]) VALUES (1006, 5)
INSERT [dbo].[perfil_permiso] ([Id_Perfil], [Id_Permiso]) VALUES (1007, 1)
INSERT [dbo].[perfil_permiso] ([Id_Perfil], [Id_Permiso]) VALUES (1007, 5)
GO
SET IDENTITY_INSERT [dbo].[permiso] ON 

INSERT [dbo].[permiso] ([Nombre], [Id], [PermisoAtomico]) VALUES (N'Ver Bitácora', 1, 1)
INSERT [dbo].[permiso] ([Nombre], [Id], [PermisoAtomico]) VALUES (N'Restaurar y Respaldar Base de Datos', 2, 2)
INSERT [dbo].[permiso] ([Nombre], [Id], [PermisoAtomico]) VALUES (N'Gestionar Usuarios', 3, 3)
INSERT [dbo].[permiso] ([Nombre], [Id], [PermisoAtomico]) VALUES (N'Administrador', 4, NULL)
INSERT [dbo].[permiso] ([Nombre], [Id], [PermisoAtomico]) VALUES (N'Web Master', 5, NULL)
INSERT [dbo].[permiso] ([Nombre], [Id], [PermisoAtomico]) VALUES (N'Gestionar Idiomas', 1001, 1001)
INSERT [dbo].[permiso] ([Nombre], [Id], [PermisoAtomico]) VALUES (N'Crear Perfiles', 1002, 4)
INSERT [dbo].[permiso] ([Nombre], [Id], [PermisoAtomico]) VALUES (N'Asignar Perfiles', 2002, 5)
SET IDENTITY_INSERT [dbo].[permiso] OFF
GO
INSERT [dbo].[permiso_permiso] ([Id_Permiso_Padre], [Id_Permiso_Hijo]) VALUES (4, 1)
INSERT [dbo].[permiso_permiso] ([Id_Permiso_Padre], [Id_Permiso_Hijo]) VALUES (4, 3)
INSERT [dbo].[permiso_permiso] ([Id_Permiso_Padre], [Id_Permiso_Hijo]) VALUES (4, 1002)
INSERT [dbo].[permiso_permiso] ([Id_Permiso_Padre], [Id_Permiso_Hijo]) VALUES (4, 2002)
INSERT [dbo].[permiso_permiso] ([Id_Permiso_Padre], [Id_Permiso_Hijo]) VALUES (5, 2)
INSERT [dbo].[permiso_permiso] ([Id_Permiso_Padre], [Id_Permiso_Hijo]) VALUES (5, 1001)
GO
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Log', N'Bitácora')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Log', N'Log')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Login', N'Iniciar sesión')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Login', N'Login')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Register', N'Registrarse')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Register', N'Register')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'ManageLanguage', N'Gestión de idioma')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'ManageLanguage', N'Language Management')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Logout', N'Cerrar Sesión')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Logout', N'Logout')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'ManageUser', N'Gestión de usuarios')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'ManageUser', N'User management')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Restoredb', N'Respaldar/Restaurar Base de Datos')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Restoredb', N'Save/Restore Database')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Cart', N'Carrito')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Cart', N'Cart')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Welcome', N'Bienvenido')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Welcome', N'Welcome')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Spanish', N'Español')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Spanish', N'Spanish')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'English', N'Inglés')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'English', N'English')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Store', N'Tienda')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Store', N'Store')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Portability', N'Portabilidad')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Portability', N'Portability')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Plans', N'Planes')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Plans', N'Plans')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Promo1', N'Internet 100 MB + Flow Flex
62% OFF por 6 meses*
$15.089 final por mes')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Promo1', N'Internet 100 MB + Flow Flex
62% OFF for 6 months*
$15,089 final per month')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Promo2text', N'Por tener un servicio del hogar + una línea móvil de Personal,
podés duplicar gratis los gigas de tu plan móvil')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Promo2text', N'For having a home service + a personal mobile line,

You can double the gigabytes of your mobile plan for free')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Promo3title', N'Por tener un servicio del hogar + una línea móvil de Personal')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Promo3title', N'For having a home service + a personal mobile line')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Promo3text', N'Hasta $2.500 pagando desde la app o hasta $2.850 por débito automático, dependiendo del nivel que
seas en Personal Pay')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Promo3text', N'Up to $2,500 paying from the app or up to $2,850 by automatic debit, depending on the level you are
you are in Bersonal Pay')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Name', N'Nombre')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Name', N'Name')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Option', N'Opción')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Option', N'Option')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Request', N'Solicitar')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Request', N'Request')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Main', N'Inicio')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Main', N'Main')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Lastname', N'Apellido')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Lastname', N'Last Name')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Password', N'Contraseña')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Password', N'Password')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'CreateUser', N'Crear Usuario')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'CreateUser', N'Create User')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Modify', N'Modificar')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Modify', N'Modify')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Delete', N'Eliminar')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Delete', N'Delete')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'CreateBackup', N'Generar Respaldo')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'CreateBackup', N'Create Backup')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'BackupRoute', N'Ingrese la ruta del archivo de respaldo')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'BackupRoute', N'Enter the backup file path')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'BackupSuccess', N'La restauración fue un éxito')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'BackupSuccess', N'The restoration was a success')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'BackupFail', N'Hubo un error al restaurar de la base de datos. Verifique la ruta del archivo de respaldo')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'BackupFail', N'There was an error restoring from the database. Check the backup file path')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Filter', N'Filtrar por fecha y/o módulo')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Filter', N'Filter by date and/or module')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Since', N'Desde')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Since', N'Since')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Until', N'Hasta')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Until', N'Until')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Module', N'Módulo')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Module', N'Module')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'FilterText', N'Filtro')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'FilterText', N'Filter')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'User', N'Usuario')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'User', N'User')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Day', N'Dia')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Day', N'Day')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Hour', N'Hora')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Hour', N'Hour')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Description', N'Descripción')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Description', N'Description')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Corruptdb', N'La base de datos está corrupta')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Corruptdb', N'The database is corrupted')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'ErrorList', N'Lista de errores')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'ErrorList', N'Error List')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Howtoproceed', N'Elija cómo proceder')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Howtoproceed', N'Choose how to proceed')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'CalculateDigitSuccess', N'Se calcularon los dígitos verificadores con éxito')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'CalculateDigitSuccess', N'Successfully calculated the check digits')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'CalculateDigit', N'Recalcular Dígitos Verificadores')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'CalculateDigit', N'Recalculate Verification Digits')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Leave', N'Salir')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Leave', N'Leave')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'CalculateDigitSuccess', N'Bersonal no está disponible en este momento. Vuelva más tarde y disculpe las molestias')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'CalculateDigitSuccess', N'Bersonal is currently unavailable. Please come back later and sorry for the inconvenience')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'ChooseBestPlan', N'Elegí el mejor plan de Internet móvil')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'ChooseBestPlan', N'Choose the best mobile internet plan')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'MostSelled', N'Más vendido')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'MostSelled', N'Most Selled')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'ForMonth', N'final por mes')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'ForMonth', N'per month')
GO
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Plan1Name', N'Móvil 3 GB')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Plan1Name', N'Mobile 3 GB')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Price', N'Precio')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Price', N'Price')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Discount', N'50% OFF por 6 meses')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Discount', N'50% OFF for 6 months')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'IwantIt', N'¡Lo quiero!')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'IwantIt', N'I want it!')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Plan1Feature1', N'Roaming: WhatsApp gratis + 2 GB extra en limítrofes y EE.UU')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Plan1Feature1', N'Roaming: Free WhatsApp + 2 GB extra on the border and in the US. USA')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Plan1Feature2', N'Enviá mensajes de WhatsApp sin consumir datos de tu plan')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Plan1Feature2', N'Send WhatsApp messages without consuming data from your plan')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Plan1Feature3', N'3 GB para navegar en tu celu')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Plan1Feature3', N'3 GB to browse on your cell phone')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'IncludeText', N'¡Incluye WhatsApp gratis y llamadas ilimitadas!')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'IncludeText', N'¡Includes free WhatsApp and unlimited calls!')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Knowmore', N'Conocer más')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Knowmore', N'Learn more')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Plan2Name', N'Móvil 5 GB')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Plan2Name', N'Mobile 5 GB')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Plan2Feature1', N'Roaming: WhatsApp gratis + 3 GB extra en América')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Plan2Feature1', N'Roaming: Free WhatsApp + 3 GB extra in America')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Plan2Feature2', N'SMS ilimitados y llamadas a América a precio local')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Plan2Feature2', N'Unlimited SMS and calls to America at local price')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Plan2Feature3', N'5 GB para navegar en tu celu')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Plan2Feature3', N'5 GB to browse on your cell phone')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Plan3Name', N'Móvil 10 GB')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Plan3Name', N'Mobile 10 GB')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Plan3Feature1', N'Roaming: WhatsApp gratis + 5 GB extra en América')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Plan3Feature1', N'Roaming: WhatsApp for free + 5 GB extra in America')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Plan3Feature2', N'Guardá los gigas sobrantes para el mes siguiente')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Plan3Feature2', N'Save the leftover gigabytes for the following month')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Plan3Feature3', N'Flow Pass: 10 GB gratis por mes para disfrutar en la app de Flow')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Plan3Feature3', N'Flow Pass: 10 GB free per month to enjoy in the Flow app')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Restore', N'Restaurar')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Restore', N'Restore')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Language', N'Idioma')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Language', N'Language')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Text', N'Texto')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Text', N'Text')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'CreateLanguage', N'Crear idioma')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'CreateLanguage', N'Create language')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'CreateProfile', N'Crear Perfiles')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'CreateProfile', N'Create Profiles')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'AssignProfile', N'Asignar Perfiles')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'AssignProfile', N'Assign Profiles')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Roles', N'Roles')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Roles', N'Roles')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Permissions', N'Permisos')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Permissions', N'Permissions')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'AddRole', N'Agregar Rol')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'AddRole', N'Add Role')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'AddPermission', N'Agregar Permiso')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'AddPermission', N'Add Permission')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'ProfileName', N'Nombre del Perfil')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'ProfileName', N'Profile Name')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'AddProfile', N'Agregar Perfil')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'AddProfile', N'Add Profile')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'CreateProfile2', N'Crear Perfil')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'CreateProfile2', N'Create Profile')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Profiles', N'Perfiles')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Profiles', N'Profiles')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'Users', N'Usuarios')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'Users', N'Users')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (1, N'AssignProfile2', N'Asignar Perfil')
INSERT [dbo].[traduccion] ([IdiomaId], [Tag], [Texto]) VALUES (2, N'AssignProfile2', N'Assign Profile')
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([id], [nombre], [apellido], [DNI], [email], [contrasena], [dvh], [ID_Perfil], [idiomaId]) VALUES (1018, N'admin', N'admin', 12345678, N'+t7clkZ2Umu/ThS4rgC3Vw==', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'872861617', 1, 2)
INSERT [dbo].[usuario] ([id], [nombre], [apellido], [DNI], [email], [contrasena], [dvh], [ID_Perfil], [idiomaId]) VALUES (1022, N'usertest', N'user', 74125896, N'1hJfgNqgbaZPFTkQ/lmx+w==', N'04f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb', N'-1472997228', 1007, 1)
INSERT [dbo].[usuario] ([id], [nombre], [apellido], [DNI], [email], [contrasena], [dvh], [ID_Perfil], [idiomaId]) VALUES (1023, N'webmaster', N'webmaster', 44655423, N'hx3soRzQ0O8DjT+JaTPWE1fCPqO+U67BnhjZDwDytNc=', N'8294547e9fe9367f291a22598513d897928d1a0eeb713ca2b41f31977192c5d1', N'-1455441042', 2, 1)
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
