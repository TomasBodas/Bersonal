USE [master]
GO
/****** Object:  Database [Bersonal]    Script Date: 14/08/2024 9:53:40 ******/
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
/****** Object:  Table [dbo].[bitacora]    Script Date: 14/08/2024 9:53:40 ******/
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
/****** Object:  Table [dbo].[dvv]    Script Date: 14/08/2024 9:53:40 ******/
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
/****** Object:  Table [dbo].[perfil]    Script Date: 14/08/2024 9:53:40 ******/
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
/****** Object:  Table [dbo].[perfil_permiso]    Script Date: 14/08/2024 9:53:40 ******/
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
/****** Object:  Table [dbo].[permiso]    Script Date: 14/08/2024 9:53:40 ******/
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
/****** Object:  Table [dbo].[permiso_permiso]    Script Date: 14/08/2024 9:53:40 ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 14/08/2024 9:53:40 ******/
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
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bitacora] ON 

INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2089, CAST(N'2024-08-13T12:14:13.000' AS DateTime), 1, N'Registro', N'Se creó una cuenta', N'882696150')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2090, CAST(N'2024-08-13T12:14:43.000' AS DateTime), 1, N'Inicio de sesión', N'Se inició sesión', N'-115071889')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2091, CAST(N'2024-08-13T13:28:43.000' AS DateTime), 1, N'Inicio de sesión', N'Se inició sesión', N'-1389853770')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2092, CAST(N'2024-08-13T13:34:30.000' AS DateTime), 1, N'Inicio de sesión', N'Se inició sesión', N'971509877')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2093, CAST(N'2024-08-13T13:37:42.000' AS DateTime), 1, N'Inicio de sesión', N'Se inició sesión', N'2028278073')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2094, CAST(N'2024-08-13T13:42:52.000' AS DateTime), 1, N'Inicio de sesión', N'Se inició sesión', N'1098573284')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2095, CAST(N'2024-08-13T13:46:14.000' AS DateTime), 1, N'Inicio de sesión', N'Se inició sesión', N'819113039')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2096, CAST(N'2024-08-13T13:48:10.000' AS DateTime), 1, N'Inicio de sesión', N'Se inició sesión', N'-1085576721')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2097, CAST(N'2024-08-13T19:56:39.000' AS DateTime), 1, N'Inicio de sesión', N'Se inició sesión', N'-991286576')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2098, CAST(N'2024-08-13T20:00:03.000' AS DateTime), 1, N'Inicio de sesión', N'Se inició sesión', N'-1498859464')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2099, CAST(N'2024-08-13T20:11:38.000' AS DateTime), 1, N'Inicio de sesión', N'Se inició sesión', N'831534752')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2100, CAST(N'2024-08-13T20:12:51.000' AS DateTime), 1, N'Inicio de sesión', N'Se inició sesión', N'-706461969')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2101, CAST(N'2024-08-13T20:14:13.000' AS DateTime), 1, N'Inicio de sesión', N'Se inició sesión', N'1604975082')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2102, CAST(N'2024-08-13T20:15:48.000' AS DateTime), 1, N'Inicio de sesión', N'Se inició sesión', N'252827214')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2103, CAST(N'2024-08-13T20:17:26.000' AS DateTime), 1, N'Inicio de sesión', N'Se inició sesión', N'-426022611')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2104, CAST(N'2024-08-13T20:19:27.000' AS DateTime), 1, N'Inicio de sesión', N'Se inició sesión', N'271355642')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2105, CAST(N'2024-08-13T20:21:14.000' AS DateTime), 1, N'Inicio de sesión', N'Se inició sesión', N'824196867')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2106, CAST(N'2024-08-13T21:38:12.000' AS DateTime), 1, N'Inicio de sesión', N'Se inició sesión', N'-1089066744')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2107, CAST(N'2024-08-13T21:38:28.000' AS DateTime), 1, N'Cierre de sesión', N'Se cerró sesión', N'840710841')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2108, CAST(N'2024-08-13T21:39:01.000' AS DateTime), 2, N'Registro', N'Se creó una cuenta', N'862123233')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2109, CAST(N'2024-08-13T21:39:08.000' AS DateTime), 2, N'Inicio de sesión', N'Se inició sesión', N'1786070268')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2110, CAST(N'2024-08-13T21:39:46.000' AS DateTime), 2, N'Cierre de sesión', N'Se cerró sesión', N'1045698716')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2111, CAST(N'2024-08-13T21:40:05.000' AS DateTime), 3, N'Registro', N'Se creó una cuenta', N'-2088138205')
INSERT [dbo].[bitacora] ([id], [fecha], [FK_usuario_bitacora], [modulo], [descripcion], [dvh]) VALUES (2112, CAST(N'2024-08-13T21:40:12.000' AS DateTime), 3, N'Inicio de sesión', N'Se inició sesión', N'2107525392')
SET IDENTITY_INSERT [dbo].[bitacora] OFF
GO
SET IDENTITY_INSERT [dbo].[dvv] ON 

