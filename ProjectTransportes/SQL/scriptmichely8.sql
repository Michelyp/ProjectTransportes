USE [master]
GO
/****** Object:  Database [transportes]    Script Date: 18/03/2024 14:17:26 ******/
CREATE DATABASE [transportes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'transportes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\transportes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'transportes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\transportes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [transportes] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [transportes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [transportes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [transportes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [transportes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [transportes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [transportes] SET ARITHABORT OFF 
GO
ALTER DATABASE [transportes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [transportes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [transportes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [transportes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [transportes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [transportes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [transportes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [transportes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [transportes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [transportes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [transportes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [transportes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [transportes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [transportes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [transportes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [transportes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [transportes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [transportes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [transportes] SET  MULTI_USER 
GO
ALTER DATABASE [transportes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [transportes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [transportes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [transportes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [transportes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [transportes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [transportes] SET QUERY_STORE = OFF
GO
USE [transportes]
GO
/****** Object:  Table [dbo].[PUNTUACION]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PUNTUACION](
	[IDPUNTUACION] [int] NOT NULL,
	[IDCOCHE] [int] NULL,
	[IDUSER] [int] NULL,
	[PUNTUACION] [int] NULL,
	[COMENTARIOS] [nvarchar](450) NULL,
 CONSTRAINT [PK_PUNTUACION] PRIMARY KEY CLUSTERED 
(
	[IDPUNTUACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MODELO]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MODELO](
	[IDMODELO] [int] NOT NULL,
	[NOMBRE] [nvarchar](700) NULL,
	[IDMARCA] [int] NULL,
 CONSTRAINT [PK__MODELO__A33B9CD655825FBB] PRIMARY KEY CLUSTERED 
(
	[IDMODELO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPOMOVILIDAD]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPOMOVILIDAD](
	[IDTIPO] [int] NOT NULL,
	[NOMBRE] [nvarchar](450) NULL,
 CONSTRAINT [PK__TIPOMOVI__E57FEC10858ED940] PRIMARY KEY CLUSTERED 
(
	[IDTIPO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COCHE]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COCHE](
	[IDCOCHE] [int] NOT NULL,
	[IDMODELO] [int] NULL,
	[IDPUNTUACION] [int] NULL,
	[TIPOMOVILIDAD] [int] NULL,
	[IDFILTRO] [int] NULL,
	[IMAGEN] [nvarchar](max) NULL,
	[ESTADOCOCHE] [bit] NULL,
	[IDPROVINCIA] [int] NULL,
	[ASIENTOS] [int] NULL,
	[MALETAS] [int] NULL,
	[PUERTAS] [int] NULL,
	[PRECIO] [int] NULL,
 CONSTRAINT [PK__COCHE__CAA10FF1D232E9B0] PRIMARY KEY CLUSTERED 
(
	[IDCOCHE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_COCHES_LISTA]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[V_COCHES_LISTA]
as
	select coche.idcoche, coche.imagen,
    coche.asientos, coche.maletas,
    coche.puertas, coche.precio,
    coche.estadocoche,
    modelo.nombre as model, puntuacion.puntuacion,
    coche.idprovincia, tipomovilidad.nombre as tipo_cambio
	from coche
	inner join modelo
	on  coche.idmodelo=  modelo.idmodelo
	inner join tipomovilidad
	on  coche.tipomovilidad=  tipomovilidad.idtipo
	left join puntuacion
	on coche.idpuntuacion = puntuacion.idpuntuacion
GO
/****** Object:  Table [dbo].[ROLES]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLES](
	[IDROL] [int] NOT NULL,
	[NOMBRE] [nvarchar](50) NULL,
 CONSTRAINT [PK_ROLES] PRIMARY KEY CLUSTERED 
(
	[IDROL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESTADOUSUARIO]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADOUSUARIO](
	[IDESTADO] [int] NOT NULL,
	[NOMBRE] [nvarchar](250) NULL,
 CONSTRAINT [PK_ESTADOUSUARIO] PRIMARY KEY CLUSTERED 
(
	[IDESTADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[IDUSUARIO] [int] NOT NULL,
	[NOMBRE] [nvarchar](700) NOT NULL,
	[APELLIDO] [nvarchar](700) NULL,
	[CORREO] [nvarchar](700) NULL,
	[SALT] [nvarchar](700) NULL,
	[PASS] [varbinary](max) NULL,
	[TELEFONO] [int] NULL,
	[IDROL] [int] NULL,
	[IDFACTURACION] [int] NULL,
	[ESTADO] [int] NULL,
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[IDUSUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_all_usuarios]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_all_usuarios]
as
	select USUARIOS.IDUSUARIO, USUARIOS.NOMBRE, USUARIOS.APELLIDO,
    USUARIOS.CORREO, USUARIOS.TELEFONO,ROLES.NOMBRE AS ROL, ESTADOUSUARIO.NOMBRE AS ESTADO
	from USUARIOS
	inner join ESTADOUSUARIO
	on USUARIOS.ESTADO  = ESTADOUSUARIO.IDESTADO
	inner join ROLES
	on USUARIOS.IDROL = ROLES.IDROL
GO
/****** Object:  Table [dbo].[ESTADORESERVA]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADORESERVA](
	[IDESTADO] [int] NOT NULL,
	[NOMBRE] [nchar](10) NULL,
 CONSTRAINT [PK_ESTADORESERVA] PRIMARY KEY CLUSTERED 
(
	[IDESTADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESERVA]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESERVA](
	[IDRESERVA] [int] NOT NULL,
	[LUGAR] [nvarchar](450) NOT NULL,
	[CONDUCTOR] [nvarchar](700) NULL,
	[HORAINICIAL] [time](7) NULL,
	[FECHARECOGIDA] [datetime] NULL,
	[FECHADEVOLUCION] [datetime] NULL,
	[HORAFINAL] [time](7) NULL,
	[IDCOCHE] [int] NULL,
	[IDUSUARIO] [int] NULL,
	[IDESTADORESERVA] [int] NULL,
 CONSTRAINT [PK__RESERVA__98D53B44A60E0E75] PRIMARY KEY CLUSTERED 
(
	[IDRESERVA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_RESERVAS_LISTA]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[V_RESERVAS_LISTA]
as
	select RESERVA.IDRESERVA, RESERVA.LUGAR,
	RESERVA.CONDUCTOR, RESERVA.HORAINICIAL, RESERVA.FECHARECOGIDA,
	RESERVA.FECHADEVOLUCION,
	RESERVA.HORAFINAL, COCHE.IDCOCHE AS COCHE, USUARIOS.NOMBRE,
	ESTADORESERVA.NOMBRE AS RESERVA
	from RESERVA
	left join COCHE
	on  RESERVA.IDCOCHE=  COCHE.IDCOCHE
	left join USUARIOS
	on  RESERVA.IDUSUARIO=  USUARIOS.IDUSUARIO
	left join ESTADORESERVA
	on RESERVA.IDESTADORESERVA = ESTADORESERVA.IDESTADO
GO
/****** Object:  Table [dbo].[FACTURACION]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACTURACION](
	[IDFACTURACION] [int] NOT NULL,
	[NOMBRE] [nvarchar](450) NULL,
	[DIRECCION] [nvarchar](450) NULL,
	[CIUDAD] [nvarchar](450) NULL,
	[CODIGOPOSTAL] [nvarchar](450) NULL,
	[PAIS] [nvarchar](450) NULL,
 CONSTRAINT [PK_FACTURACION] PRIMARY KEY CLUSTERED 
(
	[IDFACTURACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FILTROCOCHE]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FILTROCOCHE](
	[IDFILTRO] [int] NOT NULL,
	[NOMBRE] [nvarchar](700) NULL,
 CONSTRAINT [PK_FILTROCOCHE] PRIMARY KEY CLUSTERED 
(
	[IDFILTRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCA]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCA](
	[IDMARCA] [int] NOT NULL,
	[NOMBRE] [nvarchar](700) NULL,
 CONSTRAINT [PK__MARCA__C8C2A4AAA27D35F2] PRIMARY KEY CLUSTERED 
(
	[IDMARCA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVINCIA]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVINCIA](
	[IDPROVINCIA] [int] NOT NULL,
	[NOMBRE] [nvarchar](450) NULL,
 CONSTRAINT [PK__PROVINCI__E57FEC10F8010DDF] PRIMARY KEY CLUSTERED 
(
	[IDPROVINCIA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[COCHE] ([IDCOCHE], [IDMODELO], [IDPUNTUACION], [TIPOMOVILIDAD], [IDFILTRO], [IMAGEN], [ESTADOCOCHE], [IDPROVINCIA], [ASIENTOS], [MALETAS], [PUERTAS], [PRECIO]) VALUES (1, 5, NULL, 1, 2, N'https://i.postimg.cc/wTkPF5yG/audi-q8-etron.png', 0, 2, 4, 1, 4, 150)
INSERT [dbo].[COCHE] ([IDCOCHE], [IDMODELO], [IDPUNTUACION], [TIPOMOVILIDAD], [IDFILTRO], [IMAGEN], [ESTADOCOCHE], [IDPROVINCIA], [ASIENTOS], [MALETAS], [PUERTAS], [PRECIO]) VALUES (2, 1, NULL, 2, 3, N'https://i.postimg.cc/PfY0vnth/audi-a1.png', 1, 2, 5, 2, 5, 150)
INSERT [dbo].[COCHE] ([IDCOCHE], [IDMODELO], [IDPUNTUACION], [TIPOMOVILIDAD], [IDFILTRO], [IMAGEN], [ESTADOCOCHE], [IDPROVINCIA], [ASIENTOS], [MALETAS], [PUERTAS], [PRECIO]) VALUES (3, 2, NULL, 1, 1, N'https://i.postimg.cc/nrb5S0G6/bmw-1er.png', 1, 4, 4, 1, 4, 150)
INSERT [dbo].[COCHE] ([IDCOCHE], [IDMODELO], [IDPUNTUACION], [TIPOMOVILIDAD], [IDFILTRO], [IMAGEN], [ESTADOCOCHE], [IDPROVINCIA], [ASIENTOS], [MALETAS], [PUERTAS], [PRECIO]) VALUES (4, 3, NULL, 1, 2, N'https://i.postimg.cc/gjV7C8Mr/audi-q5.png', 1, 2, 4, 1, 4, 150)
INSERT [dbo].[COCHE] ([IDCOCHE], [IDMODELO], [IDPUNTUACION], [TIPOMOVILIDAD], [IDFILTRO], [IMAGEN], [ESTADOCOCHE], [IDPROVINCIA], [ASIENTOS], [MALETAS], [PUERTAS], [PRECIO]) VALUES (5, 4, NULL, 1, 2, N'https://i.postimg.cc/gjV7C8Mr/audi-q5.png', 1, 2, 5, 2, 4, 150)
INSERT [dbo].[COCHE] ([IDCOCHE], [IDMODELO], [IDPUNTUACION], [TIPOMOVILIDAD], [IDFILTRO], [IMAGEN], [ESTADOCOCHE], [IDPROVINCIA], [ASIENTOS], [MALETAS], [PUERTAS], [PRECIO]) VALUES (6, 6, NULL, 1, 3, N'https://i.postimg.cc/nrb5S0G6/bmw-1er.png', 1, 2, 5, 2, 4, 150)
INSERT [dbo].[COCHE] ([IDCOCHE], [IDMODELO], [IDPUNTUACION], [TIPOMOVILIDAD], [IDFILTRO], [IMAGEN], [ESTADOCOCHE], [IDPROVINCIA], [ASIENTOS], [MALETAS], [PUERTAS], [PRECIO]) VALUES (7, 7, NULL, 2, 1, N'https://i.postimg.cc/kGm1vDnC/seat-ateca.png', 1, 2, 4, 1, 5, 150)
INSERT [dbo].[COCHE] ([IDCOCHE], [IDMODELO], [IDPUNTUACION], [TIPOMOVILIDAD], [IDFILTRO], [IMAGEN], [ESTADOCOCHE], [IDPROVINCIA], [ASIENTOS], [MALETAS], [PUERTAS], [PRECIO]) VALUES (8, 8, NULL, 2, 1, N'https://i.postimg.cc/dtFp8N1C/mb-c-class.png', 1, 2, 4, 2, 4, 150)
INSERT [dbo].[COCHE] ([IDCOCHE], [IDMODELO], [IDPUNTUACION], [TIPOMOVILIDAD], [IDFILTRO], [IMAGEN], [ESTADOCOCHE], [IDPROVINCIA], [ASIENTOS], [MALETAS], [PUERTAS], [PRECIO]) VALUES (9, 9, NULL, 2, 2, N'https://i.postimg.cc/4yQ8LZd9/peugeot-308.png', 1, 2, 4, 1, 4, 150)
INSERT [dbo].[COCHE] ([IDCOCHE], [IDMODELO], [IDPUNTUACION], [TIPOMOVILIDAD], [IDFILTRO], [IMAGEN], [ESTADOCOCHE], [IDPROVINCIA], [ASIENTOS], [MALETAS], [PUERTAS], [PRECIO]) VALUES (10, 10, NULL, 2, 2, N'https://i.postimg.cc/mDMp97WV/peugeot-208.png', 1, 2, 4, 2, 4, 150)
INSERT [dbo].[COCHE] ([IDCOCHE], [IDMODELO], [IDPUNTUACION], [TIPOMOVILIDAD], [IDFILTRO], [IMAGEN], [ESTADOCOCHE], [IDPROVINCIA], [ASIENTOS], [MALETAS], [PUERTAS], [PRECIO]) VALUES (11, 11, NULL, 2, 2, N'https://i.postimg.cc/9MqKBvZd/fiat.png', 1, 2, 4, 1, 5, 150)
INSERT [dbo].[COCHE] ([IDCOCHE], [IDMODELO], [IDPUNTUACION], [TIPOMOVILIDAD], [IDFILTRO], [IMAGEN], [ESTADOCOCHE], [IDPROVINCIA], [ASIENTOS], [MALETAS], [PUERTAS], [PRECIO]) VALUES (12, 12, NULL, 1, 2, N'https://i.postimg.cc/kGm1vDnC/seat-ateca.png
', 1, 2, 4, 2, 4, 150)
INSERT [dbo].[COCHE] ([IDCOCHE], [IDMODELO], [IDPUNTUACION], [TIPOMOVILIDAD], [IDFILTRO], [IMAGEN], [ESTADOCOCHE], [IDPROVINCIA], [ASIENTOS], [MALETAS], [PUERTAS], [PRECIO]) VALUES (13, 13, NULL, 2, 1, NULL, 1, 2, 4, 1, 4, 150)
INSERT [dbo].[COCHE] ([IDCOCHE], [IDMODELO], [IDPUNTUACION], [TIPOMOVILIDAD], [IDFILTRO], [IMAGEN], [ESTADOCOCHE], [IDPROVINCIA], [ASIENTOS], [MALETAS], [PUERTAS], [PRECIO]) VALUES (14, 14, NULL, 1, 4, N'https://i.postimg.cc/BvjVqdhr/mb-e-klasse.png', 1, 2, 6, 2, 2, 150)
INSERT [dbo].[COCHE] ([IDCOCHE], [IDMODELO], [IDPUNTUACION], [TIPOMOVILIDAD], [IDFILTRO], [IMAGEN], [ESTADOCOCHE], [IDPROVINCIA], [ASIENTOS], [MALETAS], [PUERTAS], [PRECIO]) VALUES (15, 15, NULL, 1, 2, N'https://i.postimg.cc/MGgrXdNv/porsche-macan.png', 1, 2, 4, 1, 4, 150)
GO
INSERT [dbo].[ESTADORESERVA] ([IDESTADO], [NOMBRE]) VALUES (1, N'Pagado    ')
INSERT [dbo].[ESTADORESERVA] ([IDESTADO], [NOMBRE]) VALUES (2, N'No pagado ')
GO
INSERT [dbo].[ESTADOUSUARIO] ([IDESTADO], [NOMBRE]) VALUES (1, N'Activo')
INSERT [dbo].[ESTADOUSUARIO] ([IDESTADO], [NOMBRE]) VALUES (2, N'Inactivo')
GO
INSERT [dbo].[FACTURACION] ([IDFACTURACION], [NOMBRE], [DIRECCION], [CIUDAD], [CODIGOPOSTAL], [PAIS]) VALUES (1, N'Roberto', N'Calle Salsipuedes 22', N'Madrid', N'28021', N'España')
GO
INSERT [dbo].[FILTROCOCHE] ([IDFILTRO], [NOMBRE]) VALUES (1, N'Pequeño')
INSERT [dbo].[FILTROCOCHE] ([IDFILTRO], [NOMBRE]) VALUES (2, N'Económico')
INSERT [dbo].[FILTROCOCHE] ([IDFILTRO], [NOMBRE]) VALUES (3, N'Familiar')
INSERT [dbo].[FILTROCOCHE] ([IDFILTRO], [NOMBRE]) VALUES (4, N'Lujo')
GO
INSERT [dbo].[MARCA] ([IDMARCA], [NOMBRE]) VALUES (1, N'Audi')
INSERT [dbo].[MARCA] ([IDMARCA], [NOMBRE]) VALUES (2, N'BMW')
INSERT [dbo].[MARCA] ([IDMARCA], [NOMBRE]) VALUES (3, N'Seat')
INSERT [dbo].[MARCA] ([IDMARCA], [NOMBRE]) VALUES (4, N'Mercedes-Benz')
INSERT [dbo].[MARCA] ([IDMARCA], [NOMBRE]) VALUES (5, N'Fiat')
INSERT [dbo].[MARCA] ([IDMARCA], [NOMBRE]) VALUES (6, N'Peugeot')
INSERT [dbo].[MARCA] ([IDMARCA], [NOMBRE]) VALUES (7, N'Mini ')
INSERT [dbo].[MARCA] ([IDMARCA], [NOMBRE]) VALUES (8, N'Defender')
INSERT [dbo].[MARCA] ([IDMARCA], [NOMBRE]) VALUES (9, N'Porsche')
GO
INSERT [dbo].[MODELO] ([IDMODELO], [NOMBRE], [IDMARCA]) VALUES (1, N'Audi A1 Sportback', 1)
INSERT [dbo].[MODELO] ([IDMODELO], [NOMBRE], [IDMARCA]) VALUES (2, N'BMW Serie 1', 2)
INSERT [dbo].[MODELO] ([IDMODELO], [NOMBRE], [IDMARCA]) VALUES (3, N'Audi Q3', 1)
INSERT [dbo].[MODELO] ([IDMODELO], [NOMBRE], [IDMARCA]) VALUES (4, N'Audi Q5', 1)
INSERT [dbo].[MODELO] ([IDMODELO], [NOMBRE], [IDMARCA]) VALUES (5, N'Audi Q8 e-tron', 1)
INSERT [dbo].[MODELO] ([IDMODELO], [NOMBRE], [IDMARCA]) VALUES (6, N'BMW iX3', 2)
INSERT [dbo].[MODELO] ([IDMODELO], [NOMBRE], [IDMARCA]) VALUES (7, N'Seat Ateca', 3)
INSERT [dbo].[MODELO] ([IDMODELO], [NOMBRE], [IDMARCA]) VALUES (8, N'Mercedes-Benz Clase C', 4)
INSERT [dbo].[MODELO] ([IDMODELO], [NOMBRE], [IDMARCA]) VALUES (9, N'Peugeot 308', 6)
INSERT [dbo].[MODELO] ([IDMODELO], [NOMBRE], [IDMARCA]) VALUES (10, N'Peugeot 208', 6)
INSERT [dbo].[MODELO] ([IDMODELO], [NOMBRE], [IDMARCA]) VALUES (11, N'Fiat 500', 5)
INSERT [dbo].[MODELO] ([IDMODELO], [NOMBRE], [IDMARCA]) VALUES (12, N'Seat Ateca', 3)
INSERT [dbo].[MODELO] ([IDMODELO], [NOMBRE], [IDMARCA]) VALUES (13, N'MINI Cooper Countryman', 7)
INSERT [dbo].[MODELO] ([IDMODELO], [NOMBRE], [IDMARCA]) VALUES (14, N'Mercedes-Benz Clase V', 4)
INSERT [dbo].[MODELO] ([IDMODELO], [NOMBRE], [IDMARCA]) VALUES (15, N'BMW Serie 5', 2)
GO
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (1, N'Álava')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (2, N'Albacete')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (3, N'Alicante')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (4, N'Almería')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (5, N'Ávila')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (6, N'Badajoz')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (7, N'Barcelona')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (8, N'Burgos')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (9, N'Cáceres')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (10, N'Cádiz')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (11, N'Castellón')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (12, N'Ciudad Real')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (13, N'Córdoba')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (14, N'Cuenca')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (15, N'Gerona')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (16, N'Granada')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (17, N'Guadalajara')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (18, N'Guipúzcoa')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (19, N'Huelva')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (20, N'Huesca')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (21, N'Islas Balears')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (22, N'Jaén')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (23, N'León')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (24, N'Lérida')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (25, N'La Rioja')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (26, N'Lugo')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (27, N'Madrid')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (28, N'Málaga')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (29, N'Murcia')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (30, N'Navarra')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (31, N'Orense')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (32, N'Asturias')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (33, N'Palencia')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (34, N'Las Palmas')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (35, N'Pontevedra')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (36, N'Salamanca')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (37, N'Santa Cruz de Tenerife')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (38, N'Cantabria')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (39, N'Segovia')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (40, N'Sevilla')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (41, N'Soria')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (42, N'Tarragona')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (43, N'Teruel')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (44, N'Toledo')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (45, N'Valencia')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (46, N'Valladolid')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (47, N'Vizcaya')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (48, N'Zamora')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (49, N'Zaragoza')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (50, N'Ceuta')
INSERT [dbo].[PROVINCIA] ([IDPROVINCIA], [NOMBRE]) VALUES (51, N'Melilla')
GO
INSERT [dbo].[RESERVA] ([IDRESERVA], [LUGAR], [CONDUCTOR], [HORAINICIAL], [FECHARECOGIDA], [FECHADEVOLUCION], [HORAFINAL], [IDCOCHE], [IDUSUARIO], [IDESTADORESERVA]) VALUES (1, N'Madrid', N'Pepe', CAST(N'00:15:00' AS Time), CAST(N'2024-03-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ROLES] ([IDROL], [NOMBRE]) VALUES (1, N'Admin')
INSERT [dbo].[ROLES] ([IDROL], [NOMBRE]) VALUES (2, N'Usuario')
GO
INSERT [dbo].[TIPOMOVILIDAD] ([IDTIPO], [NOMBRE]) VALUES (1, N'Automático')
INSERT [dbo].[TIPOMOVILIDAD] ([IDTIPO], [NOMBRE]) VALUES (2, N'Manual')
GO
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (1, N'Michely', N'Pinto Morales', N'michelypintom@gmail.com', N'õ¼ë}Êê,$vÆ7Káß®þ@TNp*zn«	8ÎþÂ{)¬¨À6ßBìt;òº=', 0x4DDFCB88E23FDB4080B150CE7F5B730A8C48134A9CF6EC7F3AF474A2A9BB58AC3040E6DD9E3065F12D24CC8DCB8191AE3FE0355E71951DEB7D28FD39D60C981A, 661477452, 1, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (3, N'Michely', N'Pinto Morales', N'novaoficial12@gmail.com', N'Pµ<g¦
«ÔdÁ¬i¡M;§ðµ-Û''óVN\ÆFÑëUêÍ ã[Ý7»', 0x4282EBD45FB2B10662DCC927AFA74DB9545957A77578AC3A2CCAE12CE3CC954BC546FB67E26860AEE125E1C0F273C6FFE65D01A5E7CF7C82CDCB89DD06CC4523, 661477452, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (5, N'Juan', N'Perez', N'juan.perez@example.com', N'Â+Ð''Ì.ü(>úsàQ?qhý!0¹ØQ7ý,ÎÈZªG£)§>üÇÌEð', 0xF7768AFAD12476B5D1FE31F2D63F64B968C3A8EF7EB41B11070F2F463070F99CBC7B68B84DC6550ABABDE7032EE163CE947AF0B7F9F02E043672F3A81191C593, 1234567890, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (6, N'Ana', N'Gomez', N'ana.gomez@example.com', N'Àè³SÀ°+Ø"Â¾¬Éew{}bªMTHò×ênçNxæñæÐ_vÃÂW¦í', 0xF0EAF29377170418E9C6EE2CEB0E0513EA38EBC22C80A6EB84548E83DF7CB49E657A4AD6205130333A3AC0AAA139E39EB799F4D72A3230F759DBAFE13A1713A3, 66521541, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (7, N'Carlos', N'Rodriguez', N'carlos.rodriguez@example.com', N'½âÁØ
ëê¸È!aT<ùò¶ö÷ÏJQÁõu7@."
>>ÌèÕhô|®3', 0x4F9182C0E1B3BADE45C43C8B54F6DB0336F7A73A7243DA68B5A9AC8FDEA1C9CE671748034401C5B5DAA970B5C48A38C3AF9A4D3DF01A4E30B837739699ECC8AE, 345678901, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (8, N'Maria', N'Lopez', N'maria.lopez@example.com', N'i÷^~cs0.<Ð²ì®iºð|4×`ÆêeëÔqê¾ÎoõÄ­k»@Îà', 0xA8C236CDF19328F5BDBB2D38B846985EB8C9E859E06FF348BE5873632C1409D76CB5B08BF0DF92AEABF6DF85DE4B6A3B833F3D402F83DF2FBE965CE39A7F46C5, 456789012, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (9, N'Pedro', N'Gonzalez', N'pedro.gonzalez@example.com', N'¢,£w×¼´H[20Á}¯>PÝêwã¢u[9F2lÑá³­MÎ= æ¾', 0xADABEBA2F85E02A4BB5D9F45F61ADAA97B83EF11A3A6F198D39443A649920FE106497A2CE700350B52842BDBED772A30CA9C5CDCD879E62F6C656EF0A2AA1F78, 567890123, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (10, N'Laura', N'Martinez', N'laura.martinez@example.com', N'¸ÇÐÁ0Zh¯.XF )wÚdfêõ+''Cäuö]}xTÑ§ Ðu)Ë%lTÔ', 0xFD1A129F1D4127790FCB49B3D3969A202820339C996F5E29C4E8B322F2E97C71FAF91E80855158ABBBCD5A6C14DF9856B1265E6AC800033491CDFE9DF5B7D243, 0, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (11, N'Jorge', N'Fernandez', N'jorge.fernandez@example.com', N'ðXÒ²>Ë[6êT~©õÏmªú8]jâ¿¸1²ÛÍé0øñÑª>§HÓí', 0xD07F185966215E71AAB171F91738770D12331B9386B0835B7CA54E7C880ADBEC7F4763E045B96281E5F431337FC9B651F24DC6F162A1446E3BE4AE771386FBDA, 789012345, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (12, N'Sofia', N'Ramirez', N'sofia.ramirez@example.com', N'[®ÍþüMµXsøüBE¼ÆoüV-DµYä-Ì¨ÈçaþâOI0³.±VÎëÏÅ', 0x650916362D7756F26ABCE05B57AA4D95CD39EF3C116460CDD72AFFEE82D557B5BB612D87414EBF61A2EFBD93AA84D0617036D19B89471C69839B5E969FF34BA4, 890123456, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (13, N'Luis', N'Morales', N'luis.morales@example.com', N'ÀTßv°=¿f$+v! <åâ¨Í©NQPÅ}8í.9(Ý·ì­À±)', 0xD35399AC04957E5EAD541906C2A35DCF71617687D057AEB322E7AB3648E8C1601593F13E7A7C5BDD336ADA913885428ACBCEC6AB82D384725D321FE173AD70C0, 901234567, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (14, N'Carmen', N'Torres', N'carmen.torres@example.com', N'Ö2thºk¤''?-x÷.Èy¬e(,÷GÔÌÆ-|ö¨rMàQQ±/', 0x6A72A25A7DB1BB12DDA5A2E3D0B51ECDD0415886A80B6D135CC4332372EE288A783FEA5785F4803964F66310E66BE32F956EDE21480F4F9C0428F9BB6B816D74, 912345678, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (15, N'Ricardo', N'Ruiz', N'ricardo.ruiz@example.com', N'7ÃhÕZ³E°aÁpÉßÈå®Óë´PÓ]uexU©>ÍZc³T0LTdà(', 0x23B1D33C7FF3286CF1E6583F08548FBFDF73130463E443E843CBA41C48642F1B7759955A4CBA385C305F4F5C72617A14A4F60398E39829ECC9B776DD3F3B87EA, 923456789, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (16, N'Patricia', N'Vargas', N'patricia.vargas@example.com', N'¯a{ûVý,ÇÉÂy+b):àèÑõäÝpkGÎsds	/Ë´EQÂ[Î<', 0xD65E876B6F13041C40E802044423BCE1177954AF7A1796A393D117AEAF3E0AE4FECE4BB4B1FFFB47B58E133F64C68F1AA7779EDAB1D0E0C1AD05044DF8010543, 934567890, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (17, N'Hector', N'Diaz', N'hector.diaz@example.com', N'ÃVÉà¯ùÃ2t''cK;[µp¥xw­Ü%#È®uö`Ø(âª£\­ä', 0xD53AE744BB1EF28E23A72121FCD1B778D18F32984F62217DE9C25781F4461B5F433AEA74EC8248467D85E2175668796C616620FA1DB040D04DE978F62A14844F, 945678901, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (18, N'Gabriela', N'Mendoza', N'gabriela.mendoza@example.com', N'»$cå2=_QX²/"æx$µzÅØ·ù¡ÂF	üuä|éÒÐ àN''Q/¡)', 0x119331A8421A7B2A2B18F494D6C8FE9D6B2EE627822B73DB2BB5AEBF067864BE6D2C046FE8B001E5FD9997F95485D6C6AF62AAD05B19A088D0BD7308CC3F9030, 956789012, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (19, N'Miguel', N'Guerrero', N'miguel.guerrero@example.com', N'%?c õ¢ çO©k-1P68ò|Á,ðÍKö''ðÍÈ ~lE63÷Í', 0xB86D0518128CEE482542856ED136983628451E5A390D822330D3DE56A7DBF7F330627CFC010392C5C5590FC6AD7ED1E3AFD21E2499AAED6FE60210100AB8DFD7, 967890123, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (20, N'Isabel', N'Ochoa', N'isabel.ochoa@example.com', N'Ç?§®nÃÎ³GauónþQ/£u°9®B/[·gíG.oµÓzÕ§Ûó¦£1zÄ&', 0x9C27C8F98F8656A784F7266B69CBB546CCB649F9035982F1F46D8484DB6275CC12B9A569BDCB71E2F3D72BC799F02BA2370E740928C8AF19B8406D50E539993C, 978901234, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (21, N'Ruben', N'Rios', N'ruben.rios@example.com', N'PúT¦ëÏõ}Ç;-ÑàÅò0ª´´%9ùÔq[Ì:êN²ß)FEèÖ', 0x8ED23EAD2DB6ED72B52D1766A34ADF2CA431031249214CED6565513763FAA246240A7710F87A5AE054926437F3036E5481BA708395BE033F8F52BD12C5AD2C94, 989012345, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (22, N'Liliana', N'Castro', N'liliana.castro@example.com', N'÷Ë%ïÊf²Ù+¹ëPGÌÜ7FS»Áè$7æ5z¬et^oSm·²zikr§\', 0xDF4BD47619EEE010CADA126C1E71D7AE77D4AFCA769862602215A45E8BF770E553033F0B329FEA3B12451F2C96A01AECCC96B58F60F5BD79739DD94C1C57D164, 90123456, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (23, N'Sergio', N'Gonzalez', N'sergio.gonzalez@example.com', N'}&Í=+Ð"9wê_ãâoì3AÍ`üº#$zl'',[
¥Ái^ìù¼Z8¢U ', 0xEE8D14DBBBBC9563AE23864A7EBE1D349E8DDC71311C188C0CE6C63B981A620B7CB672B6EC303709735DBC636732DD1057966D2668127E129677608170535BFF, 901234567, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (24, N'Adriana', N'Martinez', N'adriana.martinez@example.com', N'Íd²ôI­crýFº6Æ«&3MÀe¾J1@^ÜîHIM¤YXè«ÊUSY3', 0x30E5FF280C351A857CF8A9FF50965C7C2AD870062F417ADBCC0C951A654BBF77F767D69F9177E3EC9DBA856F2406743993CD1F29F1324EC010B9751A6C3C2FA7, 912345678, 2, 1, 1)
INSERT [dbo].[USUARIOS] ([IDUSUARIO], [NOMBRE], [APELLIDO], [CORREO], [SALT], [PASS], [TELEFONO], [IDROL], [IDFACTURACION], [ESTADO]) VALUES (25, N'Michely', N'Pinto Morales', N'romi_michita@hotmail.com', N'~ärCv''qõm©ºµGÍefèï''a]¾AøLRÁÉÏ^n2ãámKÆÖK¿', 0x2B29C390EABCC23EAF461584FAB2C4617BEDB94D8496EA5C78C258C757F3815FACA0F3405B05EE2078613088735844AC7D9A6A48053D83958BC9108577A13E1D, 661477452, 2, 1, 1)
GO
ALTER TABLE [dbo].[COCHE]  WITH CHECK ADD  CONSTRAINT [FK_COCHE_FILTROCOCHE] FOREIGN KEY([IDFILTRO])
REFERENCES [dbo].[FILTROCOCHE] ([IDFILTRO])
GO
ALTER TABLE [dbo].[COCHE] CHECK CONSTRAINT [FK_COCHE_FILTROCOCHE]
GO
ALTER TABLE [dbo].[COCHE]  WITH CHECK ADD  CONSTRAINT [FK_COCHE_MODELO] FOREIGN KEY([IDMODELO])
REFERENCES [dbo].[MODELO] ([IDMODELO])
GO
ALTER TABLE [dbo].[COCHE] CHECK CONSTRAINT [FK_COCHE_MODELO]
GO
ALTER TABLE [dbo].[COCHE]  WITH CHECK ADD  CONSTRAINT [FK_COCHE_PROVINCIA1] FOREIGN KEY([IDPROVINCIA])
REFERENCES [dbo].[PROVINCIA] ([IDPROVINCIA])
GO
ALTER TABLE [dbo].[COCHE] CHECK CONSTRAINT [FK_COCHE_PROVINCIA1]
GO
ALTER TABLE [dbo].[COCHE]  WITH CHECK ADD  CONSTRAINT [FK_COCHE_PUNTUACION] FOREIGN KEY([IDPUNTUACION])
REFERENCES [dbo].[PUNTUACION] ([IDPUNTUACION])
GO
ALTER TABLE [dbo].[COCHE] CHECK CONSTRAINT [FK_COCHE_PUNTUACION]
GO
ALTER TABLE [dbo].[COCHE]  WITH CHECK ADD  CONSTRAINT [FK_COCHE_TIPOMOVILIDAD1] FOREIGN KEY([TIPOMOVILIDAD])
REFERENCES [dbo].[TIPOMOVILIDAD] ([IDTIPO])
GO
ALTER TABLE [dbo].[COCHE] CHECK CONSTRAINT [FK_COCHE_TIPOMOVILIDAD1]
GO
ALTER TABLE [dbo].[MODELO]  WITH CHECK ADD  CONSTRAINT [FK_MODELO_MARCA] FOREIGN KEY([IDMARCA])
REFERENCES [dbo].[MARCA] ([IDMARCA])
GO
ALTER TABLE [dbo].[MODELO] CHECK CONSTRAINT [FK_MODELO_MARCA]
GO
ALTER TABLE [dbo].[PUNTUACION]  WITH CHECK ADD  CONSTRAINT [FK_PUNTUACION_USUARIOS] FOREIGN KEY([IDUSER])
REFERENCES [dbo].[USUARIOS] ([IDUSUARIO])
GO
ALTER TABLE [dbo].[PUNTUACION] CHECK CONSTRAINT [FK_PUNTUACION_USUARIOS]
GO
ALTER TABLE [dbo].[RESERVA]  WITH CHECK ADD  CONSTRAINT [FK_RESERVA_COCHE] FOREIGN KEY([IDCOCHE])
REFERENCES [dbo].[COCHE] ([IDCOCHE])
GO
ALTER TABLE [dbo].[RESERVA] CHECK CONSTRAINT [FK_RESERVA_COCHE]
GO
ALTER TABLE [dbo].[RESERVA]  WITH CHECK ADD  CONSTRAINT [FK_RESERVA_ESTADORESERVA] FOREIGN KEY([IDESTADORESERVA])
REFERENCES [dbo].[ESTADORESERVA] ([IDESTADO])
GO
ALTER TABLE [dbo].[RESERVA] CHECK CONSTRAINT [FK_RESERVA_ESTADORESERVA]
GO
ALTER TABLE [dbo].[RESERVA]  WITH CHECK ADD  CONSTRAINT [FK_RESERVA_USUARIOS] FOREIGN KEY([IDUSUARIO])
REFERENCES [dbo].[USUARIOS] ([IDUSUARIO])
GO
ALTER TABLE [dbo].[RESERVA] CHECK CONSTRAINT [FK_RESERVA_USUARIOS]
GO
ALTER TABLE [dbo].[USUARIOS]  WITH CHECK ADD  CONSTRAINT [FK_USUARIOS_ESTADOUSUARIO] FOREIGN KEY([ESTADO])
REFERENCES [dbo].[ESTADOUSUARIO] ([IDESTADO])
GO
ALTER TABLE [dbo].[USUARIOS] CHECK CONSTRAINT [FK_USUARIOS_ESTADOUSUARIO]
GO
ALTER TABLE [dbo].[USUARIOS]  WITH CHECK ADD  CONSTRAINT [FK_USUARIOS_FACTURACION] FOREIGN KEY([IDFACTURACION])
REFERENCES [dbo].[FACTURACION] ([IDFACTURACION])
GO
ALTER TABLE [dbo].[USUARIOS] CHECK CONSTRAINT [FK_USUARIOS_FACTURACION]
GO
ALTER TABLE [dbo].[USUARIOS]  WITH CHECK ADD  CONSTRAINT [FK_USUARIOS_ROLES] FOREIGN KEY([IDROL])
REFERENCES [dbo].[ROLES] ([IDROL])
GO
ALTER TABLE [dbo].[USUARIOS] CHECK CONSTRAINT [FK_USUARIOS_ROLES]
GO
/****** Object:  StoredProcedure [dbo].[sp_all_coches]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_all_coches]
as
	select * from v_coches_lista
GO
/****** Object:  StoredProcedure [dbo].[SP_ALL_RESERVAS]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ALL_RESERVAS]
as
	select * from V_RESERVAS_LISTA
GO
/****** Object:  StoredProcedure [dbo].[sp_all_usuarios]    Script Date: 18/03/2024 14:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_all_usuarios]
as
	select * from v_all_usuarios
g
GO
USE [master]
GO
ALTER DATABASE [transportes] SET  READ_WRITE 
GO
