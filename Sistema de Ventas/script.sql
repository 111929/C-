USE [master]
GO
/****** Object:  Database [SistemaVentasIntegrador]    Script Date: 11/11/2020 21:17:21 ******/
CREATE DATABASE [SistemaVentasIntegrador]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistemaVentasIntegrador', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SistemaVentasIntegrador.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SistemaVentasIntegrador_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SistemaVentasIntegrador_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SistemaVentasIntegrador] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistemaVentasIntegrador].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SistemaVentasIntegrador] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET ARITHABORT OFF 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET  MULTI_USER 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SistemaVentasIntegrador] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SistemaVentasIntegrador] SET QUERY_STORE = OFF
GO
USE [SistemaVentasIntegrador]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulos](
	[idArticulo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](150) NOT NULL,
	[idMarca] [int] NOT NULL,
	[idCategoria] [int] NOT NULL,
	[idPresentacion] [int] NOT NULL,
	[precioVenta] [decimal](18, 0) NOT NULL,
	[Stock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Barrios]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barrios](
	[idBarrio] [int] IDENTITY(1,1) NOT NULL,
	[barrio] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idBarrio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombreCategoria] [varchar](50) NOT NULL,
	[descripcion] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[idTipoDocumento] [int] NOT NULL,
	[NroDocumento] [int] NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[idGenero] [int] NOT NULL,
	[calle] [varchar](100) NOT NULL,
	[altura] [int] NULL,
	[idBarrio] [int] NOT NULL,
	[telefono] [bigint] NULL,
	[email] [varchar](100) NOT NULL,
	[localidad] [int] NULL,
	[provincia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesFacturas]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesFacturas](
	[idDetalleFactura] [int] IDENTITY(1,1) NOT NULL,
	[numeroFactura] [int] NOT NULL,
	[idArticulo] [int] NOT NULL,
	[precioVenta] [float] NOT NULL,
	[cantidad] [int] NOT NULL,
	[descuento] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetalleFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[legajoEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[idTipoDocumento] [int] NOT NULL,
	[NroDocumento] [int] NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[idGenero] [int] NOT NULL,
	[fechaIngreso] [date] NOT NULL,
	[idTipoEmpleado] [int] NOT NULL,
	[calle] [varchar](100) NOT NULL,
	[altura] [int] NOT NULL,
	[idBarrio] [int] NOT NULL,
	[telefono] [bigint] NOT NULL,
	[email] [varchar](100) NOT NULL,
	[usuarios] [varchar](50) NULL,
	[contrasena] [varchar](12) NULL,
	[localidad] [int] NULL,
	[provincia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[legajoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[numeroFactura] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[idCliente] [int] NOT NULL,
	[legajoEmpleado] [int] NOT NULL,
	[idTipoFactura] [int] NULL,
	[idFormaPago] [int] NULL,
	[iva] [float] NOT NULL,
	[recargo] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[numeroFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormasPagos]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormasPagos](
	[idFormaPago] [int] IDENTITY(1,1) NOT NULL,
	[formaPago] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idFormaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[idGenero] [int] IDENTITY(1,1) NOT NULL,
	[genero] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[idLocalidad] [int] IDENTITY(1,1) NOT NULL,
	[localidad] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lotes]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lotes](
	[idLote] [int] IDENTITY(1,1) NOT NULL,
	[fechaVencimiento] [date] NOT NULL,
	[fechaElaboracion] [date] NOT NULL,
	[idArticulo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idLote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[idMarca] [int] IDENTITY(1,1) NOT NULL,
	[nombreMarca] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presentaciones]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presentaciones](
	[idPresentacion] [int] IDENTITY(1,1) NOT NULL,
	[nombrePresentacion] [varchar](50) NOT NULL,
	[descripcion] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPresentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[idProvincia] [int] IDENTITY(1,1) NOT NULL,
	[provincia] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDocumentos]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDocumentos](
	[idTipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[tipoDocumento] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposEmpleados]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposEmpleados](
	[idTipoEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[tipoEmpleado] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposFacturas]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposFacturas](
	[idTipoFactura] [int] IDENTITY(1,1) NOT NULL,
	[tipoFactura] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Articulos] ON 

INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (1, N'Pan de Salvado', N'Pan de Mesa', 1, 1, 1, CAST(50 AS Decimal(18, 0)), 30)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (2, N'Pan Hamburguesa', N'Pan de Mesa', 2, 1, 1, CAST(70 AS Decimal(18, 0)), 20)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (3, N'Pan Rallado', N'Pan rallado/Rebozador', 4, 1, 3, CAST(129 AS Decimal(18, 0)), 15)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (4, N'Sal Fina', N'Sal de Mesa', 10, 1, 4, CAST(35 AS Decimal(18, 0)), 30)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (5, N'Aceite de Girasol', N'Puro de girasol', 7, 1, 2, CAST(105 AS Decimal(18, 0)), 60)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (6, N'Oregano', N'Pan de Mesa', 10, 1, 4, CAST(50 AS Decimal(18, 0)), 30)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (7, N'Arvejas al Natural', N'En conserva', 11, 1, 4, CAST(26 AS Decimal(18, 0)), 50)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (8, N'Tomate Perita', N'Conserva', 13, 1, 4, CAST(54 AS Decimal(18, 0)), 40)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (9, N'Atun en aceite', N'Peso escurrido 120 gr', 15, 1, 4, CAST(210 AS Decimal(18, 0)), 10)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (10, N'Choclo cremoso', N'Amarillo', 13, 1, 4, CAST(40 AS Decimal(18, 0)), 40)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (11, N'Harina de Maiz', N'Polenta instantanea', 16, 1, 3, CAST(60 AS Decimal(18, 0)), 30)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (12, N'Harina premezcla para pizza', N'Con levadura', 18, 1, 3, CAST(87 AS Decimal(18, 0)), 20)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (13, N'Fideos Tirabuzon', N'Libres de gluten', 24, 1, 3, CAST(129 AS Decimal(18, 0)), 15)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (14, N'Arroz Largo y fino', N'Largo Fino', 20, 1, 3, CAST(73 AS Decimal(18, 0)), 10)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (15, N'Caldo de gallina', N'', 25, 1, 1, CAST(43 AS Decimal(18, 0)), 50)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (16, N'Pure de papas', N'Pure de papas', 25, 1, 4, CAST(55 AS Decimal(18, 0)), 7)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (17, N'Avena Instantanea', N'Fortificada', 26, 1, 4, CAST(146 AS Decimal(18, 0)), 50)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (18, N'MFlan de vainilla', N'Vainilla', 27, 1, 4, CAST(36 AS Decimal(18, 0)), 50)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (19, N'Bizcochuelo de Chololate', N'chocolate', 27, 1, 4, CAST(133 AS Decimal(18, 0)), 20)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (20, N'Jugo en polvo Naranja', N'Jugo en polvo', 31, 2, 4, CAST(12 AS Decimal(18, 0)), 50)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (21, N'Bebida a base de soja', N'Sabor manzana', 32, 2, 5, CAST(93 AS Decimal(18, 0)), 10)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (22, N'Agua mineral', N'Sin gas', 35, 2, 2, CAST(70 AS Decimal(18, 0)), 100)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (23, N'Fernet', N'Aperitivo', 69, 2, 5, CAST(459 AS Decimal(18, 0)), 25)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (24, N'Aperitivo Americano', N'Aperitivo', 37, 2, 5, CAST(215 AS Decimal(18, 0)), 10)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (25, N'Campari', N'Aperitivo', 38, 2, 5, CAST(350 AS Decimal(18, 0)), 5)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (26, N'Gaseosa Zero', N'Gaseosa', 40, 2, 2, CAST(130 AS Decimal(18, 0)), 100)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (27, N'Gaseosa Cola', N'Gaseosa', 39, 2, 2, CAST(90 AS Decimal(18, 0)), 60)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (28, N'Gaseosa Lima Limon', N'Sin Gas', 42, 2, 2, CAST(108 AS Decimal(18, 0)), 50)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (29, N'Cerveza', N'Cerveza', 45, 2, 5, CAST(170 AS Decimal(18, 0)), 80)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (30, N'Cerveza Amber Lager', N'Cerveza', 46, 2, 5, CAST(170 AS Decimal(18, 0)), 90)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (31, N'Energizante', N'Bebida Energetica', 48, 2, 5, CAST(100 AS Decimal(18, 0)), 50)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (32, N'Bebida Energetica Manzana', N'Bebida Energetica', 49, 2, 5, CAST(104 AS Decimal(18, 0)), 25)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (33, N'Vino Tinto', N'Malbec', 52, 2, 5, CAST(227 AS Decimal(18, 0)), 48)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (34, N'Hamburguesas Clasicas', N'Clasicas', 54, 3, 1, CAST(195 AS Decimal(18, 0)), 10)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (35, N'Patitas de Pollo', N'Pollo', 56, 3, 3, CAST(223 AS Decimal(18, 0)), 5)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (36, N'Papas Tradicional', N'Baston', 56, 3, 3, CAST(169 AS Decimal(18, 0)), 7)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (37, N'Milanesa de Soja', N'Con Espinaca', 55, 3, 1, CAST(147 AS Decimal(18, 0)), 10)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (38, N'Papas Fritas', N'Clasicas', 56, 4, 4, CAST(100 AS Decimal(18, 0)), 15)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (39, N'Leche descremada', N'Larga vida', 57, 5, 2, CAST(57 AS Decimal(18, 0)), 15)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (40, N'Manteca', N'x 100 Gr', 58, 5, 4, CAST(47 AS Decimal(18, 0)), 25)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (41, N'Yogur Bebible', N'Frutilla', 59, 5, 2, CAST(72 AS Decimal(18, 0)), 8)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (42, N'Yerba Mate', N'Con palo', 65, 6, 3, CAST(260 AS Decimal(18, 0)), 5)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (43, N'Cafe', N'Instantaneo', 63, 6, 4, CAST(350 AS Decimal(18, 0)), 5)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (44, N'Endulzante', N'Stevia', 64, 6, 1, CAST(350 AS Decimal(18, 0)), 5)
INSERT [dbo].[Articulos] ([idArticulo], [nombre], [descripcion], [idMarca], [idCategoria], [idPresentacion], [precioVenta], [Stock]) VALUES (49, N'Yogurt', N'Bebible', 60, 5, 2, CAST(50 AS Decimal(18, 0)), 5)
SET IDENTITY_INSERT [dbo].[Articulos] OFF
GO
SET IDENTITY_INSERT [dbo].[Barrios] ON 

INSERT [dbo].[Barrios] ([idBarrio], [barrio]) VALUES (1, N'Nueva Cordoba')
INSERT [dbo].[Barrios] ([idBarrio], [barrio]) VALUES (2, N'Alto Alberdi')
INSERT [dbo].[Barrios] ([idBarrio], [barrio]) VALUES (3, N'Observatorio')
INSERT [dbo].[Barrios] ([idBarrio], [barrio]) VALUES (4, N'Jardin')
INSERT [dbo].[Barrios] ([idBarrio], [barrio]) VALUES (5, N'Pueyrredon')
INSERT [dbo].[Barrios] ([idBarrio], [barrio]) VALUES (6, N'Villa Belgrano')
INSERT [dbo].[Barrios] ([idBarrio], [barrio]) VALUES (7, N'Panamericano')
INSERT [dbo].[Barrios] ([idBarrio], [barrio]) VALUES (8, N'San Vicente')
INSERT [dbo].[Barrios] ([idBarrio], [barrio]) VALUES (9, N'Maipu')
INSERT [dbo].[Barrios] ([idBarrio], [barrio]) VALUES (10, N'San Martin')
INSERT [dbo].[Barrios] ([idBarrio], [barrio]) VALUES (11, N'Centro')
INSERT [dbo].[Barrios] ([idBarrio], [barrio]) VALUES (12, N'Residencial San Carlos')
SET IDENTITY_INSERT [dbo].[Barrios] OFF
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([idCategoria], [nombreCategoria], [descripcion]) VALUES (1, N'Almacen', N'Panaderia,Aceites,Concervas,Pastas,Legumbres,Reposteria')
INSERT [dbo].[Categorias] ([idCategoria], [nombreCategoria], [descripcion]) VALUES (2, N'Bebidas', N'Jugos,Aguas,Aperitivos,Gaseosas,Cervezas,Energeticas,Bodega')
INSERT [dbo].[Categorias] ([idCategoria], [nombreCategoria], [descripcion]) VALUES (3, N'Congelados', N'Hamburguesas,Nuggets,Vegetales')
INSERT [dbo].[Categorias] ([idCategoria], [nombreCategoria], [descripcion]) VALUES (4, N'Snacks', N'Papas')
INSERT [dbo].[Categorias] ([idCategoria], [nombreCategoria], [descripcion]) VALUES (5, N'Lacteos', N'leches,Cremas,Yogures,Mantecad')
INSERT [dbo].[Categorias] ([idCategoria], [nombreCategoria], [descripcion]) VALUES (6, N'Infusiones y endulzantes', N'Cafe,Azucar,Edulcorante,Yerba Mate,Te')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [calle], [altura], [idBarrio], [telefono], [email], [localidad], [provincia]) VALUES (11, N'Martin', N'Gimenez', 1, 30456201, CAST(N'1983-10-12' AS Date), 1, N'Rondeau', 455, 1, 351292931, N'oscarbotta@gmail.com', 1, 5)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [calle], [altura], [idBarrio], [telefono], [email], [localidad], [provincia]) VALUES (21, N'Lucas', N'Barraza', 1, 33616215, CAST(N'1988-07-25' AS Date), 1, N'Mariano Moreno', 857, 2, 351896939, N'Lucas23@gmail.com', 1, 5)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [calle], [altura], [idBarrio], [telefono], [email], [localidad], [provincia]) VALUES (22, N'David', N'Gutierrez', 1, 25256311, CAST(N'1975-03-15' AS Date), 1, N'Gay Lussac', 6140, 6, 351478965, N'david32@gmail.com', 1, 5)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [calle], [altura], [idBarrio], [telefono], [email], [localidad], [provincia]) VALUES (23, N'Jimena', N'Stefanich', 1, 29346201, CAST(N'1979-01-02' AS Date), 2, N'Gral Mosconi', 238, 7, 351263355, N'jimena_stef@gmail.com', 1, 5)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [calle], [altura], [idBarrio], [telefono], [email], [localidad], [provincia]) VALUES (24, N'Valeria', N'Carrizo', 1, 27385531, CAST(N'1977-05-19' AS Date), 2, N'Av.Pueyrredon', 230, 1, 351494566, N'valCarrizo@gmail.com', 1, 5)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [calle], [altura], [idBarrio], [telefono], [email], [localidad], [provincia]) VALUES (25, N'Raúl', N'Flores', 1, 36102546, CAST(N'1991-12-31' AS Date), 1, N'Amadeo Sabatini', 1535, 9, 351587898, N'raul_flores@gmail.com', 1, 5)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [calle], [altura], [idBarrio], [telefono], [email], [localidad], [provincia]) VALUES (26, N'Alberto', N'Ramirez', 1, 25368124, CAST(N'1975-02-23' AS Date), 1, N'Amadeo Sabatini', 1035, 9, 351696912, N'alber@hotmail.com', 1, 5)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [calle], [altura], [idBarrio], [telefono], [email], [localidad], [provincia]) VALUES (27, N'Erika', N'Gomez', 1, 34621987, CAST(N'1989-05-23' AS Date), 2, N'Av.Colon', 102, 11, 351641455, N'eriquiña32@gmail.com', 1, 5)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [calle], [altura], [idBarrio], [telefono], [email], [localidad], [provincia]) VALUES (28, N'Arturo', N'Sanchez', 1, 32154870, CAST(N'1987-06-17' AS Date), 1, N'Emilio Olmos', 120, 11, 351758799, N'ArturoSa@gmail.com', 1, 5)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [calle], [altura], [idBarrio], [telefono], [email], [localidad], [provincia]) VALUES (29, N'Juan', N'Bautista', 1, 34227547, CAST(N'1989-09-29' AS Date), 1, N'Ituzaingo', 535, 1, 351253687, N'bauti_juan@hotmail.com', 1, 5)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [calle], [altura], [idBarrio], [telefono], [email], [localidad], [provincia]) VALUES (31, N'Nicolas', N'Flores', 1, 33223354, CAST(N'1996-11-04' AS Date), 1, N'Caseros', 270, 11, 782369512, N'niquin@gmail.com', 1, 5)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [calle], [altura], [idBarrio], [telefono], [email], [localidad], [provincia]) VALUES (32, N'Santiago', N'Salamandri', 1, 345613131, CAST(N'2020-11-06' AS Date), 1, N'Rondeau', 789, 1, 351236548, N'santi@gmail.com', 1, 5)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [calle], [altura], [idBarrio], [telefono], [email], [localidad], [provincia]) VALUES (51, N'Oscar', N'Botta', 1, 25136547, CAST(N'1975-11-11' AS Date), 1, N'Rondeau', 415, 1, 351269874, N'oscarbotta@gmail.com', 1, 3)
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[DetallesFacturas] ON 

INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (63, 165, 3, 116, 12, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (65, 167, 5, 95, 7, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (66, 168, 4, 31, 5, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (67, 168, 15, 37, 6, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (68, 169, 8, 50.5, 6, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (69, 170, 2, 50.3, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (70, 171, 16, 50, 8, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (71, 171, 12, 81, 15, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (72, 172, 7, 22.5, 10, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (73, 173, 17, 132.2, 3, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (74, 173, 11, 54.4, 4, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (75, 174, 21, 83.4, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (76, 175, 13, 119.8, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (77, 175, 22, 60.3, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (78, 176, 14, 67.9, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (79, 177, 13, 121.3, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (80, 177, 12, 83.2, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (81, 178, 18, 32.2, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (82, 179, 5, 98.2, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (83, 180, 10, 35.2, 3, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (84, 181, 16, 51.2, 5, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (85, 182, 21, 86.2, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (86, 183, 3, 121.3, 10, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (87, 183, 5, 99, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (88, 184, 19, 125.3, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (89, 185, 6, 46.3, 3, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (90, 186, 9, 195.2, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (91, 187, 13, 113.2, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (92, 188, 8, 51.6, 8, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (93, 189, 11, 57.4, 3, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (94, 190, 6, 48.2, 4, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (95, 191, 10, 37.2, 8, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (96, 192, 16, 52.4, 6, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (97, 193, 19, 128.5, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (98, 193, 14, 66.5, 3, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (99, 194, 9, 200, 8, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (100, 195, 27, 82.3, 3, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (101, 195, 23, 420, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (102, 196, 39, 53.5, 5, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (103, 197, 41, 68.2, 4, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (104, 198, 11, 57.2, 3, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (105, 198, 39, 54, 3, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (106, 199, 44, 328.2, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (107, 200, 13, 124.2, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (108, 201, 16, 52, 3, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (109, 201, 39, 54.1, 5, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (110, 202, 8, 52.4, 10, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (111, 203, 17, 140.2, 5, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (112, 203, 39, 54.2, 8, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (113, 204, 1, 85.2, 3, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (114, 205, 9, 200.6, 3, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (115, 205, 2, 55.8, 10, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (116, 205, 13, 125.8, 3, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (117, 206, 19, 128.6, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (118, 207, 22, 65.3, 3, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (119, 207, 20, 9.2, 5, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (120, 208, 10, 37.5, 12, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (121, 208, 14, 65, 9, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (122, 208, 15, 40.2, 5, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (123, 209, 16, 51.5, 8, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (124, 209, 16, 54.9, 7, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (125, 167, 1, 80, 10, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (126, 210, 44, 332.5, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (127, 210, 43, 200, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (128, 210, 1, 84.5, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (129, 211, 23, 436, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (130, 211, 27, 85.4, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (131, 211, 38, 94.9, 3, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (132, 212, 29, 161.4, 4, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (133, 212, 38, 94.9, 3, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (134, 213, 37, 139.5, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (135, 213, 41, 38.3, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (136, 214, 42, 243.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (137, 214, 19, 126, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (138, 214, 28, 90.5, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (139, 215, 33, 211, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (140, 215, 35, 210, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (141, 216, 22, 65, 6, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (142, 217, 21, 210, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (143, 217, 28, 102, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (144, 218, 5, 54, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (145, 218, 34, 190, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (146, 218, 26, 128, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (147, 219, 35, 220, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (148, 219, 27, 87, 3, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (149, 220, 3, 101, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (150, 221, 40, 45, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (151, 221, 41, 70, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (152, 222, 30, 168, 4, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (153, 222, 36, 165, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (154, 223, 12, 84, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (155, 223, 3, 168, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (156, 224, 33, 211, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (157, 224, 38, 98, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (158, 225, 42, 256, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (159, 225, 44, 348, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (160, 225, 21, 91, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (161, 226, 18, 34.5, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (162, 226, 22, 69.5, 4, 0)
GO
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (163, 227, 30, 168, 4, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (164, 228, 3, 127, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (165, 228, 4, 34, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (166, 228, 28, 107, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (167, 229, 39, 56, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (168, 229, 43, 340, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (169, 229, 25, 348, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (170, 230, 37, 145, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (171, 230, 41, 71, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (172, 230, 21, 92, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (173, 231, 23, 458, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (174, 232, 36, 166, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (175, 232, 33, 225, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (176, 233, 26, 129, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (177, 234, 42, 259, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (178, 234, 41, 71, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (179, 235, 1, 88.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (180, 235, 40, 46.9, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (181, 235, 44, 349.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (182, 236, 22, 69.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (183, 237, 39, 56.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (184, 237, 41, 71.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (185, 238, 34, 194.9, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (186, 238, 26, 129.9, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (187, 238, 30, 169.9, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (188, 239, 17, 145.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (189, 239, 22, 69.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (190, 239, 30, 169.9, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (191, 240, 32, 103.9, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (192, 240, 35, 222.9, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (193, 241, 5, 104.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (194, 241, 8, 53.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (195, 241, 43, 349.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (196, 242, 39, 56.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (197, 242, 1, 88.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (198, 242, 40, 46.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (199, 242, 37, 146.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (200, 243, 26, 129.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (201, 243, 35, 222.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (202, 243, 31, 99.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (203, 244, 30, 169.9, 4, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (204, 244, 38, 99.9, 2, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (205, 245, 36, 168.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (206, 246, 25, 349.9, 1, 0)
INSERT [dbo].[DetallesFacturas] ([idDetalleFactura], [numeroFactura], [idArticulo], [precioVenta], [cantidad], [descuento]) VALUES (207, 247, 31, 99.9, 1, 0)
SET IDENTITY_INSERT [dbo].[DetallesFacturas] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([legajoEmpleado], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [fechaIngreso], [idTipoEmpleado], [calle], [altura], [idBarrio], [telefono], [email], [usuarios], [contrasena], [localidad], [provincia]) VALUES (8, N'Dario', N'Toscano', 1, 35689777, CAST(N'1990-07-27' AS Date), 1, CAST(N'2020-03-07' AS Date), 1, N'Chacabuco', 430124, 1, 351456987, N'tosca@gmail.com', N'toska', N'admin', 1, 5)
INSERT [dbo].[Empleados] ([legajoEmpleado], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [fechaIngreso], [idTipoEmpleado], [calle], [altura], [idBarrio], [telefono], [email], [usuarios], [contrasena], [localidad], [provincia]) VALUES (9, N'Maximiliano', N'Farias', 1, 33245897, CAST(N'1987-09-04' AS Date), 1, CAST(N'2020-03-07' AS Date), 1, N'Belardinelli', 123, 4, 351212547, N'maxicba@gmail.com', N'maxi', N'admin', 1, 5)
INSERT [dbo].[Empleados] ([legajoEmpleado], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [fechaIngreso], [idTipoEmpleado], [calle], [altura], [idBarrio], [telefono], [email], [usuarios], [contrasena], [localidad], [provincia]) VALUES (10, N'Valeria', N'Diaz', 1, 25222368, CAST(N'1980-01-27' AS Date), 2, CAST(N'2010-05-01' AS Date), 2, N'Duarte Quiroz', 1600, 2, 351698741, N'valDiaz@gmail.com', N'vale', N'123abc', 1, 5)
INSERT [dbo].[Empleados] ([legajoEmpleado], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [fechaIngreso], [idTipoEmpleado], [calle], [altura], [idBarrio], [telefono], [email], [usuarios], [contrasena], [localidad], [provincia]) VALUES (11, N'Raul', N'Rodriguez', 1, 30154789, CAST(N'1988-07-14' AS Date), 1, CAST(N'2018-10-15' AS Date), 3, N'Simon Bolivar', 950, 3, 351236985, N'rodRaul@Hotmail.com', N'raulo', N'123abc', 1, 5)
INSERT [dbo].[Empleados] ([legajoEmpleado], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [fechaIngreso], [idTipoEmpleado], [calle], [altura], [idBarrio], [telefono], [email], [usuarios], [contrasena], [localidad], [provincia]) VALUES (12, N'Alberto', N'Moreno', 1, 20147896, CAST(N'1975-05-20' AS Date), 1, CAST(N'2009-08-20' AS Date), 2, N'Colón', 430, 11, 351456987, N'alberto23@gmail.com', N'albert', N'123abc', 1, 5)
INSERT [dbo].[Empleados] ([legajoEmpleado], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [fechaIngreso], [idTipoEmpleado], [calle], [altura], [idBarrio], [telefono], [email], [usuarios], [contrasena], [localidad], [provincia]) VALUES (13, N'Camila', N'Garcia', 1, 354897112, CAST(N'1989-03-20' AS Date), 2, CAST(N'2020-05-08' AS Date), 3, N'Bilbao', 756, 9, 351269874, N'cam_40@hotmail.com', N'cami', N'123abc', 1, 5)
INSERT [dbo].[Empleados] ([legajoEmpleado], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [fechaIngreso], [idTipoEmpleado], [calle], [altura], [idBarrio], [telefono], [email], [usuarios], [contrasena], [localidad], [provincia]) VALUES (15, N'Erika', N'Stefani', 1, 35123458, CAST(N'1989-08-08' AS Date), 2, CAST(N'2020-03-07' AS Date), 1, N'Chascomus', 123, 12, 351269852, N'eri.stefani@gmail.com', N'eri', N'admin', 1, 5)
INSERT [dbo].[Empleados] ([legajoEmpleado], [nombre], [apellido], [idTipoDocumento], [NroDocumento], [FechaNacimiento], [idGenero], [fechaIngreso], [idTipoEmpleado], [calle], [altura], [idBarrio], [telefono], [email], [usuarios], [contrasena], [localidad], [provincia]) VALUES (24, N'Natalia', N'Prystupczuk', 1, 42052596, CAST(N'1999-07-12' AS Date), 2, CAST(N'2020-10-10' AS Date), 1, N'Chacabuco', 456, 1, 3515466589, N'natyp@gmail.com', N'nati', N'admin', 1, 5)
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[Facturas] ON 

INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (165, CAST(N'2015-01-03' AS Date), 11, 10, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (167, CAST(N'2015-05-21' AS Date), 22, 10, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (168, CAST(N'2015-06-15' AS Date), 23, 10, 1, 2, 21, 10)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (169, CAST(N'2015-09-28' AS Date), 23, 12, 1, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (170, CAST(N'2015-10-22' AS Date), 24, 10, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (171, CAST(N'2015-11-13' AS Date), 26, 12, 1, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (172, CAST(N'2015-11-23' AS Date), 26, 12, 1, 2, 21, 10)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (173, CAST(N'2016-01-05' AS Date), 25, 10, 3, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (174, CAST(N'2016-01-16' AS Date), 11, 11, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (175, CAST(N'2016-01-29' AS Date), 22, 11, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (176, CAST(N'2016-01-31' AS Date), 23, 12, 1, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (177, CAST(N'2016-02-25' AS Date), 25, 10, 3, 2, 21, 10)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (178, CAST(N'2016-06-20' AS Date), 23, 11, 1, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (179, CAST(N'2016-06-25' AS Date), 21, 13, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (180, CAST(N'2016-07-12' AS Date), 21, 12, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (181, CAST(N'2016-07-23' AS Date), 26, 13, 1, 1, 0, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (182, CAST(N'2016-08-19' AS Date), 23, 12, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (183, CAST(N'2016-08-23' AS Date), 21, 13, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (184, CAST(N'2016-09-10' AS Date), 25, 10, 3, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (185, CAST(N'2016-09-21' AS Date), 11, 12, 2, 2, 21, 10)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (186, CAST(N'2016-10-10' AS Date), 23, 11, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (187, CAST(N'2016-10-25' AS Date), 26, 11, 1, 1, 0, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (188, CAST(N'2017-02-05' AS Date), 27, 12, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (189, CAST(N'2017-02-25' AS Date), 27, 12, 2, 2, 21, 10)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (190, CAST(N'2017-03-10' AS Date), 28, 13, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (191, CAST(N'2017-03-16' AS Date), 23, 12, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (192, CAST(N'2017-04-16' AS Date), 27, 11, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (193, CAST(N'2017-04-23' AS Date), 11, 10, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (194, CAST(N'2017-04-28' AS Date), 26, 13, 1, 4, 0, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (195, CAST(N'2017-05-12' AS Date), 23, 13, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (196, CAST(N'2017-05-26' AS Date), 22, 12, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (197, CAST(N'2017-06-13' AS Date), 28, 10, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (198, CAST(N'2017-06-22' AS Date), 27, 13, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (199, CAST(N'2017-07-11' AS Date), 11, 12, 2, 4, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (200, CAST(N'2017-08-03' AS Date), 24, 12, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (201, CAST(N'2017-08-20' AS Date), 24, 10, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (202, CAST(N'2017-09-07' AS Date), 26, 13, 1, 1, 0, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (203, CAST(N'2017-09-23' AS Date), 22, 10, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (204, CAST(N'2017-10-08' AS Date), 27, 12, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (205, CAST(N'2017-10-29' AS Date), 21, 13, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (206, CAST(N'2017-11-19' AS Date), 28, 11, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (207, CAST(N'2017-11-29' AS Date), 11, 12, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (208, CAST(N'2017-12-04' AS Date), 11, 10, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (209, CAST(N'2017-12-21' AS Date), 27, 13, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (210, CAST(N'2018-03-10' AS Date), 22, 10, 2, 4, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (211, CAST(N'2018-04-25' AS Date), 28, 13, 2, 4, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (212, CAST(N'2018-04-29' AS Date), 11, 12, 2, 4, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (213, CAST(N'2018-05-23' AS Date), 24, 11, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (214, CAST(N'2018-06-12' AS Date), 28, 12, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (215, CAST(N'2018-07-25' AS Date), 21, 10, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (216, CAST(N'2018-08-13' AS Date), 22, 12, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (217, CAST(N'2018-10-19' AS Date), 27, 12, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (218, CAST(N'2018-11-09' AS Date), 25, 13, 3, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (219, CAST(N'2018-12-19' AS Date), 26, 12, 1, 3, 0, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (220, CAST(N'2019-02-01' AS Date), 21, 12, 2, 3, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (221, CAST(N'2019-03-05' AS Date), 22, 10, 2, 3, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (222, CAST(N'2019-03-26' AS Date), 11, 13, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (223, CAST(N'2019-04-08' AS Date), 26, 12, 1, 1, 0, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (224, CAST(N'2019-04-19' AS Date), 28, 11, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (225, CAST(N'2019-05-07' AS Date), 24, 11, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (226, CAST(N'2019-06-15' AS Date), 27, 13, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (227, CAST(N'2019-07-23' AS Date), 22, 11, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (228, CAST(N'2019-08-22' AS Date), 21, 13, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (229, CAST(N'2019-10-21' AS Date), 11, 12, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (230, CAST(N'2019-11-27' AS Date), 26, 12, 1, 1, 0, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (231, CAST(N'2019-12-22' AS Date), 28, 13, 2, 3, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (232, CAST(N'2020-02-02' AS Date), 27, 13, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (233, CAST(N'2020-02-13' AS Date), 24, 10, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (234, CAST(N'2020-12-22' AS Date), 28, 12, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (235, CAST(N'2020-03-12' AS Date), 11, 13, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (236, CAST(N'2020-04-10' AS Date), 22, 10, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (237, CAST(N'2020-05-21' AS Date), 26, 13, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (238, CAST(N'2020-05-23' AS Date), 21, 12, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (239, CAST(N'2020-06-11' AS Date), 27, 11, 2, 3, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (240, CAST(N'2020-06-22' AS Date), 27, 13, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (241, CAST(N'2020-07-19' AS Date), 21, 13, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (242, CAST(N'2020-08-14' AS Date), 25, 12, 3, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (243, CAST(N'2020-08-26' AS Date), 26, 12, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (244, CAST(N'2020-09-21' AS Date), 24, 10, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (245, CAST(N'2020-10-12' AS Date), 28, 12, 2, 2, 21, 10)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (246, CAST(N'2020-10-20' AS Date), 22, 12, 2, 1, 21, 0)
INSERT [dbo].[Facturas] ([numeroFactura], [fecha], [idCliente], [legajoEmpleado], [idTipoFactura], [idFormaPago], [iva], [recargo]) VALUES (247, CAST(N'2015-04-11' AS Date), 23, 11, 1, 1, 21, 0)
SET IDENTITY_INSERT [dbo].[Facturas] OFF
GO
SET IDENTITY_INSERT [dbo].[FormasPagos] ON 

INSERT [dbo].[FormasPagos] ([idFormaPago], [formaPago]) VALUES (1, N'EFECTIVO')
INSERT [dbo].[FormasPagos] ([idFormaPago], [formaPago]) VALUES (2, N'CON CHEQUE')
INSERT [dbo].[FormasPagos] ([idFormaPago], [formaPago]) VALUES (3, N'TARJETA CREDITO')
INSERT [dbo].[FormasPagos] ([idFormaPago], [formaPago]) VALUES (4, N'TARJETA DEBITO')
INSERT [dbo].[FormasPagos] ([idFormaPago], [formaPago]) VALUES (5, N'CUENTA CORRIENTE')
SET IDENTITY_INSERT [dbo].[FormasPagos] OFF
GO
SET IDENTITY_INSERT [dbo].[Generos] ON 

INSERT [dbo].[Generos] ([idGenero], [genero]) VALUES (1, N'Masculino')
INSERT [dbo].[Generos] ([idGenero], [genero]) VALUES (2, N'Femenino')
SET IDENTITY_INSERT [dbo].[Generos] OFF
GO
SET IDENTITY_INSERT [dbo].[Localidades] ON 

INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (1, N'CORDOBA')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (2, N'CARLOS PAZ')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (3, N'ADELIA MARIA')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (4, N'ALTA GRACIA')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (5, N'AGUA DE ORO')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (6, N'AGUA DEL TALA')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (7, N'AGUA PINTADA')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (8, N'ALEJANDRO ROCA')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (9, N'ARIAS')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (10, N'ARROYO CABRAL')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (11, N'ARROYO LA HIGUERA')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (12, N'ASCOCHINGA')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (13, N'BAJO DE FERNANDEZ')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (14, N'BAJO DEL CARMEN')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (15, N'BAJO GRANDE')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (16, N'BAJO HONDO')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (17, N'BAJO LINDO')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (18, N'BARRIO DEAN FUNES')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (19, N'BARRIO LA FERIA')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (20, N'BO FLORES GUARNICION AEREA')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (21, N'CAJON DEL RIO')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (22, N'CALASUYA')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (23, N'CAMPO BANDILLO')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (24, N'CAMPO LOS ZORROS')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (25, N'CANDELARIA SUR')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (26, N'CAPILLA DE SITON')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (27, N'CAPILLA LA ESPERANZA')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (28, N'CASAS VEJAS')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (29, N'CASEROS ESTE')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (30, N'CA?ADA DE CUEVAS')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (31, N'CA?ADA DEL TALA')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (32, N'CA?ADA VERDE')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (33, N'CERRO PELADO')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (34, N'CHARACATO')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (35, N'CHA?ARIACO')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (36, N'CHIPITIN')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (37, N'CHUA')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (38, N'CHURQUI CA?ADA')
INSERT [dbo].[Localidades] ([idLocalidad], [localidad]) VALUES (39, N'COLAZO')
SET IDENTITY_INSERT [dbo].[Localidades] OFF
GO
SET IDENTITY_INSERT [dbo].[Lotes] ON 

INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (1, CAST(N'2020-11-06' AS Date), CAST(N'2020-05-06' AS Date), 1)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (2, CAST(N'2020-11-06' AS Date), CAST(N'2020-04-06' AS Date), 2)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (3, CAST(N'2020-12-04' AS Date), CAST(N'2020-02-06' AS Date), 3)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (4, CAST(N'2020-12-01' AS Date), CAST(N'2020-02-08' AS Date), 4)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (5, CAST(N'2020-11-20' AS Date), CAST(N'2019-09-04' AS Date), 5)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (6, CAST(N'2022-05-14' AS Date), CAST(N'2019-05-06' AS Date), 6)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (7, CAST(N'2022-04-21' AS Date), CAST(N'2019-04-03' AS Date), 7)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (8, CAST(N'2021-03-06' AS Date), CAST(N'2019-12-15' AS Date), 8)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (9, CAST(N'2025-05-12' AS Date), CAST(N'2019-05-06' AS Date), 9)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (10, CAST(N'2024-11-01' AS Date), CAST(N'2029-05-06' AS Date), 10)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (11, CAST(N'2023-06-11' AS Date), CAST(N'2020-06-11' AS Date), 11)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (12, CAST(N'2023-06-11' AS Date), CAST(N'2020-06-11' AS Date), 12)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (13, CAST(N'2024-05-06' AS Date), CAST(N'2020-09-03' AS Date), 13)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (14, CAST(N'2023-11-07' AS Date), CAST(N'2020-10-07' AS Date), 14)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (15, CAST(N'2023-10-04' AS Date), CAST(N'2020-03-06' AS Date), 15)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (16, CAST(N'2023-03-03' AS Date), CAST(N'2020-03-03' AS Date), 16)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (17, CAST(N'2022-01-06' AS Date), CAST(N'2020-01-06' AS Date), 17)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (18, CAST(N'2022-11-12' AS Date), CAST(N'2020-05-12' AS Date), 18)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (19, CAST(N'2021-11-25' AS Date), CAST(N'2020-11-25' AS Date), 19)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (20, CAST(N'2021-08-13' AS Date), CAST(N'2020-07-13' AS Date), 20)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (21, CAST(N'2023-02-06' AS Date), CAST(N'2020-02-06' AS Date), 21)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (22, CAST(N'2023-05-06' AS Date), CAST(N'2020-05-10' AS Date), 22)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (23, CAST(N'2021-06-02' AS Date), CAST(N'2020-06-02' AS Date), 23)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (24, CAST(N'2023-05-14' AS Date), CAST(N'2020-05-13' AS Date), 24)
INSERT [dbo].[Lotes] ([idLote], [fechaVencimiento], [fechaElaboracion], [idArticulo]) VALUES (25, CAST(N'2023-11-06' AS Date), CAST(N'2020-05-06' AS Date), 25)
SET IDENTITY_INSERT [dbo].[Lotes] OFF
GO
SET IDENTITY_INSERT [dbo].[Marcas] ON 

INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (1, N'Lactal')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (2, N'Bimbo')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (3, N'Valente')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (4, N'Preferido')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (5, N'Fargo')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (6, N'Ideal')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (7, N'Cocinero')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (8, N'Natura')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (9, N'Hellman´s')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (10, N'Celusal')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (11, N'Alicante')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (12, N'Inalpa')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (13, N'Cumana')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (14, N'Arcor')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (15, N'Bahia')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (16, N'La Campagnola')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (17, N'Presto Pronta')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (18, N'Florencia')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (19, N'Pureza')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (20, N'Egran')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (21, N'Lucceti')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (22, N'Dos Hermanos')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (23, N'Ricatto')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (24, N'Gallo')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (25, N'Mtarazzo')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (26, N'Knor')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (27, N'Quaker')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (28, N'Exquisita')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (29, N'Alicante')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (30, N'Baggio')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (31, N'Bc')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (32, N'Tang')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (33, N'Ades')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (34, N'Awafrut')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (35, N'H2OH')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (36, N'Eco de los Andes')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (37, N'Ferntet')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (38, N'Gancia')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (39, N'Campari')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (40, N'Coca Cola')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (41, N'Pepsi')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (42, N'Pritty')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (43, N'Seven up')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (44, N'Fanta')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (45, N'Stella Artois')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (46, N'Corona')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (47, N'Patagonia')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (48, N'Andes')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (49, N'Red Bull')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (50, N'Powerade')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (51, N'Dadá')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (52, N'Santa Julia')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (53, N'Benjamin')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (54, N'Elementos')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (55, N'Swift')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (56, N'Granja del Sol')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (57, N'Mc Cain')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (58, N'Ilolay')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (59, N'Manfrey')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (60, N'La Serenisima')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (61, N'Nestlé')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (62, N'La Virginia')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (63, N'Nesquic')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (64, N'Dolca')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (65, N'Hileret')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (66, N'Playadito')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (67, N'Lays')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (68, N'Pehuamar')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (69, N'Twistos')
INSERT [dbo].[Marcas] ([idMarca], [nombreMarca]) VALUES (70, N'Branca')
SET IDENTITY_INSERT [dbo].[Marcas] OFF
GO
SET IDENTITY_INSERT [dbo].[Presentaciones] ON 

INSERT [dbo].[Presentaciones] ([idPresentacion], [nombrePresentacion], [descripcion]) VALUES (1, N'Und', N'Unidad')
INSERT [dbo].[Presentaciones] ([idPresentacion], [nombrePresentacion], [descripcion]) VALUES (2, N'Lt', N'Litro')
INSERT [dbo].[Presentaciones] ([idPresentacion], [nombrePresentacion], [descripcion]) VALUES (3, N'Kg', N'Kilogramos')
INSERT [dbo].[Presentaciones] ([idPresentacion], [nombrePresentacion], [descripcion]) VALUES (4, N'Gr', N'Gramos')
INSERT [dbo].[Presentaciones] ([idPresentacion], [nombrePresentacion], [descripcion]) VALUES (5, N'Ml', N'Mililitros')
SET IDENTITY_INSERT [dbo].[Presentaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincias] ON 

INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (1, N'BUENOS AIRES')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (2, N'CATAMARCA')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (3, N'CHACO')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (4, N'CHUBUT')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (5, N'CORDOBA')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (6, N'CORRIENTES')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (7, N'ENTRE RIOS')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (8, N'FORMOSA')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (9, N'JUJUY')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (10, N'LA PAMPA')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (11, N'LA RIOJA')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (12, N'MENDOZA')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (13, N'MISIONES')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (14, N'NEUQUEN')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (15, N'RIO NEGRO')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (16, N'SALTA')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (17, N'SAN JUAN')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (18, N'SAN LUIS')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (19, N'SANTA CRUZ')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (20, N'SANTA FE')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (21, N'SANTIAGO DEL ESTERO')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (22, N'TIERRA DEL FUEGO')
INSERT [dbo].[Provincias] ([idProvincia], [provincia]) VALUES (23, N'TUCUMAN')
SET IDENTITY_INSERT [dbo].[Provincias] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposDocumentos] ON 

INSERT [dbo].[TiposDocumentos] ([idTipoDocumento], [tipoDocumento]) VALUES (1, N'DNI')
INSERT [dbo].[TiposDocumentos] ([idTipoDocumento], [tipoDocumento]) VALUES (2, N'LC')
INSERT [dbo].[TiposDocumentos] ([idTipoDocumento], [tipoDocumento]) VALUES (3, N'LE')
INSERT [dbo].[TiposDocumentos] ([idTipoDocumento], [tipoDocumento]) VALUES (4, N'PASAPORTE')
SET IDENTITY_INSERT [dbo].[TiposDocumentos] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposEmpleados] ON 

INSERT [dbo].[TiposEmpleados] ([idTipoEmpleado], [tipoEmpleado]) VALUES (1, N'ADMINISTRADOR')
INSERT [dbo].[TiposEmpleados] ([idTipoEmpleado], [tipoEmpleado]) VALUES (2, N'ENCARGADO')
INSERT [dbo].[TiposEmpleados] ([idTipoEmpleado], [tipoEmpleado]) VALUES (3, N'VENDEDOR')
SET IDENTITY_INSERT [dbo].[TiposEmpleados] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposFacturas] ON 

INSERT [dbo].[TiposFacturas] ([idTipoFactura], [tipoFactura]) VALUES (1, N'factura A')
INSERT [dbo].[TiposFacturas] ([idTipoFactura], [tipoFactura]) VALUES (2, N'factura B')
INSERT [dbo].[TiposFacturas] ([idTipoFactura], [tipoFactura]) VALUES (3, N'factura C')
SET IDENTITY_INSERT [dbo].[TiposFacturas] OFF
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [fkArticulos_Categorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([idCategoria])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [fkArticulos_Categorias]
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [fkArticulos_Marcas] FOREIGN KEY([idMarca])
REFERENCES [dbo].[Marcas] ([idMarca])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [fkArticulos_Marcas]
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [fkArticulos_Presentaciones] FOREIGN KEY([idPresentacion])
REFERENCES [dbo].[Presentaciones] ([idPresentacion])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [fkArticulos_Presentaciones]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [fk_clientes_localidades] FOREIGN KEY([localidad])
REFERENCES [dbo].[Localidades] ([idLocalidad])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [fk_clientes_localidades]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [fk_clientes_provincias] FOREIGN KEY([provincia])
REFERENCES [dbo].[Provincias] ([idProvincia])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [fk_clientes_provincias]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [fkClientes_Barrios] FOREIGN KEY([idBarrio])
REFERENCES [dbo].[Barrios] ([idBarrio])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [fkClientes_Barrios]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [fkClientes_Genero] FOREIGN KEY([idGenero])
REFERENCES [dbo].[Generos] ([idGenero])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [fkClientes_Genero]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [fkClientes_TiposDocumentos] FOREIGN KEY([idTipoDocumento])
REFERENCES [dbo].[TiposDocumentos] ([idTipoDocumento])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [fkClientes_TiposDocumentos]
GO
ALTER TABLE [dbo].[DetallesFacturas]  WITH CHECK ADD  CONSTRAINT [fkDetallesFacturas_Articulos] FOREIGN KEY([idArticulo])
REFERENCES [dbo].[Articulos] ([idArticulo])
GO
ALTER TABLE [dbo].[DetallesFacturas] CHECK CONSTRAINT [fkDetallesFacturas_Articulos]
GO
ALTER TABLE [dbo].[DetallesFacturas]  WITH CHECK ADD  CONSTRAINT [fkDetallesFacturas_Facturas] FOREIGN KEY([numeroFactura])
REFERENCES [dbo].[Facturas] ([numeroFactura])
GO
ALTER TABLE [dbo].[DetallesFacturas] CHECK CONSTRAINT [fkDetallesFacturas_Facturas]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [fk_empleados_localidades] FOREIGN KEY([localidad])
REFERENCES [dbo].[Localidades] ([idLocalidad])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [fk_empleados_localidades]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [fk_empleados_provincias] FOREIGN KEY([provincia])
REFERENCES [dbo].[Provincias] ([idProvincia])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [fk_empleados_provincias]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [fkEmpleados_Barrios] FOREIGN KEY([idBarrio])
REFERENCES [dbo].[Barrios] ([idBarrio])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [fkEmpleados_Barrios]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [fkEmpleados_Genero] FOREIGN KEY([idGenero])
REFERENCES [dbo].[Generos] ([idGenero])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [fkEmpleados_Genero]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [fkEmpleados_TiposDocumentos] FOREIGN KEY([idTipoDocumento])
REFERENCES [dbo].[TiposDocumentos] ([idTipoDocumento])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [fkEmpleados_TiposDocumentos]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [fkEmpleados_TiposEmpleados] FOREIGN KEY([idTipoEmpleado])
REFERENCES [dbo].[TiposEmpleados] ([idTipoEmpleado])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [fkEmpleados_TiposEmpleados]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [fkFacturas_Clientes] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [fkFacturas_Clientes]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [fkFacturas_Empleados] FOREIGN KEY([legajoEmpleado])
REFERENCES [dbo].[Empleados] ([legajoEmpleado])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [fkFacturas_Empleados]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [fkFacturas_FormasPagos] FOREIGN KEY([idFormaPago])
REFERENCES [dbo].[FormasPagos] ([idFormaPago])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [fkFacturas_FormasPagos]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [fkFacturas_TiposFacturas] FOREIGN KEY([idTipoFactura])
REFERENCES [dbo].[TiposFacturas] ([idTipoFactura])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [fkFacturas_TiposFacturas]
GO
ALTER TABLE [dbo].[Lotes]  WITH CHECK ADD  CONSTRAINT [fkLotes_Articulos] FOREIGN KEY([idArticulo])
REFERENCES [dbo].[Articulos] ([idArticulo])
GO
ALTER TABLE [dbo].[Lotes] CHECK CONSTRAINT [fkLotes_Articulos]
GO
/****** Object:  StoredProcedure [dbo].[sp_borrarArticulos]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_borrarArticulos]
@id_articulo int
as 
delete Articulos where idArticulo=@id_articulo
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarClientes]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EliminarClientes]
@numeroDocu int
as
delete Clientes where NroDocumento=@numeroDocu
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarEmpleado]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EliminarEmpleado]
@numeroDoc int
as
delete Empleados where @numeroDoc=NroDocumento
GO
/****** Object:  StoredProcedure [dbo].[sp_GraficoVentas]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GraficoVentas]
as
select year(fecha)Año, count(*)CantidadVentas
from facturas
group by year(fecha)
order by 1 asc
GO
/****** Object:  StoredProcedure [dbo].[sp_insertarArticulos]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_insertarArticulos]
@nombre varchar (50),
@descripcion varchar (50),
@idmarca int,
@idcategoria int,
@idpresentacion int,
@precioVenta float,
@stock int
as
if exists(select *from Articulos
where nombre=@nombre
and idMarca=@idmarca)
begin 
print ('ya existe el articulo ')
return
end
begin 
insert into Articulos values
(@nombre ,@descripcion ,@idmarca ,@idcategoria,@idpresentacion,@precioVenta,@stock)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insertarArticulosyLotes]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_insertarArticulosyLotes]
@nombre varchar (50),
@descripcion varchar (50),
@idmarca int,
@idcategoria int,
@idpresentacion int,
@precioVenta float,
@stock int,
@vencimiento date,
@elaboracion date,
@idArticulo int
as
if exists(select *from Articulos
where nombre=@nombre
and idMarca=@idmarca)
begin 
print ('ya existe el articulo ')
return
end
begin 
insert into Articulos values
(@nombre ,@descripcion ,@idmarca ,@idcategoria,@idpresentacion,@precioVenta,@stock)
end
begin
insert into Lotes 
values (@vencimiento,@elaboracion,@idArticulo)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarClientes]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsertarClientes]
@nombre varchar(50),
@apellido varchar(50),
@idTipoDoc int,
@numeroDoc int,
@fechaNac date,
@idGenero int,
@calle varchar(100),
@altura int,
@idBarrio int,
@telefono bigint,
@email varchar(100),
@idlocalidad int,
@idprovincia int
as
if exists (select*from Clientes where NroDocumento=@numeroDoc)
begin
print('Ya existe un cliente con numero de documento: '+ convert(varchar(50),@numeroDoc))
return
end
begin
insert into Clientes values (@nombre,@apellido,@idTipoDoc,@numeroDoc,@fechaNac,@idGenero,@calle,@altura,@idBarrio,@telefono,@email,@idlocalidad,@idprovincia)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarEmpleado]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsertarEmpleado]
@nombre varchar(50),
@apellido varchar(50),
@idTipoDoc int,
@numeroDoc int,
@fechaNac date,
@idGenero int,
@fechaIngreso date,
@idTipoEmpleado int,
@calle varchar(100),
@altura int,
@idBarrio int,
@telefono bigint,
@email varchar(100),
@usuario varchar(50),
@contrasena varchar(12),
@localidad int,
@provincia int
as
if exists (select*from Empleados where NroDocumento=@numeroDoc)
begin
print('Ya existe un empleado con numero de documento: '+ convert(varchar(50),@numeroDoc))
return
end
begin
insert into Empleados values (@nombre,@apellido,@idTipoDoc,@numeroDoc,@fechaNac,@idGenero,@fechaIngreso,@idTipoEmpleado,@calle,@altura,@idBarrio,@telefono,@email,@usuario,@contrasena,@localidad,@provincia)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Login]
@usuario varchar(20),
@contrasena varchar(12)
as
select legajoEmpleado, nombre, apellido, t.tipoEmpleado
from Empleados e join TiposEmpleados t
on e.idTipoEmpleado=t.idTipoEmpleado
where usuarios = @usuario and contrasena=@contrasena
GO
/****** Object:  StoredProcedure [dbo].[sp_modificarArticulos]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_modificarArticulos]
@nombre varchar (50),
@descripcion varchar (50),
@idmarca int,
@idcategoria int,
@idpresentacion int,
@precioVenta float,
@stock int,
@id_Articulo int
as
update Articulos set  nombre=@nombre,
		           descripcion=@descripcion,
			       idMarca=@idmarca,
			       idCategoria=@idcategoria,
			       idPresentacion=@idpresentacion,
			       precioVenta=@precioVenta,
			       Stock=@stock
where idArticulo=@id_Articulo
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarClientes]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ModificarClientes]
@nombre varchar(50),
@apellido varchar(50),
@idTipoDoc int,
@fechaNac date,
@idGenerto int,
@calle varchar(100),
@altura int,
@idBarrio int,
@telefono bigint,
@email varchar(100),
@idlocalidad int,
@idprovincia int,
@numeroDoc int
as
update Clientes set nombre=@nombre,
apellido=@apellido,
idTipoDocumento=@idTipoDoc,
FechaNacimiento=@fechaNac,
idGenero=@idGenerto,
calle=@calle,
altura=@altura,
idBarrio=@idBarrio,
telefono=@telefono,
email=@email,
localidad=@idlocalidad,
provincia=@idprovincia
where NroDocumento=@numeroDoc
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarEmpleado]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ModificarEmpleado]
@nombre varchar(50),
@apellido varchar(50),
@idTipoDoc int,
@fechaNac date,
@idGenero int,
@fechaIngreso date,
@idTipoEmpleado int,
@calle varchar(100),
@altura int,
@idBarrio int,
@telefono bigint,
@email varchar(100),
@localidad int,
@provincia int,
@usuario varchar(50),
@contrasena varchar(12),
@numeroDoc int
as
update Empleados set nombre=@nombre,
apellido=@apellido,
idTipoDocumento=@idTipoDoc,
FechaNacimiento=@fechaNac,
idGenero=@idGenero,
fechaIngreso=@fechaIngreso,
idTipoEmpleado=@idTipoEmpleado,
calle=@calle,
altura=@altura ,
idBarrio=@idBarrio,
telefono=@telefono,
email=@email,
localidad=@localidad,
provincia=@provincia,
usuarios=@usuario,
contrasena=@contrasena
where NroDocumento=@numeroDoc
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarArticulos]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_MostrarArticulos]
as
SELECT nombre Articulo, a.descripcion Descripcion, m.nombreMarca Marca, c.nombreCategoria Categoria, p.descripcion Presentacion,
precioVenta Precio, stock Stock
from Marcas m join Articulos a
on a.idMarca=m.idMarca join Categorias c
on c.idCategoria=a.idCategoria join Presentaciones p
on p.idPresentacion=a.idPresentacion
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarClientes]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_MostrarClientes]
as
select c.nombre+' '+c.apellido Cliente, td.tipoDocumento Tipo_de_documento,
c.NroDocumento Documento, FechaNacimiento Fecha_de_Nacimiento, g.genero Genero,
c.calle+' '+ str(c.altura) Direccion, b.barrio Barrio,c.telefono Telefono,l.localidad Localidad,
p.provincia Provincia, c.email Email 
from TiposDocumentos td join clientes c
on td.idTipoDocumento=c.idTipoDocumento join Generos g
on g.idGenero=c.idGenero join Barrios b
on b.idBarrio=c.idBarrio join Localidades l
on l.idLocalidad=c.localidad join Provincias p
on p.idProvincia=c.provincia

GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarEmpleado]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_MostrarEmpleado]
as
select e.nombre+' '+e.apellido Empleado, td.tipoDocumento Tipo_de_documento,
e.NroDocumento Documento, FechaNacimiento Fecha_de_Nacimiento, G.genero Genero, e.fechaIngreso Fecha_de_Ingreso,
te.tipoEmpleado Tipo_de_Empleado,e.calle+' '+ str(e.altura) Direccion, b.barrio Barrio,e.telefono Telefono,
e.email Email, e.usuarios Usuario, e.contrasena Contraseña
from TiposDocumentos td join Empleados e
on td.idTipoDocumento=e.idTipoDocumento join Generos g
on g.idGenero=e.idGenero join Barrios b
on b.idBarrio=e.idBarrio join TiposEmpleados te
on te.idTipoEmpleado=e.idTipoEmpleado 
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarCliente]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ValidarCliente]
@documento int
--@email varchar(100)
as
select * from Clientes
where NroDocumento = @documento
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarEmpleado]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ValidarEmpleado]
@documento int,
@email varchar(50)
as
select * from Empleados
where NroDocumento = @documento or email=@email
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_articulo_codigo]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spbuscar_articulo_codigo]
@textobuscar varchar(50)
as
select idArticulo Codigo ,nombre Articulo, a.descripcion Descripcion, m.nombreMarca Marca, c.nombreCategoria Categoria, p.descripcion Presentacion,
precioVenta Precio, stock Stock
from Marcas m join Articulos a
on a.idMarca=m.idMarca join Categorias c
on c.idCategoria=a.idCategoria join Presentaciones p
on p.idPresentacion=a.idPresentacion

where idArticulo like @textobuscar + '%'
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_articulo_nombre]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_articulo_nombre]
@textobuscar varchar(50)
as
select nombre Articulo, a.descripcion Descripcion, m.nombreMarca Marca, c.nombreCategoria Categoria, p.descripcion Presentacion,
precioVenta Precio, stock Stock
from Marcas m join Articulos a
on a.idMarca=m.idMarca join Categorias c
on c.idCategoria=a.idCategoria join Presentaciones p
on p.idPresentacion=a.idPresentacion

where nombre like @textobuscar + '%'
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_cliente_documento]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spbuscar_cliente_documento]
@textobuscar varchar(50)
as
select c.nombre+' '+c.apellido Cliente,
c.NroDocumento Documento, FechaNacimiento 'Fecha de Nacimiento', g.genero Genero,
c.calle+' '+ str(c.altura) Direccion, b.barrio Barrio,c.telefono Telefono,c.email Email 
from TiposDocumentos td join clientes c
on td.idTipoDocumento=c.idTipoDocumento join Generos g
on g.idGenero=c.idGenero join Barrios b
on b.idBarrio=c.idBarrio 
where NroDocumento like @textobuscar + '%'
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_cliente_nombre]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spbuscar_cliente_nombre]
@textobuscar varchar(50)
as
select c.nombre+' '+c.apellido Cliente,
c.NroDocumento Documento, FechaNacimiento 'Fecha de Nacimiento', g.genero Genero,
c.calle+' '+ str(c.altura) Direccion, b.barrio Barrio,c.telefono Telefono,c.email Email 
from TiposDocumentos td join clientes c
on td.idTipoDocumento=c.idTipoDocumento join Generos g
on g.idGenero=c.idGenero join Barrios b
on b.idBarrio=c.idBarrio 
where nombre like @textobuscar + '%'
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_empleado_documento]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_empleado_documento]
@textobuscar varchar(50)
as
select e.nombre+' '+e.apellido Empleado,
e.NroDocumento Documento,e.fechaIngreso 'Fecha de Ingreso',
te.tipoEmpleado 'Tipo de Empleado',e.calle+' '+ str(e.altura) Direccion, b.barrio Barrio,e.telefono Telefono,
e.email Email, e.usuarios Usuario, e.contrasena Contraseña
from  Empleados e join Barrios b
on b.idBarrio=e.idBarrio join TiposEmpleados te
on te.idTipoEmpleado=e.idTipoEmpleado 
where NroDocumento like @textobuscar + '%'
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_empleado_nombre]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spbuscar_empleado_nombre]
@textobuscar varchar(50)
as
select e.nombre+' '+e.apellido Empleado,
e.NroDocumento Documento,e.fechaIngreso 'Fecha de Ingreso',
te.tipoEmpleado 'Tipo de Empleado',e.calle+' '+ str(e.altura) Direccion, b.barrio Barrio,e.telefono Telefono,
e.email Email, e.usuarios Usuario, e.contrasena Contraseña
from  Empleados e join Barrios b
on b.idBarrio=e.idBarrio join TiposEmpleados te
on te.idTipoEmpleado=e.idTipoEmpleado 
where nombre like @textobuscar + '%'
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_producto_nombre]    Script Date: 11/11/2020 21:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_producto_nombre]
@textobuscar varchar(50)
as
select e.nombre+' '+e.apellido Empleado,
e.NroDocumento Documento,e.fechaIngreso 'Fecha de Ingreso',
te.tipoEmpleado 'Tipo de Empleado',e.calle+' '+ str(e.altura) Direccion, b.barrio Barrio,e.telefono Telefono,
e.email Email, e.usuarios Usuario, e.contrasena Contraseña
from  Empleados e join Barrios b
on b.idBarrio=e.idBarrio join TiposEmpleados te
on te.idTipoEmpleado=e.idTipoEmpleado 
where nombre like @textobuscar + '%'
GO
USE [master]
GO
ALTER DATABASE [SistemaVentasIntegrador] SET  READ_WRITE 
GO