INSERT [dbo].[dvv] ([id], [dvv], [nombreTabla]) VALUES (5, N'1716117240', N'bitacora')
INSERT [dbo].[dvv] ([id], [dvv], [nombreTabla]) VALUES (6, N'1474000860', N'usuario')
SET IDENTITY_INSERT [dbo].[dvv] OFF
GO
SET IDENTITY_INSERT [dbo].[perfil] ON 

INSERT [dbo].[perfil] ([Id], [Nombre]) VALUES (1, N'Administrador')
INSERT [dbo].[perfil] ([Id], [Nombre]) VALUES (2, N'Web Master')
INSERT [dbo].[perfil] ([Id], [Nombre]) VALUES (3, N'Cliente')
SET IDENTITY_INSERT [dbo].[perfil] OFF
GO
INSERT [dbo].[perfil_permiso] ([Id_Perfil], [Id_Permiso]) VALUES (1, 4)
INSERT [dbo].[perfil_permiso] ([Id_Perfil], [Id_Permiso]) VALUES (2, 5)
GO
SET IDENTITY_INSERT [dbo].[permiso] ON 

INSERT [dbo].[permiso] ([Nombre], [Id], [PermisoAtomico]) VALUES (N'Ver Bitácora', 1, 1)
INSERT [dbo].[permiso] ([Nombre], [Id], [PermisoAtomico]) VALUES (N'Restaurar y Respaldar Base de Datos', 2, 2)
INSERT [dbo].[permiso] ([Nombre], [Id], [PermisoAtomico]) VALUES (N'Gestionar Usuarios', 3, 3)
INSERT [dbo].[permiso] ([Nombre], [Id], [PermisoAtomico]) VALUES (N'Administrador', 4, NULL)
INSERT [dbo].[permiso] ([Nombre], [Id], [PermisoAtomico]) VALUES (N'Web Master', 5, NULL)
SET IDENTITY_INSERT [dbo].[permiso] OFF
GO
INSERT [dbo].[permiso_permiso] ([Id_Permiso_Padre], [Id_Permiso_Hijo]) VALUES (4, 1)
INSERT [dbo].[permiso_permiso] ([Id_Permiso_Padre], [Id_Permiso_Hijo]) VALUES (4, 3)
INSERT [dbo].[permiso_permiso] ([Id_Permiso_Padre], [Id_Permiso_Hijo]) VALUES (5, 2)
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([id], [nombre], [apellido], [DNI], [email], [contrasena], [dvh], [ID_Perfil]) VALUES (1, N'webmaster', N'webmaster', 12345678, N'hx3soRzQ0O8DjT+JaTPWE1fCPqO+U67BnhjZDwDytNc=', N'8294547e9fe9367f291a22598513d897928d1a0eeb713ca2b41f31977192c5d1', N'-697239767', 2)
INSERT [dbo].[usuario] ([id], [nombre], [apellido], [DNI], [email], [contrasena], [dvh], [ID_Perfil]) VALUES (2, N'admin', N'admin', 32165498, N'+t7clkZ2Umu/ThS4rgC3Vw==', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'1606878483', 1)
INSERT [dbo].[usuario] ([id], [nombre], [apellido], [DNI], [email], [contrasena], [dvh], [ID_Perfil]) VALUES (3, N'user', N'user', 98765432, N'1hJfgNqgbaZPFTkQ/lmx+w==', N'04f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb', N'-1171870497', 3)
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
