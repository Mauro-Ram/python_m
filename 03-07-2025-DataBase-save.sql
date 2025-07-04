USE [master]
GO
/****** Object:  Database [db_ab7f1d_dbthefuentes]    Script Date: 03/07/2025 05:12:09 p. m. ******/
CREATE DATABASE [db_ab7f1d_dbthefuentes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_ab7f1d_dbthefuentes_Data', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_ab7f1d_dbthefuentes_DATA.mdf' , SIZE = 11200KB , MAXSIZE = 1024000KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'db_ab7f1d_dbthefuentes_Log', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_ab7f1d_dbthefuentes_Log.LDF' , SIZE = 3072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_ab7f1d_dbthefuentes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET  MULTI_USER 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_ab7f1d_dbthefuentes]
GO
/****** Object:  User [ExecuteProcedures]    Script Date: 03/07/2025 05:12:10 p. m. ******/
CREATE USER [ExecuteProcedures] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [db_executor]    Script Date: 03/07/2025 05:12:10 p. m. ******/
CREATE ROLE [db_executor]
GO
ALTER ROLE [db_executor] ADD MEMBER [ExecuteProcedures]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 03/07/2025 05:12:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[id_usuario] [bigint] IDENTITY(1,1) NOT NULL,
	[num_id] [nvarchar](10) NOT NULL,
	[NombreUsuario] [nvarchar](75) NOT NULL,
	[PasswordHash] [nvarchar](200) NULL,
	[nombre] [nvarchar](100) NULL,
	[apellido] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_nacimiento] [date] NULL,
	[foto_perfil] [nvarchar](max) NULL,
	[foto_portada] [nvarchar](max) NULL,
	[password_temp] [bit] NULL,
	[Token] [nvarchar](250) NULL,
	[two_factor] [bit] NULL,
	[activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Usuarios]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Usuarios]
AS
SELECT        id_usuario, num_id, NombreUsuario, PasswordHash, nombre, apellido, activo, Email, fecha_creacion, fecha_nacimiento, foto_perfil, foto_portada, password_temp, Token, two_factor
FROM            dbo.USUARIOS
GO
/****** Object:  Table [dbo].[ACCIONES]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCIONES](
	[id_accion] [int] IDENTITY(1,1) NOT NULL,
	[nom_accion] [nvarchar](100) NULL,
	[estado] [nvarchar](100) NULL,
	[descripcion] [nvarchar](100) NULL,
 CONSTRAINT [PK__ACCIONES__387C45612318BB09] PRIMARY KEY CLUSTERED 
(
	[id_accion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACTIVIDADES]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACTIVIDADES](
	[id_actividad] [int] IDENTITY(1,1) NOT NULL,
	[id_accion] [int] NULL,
	[id_rol] [int] NULL,
 CONSTRAINT [PK__ACTIVIDA__DCD34883190F45DF] PRIMARY KEY CLUSTERED 
(
	[id_actividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[RFC] [nvarchar](20) NOT NULL,
	[Direccion] [nvarchar](200) NULL,
	[Telefono] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioCreacion] [nvarchar](50) NULL,
	[UsuarioModificacion] [nvarchar](50) NULL,
	[Estatus] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RFC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[nombre_estado] [varchar](100) NOT NULL,
	[abreviatura_estado] [varchar](10) NULL,
	[activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_Almacenes]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_Almacenes](
	[id_almacen] [int] IDENTITY(1,1) NOT NULL,
	[nombre_almacen] [varchar](100) NOT NULL,
	[direccion] [varchar](255) NULL,
	[responsable_id] [bigint] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[id_estado] [int] NULL,
	[id_proyecto] [int] NULL,
	[activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre_almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_Categorias_Producto]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_Categorias_Producto](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre_categoria] [varchar](100) NOT NULL,
	[descripcion] [varchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_Checklist_Maquinaria]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_Checklist_Maquinaria](
	[id_checklist] [int] IDENTITY(1,1) NOT NULL,
	[id_maquina] [int] NOT NULL,
	[fecha_checklist] [datetime] NOT NULL,
	[id_operador_realiza] [int] NOT NULL,
	[nivel_aceite_motor_ok] [bit] NOT NULL,
	[nivel_aceite_transmision_ok] [bit] NOT NULL,
	[nivel_aceite_hidraulico_ok] [bit] NOT NULL,
	[estado_neumaticos_ok] [bit] NOT NULL,
	[luces_funcionando_ok] [bit] NOT NULL,
	[observaciones_generales] [varchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_checklist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_Detalle_Movimiento]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_Detalle_Movimiento](
	[id_detalle_movimiento] [int] IDENTITY(1,1) NOT NULL,
	[id_movimiento] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad_solicitada] [decimal](10, 2) NULL,
	[cantidad_movida] [decimal](10, 2) NOT NULL,
	[id_unidad_medida_movimiento] [int] NOT NULL,
	[ubicacion_especifica_almacen] [varchar](100) NULL,
	[observaciones_item] [varchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle_movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_Estados]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_Estados](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[nombre_estado] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_Historial_Actividad_Maquinaria]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_Historial_Actividad_Maquinaria](
	[id_registro] [int] IDENTITY(1,1) NOT NULL,
	[id_maquina] [int] NOT NULL,
	[fecha_actividad] [datetime] NOT NULL,
	[id_operador_chofer] [int] NOT NULL,
	[id_proyecto_obra] [int] NULL,
	[tipo_actividad] [varchar](100) NOT NULL,
	[horas_trabajadas] [decimal](6, 2) NOT NULL,
	[observaciones_actividad] [varchar](max) NULL,
	[firma_operador_digital] [bit] NOT NULL,
	[id_trabajador_empresa_confirma] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_registro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_Historial_Mantenimiento_Reparacion_Maquinaria]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_Historial_Mantenimiento_Reparacion_Maquinaria](
	[id_registro] [int] IDENTITY(1,1) NOT NULL,
	[id_maquina] [int] NOT NULL,
	[fecha_intervencion] [datetime] NOT NULL,
	[tipo_intervencion] [varchar](50) NOT NULL,
	[descripcion_trabajo] [varchar](max) NOT NULL,
	[costo_estimado] [decimal](10, 2) NULL,
	[realizado_por] [varchar](255) NULL,
	[proxima_intervencion_sugerida] [date] NULL,
	[observaciones] [varchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_registro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_Maquinaria]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_Maquinaria](
	[id_maquina] [int] IDENTITY(1,1) NOT NULL,
	[nombre_maquina] [varchar](100) NOT NULL,
	[numero_identificador] [varchar](50) NOT NULL,
	[descripcion_detallada] [varchar](max) NULL,
	[id_almacen_actual] [int] NULL,
	[id_proyecto_actual] [int] NULL,
	[operador_asignado_id] [int] NULL,
	[fecha_adquisicion] [date] NOT NULL,
	[estado_operacional] [varchar](50) NOT NULL,
	[observaciones] [varchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_maquina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[numero_identificador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_Movimientos_Inventario]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_Movimientos_Inventario](
	[id_movimiento] [int] IDENTITY(1,1) NOT NULL,
	[folio_documento] [varchar](50) NOT NULL,
	[fecha_movimiento] [datetime] NOT NULL,
	[tipo_movimiento] [varchar](50) NOT NULL,
	[id_almacen_origen] [int] NULL,
	[id_almacen_destino] [int] NULL,
	[id_proyecto_obra] [int] NULL,
	[id_persona_entrega] [int] NOT NULL,
	[id_persona_recibe] [int] NOT NULL,
	[id_persona_autoriza] [int] NULL,
	[proposito_uso] [varchar](max) NULL,
	[observaciones] [varchar](max) NULL,
	[confirmacion_entrega] [bit] NOT NULL,
	[fecha_confirmacion] [datetime] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[folio_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_Perdidas_Robos]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_Perdidas_Robos](
	[id_perdida] [int] IDENTITY(1,1) NOT NULL,
	[fecha_perdida] [datetime] NOT NULL,
	[tipo_item_perdido] [varchar](50) NOT NULL,
	[id_referencia_item_perdido] [int] NOT NULL,
	[id_persona_responsable] [int] NULL,
	[descripcion_perdida] [varchar](max) NOT NULL,
	[causa_probable] [varchar](100) NULL,
	[valor_estimado_recuperacion] [decimal](10, 2) NULL,
	[id_persona_reporta] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_perdida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_Productos]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_Productos](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[codigo_sku] [varchar](50) NOT NULL,
	[nombre_producto] [varchar](255) NOT NULL,
	[descripcion] [varchar](max) NULL,
	[id_unidad_medida_base] [int] NOT NULL,
	[es_consumible] [bit] NOT NULL,
	[id_categoria] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[precio_unitario] [decimal](10, 2) NOT NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[codigo_sku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_Stock_Actual]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_Stock_Actual](
	[id_stock] [int] IDENTITY(1,1) NOT NULL,
	[id_almacen] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad_actual] [decimal](10, 2) NOT NULL,
	[id_unidad_medida] [int] NOT NULL,
	[ultima_actualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_inventario_Stock_AlmacenProducto] UNIQUE NONCLUSTERED 
(
	[id_almacen] ASC,
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_Tipo_Movimiento]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_Tipo_Movimiento](
	[id_tipo_movimiento] [int] IDENTITY(1,1) NOT NULL,
	[nombre_tipo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipo_movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_Unidades_Medida]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_Unidades_Medida](
	[id_unidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre_unidad] [varchar](50) NOT NULL,
	[abreviatura] [varchar](10) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_unidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[abreviatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre_unidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MENU]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU](
	[id_menu] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
	[url] [nvarchar](255) NULL,
	[icono] [nvarchar](50) NULL,
	[orden] [int] NOT NULL,
	[id_menu_padre] [int] NULL,
	[es_padre] [bit] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[id_usuario_creacion] [bigint] NULL,
	[key_translate] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MENU_ROL]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU_ROL](
	[id_menu_rol] [int] IDENTITY(1,1) NOT NULL,
	[id_menu] [int] NOT NULL,
	[id_rol] [int] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_asignacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_menu_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Obras]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Obras](
	[ObrasId] [int] IDENTITY(1,1) NOT NULL,
	[ObrasNombre] [nvarchar](100) NOT NULL,
	[ObrasClave] [nvarchar](50) NOT NULL,
	[ObrasTipo] [nvarchar](50) NOT NULL,
	[ObrasEstatus] [nvarchar](20) NOT NULL,
	[ObraAutomatico] [bit] NOT NULL,
	[ObrasCiudad] [nvarchar](100) NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioCreacion] [nvarchar](50) NULL,
	[UsuarioModificacion] [nvarchar](50) NULL,
	[ClienteId] [int] NULL,
	[ResponsableId] [int] NULL,
	[Presupuesto] [decimal](18, 2) NULL,
	[FechaInicio] [date] NULL,
	[FechaFin] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ObrasId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ObrasClave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Responsables]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Responsables](
	[ResponsableId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Puesto] [nvarchar](100) NULL,
	[Telefono] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioCreacion] [nvarchar](50) NULL,
	[UsuarioModificacion] [nvarchar](50) NULL,
	[Estatus] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ResponsableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLES]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLES](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[nombre_rol] [nvarchar](100) NULL,
	[asignado_por] [int] NULL,
	[descripcion] [nvarchar](max) NULL,
 CONSTRAINT [PK__ROLES__6ABCB5E014ABA5EA] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_AreasPrincipal]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AreasPrincipal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](500) NULL,
 CONSTRAINT [PK_tbl_AreasPrincipal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_AreasSubPrincipales]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AreasSubPrincipales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](500) NULL,
	[IdProyecto] [int] NULL,
	[IdAreaPrincipal] [int] NULL,
	[IdEstado] [int] NULL,
 CONSTRAINT [PK_tbl_AreasProyecto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Automotores]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Automotores](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](500) NULL,
	[IdTipo] [int] NULL,
	[Marca] [nvarchar](50) NULL,
	[Placa] [nvarchar](50) NULL,
	[NumeroSerie] [nvarchar](50) NULL,
	[Modelo] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[Tipo] [nvarchar](50) NULL,
	[Año] [nvarchar](50) NULL,
	[TarjetaCirculacion] [nvarchar](50) NULL,
	[IdEmpresa] [int] NULL,
	[IdProyecto] [int] NULL,
	[Precio] [float] NULL,
	[UrlImagen] [nvarchar](max) NULL,
	[IdEmpleado] [int] NULL,
 CONSTRAINT [PK_Automotores] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_AutomotoresTipo]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AutomotoresTipo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](500) NULL,
 CONSTRAINT [PK_tbl_AutomotoresTipo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_AutomotoresTrabajo]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AutomotoresTrabajo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdAutomotor] [int] NULL,
	[IdTipoAutomotor] [int] NULL,
	[HorometroInicial] [float] NULL,
	[HorometroFinal] [float] NULL,
	[TotalHorometro] [float] NULL,
	[HorasMinimas] [float] NULL,
	[TotalHorasConMinimas] [float] NULL,
	[IdEmpleado] [int] NULL,
	[HoraEntrada] [time](0) NULL,
	[HoraSalida] [time](0) NULL,
	[TotalHorasEmpleado] [time](7) NULL,
	[Fecha] [datetime] NULL,
	[IdProyecto] [int] NULL,
	[Observaciones] [nvarchar](max) NULL,
	[Imagen] [nvarchar](500) NULL,
	[UserRegistrer] [nvarchar](500) NULL,
	[Correlativo] [int] NULL,
	[IdTipoCombustible] [int] NULL,
	[SuministroCombustible] [float] NULL,
	[IdEstado] [int] NULL,
 CONSTRAINT [PK_tbl_TrabajoAutomotores] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Autorizacion]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Autorizacion](
	[IdAutorizacion] [int] NOT NULL,
	[IdBitacora] [int] NULL,
	[descripcion] [nchar](10) NULL,
	[activo] [bit] NULL,
	[IdUsuarioRegister] [int] NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_Autorizacion] PRIMARY KEY CLUSTERED 
(
	[IdAutorizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Bitacora]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Bitacora](
	[IdBitacora] [int] IDENTITY(1,1) NOT NULL,
	[IdProyecto] [int] NULL,
	[IdContratista] [int] NULL,
	[IdSupervision] [int] NULL,
	[Descripcion] [varchar](max) NULL,
	[activo] [bit] NULL,
	[IdUsuarioRegister] [int] NULL,
	[FechaRegistro] [datetime] NULL,
	[FechaBitacora] [date] NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[IdBitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_BitacoraActividades]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_BitacoraActividades](
	[IdBitacoraActividades] [int] IDENTITY(1,1) NOT NULL,
	[IdBitacora] [int] NULL,
	[IdProyectoActividad] [int] NULL,
 CONSTRAINT [PK_BitacoraActividades] PRIMARY KEY CLUSTERED 
(
	[IdBitacoraActividades] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_BitacoraDocumentos]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_BitacoraDocumentos](
	[IdBitacoraDocumentos] [int] IDENTITY(1,1) NOT NULL,
	[IdBitacora] [int] NULL,
	[descripcion] [nvarchar](500) NULL,
	[UrlDocumento] [nvarchar](max) NULL,
	[activo] [bit] NULL,
	[IdUsuarioRegister] [int] NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_BitacoraDocumentos] PRIMARY KEY CLUSTERED 
(
	[IdBitacoraDocumentos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Cargos]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Cargos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](500) NULL,
	[IdProyecto] [int] NULL,
	[IdArea] [int] NULL,
	[Salario] [float] NULL,
 CONSTRAINT [PK_Cargos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Comprobante_Domicilio]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Comprobante_Domicilio](
	[id_comprobante] [int] NOT NULL,
	[id_empleado] [int] NULL,
	[tipo_comprobante] [nvarchar](50) NULL,
	[archivo_comprobante] [varbinary](max) NULL,
	[fecha_emision] [date] NULL,
 CONSTRAINT [PK_tbl_Comprobante_Domicilio] PRIMARY KEY CLUSTERED 
(
	[id_comprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Constancia_Situacion_Fiscal]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Constancia_Situacion_Fiscal](
	[id_constancia] [int] NOT NULL,
	[id_proveedor] [int] NULL,
	[fecha_emision] [date] NULL,
	[fecha_vencimiento] [date] NULL,
	[archivo_digital] [nvarchar](255) NULL,
	[estatus] [nvarchar](50) NULL,
	[ultima_actualizacion] [datetime] NULL,
 CONSTRAINT [PK_tbl_Constancia_Situacion_Fiscal] PRIMARY KEY CLUSTERED 
(
	[id_constancia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Contratista]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Contratista](
	[IdContratista] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
	[activo] [bit] NULL,
	[IdUsuarioRegister] [int] NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_tbl_Contratista] PRIMARY KEY CLUSTERED 
(
	[IdContratista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Contrato]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Contrato](
	[IdContrato] [int] NOT NULL,
	[IdProyecto] [int] NULL,
	[Descripcion] [varchar](50) NULL,
	[NumeroContrato] [varchar](50) NULL,
	[FechaInicio] [date] NULL,
	[FechaFin] [date] NULL,
	[Monto] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Contrato] PRIMARY KEY CLUSTERED 
(
	[IdContrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Cotizacion]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Cotizacion](
	[id_cotizacion] [int] NOT NULL,
	[codigo_Cotizacion] [varchar](20) NULL,
	[fecha_emision] [date] NULL,
	[fecha_vencimiento] [date] NULL,
	[estado] [varchar](50) NULL,
	[subtotal] [decimal](10, 2) NULL,
	[impuestos] [decimal](10, 2) NULL,
	[total] [decimal](10, 2) NULL,
	[moneda] [varchar](50) NULL,
	[id_proveedor] [int] NULL,
 CONSTRAINT [PK_tbl_Cotizacion] PRIMARY KEY CLUSTERED 
(
	[id_cotizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CURP]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CURP](
	[id_curp] [int] NULL,
	[id_empleado] [int] NULL,
	[codigo_curp] [nvarchar](18) NULL,
	[archivo_curp] [varbinary](max) NULL,
	[fecha_registro] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Datos_Bancarios]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Datos_Bancarios](
	[id_cuenta] [int] NOT NULL,
	[id_proveedor] [int] NULL,
	[banco] [nvarchar](50) NULL,
	[numero_cuenta] [nvarchar](100) NULL,
	[clabe_interbancaria] [nvarchar](18) NULL,
	[tipo_cuenta] [nvarchar](30) NULL,
	[moneda] [nvarchar](3) NULL,
	[titular_cuenta] [nvarchar](150) NULL,
	[sucursal] [nvarchar](100) NULL,
 CONSTRAINT [PK_tbl_Datos_Bancarios] PRIMARY KEY CLUSTERED 
(
	[id_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Documento_INE]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Documento_INE](
	[id_ine] [int] NOT NULL,
	[id_empleado] [int] NULL,
	[numero_ine] [nvarchar](18) NULL,
	[clave_elector] [nvarchar](18) NULL,
	[archivo_frente] [varbinary](max) NULL,
	[archivo_reverso] [varbinary](max) NULL,
	[fecha_vencimiento] [date] NULL,
 CONSTRAINT [PK_tbl_Documento_INE] PRIMARY KEY CLUSTERED 
(
	[id_ine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Empleado]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Empleado](
	[id_empleado] [int] NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
	[fecha_nacimiento] [date] NULL,
	[email] [nvarchar](50) NULL,
	[telefono] [nvarchar](50) NULL,
	[fecha_ingreso] [date] NULL,
	[activo] [bit] NULL,
	[cargo] [nvarchar](50) NULL,
	[area] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Empleado] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Empleados]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Empleados](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](max) NULL,
	[Apellidos] [nvarchar](max) NULL,
	[Orden] [int] NULL,
	[IdJefeInmediato] [int] NULL,
	[IdAreaProyecto] [int] NULL,
	[DUI] [nvarchar](50) NULL,
	[NIT] [nvarchar](50) NULL,
	[ISSS] [nvarchar](50) NULL,
	[AFP] [nvarchar](500) NULL,
	[CuentaBanco] [nvarchar](50) NULL,
	[IdBanco] [int] NULL,
	[Salario] [float] NULL,
	[Idcargo] [int] NULL,
	[IdProyecto] [int] NULL,
	[IdTipoAFP] [int] NULL,
	[Licencia] [bit] NULL,
	[EncargadoCombustible] [bit] NULL,
	[IdEstado] [int] NULL,
	[IdCuadrilla] [int] NULL,
	[EncargadoVehiculo] [bit] NULL,
	[IdAutomotor] [int] NULL,
	[FechaInicio] [date] NULL,
	[FechaNacimiento] [date] NULL,
	[ViaticosFijos] [float] NULL,
	[CodigoEmpleado] [int] NULL,
	[Tiene_O_No_AFP_ISSS] [bit] NULL,
	[ValorMontoComplemento] [float] NULL,
	[ValorMontoViatico] [float] NULL,
	[ValorMontoBonificacion] [float] NULL,
	[ValorMontoHoraExtra] [float] NULL,
	[Notas] [nvarchar](max) NULL,
	[Asesor] [bit] NULL,
	[ProyectoExtra] [nvarchar](500) NULL,
	[IdEmpresa] [int] NULL,
	[Imagen] [nvarchar](max) NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Empresa]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Empresa](
	[idEmpresa] [nchar](10) NULL,
	[nombre] [varchar](60) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Inventario_ProductoImagen]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Inventario_ProductoImagen](
	[Id_Imagen] [int] IDENTITY(1,1) NOT NULL,
	[Id_Producto] [int] NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[Url_Imagen] [nvarchar](1000) NOT NULL,
	[Activo] [bit] NOT NULL,
	[Id_Usuario_Register] [int] NULL,
	[FechaRegistro] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Imagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Notificacion_Proyecto]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Notificacion_Proyecto](
	[IdNotificacionProyecto] [int] IDENTITY(1,1) NOT NULL,
	[IdProyecto] [int] NOT NULL,
	[NotificacionesActivas] [bit] NOT NULL,
	[TablasAVerificar] [varchar](500) NULL,
	[HoraEnvio] [time](7) NULL,
	[CorreosDestinatarios] [varchar](500) NOT NULL,
	[Activo] [bit] NOT NULL,
	[IdUsuarioRegister] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[FechaUltimaNotificacion] [datetime] NULL,
 CONSTRAINT [PK_Notificacion_Proyecto] PRIMARY KEY CLUSTERED 
(
	[IdNotificacionProyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Opinion_Cumplimiento_SAT]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Opinion_Cumplimiento_SAT](
	[id_opinion] [int] NOT NULL,
	[id_proveedor] [int] NULL,
	[fecha_consulta] [date] NULL,
	[resultado] [nvarchar](20) NULL,
	[observaciones] [nvarchar](50) NULL,
	[archivo_comprobante] [nvarchar](255) NULL,
 CONSTRAINT [PK_tbl_Opinion_Cumplimiento_SAT] PRIMARY KEY CLUSTERED 
(
	[id_opinion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Proveedor]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Proveedor](
	[id_proveedor] [int] NOT NULL,
	[nombre_empresa] [nvarchar](10) NOT NULL,
	[rfc] [nvarchar](10) NULL,
	[direccion_fiscal] [nvarchar](10) NULL,
	[telefono] [nvarchar](10) NULL,
	[email] [nvarchar](10) NULL,
	[fecha_alta] [datetime] NULL,
	[activo] [bit] NULL,
	[giro_empresarial] [nvarchar](10) NULL,
	[persona_contacto] [nvarchar](10) NULL,
 CONSTRAINT [PK_tbl_Proveedor] PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Proyecto]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Proyecto](
	[IdProyecto] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](500) NULL,
	[descripcionCorta] [varchar](50) NULL,
	[IdEstado] [int] NULL,
	[activo] [bit] NULL,
	[IdUsuarioRegister] [int] NULL,
	[FechaRegistro] [datetime] NULL,
	[FechaInicio] [date] NULL,
	[FechaFinal] [date] NULL,
	[Presupuesto] [decimal](18, 2) NULL,
	[IdProyecto_Clasificacion] [int] NULL,
 CONSTRAINT [PK_Proyecto] PRIMARY KEY CLUSTERED 
(
	[IdProyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Proyecto_clasificacion]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Proyecto_clasificacion](
	[IdProyecto_Clasificacion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[activo] [bit] NULL,
	[IdUsuarioRegister] [int] NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_tbl_Proyecto_clasificacion_1] PRIMARY KEY CLUSTERED 
(
	[IdProyecto_Clasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProyectoActividad]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ProyectoActividad](
	[IdProyectoActividad] [int] NULL,
	[IdProyectoActividadEstado] [int] NULL,
	[IdProyecto] [int] NULL,
	[IdUnidadMedida] [int] NULL,
	[descripcion] [varchar](50) NULL,
	[Cantidad] [nchar](10) NULL,
	[activo] [bit] NULL,
	[IdUsuarioRegister] [int] NULL,
	[FechaRegistro] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProyectoActividadEstado]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ProyectoActividadEstado](
	[IdProyectoActividadEstado] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
	[activo] [bit] NULL,
	[IdUsuarioRegister] [int] NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_ProyectoActividadEstado] PRIMARY KEY CLUSTERED 
(
	[IdProyectoActividadEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProyectoDocumento]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ProyectoDocumento](
	[IdProyectoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[IdProyecto] [int] NULL,
	[IdContrato] [int] NULL,
	[NombreDocumento] [varchar](100) NULL,
	[RutaDocumento] [varchar](255) NULL,
	[TipoDocumento] [varchar](50) NULL,
	[FechaRegistro] [datetime] NULL,
	[IdUsuarioRegister] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_ProyectoDocumento] PRIMARY KEY CLUSTERED 
(
	[IdProyectoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Seguro_Social]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Seguro_Social](
	[id_seguro_social] [int] NOT NULL,
	[id_empleado] [int] NULL,
	[numero_seguro_social] [nvarchar](11) NULL,
	[archivo_imss] [varbinary](max) NULL,
	[fecha_registro] [date] NULL,
 CONSTRAINT [PK_tbl_Seguro_Social] PRIMARY KEY CLUSTERED 
(
	[id_seguro_social] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Supervision]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Supervision](
	[IdSupervision] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
	[activo] [bit] NULL,
	[IdUsuarioRegister] [int] NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_Supervision] PRIMARY KEY CLUSTERED 
(
	[IdSupervision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Usuario_Proyecto]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Usuario_Proyecto](
	[Id_Usuario_Proyecto] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [bigint] NULL,
	[IdProyecto] [int] NULL,
	[activo] [bit] NULL,
	[IdUsuarioRegister] [int] NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_tbl_Usuario_Proyecto] PRIMARY KEY CLUSTERED 
(
	[Id_Usuario_Proyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO_ROLES]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO_ROLES](
	[id_usuario_rol] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [bigint] NOT NULL,
	[id_rol] [int] NOT NULL,
	[fecha_asignacion] [datetime] NOT NULL,
	[usuario_modificacion] [int] NULL,
 CONSTRAINT [PK__USUARIO___D1F881FE92B658AD] PRIMARY KEY CLUSTERED 
(
	[id_usuario_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO_TOKEN_VERIFICACION]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO_TOKEN_VERIFICACION](
	[id_token_verificacion] [bigint] IDENTITY(1,1) NOT NULL,
	[id_usuario] [bigint] NOT NULL,
	[Token] [nvarchar](100) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[Expiracion] [datetime] NOT NULL,
	[EsValido] [bit] NOT NULL,
	[TipoToken] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_token_verificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT ('Activo') FOR [Estatus]
GO
ALTER TABLE [dbo].[inventario_Almacenes] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[inventario_Almacenes] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[inventario_Almacenes] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[inventario_Categorias_Producto] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[inventario_Categorias_Producto] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[inventario_Checklist_Maquinaria] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[inventario_Checklist_Maquinaria] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[inventario_Detalle_Movimiento] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[inventario_Detalle_Movimiento] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[inventario_Historial_Actividad_Maquinaria] ADD  DEFAULT ((0)) FOR [firma_operador_digital]
GO
ALTER TABLE [dbo].[inventario_Historial_Actividad_Maquinaria] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[inventario_Historial_Actividad_Maquinaria] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[inventario_Historial_Mantenimiento_Reparacion_Maquinaria] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[inventario_Historial_Mantenimiento_Reparacion_Maquinaria] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[inventario_Maquinaria] ADD  DEFAULT ('Operativa') FOR [estado_operacional]
GO
ALTER TABLE [dbo].[inventario_Maquinaria] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[inventario_Maquinaria] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[inventario_Movimientos_Inventario] ADD  DEFAULT ((0)) FOR [confirmacion_entrega]
GO
ALTER TABLE [dbo].[inventario_Movimientos_Inventario] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[inventario_Movimientos_Inventario] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[inventario_Perdidas_Robos] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[inventario_Perdidas_Robos] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[inventario_Productos] ADD  DEFAULT ((1)) FOR [es_consumible]
GO
ALTER TABLE [dbo].[inventario_Productos] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[inventario_Productos] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[inventario_Productos] ADD  DEFAULT ((0.00)) FOR [precio_unitario]
GO
ALTER TABLE [dbo].[inventario_Productos] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[inventario_Stock_Actual] ADD  DEFAULT ((0.00)) FOR [cantidad_actual]
GO
ALTER TABLE [dbo].[inventario_Stock_Actual] ADD  DEFAULT (getdate()) FOR [ultima_actualizacion]
GO
ALTER TABLE [dbo].[inventario_Unidades_Medida] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[inventario_Unidades_Medida] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[MENU] ADD  DEFAULT ((1)) FOR [orden]
GO
ALTER TABLE [dbo].[MENU] ADD  DEFAULT ((0)) FOR [es_padre]
GO
ALTER TABLE [dbo].[MENU] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[MENU] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[MENU_ROL] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[MENU_ROL] ADD  DEFAULT (getdate()) FOR [fecha_asignacion]
GO
ALTER TABLE [dbo].[Obras] ADD  DEFAULT ('Activo') FOR [ObrasEstatus]
GO
ALTER TABLE [dbo].[Obras] ADD  DEFAULT ((0)) FOR [ObraAutomatico]
GO
ALTER TABLE [dbo].[Obras] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Responsables] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Responsables] ADD  DEFAULT ('Activo') FOR [Estatus]
GO
ALTER TABLE [dbo].[tbl_Inventario_ProductoImagen] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[tbl_Inventario_ProductoImagen] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[tbl_Notificacion_Proyecto] ADD  DEFAULT ((0)) FOR [NotificacionesActivas]
GO
ALTER TABLE [dbo].[tbl_Notificacion_Proyecto] ADD  DEFAULT ('tbl_Bitacora') FOR [TablasAVerificar]
GO
ALTER TABLE [dbo].[tbl_Notificacion_Proyecto] ADD  DEFAULT ('17:00:00') FOR [HoraEnvio]
GO
ALTER TABLE [dbo].[tbl_Notificacion_Proyecto] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[tbl_Notificacion_Proyecto] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[tbl_Proyecto_clasificacion] ADD  CONSTRAINT [DF_tbl_Proyecto_clasificacion_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[USUARIO_ROLES] ADD  CONSTRAINT [DF__USUARIO_R__fecha__339FAB6E]  DEFAULT (getdate()) FOR [fecha_asignacion]
GO
ALTER TABLE [dbo].[USUARIO_TOKEN_VERIFICACION] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[USUARIO_TOKEN_VERIFICACION] ADD  DEFAULT ((1)) FOR [EsValido]
GO
ALTER TABLE [dbo].[USUARIO_TOKEN_VERIFICACION] ADD  CONSTRAINT [DF_USUARIO_TOKEN_VERIFICACION_TipoToken]  DEFAULT ('2FA') FOR [TipoToken]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[ACTIVIDADES]  WITH CHECK ADD  CONSTRAINT [ACTIVIDADES_id_accion_fk] FOREIGN KEY([id_accion])
REFERENCES [dbo].[ACCIONES] ([id_accion])
GO
ALTER TABLE [dbo].[ACTIVIDADES] CHECK CONSTRAINT [ACTIVIDADES_id_accion_fk]
GO
ALTER TABLE [dbo].[ACTIVIDADES]  WITH CHECK ADD  CONSTRAINT [ACTIVIDADES_id_rol_fk] FOREIGN KEY([id_rol])
REFERENCES [dbo].[ROLES] ([id_rol])
GO
ALTER TABLE [dbo].[ACTIVIDADES] CHECK CONSTRAINT [ACTIVIDADES_id_rol_fk]
GO
ALTER TABLE [dbo].[inventario_Almacenes]  WITH CHECK ADD  CONSTRAINT [FK_Almacen_Estado] FOREIGN KEY([id_estado])
REFERENCES [dbo].[Estados] ([id_estado])
GO
ALTER TABLE [dbo].[inventario_Almacenes] CHECK CONSTRAINT [FK_Almacen_Estado]
GO
ALTER TABLE [dbo].[inventario_Almacenes]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Almacenes_Usuario] FOREIGN KEY([responsable_id])
REFERENCES [dbo].[USUARIOS] ([id_usuario])
GO
ALTER TABLE [dbo].[inventario_Almacenes] CHECK CONSTRAINT [FK_inventario_Almacenes_Usuario]
GO
ALTER TABLE [dbo].[inventario_Almacenes]  WITH CHECK ADD  CONSTRAINT [FK_InventarioAlmacenes_Proyecto] FOREIGN KEY([id_proyecto])
REFERENCES [dbo].[tbl_Proyecto] ([IdProyecto])
GO
ALTER TABLE [dbo].[inventario_Almacenes] CHECK CONSTRAINT [FK_InventarioAlmacenes_Proyecto]
GO
ALTER TABLE [dbo].[inventario_Checklist_Maquinaria]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Checklist_Maquina] FOREIGN KEY([id_maquina])
REFERENCES [dbo].[inventario_Maquinaria] ([id_maquina])
GO
ALTER TABLE [dbo].[inventario_Checklist_Maquinaria] CHECK CONSTRAINT [FK_inventario_Checklist_Maquina]
GO
ALTER TABLE [dbo].[inventario_Checklist_Maquinaria]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Checklist_OperadorRealiza] FOREIGN KEY([id_operador_realiza])
REFERENCES [dbo].[tbl_Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[inventario_Checklist_Maquinaria] CHECK CONSTRAINT [FK_inventario_Checklist_OperadorRealiza]
GO
ALTER TABLE [dbo].[inventario_Detalle_Movimiento]  WITH CHECK ADD  CONSTRAINT [FK_inventario_DetalleMov_Movimiento] FOREIGN KEY([id_movimiento])
REFERENCES [dbo].[inventario_Movimientos_Inventario] ([id_movimiento])
GO
ALTER TABLE [dbo].[inventario_Detalle_Movimiento] CHECK CONSTRAINT [FK_inventario_DetalleMov_Movimiento]
GO
ALTER TABLE [dbo].[inventario_Detalle_Movimiento]  WITH CHECK ADD  CONSTRAINT [FK_inventario_DetalleMov_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[inventario_Productos] ([id_producto])
GO
ALTER TABLE [dbo].[inventario_Detalle_Movimiento] CHECK CONSTRAINT [FK_inventario_DetalleMov_Producto]
GO
ALTER TABLE [dbo].[inventario_Detalle_Movimiento]  WITH CHECK ADD  CONSTRAINT [FK_inventario_DetalleMov_UnidadMedida] FOREIGN KEY([id_unidad_medida_movimiento])
REFERENCES [dbo].[inventario_Unidades_Medida] ([id_unidad])
GO
ALTER TABLE [dbo].[inventario_Detalle_Movimiento] CHECK CONSTRAINT [FK_inventario_DetalleMov_UnidadMedida]
GO
ALTER TABLE [dbo].[inventario_Historial_Actividad_Maquinaria]  WITH CHECK ADD  CONSTRAINT [FK_inventario_HistorialAct_Maquina] FOREIGN KEY([id_maquina])
REFERENCES [dbo].[inventario_Maquinaria] ([id_maquina])
GO
ALTER TABLE [dbo].[inventario_Historial_Actividad_Maquinaria] CHECK CONSTRAINT [FK_inventario_HistorialAct_Maquina]
GO
ALTER TABLE [dbo].[inventario_Historial_Actividad_Maquinaria]  WITH CHECK ADD  CONSTRAINT [FK_inventario_HistorialAct_OperadorChofer] FOREIGN KEY([id_operador_chofer])
REFERENCES [dbo].[tbl_Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[inventario_Historial_Actividad_Maquinaria] CHECK CONSTRAINT [FK_inventario_HistorialAct_OperadorChofer]
GO
ALTER TABLE [dbo].[inventario_Historial_Actividad_Maquinaria]  WITH CHECK ADD  CONSTRAINT [FK_inventario_HistorialAct_ProyectoObra] FOREIGN KEY([id_proyecto_obra])
REFERENCES [dbo].[Obras] ([ObrasId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[inventario_Historial_Actividad_Maquinaria] CHECK CONSTRAINT [FK_inventario_HistorialAct_ProyectoObra]
GO
ALTER TABLE [dbo].[inventario_Historial_Actividad_Maquinaria]  WITH CHECK ADD  CONSTRAINT [FK_inventario_HistorialAct_TrabajadorConfirma] FOREIGN KEY([id_trabajador_empresa_confirma])
REFERENCES [dbo].[tbl_Empleado] ([id_empleado])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[inventario_Historial_Actividad_Maquinaria] CHECK CONSTRAINT [FK_inventario_HistorialAct_TrabajadorConfirma]
GO
ALTER TABLE [dbo].[inventario_Historial_Mantenimiento_Reparacion_Maquinaria]  WITH CHECK ADD  CONSTRAINT [FK_inventario_HistorialMnt_Maquina] FOREIGN KEY([id_maquina])
REFERENCES [dbo].[inventario_Maquinaria] ([id_maquina])
GO
ALTER TABLE [dbo].[inventario_Historial_Mantenimiento_Reparacion_Maquinaria] CHECK CONSTRAINT [FK_inventario_HistorialMnt_Maquina]
GO
ALTER TABLE [dbo].[inventario_Maquinaria]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Maquinaria_AlmacenActual] FOREIGN KEY([id_almacen_actual])
REFERENCES [dbo].[inventario_Almacenes] ([id_almacen])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[inventario_Maquinaria] CHECK CONSTRAINT [FK_inventario_Maquinaria_AlmacenActual]
GO
ALTER TABLE [dbo].[inventario_Maquinaria]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Maquinaria_OperadorAsignado] FOREIGN KEY([operador_asignado_id])
REFERENCES [dbo].[tbl_Empleado] ([id_empleado])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[inventario_Maquinaria] CHECK CONSTRAINT [FK_inventario_Maquinaria_OperadorAsignado]
GO
ALTER TABLE [dbo].[inventario_Maquinaria]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Maquinaria_ProyectoActual] FOREIGN KEY([id_proyecto_actual])
REFERENCES [dbo].[Obras] ([ObrasId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[inventario_Maquinaria] CHECK CONSTRAINT [FK_inventario_Maquinaria_ProyectoActual]
GO
ALTER TABLE [dbo].[inventario_Movimientos_Inventario]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Mov_AlmacenDestino] FOREIGN KEY([id_almacen_destino])
REFERENCES [dbo].[inventario_Almacenes] ([id_almacen])
GO
ALTER TABLE [dbo].[inventario_Movimientos_Inventario] CHECK CONSTRAINT [FK_inventario_Mov_AlmacenDestino]
GO
ALTER TABLE [dbo].[inventario_Movimientos_Inventario]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Mov_AlmacenOrigen] FOREIGN KEY([id_almacen_origen])
REFERENCES [dbo].[inventario_Almacenes] ([id_almacen])
GO
ALTER TABLE [dbo].[inventario_Movimientos_Inventario] CHECK CONSTRAINT [FK_inventario_Mov_AlmacenOrigen]
GO
ALTER TABLE [dbo].[inventario_Movimientos_Inventario]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Mov_PersonaAutoriza] FOREIGN KEY([id_persona_autoriza])
REFERENCES [dbo].[tbl_Empleado] ([id_empleado])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[inventario_Movimientos_Inventario] CHECK CONSTRAINT [FK_inventario_Mov_PersonaAutoriza]
GO
ALTER TABLE [dbo].[inventario_Movimientos_Inventario]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Mov_PersonaEntrega] FOREIGN KEY([id_persona_entrega])
REFERENCES [dbo].[tbl_Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[inventario_Movimientos_Inventario] CHECK CONSTRAINT [FK_inventario_Mov_PersonaEntrega]
GO
ALTER TABLE [dbo].[inventario_Movimientos_Inventario]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Mov_PersonaRecibe] FOREIGN KEY([id_persona_recibe])
REFERENCES [dbo].[tbl_Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[inventario_Movimientos_Inventario] CHECK CONSTRAINT [FK_inventario_Mov_PersonaRecibe]
GO
ALTER TABLE [dbo].[inventario_Movimientos_Inventario]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Mov_ProyectoObra] FOREIGN KEY([id_proyecto_obra])
REFERENCES [dbo].[Obras] ([ObrasId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[inventario_Movimientos_Inventario] CHECK CONSTRAINT [FK_inventario_Mov_ProyectoObra]
GO
ALTER TABLE [dbo].[inventario_Perdidas_Robos]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Perdidas_PersonaReporta] FOREIGN KEY([id_persona_reporta])
REFERENCES [dbo].[tbl_Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[inventario_Perdidas_Robos] CHECK CONSTRAINT [FK_inventario_Perdidas_PersonaReporta]
GO
ALTER TABLE [dbo].[inventario_Perdidas_Robos]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Perdidas_PersonaResponsable] FOREIGN KEY([id_persona_responsable])
REFERENCES [dbo].[tbl_Empleado] ([id_empleado])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[inventario_Perdidas_Robos] CHECK CONSTRAINT [FK_inventario_Perdidas_PersonaResponsable]
GO
ALTER TABLE [dbo].[inventario_Productos]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Productos_Categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[inventario_Categorias_Producto] ([id_categoria])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[inventario_Productos] CHECK CONSTRAINT [FK_inventario_Productos_Categoria]
GO
ALTER TABLE [dbo].[inventario_Productos]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Productos_UnidadMedida] FOREIGN KEY([id_unidad_medida_base])
REFERENCES [dbo].[inventario_Unidades_Medida] ([id_unidad])
GO
ALTER TABLE [dbo].[inventario_Productos] CHECK CONSTRAINT [FK_inventario_Productos_UnidadMedida]
GO
ALTER TABLE [dbo].[inventario_Stock_Actual]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Stock_Almacen] FOREIGN KEY([id_almacen])
REFERENCES [dbo].[inventario_Almacenes] ([id_almacen])
GO
ALTER TABLE [dbo].[inventario_Stock_Actual] CHECK CONSTRAINT [FK_inventario_Stock_Almacen]
GO
ALTER TABLE [dbo].[inventario_Stock_Actual]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Stock_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[inventario_Productos] ([id_producto])
GO
ALTER TABLE [dbo].[inventario_Stock_Actual] CHECK CONSTRAINT [FK_inventario_Stock_Producto]
GO
ALTER TABLE [dbo].[inventario_Stock_Actual]  WITH CHECK ADD  CONSTRAINT [FK_inventario_Stock_UnidadMedida] FOREIGN KEY([id_unidad_medida])
REFERENCES [dbo].[inventario_Unidades_Medida] ([id_unidad])
GO
ALTER TABLE [dbo].[inventario_Stock_Actual] CHECK CONSTRAINT [FK_inventario_Stock_UnidadMedida]
GO
ALTER TABLE [dbo].[MENU]  WITH CHECK ADD  CONSTRAINT [FK_MENU_MENU] FOREIGN KEY([id_menu_padre])
REFERENCES [dbo].[MENU] ([id_menu])
GO
ALTER TABLE [dbo].[MENU] CHECK CONSTRAINT [FK_MENU_MENU]
GO
ALTER TABLE [dbo].[MENU_ROL]  WITH CHECK ADD  CONSTRAINT [FK_MENU_ROL_MENU] FOREIGN KEY([id_menu])
REFERENCES [dbo].[MENU] ([id_menu])
GO
ALTER TABLE [dbo].[MENU_ROL] CHECK CONSTRAINT [FK_MENU_ROL_MENU]
GO
ALTER TABLE [dbo].[MENU_ROL]  WITH CHECK ADD  CONSTRAINT [FK_MENU_ROL_ROLES] FOREIGN KEY([id_rol])
REFERENCES [dbo].[ROLES] ([id_rol])
GO
ALTER TABLE [dbo].[MENU_ROL] CHECK CONSTRAINT [FK_MENU_ROL_ROLES]
GO
ALTER TABLE [dbo].[tbl_AreasSubPrincipales]  WITH CHECK ADD  CONSTRAINT [FK_tbl_AreasProyecto_AreasPrincipal] FOREIGN KEY([IdAreaPrincipal])
REFERENCES [dbo].[tbl_AreasPrincipal] ([ID])
GO
ALTER TABLE [dbo].[tbl_AreasSubPrincipales] CHECK CONSTRAINT [FK_tbl_AreasProyecto_AreasPrincipal]
GO
ALTER TABLE [dbo].[tbl_AreasSubPrincipales]  WITH CHECK ADD  CONSTRAINT [FK_tbl_AreasProyecto_Proyectos] FOREIGN KEY([IdProyecto])
REFERENCES [dbo].[tbl_Proyecto] ([IdProyecto])
GO
ALTER TABLE [dbo].[tbl_AreasSubPrincipales] CHECK CONSTRAINT [FK_tbl_AreasProyecto_Proyectos]
GO
ALTER TABLE [dbo].[tbl_AutomotoresTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_AutomotoresTrabajo_tbl_AutomotoresTipo] FOREIGN KEY([IdTipoAutomotor])
REFERENCES [dbo].[tbl_AutomotoresTipo] ([ID])
GO
ALTER TABLE [dbo].[tbl_AutomotoresTrabajo] CHECK CONSTRAINT [FK_AutomotoresTrabajo_tbl_AutomotoresTipo]
GO
ALTER TABLE [dbo].[tbl_AutomotoresTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_TrabajoAutomotores_Automotores] FOREIGN KEY([IdAutomotor])
REFERENCES [dbo].[tbl_Automotores] ([ID])
GO
ALTER TABLE [dbo].[tbl_AutomotoresTrabajo] CHECK CONSTRAINT [FK_TrabajoAutomotores_Automotores]
GO
ALTER TABLE [dbo].[tbl_Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Bitacora_tbl_Proyecto] FOREIGN KEY([IdProyecto])
REFERENCES [dbo].[tbl_Proyecto] ([IdProyecto])
GO
ALTER TABLE [dbo].[tbl_Bitacora] CHECK CONSTRAINT [FK_tbl_Bitacora_tbl_Proyecto]
GO
ALTER TABLE [dbo].[tbl_BitacoraDocumentos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_BitacoraDocumentos_tbl_Bitacora] FOREIGN KEY([IdBitacora])
REFERENCES [dbo].[tbl_Bitacora] ([IdBitacora])
GO
ALTER TABLE [dbo].[tbl_BitacoraDocumentos] CHECK CONSTRAINT [FK_tbl_BitacoraDocumentos_tbl_Bitacora]
GO
ALTER TABLE [dbo].[tbl_Comprobante_Domicilio]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Comprobante_Domicilio_tbl_Empleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[tbl_Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[tbl_Comprobante_Domicilio] CHECK CONSTRAINT [FK_tbl_Comprobante_Domicilio_tbl_Empleado]
GO
ALTER TABLE [dbo].[tbl_Constancia_Situacion_Fiscal]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Constancia_Situacion_Fiscal_tbl_Empleado] FOREIGN KEY([id_constancia])
REFERENCES [dbo].[tbl_Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[tbl_Constancia_Situacion_Fiscal] CHECK CONSTRAINT [FK_tbl_Constancia_Situacion_Fiscal_tbl_Empleado]
GO
ALTER TABLE [dbo].[tbl_Constancia_Situacion_Fiscal]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Constancia_Situacion_Fiscal_tbl_Proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[tbl_Proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[tbl_Constancia_Situacion_Fiscal] CHECK CONSTRAINT [FK_tbl_Constancia_Situacion_Fiscal_tbl_Proveedor]
GO
ALTER TABLE [dbo].[tbl_Cotizacion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Cotizacion_tbl_Proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[tbl_Proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[tbl_Cotizacion] CHECK CONSTRAINT [FK_tbl_Cotizacion_tbl_Proveedor]
GO
ALTER TABLE [dbo].[tbl_CURP]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CURP_tbl_Empleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[tbl_Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[tbl_CURP] CHECK CONSTRAINT [FK_tbl_CURP_tbl_Empleado]
GO
ALTER TABLE [dbo].[tbl_Datos_Bancarios]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Datos_Bancarios_tbl_Empleado] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[tbl_Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[tbl_Datos_Bancarios] CHECK CONSTRAINT [FK_tbl_Datos_Bancarios_tbl_Empleado]
GO
ALTER TABLE [dbo].[tbl_Datos_Bancarios]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Datos_Bancarios_tbl_Proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[tbl_Proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[tbl_Datos_Bancarios] CHECK CONSTRAINT [FK_tbl_Datos_Bancarios_tbl_Proveedor]
GO
ALTER TABLE [dbo].[tbl_Documento_INE]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Documento_INE_tbl_Empleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[tbl_Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[tbl_Documento_INE] CHECK CONSTRAINT [FK_tbl_Documento_INE_tbl_Empleado]
GO
ALTER TABLE [dbo].[tbl_Inventario_ProductoImagen]  WITH CHECK ADD  CONSTRAINT [FK_ProductoImagen_Producto] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[inventario_Productos] ([id_producto])
GO
ALTER TABLE [dbo].[tbl_Inventario_ProductoImagen] CHECK CONSTRAINT [FK_ProductoImagen_Producto]
GO
ALTER TABLE [dbo].[tbl_Notificacion_Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Notificacion_Proyecto_tbl_Proyecto] FOREIGN KEY([IdProyecto])
REFERENCES [dbo].[tbl_Proyecto] ([IdProyecto])
GO
ALTER TABLE [dbo].[tbl_Notificacion_Proyecto] CHECK CONSTRAINT [FK_tbl_Notificacion_Proyecto_tbl_Proyecto]
GO
ALTER TABLE [dbo].[tbl_Opinion_Cumplimiento_SAT]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Opinion_Cumplimiento_SAT_tbl_Proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[tbl_Proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[tbl_Opinion_Cumplimiento_SAT] CHECK CONSTRAINT [FK_tbl_Opinion_Cumplimiento_SAT_tbl_Proveedor]
GO
ALTER TABLE [dbo].[tbl_Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Proyecto_tbl_Proyecto_clasificacion] FOREIGN KEY([IdProyecto_Clasificacion])
REFERENCES [dbo].[tbl_Proyecto_clasificacion] ([IdProyecto_Clasificacion])
GO
ALTER TABLE [dbo].[tbl_Proyecto] CHECK CONSTRAINT [FK_tbl_Proyecto_tbl_Proyecto_clasificacion]
GO
ALTER TABLE [dbo].[tbl_Seguro_Social]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Seguro_Social_tbl_Empleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[tbl_Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[tbl_Seguro_Social] CHECK CONSTRAINT [FK_tbl_Seguro_Social_tbl_Empleado]
GO
ALTER TABLE [dbo].[tbl_Usuario_Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Usuario_Proyecto_tbl_Proyecto] FOREIGN KEY([IdProyecto])
REFERENCES [dbo].[tbl_Proyecto] ([IdProyecto])
GO
ALTER TABLE [dbo].[tbl_Usuario_Proyecto] CHECK CONSTRAINT [FK_tbl_Usuario_Proyecto_tbl_Proyecto]
GO
ALTER TABLE [dbo].[USUARIO_ROLES]  WITH CHECK ADD  CONSTRAINT [FK_USUARIO_ROLES_ROLES] FOREIGN KEY([id_rol])
REFERENCES [dbo].[ROLES] ([id_rol])
GO
ALTER TABLE [dbo].[USUARIO_ROLES] CHECK CONSTRAINT [FK_USUARIO_ROLES_ROLES]
GO
ALTER TABLE [dbo].[USUARIO_ROLES]  WITH CHECK ADD  CONSTRAINT [FK_USUARIO_ROLES_USUARIOS] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[USUARIOS] ([id_usuario])
GO
ALTER TABLE [dbo].[USUARIO_ROLES] CHECK CONSTRAINT [FK_USUARIO_ROLES_USUARIOS]
GO
ALTER TABLE [dbo].[inventario_Historial_Mantenimiento_Reparacion_Maquinaria]  WITH CHECK ADD  CONSTRAINT [CK_inventario_Mantenimiento_TipoIntervencion] CHECK  (([tipo_intervencion]='Inspección' OR [tipo_intervencion]='Reparación Mayor' OR [tipo_intervencion]='Mantenimiento Correctivo' OR [tipo_intervencion]='Mantenimiento Preventivo'))
GO
ALTER TABLE [dbo].[inventario_Historial_Mantenimiento_Reparacion_Maquinaria] CHECK CONSTRAINT [CK_inventario_Mantenimiento_TipoIntervencion]
GO
ALTER TABLE [dbo].[inventario_Maquinaria]  WITH CHECK ADD  CONSTRAINT [CK_inventario_Maquinaria_EstadoOperacional] CHECK  (([estado_operacional]='En Traslado' OR [estado_operacional]='Fuera de Servicio' OR [estado_operacional]='Dañada' OR [estado_operacional]='En Mantenimiento' OR [estado_operacional]='Operativa'))
GO
ALTER TABLE [dbo].[inventario_Maquinaria] CHECK CONSTRAINT [CK_inventario_Maquinaria_EstadoOperacional]
GO
ALTER TABLE [dbo].[inventario_Movimientos_Inventario]  WITH CHECK ADD  CONSTRAINT [CK_inventario_Movimientos_TipoMovimiento] CHECK  (([tipo_movimiento]='AJUSTE_NEGATIVO' OR [tipo_movimiento]='AJUSTE_POSITIVO' OR [tipo_movimiento]='REINGRESO' OR [tipo_movimiento]='TRANSFERENCIA' OR [tipo_movimiento]='SALIDA_USO_OBRA' OR [tipo_movimiento]='ENTRADA_COMPRA'))
GO
ALTER TABLE [dbo].[inventario_Movimientos_Inventario] CHECK CONSTRAINT [CK_inventario_Movimientos_TipoMovimiento]
GO
ALTER TABLE [dbo].[inventario_Perdidas_Robos]  WITH CHECK ADD  CONSTRAINT [CK_inventario_Perdidas_TipoItemPerdido] CHECK  (([tipo_item_perdido]='Maquinaria' OR [tipo_item_perdido]='Producto'))
GO
ALTER TABLE [dbo].[inventario_Perdidas_Robos] CHECK CONSTRAINT [CK_inventario_Perdidas_TipoItemPerdido]
GO
/****** Object:  StoredProcedure [dbo].[acciones_crud]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--ACCIONES

CREATE PROCEDURE [dbo].[acciones_crud]
@accion NVARCHAR(100),
@id_accion INT=null,
@nom_accion NVARCHAR(500)=null,
@estado NVARCHAR(500)=null,
@descripcion NVARCHAR(MAX)=null
AS
BEGIN
	IF @accion = 'insert'
	BEGIN
		INSERT INTO ACCIONES(nom_accion, estado, descripcion)
		VALUES(@nom_accion, @estado, @descripcion);
		RETURN;
	END
	ELSE IF @accion = 'read'
	BEGIN
		SELECT id_accion, nom_accion, estado, descripcion FROM ACCIONES;
		RETURN;
	END
	ELSE IF @accion = 'read_by_id'
	BEGIN
		SELECT id_accion, nom_accion, estado, descripcion FROM ACCIONES WHERE id_accion = @id_accion;
		RETURN;
	END
	ELSE IF @accion = 'update'
	BEGIN
		UPDATE ACCIONES SET
			nom_accion = @nom_accion,
			estado = @estado,
			descripcion = @descripcion
		WHERE id_accion = @id_accion;
		RETURN;
	END
	ELSE IF @accion = 'delete'
	BEGIN
		UPDATE ACCIONES SET
			estado = @estado
		WHERE id_accion = @id_accion;
		RETURN;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[actividades_crud]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----ACTIVIDADES

CREATE PROCEDURE [dbo].[actividades_crud]
@accion NVARCHAR(100),
@id_actividad INT=null,
@id_accion INT=null,
@id_rol INT=null
AS
BEGIN
	IF @accion = 'insert'
	BEGIN
		INSERT INTO ACTIVIDADES(id_accion, id_rol)
		VALUES(@id_accion, @id_rol);
		RETURN;
	END
	ELSE IF @accion = 'read'
	BEGIN
		SELECT a.id_actividad, a.id_rol, ac.id_accion, ac.nom_accion, ac.descripcion, ac.estado
		FROM ACTIVIDADES a
		INNER JOIN ACCIONES ac ON a.id_accion = ac.id_accion;
		RETURN;
	END
	ELSE IF @accion = 'read_by_id'
	BEGIN
		SELECT a.id_actividad, a.id_rol, ac.id_accion, ac.nom_accion, ac.descripcion, ac.estado
		FROM ACTIVIDADES a
		INNER JOIN ACCIONES ac ON a.id_accion = ac.id_accion
		WHERE a.id_actividad = @id_actividad;
		RETURN;
	END
	ELSE IF @accion = 'update'
	BEGIN
		UPDATE ACTIVIDADES SET
			id_accion = @id_accion,
			id_rol = @id_rol
		WHERE id_actividad = @id_actividad;
		RETURN;
	END
	ELSE IF @accion = 'delete'
	BEGIN
		DELETE FROM ACTIVIDADES WHERE id_actividad = @id_actividad;
		RETURN;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[roles_crud]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--ROLES

CREATE PROCEDURE [dbo].[roles_crud]
@accion NVARCHAR(100),
@id_rol INT=null,
@nombre_rol NVARCHAR(500)=null,
@asignado_por int=null,
@descripcion NVARCHAR(500)=null
AS
BEGIN
    IF @accion = 'Insert'
    BEGIN
        INSERT INTO ROLES(nombre_rol, asignado_por, descripcion)
        VALUES(@nombre_rol, @asignado_por, @descripcion);
        RETURN;
    END
    ELSE IF @accion = 'Read'
    BEGIN
        SELECT id_rol, nombre_rol, asignado_por, descripcion
        FROM ROLES;
        RETURN;
    END
    ELSE IF @accion = 'Read_by_id'
    BEGIN
        SELECT id_rol, nombre_rol, asignado_por, descripcion
        FROM ROLES
        WHERE id_rol = @id_rol;
        RETURN;
    END
    ELSE IF @accion = 'Update'
    BEGIN
        UPDATE ROLES SET
        nombre_rol = @nombre_rol,
        asignado_por = @asignado_por,
        descripcion = @descripcion
        WHERE id_rol = @id_rol;
        RETURN;
    END
    ELSE IF @accion = 'Delete'
    BEGIN
        DELETE FROM ROLES WHERE id_rol = @id_rol;
        RETURN;
    END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_AreasPrincipales_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AreasPrincipales_CRUD]
    @Accion VARCHAR(10),
    @ID INT = NULL,
    @Nombre NVARCHAR(500) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- LISTAR todas las áreas principales
    IF @Accion = 'LIST'
    BEGIN
        SELECT 
            ID,
            Nombre
        FROM tbl_AreasPrincipal
        RETURN
    END

    -- OBTENER un área principal específica
    IF @Accion = 'READ'
    BEGIN
        SELECT 
            ID,
            Nombre
        FROM tbl_AreasPrincipal
        WHERE ID = @ID
        RETURN
    END

    -- CREAR una nueva área principal
    IF @Accion = 'CREATE'
    BEGIN
        INSERT INTO tbl_AreasPrincipal (
            Nombre
        )
        VALUES (
            @Nombre
        )
        
        SELECT SCOPE_IDENTITY() AS ID
        RETURN
    END

    -- ACTUALIZAR un área principal existente
    IF @Accion = 'UPDATE'
    BEGIN
        UPDATE tbl_AreasPrincipal SET
            Nombre = ISNULL(@Nombre, Nombre)
        WHERE ID = @ID
        
        SELECT @@ROWCOUNT AS RowsAffected
        RETURN
    END

    -- ELIMINAR un área principal
    IF @Accion = 'DELETE'
    BEGIN
        DELETE FROM tbl_AreasPrincipal
        WHERE ID = @ID
        
        SELECT @@ROWCOUNT AS RowsAffected
        RETURN
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AreasSubPrincipales_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AreasSubPrincipales_CRUD]
    @Accion VARCHAR(10),
    @ID INT = NULL,
    @Nombre NVARCHAR(500) = NULL,
    @IdProyecto INT = NULL,
    @IdAreaPrincipal INT = NULL,
    @IdEstado INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- LISTAR todas las áreas sub-principales
    IF @Accion = 'LIST'
    BEGIN
        SELECT 
            ID,
            Nombre,
            IdProyecto,
            IdAreaPrincipal,
            IdEstado
        FROM tbl_AreasSubPrincipales
        RETURN
    END

    -- OBTENER un área sub-principal específica
    IF @Accion = 'READ'
    BEGIN
        SELECT 
            ID,
            Nombre,
            IdProyecto,
            IdAreaPrincipal,
            IdEstado
        FROM tbl_AreasSubPrincipales
        WHERE ID = @ID
        RETURN
    END

    -- CREAR una nueva área sub-principal
    IF @Accion = 'CREATE'
    BEGIN
        INSERT INTO tbl_AreasSubPrincipales (
            Nombre,
            IdProyecto,
            IdAreaPrincipal,
            IdEstado
        )
        VALUES (
            @Nombre,
            @IdProyecto,
            @IdAreaPrincipal,
            @IdEstado
        )
        
        SELECT SCOPE_IDENTITY() AS ID
        RETURN
    END

    -- ACTUALIZAR un área sub-principal existente
    IF @Accion = 'UPDATE'
    BEGIN
        UPDATE tbl_AreasSubPrincipales SET
            Nombre = ISNULL(@Nombre, Nombre),
            IdProyecto = ISNULL(@IdProyecto, IdProyecto),
            IdAreaPrincipal = ISNULL(@IdAreaPrincipal, IdAreaPrincipal),
            IdEstado = ISNULL(@IdEstado, IdEstado)
        WHERE ID = @ID
        
        SELECT @@ROWCOUNT AS RowsAffected
        RETURN
    END

    -- ELIMINAR un área sub-principal
    IF @Accion = 'DELETE'
    BEGIN
        DELETE FROM tbl_AreasSubPrincipales
        WHERE ID = @ID
        
        SELECT @@ROWCOUNT AS RowsAffected
        RETURN
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Automotores_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_Automotores_CRUD]
    @Accion VARCHAR(10),
    @ID INT = NULL,
    @Nombre NVARCHAR(500) = NULL,
    @IdTipo INT = NULL,
    @Marca NVARCHAR(50) = NULL,
    @Placa NVARCHAR(50) = NULL,
    @NumeroSerie NVARCHAR(50) = NULL,
    @Modelo NVARCHAR(50) = NULL,
    @Color NVARCHAR(50) = NULL,
    @Tipo NVARCHAR(50) = NULL,
    @Año NVARCHAR(50) = NULL,
    @TarjetaCirculacion NVARCHAR(50) = NULL,
    @IdEmpresa INT = NULL,
    @IdProyecto INT = NULL,
    @Precio FLOAT = NULL,
    @IdEmpleado INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- LISTAR TODOS LOS AUTOMOTORES
    IF @Accion = 'LIST'
    BEGIN
        SELECT * FROM tbl_Automotores;
        RETURN;
    END

    -- OBTENER UN AUTOMOTOR POR ID
    IF @Accion = 'READ'
    BEGIN
        SELECT * FROM tbl_Automotores WHERE ID = @ID;
        RETURN;
    END

    -- CREAR UN NUEVO AUTOMOTOR
    IF @Accion = 'CREATE'
    BEGIN
        INSERT INTO tbl_Automotores (
            Nombre, IdTipo, Marca, Placa, NumeroSerie, Modelo, 
            Color, Tipo, Año, TarjetaCirculacion, IdEmpresa, 
            IdProyecto, Precio, IdEmpleado
        )
        VALUES (
            @Nombre, @IdTipo, @Marca, @Placa, @NumeroSerie, @Modelo, 
            @Color, @Tipo, @Año, @TarjetaCirculacion, @IdEmpresa, 
            @IdProyecto, @Precio, @IdEmpleado
        );
        
        SELECT SCOPE_IDENTITY() AS ID;
        RETURN;
    END

    -- ACTUALIZAR UN AUTOMOTOR
    IF @Accion = 'UPDATE'
    BEGIN
        UPDATE tbl_Automotores SET
            Nombre = ISNULL(@Nombre, Nombre),
            IdTipo = ISNULL(@IdTipo, IdTipo),
            Marca = ISNULL(@Marca, Marca),
            Placa = ISNULL(@Placa, Placa),
            NumeroSerie = ISNULL(@NumeroSerie, NumeroSerie),
            Modelo = ISNULL(@Modelo, Modelo),
            Color = ISNULL(@Color, Color),
            Tipo = ISNULL(@Tipo, Tipo),
            Año = ISNULL(@Año, Año),
            TarjetaCirculacion = ISNULL(@TarjetaCirculacion, TarjetaCirculacion),
            IdEmpresa = ISNULL(@IdEmpresa, IdEmpresa),
            IdProyecto = ISNULL(@IdProyecto, IdProyecto),
            Precio = ISNULL(@Precio, Precio),
            IdEmpleado = ISNULL(@IdEmpleado, IdEmpleado)
        WHERE ID = @ID;
        
        SELECT @@ROWCOUNT AS RowsAffected;
        RETURN;
    END

    -- ELIMINAR UN AUTOMOTOR
    IF @Accion = 'DELETE'
    BEGIN
        DELETE FROM tbl_Automotores WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
        RETURN;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AutomotoresTipo_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AutomotoresTipo_CRUD]
    @Accion VARCHAR(10),
    @ID INT = NULL,
    @Nombre NVARCHAR(500) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- LISTAR TODOS LOS TIPOS
    IF @Accion = 'LIST'
    BEGIN
        SELECT * FROM tbl_AutomotoresTipo;
        RETURN;
    END

    -- OBTENER UN TIPO POR ID
    IF @Accion = 'READ'
    BEGIN
        SELECT * FROM tbl_AutomotoresTipo WHERE ID = @ID;
        RETURN;
    END

    -- CREAR UN NUEVO TIPO
    IF @Accion = 'CREATE'
    BEGIN
        INSERT INTO tbl_AutomotoresTipo (Nombre)
        VALUES (@Nombre);
        
        SELECT SCOPE_IDENTITY() AS ID;
        RETURN;
    END

    -- ACTUALIZAR UN TIPO
    IF @Accion = 'UPDATE'
    BEGIN
        UPDATE tbl_AutomotoresTipo SET
            Nombre = ISNULL(@Nombre, Nombre)
        WHERE ID = @ID;
        
        SELECT @@ROWCOUNT AS RowsAffected;
        RETURN;
    END

    -- ELIMINAR UN TIPO
    IF @Accion = 'DELETE'
    BEGIN
        DELETE FROM tbl_AutomotoresTipo WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
        RETURN;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AutomotoresTrabajo_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AutomotoresTrabajo_CRUD]
    @Accion VARCHAR(10),
    @ID INT = NULL,
    @IdAutomotor INT = NULL,
    @IdTipoAutomotor INT = NULL,
    @HorometroInicial FLOAT = NULL,
    @HorometroFinal FLOAT = NULL,
    @HorasMinimas FLOAT = NULL,
    @IdEmpleado INT = NULL,
    @HoraEntrada TIME(0) = NULL,
    @HoraSalida TIME(0) = NULL,
    @Fecha DATETIME = NULL,
    @IdProyecto INT = NULL,
    @Observaciones NVARCHAR(MAX) = NULL,
    @Imagen NVARCHAR(500) = NULL,
    @UserRegistrer NVARCHAR(500) = NULL,
    @Correlativo INT = NULL,
    @IdTipoCombustible INT = NULL,
    @SuministroCombustible FLOAT = NULL,
    @IdEstado INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- LISTAR TODOS LOS REGISTROS
    IF @Accion = 'LIST'
    BEGIN
        SELECT 
            ID, IdAutomotor, IdTipoAutomotor, HorometroInicial, HorometroFinal,
            TotalHorometro = HorometroFinal - HorometroInicial,
            HorasMinimas, 
            TotalHorasConMinimas = CASE 
                WHEN (HorometroFinal - HorometroInicial) < HorasMinimas 
                THEN HorasMinimas 
                ELSE (HorometroFinal - HorometroInicial) 
            END,
            IdEmpleado, HoraEntrada, HoraSalida,
            TotalHorasEmpleado = CONVERT(TIME, DATEADD(SECOND, DATEDIFF(SECOND, HoraEntrada, HoraSalida), 0)),
            Fecha, IdProyecto, Observaciones, Imagen, UserRegistrer,
            Correlativo, IdTipoCombustible, SuministroCombustible, IdEstado
        FROM tbl_AutomotoresTrabajo;
        RETURN;
    END

    -- OBTENER UN REGISTRO POR ID
    IF @Accion = 'READ'
    BEGIN
        SELECT 
            ID, IdAutomotor, IdTipoAutomotor, HorometroInicial, HorometroFinal,
            TotalHorometro = HorometroFinal - HorometroInicial,
            HorasMinimas, 
            TotalHorasConMinimas = CASE 
                WHEN (HorometroFinal - HorometroInicial) < HorasMinimas 
                THEN HorasMinimas 
                ELSE (HorometroFinal - HorometroInicial) 
            END,
            IdEmpleado, HoraEntrada, HoraSalida,
            TotalHorasEmpleado = CONVERT(TIME, DATEADD(SECOND, DATEDIFF(SECOND, HoraEntrada, HoraSalida), 0)),
            Fecha, IdProyecto, Observaciones, Imagen, UserRegistrer,
            Correlativo, IdTipoCombustible, SuministroCombustible, IdEstado
        FROM tbl_AutomotoresTrabajo 
        WHERE ID = @ID;
        RETURN;
    END

    -- CREAR UN NUEVO REGISTRO
    IF @Accion = 'CREATE'
    BEGIN
        INSERT INTO tbl_AutomotoresTrabajo (
            IdAutomotor, IdTipoAutomotor, HorometroInicial, HorometroFinal,
            HorasMinimas, IdEmpleado, HoraEntrada, HoraSalida,
            Fecha, IdProyecto, Observaciones, Imagen, UserRegistrer,
            Correlativo, IdTipoCombustible, SuministroCombustible, IdEstado
        )
        VALUES (
            @IdAutomotor, @IdTipoAutomotor, @HorometroInicial, @HorometroFinal,
            @HorasMinimas, @IdEmpleado, @HoraEntrada, @HoraSalida,
            @Fecha, @IdProyecto, @Observaciones, @Imagen, @UserRegistrer,
            @Correlativo, @IdTipoCombustible, @SuministroCombustible, @IdEstado
        );
        
        SELECT SCOPE_IDENTITY() AS ID;
        RETURN;
    END

    -- ACTUALIZAR UN REGISTRO
    IF @Accion = 'UPDATE'
    BEGIN
        UPDATE tbl_AutomotoresTrabajo SET
            IdAutomotor = ISNULL(@IdAutomotor, IdAutomotor),
            IdTipoAutomotor = ISNULL(@IdTipoAutomotor, IdTipoAutomotor),
            HorometroInicial = ISNULL(@HorometroInicial, HorometroInicial),
            HorometroFinal = ISNULL(@HorometroFinal, HorometroFinal),
            HorasMinimas = ISNULL(@HorasMinimas, HorasMinimas),
            IdEmpleado = ISNULL(@IdEmpleado, IdEmpleado),
            HoraEntrada = ISNULL(@HoraEntrada, HoraEntrada),
            HoraSalida = ISNULL(@HoraSalida, HoraSalida),
            Fecha = ISNULL(@Fecha, Fecha),
            IdProyecto = ISNULL(@IdProyecto, IdProyecto),
            Observaciones = ISNULL(@Observaciones, Observaciones),
            Imagen = ISNULL(@Imagen, Imagen),
            UserRegistrer = ISNULL(@UserRegistrer, UserRegistrer),
            Correlativo = ISNULL(@Correlativo, Correlativo),
            IdTipoCombustible = ISNULL(@IdTipoCombustible, IdTipoCombustible),
            SuministroCombustible = ISNULL(@SuministroCombustible, SuministroCombustible),
            IdEstado = ISNULL(@IdEstado, IdEstado)
        WHERE ID = @ID;
        
        SELECT @@ROWCOUNT AS RowsAffected;
        RETURN;
    END

    -- ELIMINAR UN REGISTRO
    IF @Accion = 'DELETE'
    BEGIN
        DELETE FROM tbl_AutomotoresTrabajo WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
        RETURN;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Bitacora_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	  CREATE PROCEDURE [dbo].[sp_Bitacora_CRUD]
    @Action VARCHAR(10), -- 'CREATE', 'READ', 'UPDATE', 'DELETE', 'READ_ALL'
    @IdBitacora INT = NULL,
    @IdProyecto INT = NULL,
    @IdContratista INT = NULL,
    @IdSupervision INT = NULL,
    @Descripcion VARCHAR(MAX) = NULL,
    @Activo BIT = NULL,
    @IdUsuarioRegister INT = NULL,
    @FechaRegistro DATETIME = NULL,
    @FechaBitacora DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- CREATE
    IF @Action = 'CREATE'
    BEGIN
        INSERT INTO [dbo].[tbl_Bitacora] (
            [IdProyecto],
            [IdContratista],
            [IdSupervision],
            [Descripcion],
            [activo],
            [IdUsuarioRegister],
            FechaRegistro,
            FechaBitacora
        )
        VALUES (
            @IdProyecto,
            @IdContratista,
            @IdSupervision,
            @Descripcion,
            @Activo,
            @IdUsuarioRegister,
			@FechaBitacora,
             GETDATE()
        )
        
        SELECT SCOPE_IDENTITY() AS IdBitacora;
    END

    -- READ (single record)
    ELSE IF @Action = 'READ'
    BEGIN
        SELECT 
            [IdBitacora],
            [IdProyecto],
            [IdContratista],
            [IdSupervision],
            [Descripcion],
            [activo],
            [IdUsuarioRegister],
            [FechaRegistro]
			,FechaBitacora
        FROM 
            [dbo].[tbl_Bitacora]
        WHERE 
            [IdBitacora] = @IdBitacora;
    END

    -- READ ALL
    ELSE IF @Action = 'READ_ALL'
    BEGIN
        SELECT 
            [IdBitacora],
            [IdProyecto],
            [IdContratista],
            [IdSupervision],
            [Descripcion],
            [activo],
            [IdUsuarioRegister],
            [FechaRegistro],
			FechaBitacora
        FROM 
            [dbo].[tbl_Bitacora]
        WHERE
            (@Activo IS NULL OR [activo] = @Activo);
    END

    -- UPDATE
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE [dbo].[tbl_Bitacora]
        SET 
            [IdProyecto] = ISNULL(@IdProyecto, [IdProyecto]),
            [IdContratista] = ISNULL(@IdContratista, [IdContratista]),
            [IdSupervision] = ISNULL(@IdSupervision, [IdSupervision]),
            [Descripcion] = ISNULL(@Descripcion, [Descripcion]),
            [activo] = ISNULL(@Activo, [activo]),
            [IdUsuarioRegister] = ISNULL(@IdUsuarioRegister, [IdUsuarioRegister]),
            FechaBitacora = ISNULL(@FechaBitacora, FechaBitacora)
        WHERE 
            [IdBitacora] = @IdBitacora;
            
        SELECT @@ROWCOUNT AS RowsAffected;
    END

    -- DELETE (logical delete)
    ELSE IF @Action = 'DELETE'
    BEGIN
        UPDATE [dbo].[tbl_Bitacora]
        SET 
            [activo] = 0
        WHERE 
            [IdBitacora] = @IdBitacora;
            
        SELECT @@ROWCOUNT AS RowsAffected;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_BitacoraDocumentos_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_BitacoraDocumentos_CRUD]
    @Action VARCHAR(10), -- 'CREATE', 'READ', 'UPDATE', 'DELETE', 'READ_ALL'
    @IdBitacoraDocumentos INT = NULL,
    @IdBitacora INT = NULL,
    @Descripcion nvarchar(500) = NULL,
    @UrlDocumento nvarchar(max) = NULL,
    @Activo BIT = NULL,
    @IdUsuarioRegister INT = NULL,
    @FechaRegistro DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- CREATE
    IF @Action = 'CREATE'
    BEGIN
        INSERT INTO [dbo].[tbl_BitacoraDocumentos] (
            [IdBitacora],
            [descripcion],
            [UrlDocumento],
            [activo],
            [IdUsuarioRegister],
            [FechaRegistro]
        )
        VALUES (
            @IdBitacora,
            @Descripcion,
            @UrlDocumento,
            ISNULL(@Activo, 1),
            @IdUsuarioRegister,
            ISNULL(@FechaRegistro, GETDATE())
        )
        
        SELECT SCOPE_IDENTITY() AS IdBitacoraDocumentos;
    END

    -- READ (single record)
    ELSE IF @Action = 'READ'
    BEGIN
        SELECT 
            [IdBitacoraDocumentos],
            [IdBitacora],
            [descripcion],
            [UrlDocumento],
            [activo],
            [IdUsuarioRegister],
            [FechaRegistro]
        FROM 
            [dbo].[tbl_BitacoraDocumentos]
        WHERE 
            [IdBitacoraDocumentos] = @IdBitacoraDocumentos and activo=1;
    END

    -- READ ALL
    ELSE IF @Action = 'READ_ALL'
    BEGIN
        SELECT 
            [IdBitacoraDocumentos],
            [IdBitacora],
            [descripcion],
            [UrlDocumento],
            [activo],
            [IdUsuarioRegister],
            [FechaRegistro]
        FROM 
            [dbo].[tbl_BitacoraDocumentos]
        WHERE
            activo =1
            AND (@IdBitacora IS NULL OR [IdBitacora] = @IdBitacora);
    END
  ELSE IF @Action = 'READ_ALL_BY_BITACORA'
BEGIN
    SELECT * FROM tbl_BitacoraDocumentos WHERE IdBitacora = @IdBitacora AND Activo = 1
END
    -- UPDATE
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE [dbo].[tbl_BitacoraDocumentos]
        SET 
            [IdBitacora] = ISNULL(@IdBitacora, [IdBitacora]),
            [descripcion] = ISNULL(@Descripcion, [descripcion]),
            [UrlDocumento] = ISNULL(@UrlDocumento, [UrlDocumento]),
            [activo] = ISNULL(@Activo, [activo]),
            [IdUsuarioRegister] = ISNULL(@IdUsuarioRegister, [IdUsuarioRegister]),
            [FechaRegistro] = ISNULL(@FechaRegistro, [FechaRegistro])
        WHERE 
            [IdBitacoraDocumentos] = @IdBitacoraDocumentos;
            
        SELECT @@ROWCOUNT AS RowsAffected;
    END

    -- DELETE (logical delete)
    ELSE IF @Action = 'DELETE'
    BEGIN
        UPDATE [dbo].[tbl_BitacoraDocumentos]
        SET 
            [activo] = 0
        WHERE 
            [IdBitacoraDocumentos] = @IdBitacoraDocumentos;
            
        SELECT @@ROWCOUNT AS RowsAffected;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Cargos_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Cargos_CRUD]
    @Accion VARCHAR(10),
    @ID INT = NULL,
    @Nombre NVARCHAR(500) = NULL,
    @IdProyecto INT = NULL,
    @IdArea INT = NULL,
    @Salario FLOAT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- LISTAR todos los cargos
    IF @Accion = 'LIST'
    BEGIN
        SELECT 
            ID,
            Nombre,
            IdProyecto,
            IdArea,
            Salario
        FROM tbl_Cargos
        RETURN
    END

    -- OBTENER un cargo específico
    IF @Accion = 'READ'
    BEGIN
        SELECT 
            ID,
            Nombre,
            IdProyecto,
            IdArea,
            Salario
        FROM tbl_Cargos
        WHERE ID = @ID
        RETURN
    END

    -- CREAR un nuevo cargo
    IF @Accion = 'CREATE'
    BEGIN
        INSERT INTO tbl_Cargos (
            Nombre,
            IdProyecto,
            IdArea,
            Salario
        )
        VALUES (
            @Nombre,
            @IdProyecto,
            @IdArea,
            @Salario
        )
        
        SELECT SCOPE_IDENTITY() AS ID
        RETURN
    END

    -- ACTUALIZAR un cargo existente
    IF @Accion = 'UPDATE'
    BEGIN
        UPDATE tbl_Cargos SET
            Nombre = ISNULL(@Nombre, Nombre),
            IdProyecto = ISNULL(@IdProyecto, IdProyecto),
            IdArea = ISNULL(@IdArea, IdArea),
            Salario = ISNULL(@Salario, Salario)
        WHERE ID = @ID
        
        SELECT @@ROWCOUNT AS RowsAffected
        RETURN
    END

    -- ELIMINAR un cargo
    IF @Accion = 'DELETE'
    BEGIN
        DELETE FROM tbl_Cargos
        WHERE ID = @ID
        
        SELECT @@ROWCOUNT AS RowsAffected
        RETURN
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Cliente_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

		CREATE PROCEDURE [dbo].[sp_Cliente_CRUD]
    @Accion VARCHAR(10),
    @ClienteId INT = NULL,
    @Nombre NVARCHAR(100) = NULL,
    @RFC NVARCHAR(20) = NULL,
    @Direccion NVARCHAR(200) = NULL,
    @Telefono NVARCHAR(20) = NULL,
    @Email NVARCHAR(100) = NULL,
    @Usuario NVARCHAR(50) = NULL,
    @Estatus NVARCHAR(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    -- CREATE
    IF @Accion = 'CREATE'
    BEGIN
        IF EXISTS (SELECT 1 FROM Clientes WHERE RFC = @RFC)
        BEGIN
            RAISERROR('Ya existe un cliente con este RFC', 16, 1);
            RETURN;
        END
        
        INSERT INTO Clientes (Nombre, RFC, Direccion, Telefono, Email, UsuarioCreacion, Estatus)
        VALUES (@Nombre, @RFC, @Direccion, @Telefono, @Email, @Usuario, ISNULL(@Estatus, 'Activo'));
        
        SELECT SCOPE_IDENTITY() AS ClienteId;
    END
    
    -- READ
    ELSE IF @Accion = 'READ'
    BEGIN
        IF @ClienteId IS NULL
        BEGIN
            SELECT * FROM Clientes WHERE Estatus <> 'Inactivo' ORDER BY Nombre;
        END
        ELSE
        BEGIN
            SELECT * FROM Clientes WHERE ClienteId = @ClienteId;
        END
    END
    
    -- UPDATE
    ELSE IF @Accion = 'UPDATE'
    BEGIN
        UPDATE Clientes SET
            Nombre = @Nombre,
            RFC = @RFC,
            Direccion = @Direccion,
            Telefono = @Telefono,
            Email = @Email,
            FechaModificacion = GETDATE(),
            UsuarioModificacion = @Usuario,
            Estatus = @Estatus
        WHERE ClienteId = @ClienteId;
        
        SELECT @@ROWCOUNT AS FilasAfectadas;
    END
    
    -- DELETE (Eliminación lógica)
    ELSE IF @Accion = 'DELETE'
    BEGIN
        UPDATE Clientes SET
            Estatus = 'Inactivo',
            FechaModificacion = GETDATE(),
            UsuarioModificacion = @Usuario
        WHERE ClienteId = @ClienteId;
        
        SELECT @@ROWCOUNT AS FilasAfectadas;
    END
    
    ELSE
    BEGIN
        RAISERROR('Acción no válida. Use CREATE, READ, UPDATE o DELETE', 16, 1);
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Contrato_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Contrato_CRUD]
    @Accion VARCHAR(10),
    @IdContrato INT = NULL,
    @IdProyecto INT = NULL,
    @Descripcion VARCHAR(50) = NULL,
    @NumeroContrato VARCHAR(50) = NULL,
    @FechaInicio DATE = NULL,
    @FechaFin DATE = NULL,
    @Monto DECIMAL(18, 2) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- CREATE (Insert)
    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO tbl_Contrato (IdProyecto, Descripcion, NumeroContrato, FechaInicio, FechaFin, Monto)
        VALUES (@IdProyecto, @Descripcion, @NumeroContrato, @FechaInicio, @FechaFin, @Monto)
        
        SELECT SCOPE_IDENTITY() AS IdContrato
    END
    
    -- READ (Select)
    ELSE IF @Accion = 'SELECT'
    BEGIN
        IF @IdContrato IS NOT NULL
            SELECT * FROM tbl_Contrato WHERE IdContrato = @IdContrato
        ELSE
            SELECT * FROM tbl_Contrato
    END
    
    -- UPDATE
    ELSE IF @Accion = 'UPDATE'
    BEGIN
        UPDATE tbl_Contrato SET
            IdProyecto = @IdProyecto,
            Descripcion = @Descripcion,
            NumeroContrato = @NumeroContrato,
            FechaInicio = @FechaInicio,
            FechaFin = @FechaFin,
            Monto = @Monto
        WHERE IdContrato = @IdContrato
    END
    
    -- DELETE
    ELSE IF @Accion = 'DELETE'
    BEGIN
        DELETE FROM tbl_Contrato WHERE IdContrato = @IdContrato
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Empleados_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_Empleados_CRUD]
    @Accion VARCHAR(10),
    @ID INT = NULL,
    @Nombres NVARCHAR(MAX) = NULL,
    @Apellidos NVARCHAR(MAX) = NULL,
    @Orden INT = NULL,
    @IdJefeInmediato INT = NULL,
    @IdAreaProyecto INT = NULL,
    @DUI NVARCHAR(50) = NULL,
    @NIT NVARCHAR(50) = NULL,
    @ISSS NVARCHAR(50) = NULL,
    @AFP NVARCHAR(500) = NULL,
    @CuentaBanco NVARCHAR(50) = NULL,
    @IdBanco INT = NULL,
    @Salario FLOAT = NULL,
    @Idcargo INT = NULL,
    @IdProyecto INT = NULL,
    @IdTipoAFP INT = NULL,
    @Licencia BIT = NULL,
    @EncargadoCombustible BIT = NULL,
    @IdEstado INT = NULL,
    @IdCuadrilla INT = NULL,
    @EncargadoVehiculo BIT = NULL,
    @IdAutomotor INT = NULL,
    @FechaInicio DATE = NULL,
    @FechaNacimiento DATE = NULL,
    @ViaticosFijos FLOAT = NULL,
    @CodigoEmpleado INT = NULL,
    @Tiene_O_No_AFP_ISSS BIT = NULL,
    @ValorMontoComplemento FLOAT = NULL,
    @ValorMontoViatico FLOAT = NULL,
    @ValorMontoBonificacion FLOAT = NULL,
    @ValorMontoHoraExtra FLOAT = NULL,
    @Notas NVARCHAR(MAX) = NULL,
    @Asesor BIT = NULL,
    @ProyectoExtra NVARCHAR(500) = NULL,
    @IdEmpresa INT = NULL,
    @Imagen NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- LISTAR TODOS LOS EMPLEADOS
    IF @Accion = 'LIST'
    BEGIN
        SELECT * FROM tbl_Empleados;
        RETURN;
    END

    -- OBTENER UN EMPLEADO POR ID
    IF @Accion = 'READ'
    BEGIN
        SELECT * FROM tbl_Empleados WHERE ID = @ID;
        RETURN;
    END

    -- CREAR UN NUEVO EMPLEADO
    IF @Accion = 'CREATE'
    BEGIN
        INSERT INTO tbl_Empleados (
            Nombres, Apellidos, Orden, IdJefeInmediato, IdAreaProyecto,
            DUI, NIT, ISSS, AFP, CuentaBanco, IdBanco, Salario, Idcargo,
            IdProyecto, IdTipoAFP, Licencia, EncargadoCombustible, IdEstado,
            IdCuadrilla, EncargadoVehiculo, IdAutomotor, FechaInicio,
            FechaNacimiento, ViaticosFijos, CodigoEmpleado, Tiene_O_No_AFP_ISSS,
            ValorMontoComplemento, ValorMontoViatico, ValorMontoBonificacion,
            ValorMontoHoraExtra, Notas, Asesor, ProyectoExtra, IdEmpresa, Imagen
        )
        VALUES (
            @Nombres, @Apellidos, @Orden, @IdJefeInmediato, @IdAreaProyecto,
            @DUI, @NIT, @ISSS, @AFP, @CuentaBanco, @IdBanco, @Salario, @Idcargo,
            @IdProyecto, @IdTipoAFP, @Licencia, @EncargadoCombustible, @IdEstado,
            @IdCuadrilla, @EncargadoVehiculo, @IdAutomotor, @FechaInicio,
            @FechaNacimiento, @ViaticosFijos, @CodigoEmpleado, @Tiene_O_No_AFP_ISSS,
            @ValorMontoComplemento, @ValorMontoViatico, @ValorMontoBonificacion,
            @ValorMontoHoraExtra, @Notas, @Asesor, @ProyectoExtra, @IdEmpresa, @Imagen
        );
        
        SELECT SCOPE_IDENTITY() AS ID;
        RETURN;
    END

    -- ACTUALIZAR UN EMPLEADO
    IF @Accion = 'UPDATE'
    BEGIN
        UPDATE tbl_Empleados SET
            Nombres = ISNULL(@Nombres, Nombres),
            Apellidos = ISNULL(@Apellidos, Apellidos),
            Orden = ISNULL(@Orden, Orden),
            IdJefeInmediato = ISNULL(@IdJefeInmediato, IdJefeInmediato),
            IdAreaProyecto = ISNULL(@IdAreaProyecto, IdAreaProyecto),
            DUI = ISNULL(@DUI, DUI),
            NIT = ISNULL(@NIT, NIT),
            ISSS = ISNULL(@ISSS, ISSS),
            AFP = ISNULL(@AFP, AFP),
            CuentaBanco = ISNULL(@CuentaBanco, CuentaBanco),
            IdBanco = ISNULL(@IdBanco, IdBanco),
            Salario = ISNULL(@Salario, Salario),
            Idcargo = ISNULL(@Idcargo, Idcargo),
            IdProyecto = ISNULL(@IdProyecto, IdProyecto),
            IdTipoAFP = ISNULL(@IdTipoAFP, IdTipoAFP),
            Licencia = ISNULL(@Licencia, Licencia),
            EncargadoCombustible = ISNULL(@EncargadoCombustible, EncargadoCombustible),
            IdEstado = ISNULL(@IdEstado, IdEstado),
            IdCuadrilla = ISNULL(@IdCuadrilla, IdCuadrilla),
            EncargadoVehiculo = ISNULL(@EncargadoVehiculo, EncargadoVehiculo),
            IdAutomotor = ISNULL(@IdAutomotor, IdAutomotor),
            FechaInicio = ISNULL(@FechaInicio, FechaInicio),
            FechaNacimiento = ISNULL(@FechaNacimiento, FechaNacimiento),
            ViaticosFijos = ISNULL(@ViaticosFijos, ViaticosFijos),
            CodigoEmpleado = ISNULL(@CodigoEmpleado, CodigoEmpleado),
            Tiene_O_No_AFP_ISSS = ISNULL(@Tiene_O_No_AFP_ISSS, Tiene_O_No_AFP_ISSS),
            ValorMontoComplemento = ISNULL(@ValorMontoComplemento, ValorMontoComplemento),
            ValorMontoViatico = ISNULL(@ValorMontoViatico, ValorMontoViatico),
            ValorMontoBonificacion = ISNULL(@ValorMontoBonificacion, ValorMontoBonificacion),
            ValorMontoHoraExtra = ISNULL(@ValorMontoHoraExtra, ValorMontoHoraExtra),
            Notas = ISNULL(@Notas, Notas),
            Asesor = ISNULL(@Asesor, Asesor),
            ProyectoExtra = ISNULL(@ProyectoExtra, ProyectoExtra),
            IdEmpresa = ISNULL(@IdEmpresa, IdEmpresa),
            Imagen = ISNULL(@Imagen, Imagen)
        WHERE ID = @ID;
        
        SELECT @@ROWCOUNT AS RowsAffected;
        RETURN;
    END

    -- ELIMINAR UN EMPLEADO
    IF @Accion = 'DELETE'
    BEGIN
        DELETE FROM tbl_Empleados WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
        RETURN;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Estados_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Estados_CRUD]
    @Action NVARCHAR(20),
    @Id_Estado INT = NULL,
    @Nombre_Estado NVARCHAR(100) = NULL,
    @Abreviatura_Estado NVARCHAR(10) = NULL,
    @Activo BIT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- CREATE
    IF @Action = 'CREATE'
    BEGIN
        INSERT INTO Estados (nombre_estado, abreviatura_estado, activo)
        VALUES (@Nombre_Estado, @Abreviatura_Estado, 1);
        SELECT SCOPE_IDENTITY() AS id_estado;
        RETURN;
    END

    -- READ ONE
    IF @Action = 'READ'
    BEGIN
        SELECT id_estado, nombre_estado, abreviatura_estado, activo
        FROM Estados
        WHERE id_estado = @Id_Estado;
        RETURN;
    END

    -- READ ALL
    IF @Action = 'READ_ALL'
    BEGIN
        SELECT id_estado, nombre_estado, abreviatura_estado, activo
        FROM Estados
        WHERE (@Activo IS NULL OR activo = @Activo);
        RETURN;
    END

    -- UPDATE
    IF @Action = 'UPDATE'
    BEGIN
        UPDATE Estados
        SET nombre_estado = @Nombre_Estado,
            abreviatura_estado = @Abreviatura_Estado
        WHERE id_estado = @Id_Estado;
        SELECT @@ROWCOUNT AS rows_affected;
        RETURN;
    END

    -- DELETE (baja lógica)
    IF @Action = 'DELETE'
    BEGIN
        UPDATE Estados
        SET activo = 0
        WHERE id_estado = @Id_Estado;
        SELECT @@ROWCOUNT AS rows_affected;
        RETURN;
    END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Inventario_Almacenes_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Inventario_Almacenes_CRUD]
    @Action VARCHAR(20),
    @Id_Almacen INT = NULL,
    @Nombre_Almacen VARCHAR(100) = NULL,
    @Direccion VARCHAR(255) = NULL,
    @Responsable_Id BIGINT = NULL,      -- CAMBIO A BIGINT
    @Id_Estado INT = NULL,
    @Id_Proyecto INT = NULL,
    @Activo BIT = NULL,
    @Created_At DATETIME = NULL,
    @Updated_At DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- CREATE
    IF @Action = 'CREATE'
    BEGIN
        INSERT INTO [dbo].[inventario_Almacenes] (
            [nombre_almacen],
            [direccion],
            [responsable_id],
            [id_estado],
            [id_proyecto],
            [activo],
            [created_at]
        )
        VALUES (
            @Nombre_Almacen,
            @Direccion,
            @Responsable_Id,
            @Id_Estado,
            @Id_Proyecto,
            ISNULL(@Activo, 1),
            ISNULL(@Created_At, GETDATE())
        )
        SELECT SCOPE_IDENTITY() AS Id_Almacen;
    END

    -- READ (single record)
    ELSE IF @Action = 'READ'
    BEGIN
        SELECT 
            a.[id_almacen],
            a.[nombre_almacen],
            a.[direccion],
            a.[responsable_id],
            a.[id_estado],
            e.[nombre_estado],
            a.[id_proyecto],
            p.[descripcion] AS nombre_proyecto,
            a.[activo],
            a.[created_at],
            a.[updated_at]
        FROM [dbo].[inventario_Almacenes] a
        LEFT JOIN [dbo].[Estados] e ON a.id_estado = e.id_estado
        LEFT JOIN [dbo].[tbl_Proyecto] p ON a.id_proyecto = p.IdProyecto
        WHERE 
            a.[id_almacen] = @Id_Almacen AND a.[activo]=1;
    END

    -- READ_ALL
    ELSE IF @Action = 'READ_ALL'
    BEGIN
        SELECT 
            a.[id_almacen],
            a.[nombre_almacen],
            a.[direccion],
            a.[responsable_id],
            a.[id_estado],
            e.[nombre_estado],
            a.[id_proyecto],
            p.[descripcion] AS nombre_proyecto,
            a.[activo],
            a.[created_at],
            a.[updated_at]
        FROM [dbo].[inventario_Almacenes] a
        LEFT JOIN [dbo].[Estados] e ON a.id_estado = e.id_estado
        LEFT JOIN [dbo].[tbl_Proyecto] p ON a.id_proyecto = p.IdProyecto
        WHERE
            a.[activo] = 1
            AND (@Id_Estado IS NULL OR a.[id_estado] = @Id_Estado)
            AND (@Id_Proyecto IS NULL OR a.[id_proyecto] = @Id_Proyecto)
        ORDER BY a.[nombre_almacen];
    END

    -- UPDATE
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE [dbo].[inventario_Almacenes]
        SET 
            [nombre_almacen] = ISNULL(@Nombre_Almacen, [nombre_almacen]),
            [direccion] = ISNULL(@Direccion, [direccion]),
            [responsable_id] = ISNULL(@Responsable_Id, [responsable_id]),
            [id_estado] = ISNULL(@Id_Estado, [id_estado]),
            [id_proyecto] = ISNULL(@Id_Proyecto, [id_proyecto]),
            [activo] = ISNULL(@Activo, [activo]),
            [updated_at] = ISNULL(@Updated_At, GETDATE())
        WHERE 
            [id_almacen] = @Id_Almacen;
        SELECT @@ROWCOUNT AS RowsAffected;
    END

    -- DELETE (baja lógica)
    ELSE IF @Action = 'DELETE'
    BEGIN
        UPDATE [dbo].[inventario_Almacenes]
        SET 
            [activo] = 0,
            [updated_at] = GETDATE()
        WHERE 
            [id_almacen] = @Id_Almacen;
        SELECT @@ROWCOUNT AS RowsAffected;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Inventario_ProductoImagen_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Inventario_ProductoImagen_CRUD]
    @Action VARCHAR(20), -- 'CREATE', 'READ', 'UPDATE', 'DELETE', 'READ_ALL'
    @Id_Imagen INT = NULL,
    @Id_Producto INT = NULL,
    @Descripcion NVARCHAR(255) = NULL,
    @Url_Imagen NVARCHAR(500) = NULL,
    @Activo BIT = NULL,
    @Id_Usuario_Register INT = NULL,
    @FechaRegistro DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- CREATE
    IF @Action = 'CREATE'
    BEGIN
        INSERT INTO [dbo].[tbl_Inventario_ProductoImagen] (
            [Id_Producto],
            [Descripcion],
            [Url_Imagen],
            [Activo],
            [Id_Usuario_Register],
            [FechaRegistro]
        )
        VALUES (
            @Id_Producto,
            @Descripcion,
            @Url_Imagen,
            ISNULL(@Activo, 1),
            @Id_Usuario_Register,
            ISNULL(@FechaRegistro, GETDATE())
        )
        SELECT SCOPE_IDENTITY() AS Id_Imagen;
    END

    -- READ (single record)
    ELSE IF @Action = 'READ'
    BEGIN
        SELECT 
            [Id_Imagen],
            [Id_Producto],
            [Descripcion],
            [Url_Imagen],
            [Activo],
            [Id_Usuario_Register],
            [FechaRegistro]
        FROM 
            [dbo].[tbl_Inventario_ProductoImagen]
        WHERE 
            [Id_Imagen] = @Id_Imagen AND [Activo]=1;
    END

    -- READ ALL (opcionalmente por producto)
    ELSE IF @Action = 'READ_ALL'
    BEGIN
        SELECT 
            [Id_Imagen],
            [Id_Producto],
            [Descripcion],
            [Url_Imagen],
            [Activo],
            [Id_Usuario_Register],
            [FechaRegistro]
        FROM 
            [dbo].[tbl_Inventario_ProductoImagen]
        WHERE
            [Activo] = 1
            AND (@Id_Producto IS NULL OR [Id_Producto] = @Id_Producto);
    END

    -- UPDATE
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE [dbo].[tbl_Inventario_ProductoImagen]
        SET 
            [Id_Producto] = ISNULL(@Id_Producto, [Id_Producto]),
            [Descripcion] = ISNULL(@Descripcion, [Descripcion]),
            [Url_Imagen] = ISNULL(@Url_Imagen, [Url_Imagen]),
            [Activo] = ISNULL(@Activo, [Activo]),
            [Id_Usuario_Register] = ISNULL(@Id_Usuario_Register, [Id_Usuario_Register]),
            [FechaRegistro] = ISNULL(@FechaRegistro, [FechaRegistro])
        WHERE 
            [Id_Imagen] = @Id_Imagen;
        SELECT @@ROWCOUNT AS RowsAffected;
    END

    -- DELETE (logical delete)
    ELSE IF @Action = 'DELETE'
    BEGIN
        UPDATE [dbo].[tbl_Inventario_ProductoImagen]
        SET 
            [Activo] = 0
        WHERE 
            [Id_Imagen] = @Id_Imagen;
        SELECT @@ROWCOUNT AS RowsAffected;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InventarioCategoriasProducto_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================
-- CRUD para CATEGORÍA DE PRODUCTO
-- ===============================================
CREATE   PROCEDURE [dbo].[sp_InventarioCategoriasProducto_CRUD]
    @Action VARCHAR(20),
    @id_categoria INT = NULL,
    @nombre_categoria VARCHAR(255) = NULL,
    @descripcion VARCHAR(MAX) = NULL,
    @created_at DATETIME = NULL,
    @updated_at DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'CREATE'
    BEGIN
        INSERT INTO dbo.inventario_Categorias_Producto
        (
            nombre_categoria,
            descripcion,
            created_at,
            updated_at
        )
        VALUES
        (
            @nombre_categoria,
            @descripcion,
            ISNULL(@created_at, GETDATE()),
            ISNULL(@updated_at, GETDATE())
        );
        SELECT SCOPE_IDENTITY() AS id_categoria;
        RETURN;
    END

    IF @Action = 'READ'
    BEGIN
        SELECT
            id_categoria,
            nombre_categoria,
            descripcion,
            created_at,
            updated_at
        FROM dbo.inventario_Categorias_Producto
        WHERE id_categoria = @id_categoria;
        RETURN;
    END

    IF @Action = 'READ_ALL'
    BEGIN
        SELECT
            id_categoria,
            nombre_categoria,
            descripcion,
            created_at,
            updated_at
        FROM dbo.inventario_Categorias_Producto;
        RETURN;
    END

    IF @Action = 'UPDATE'
    BEGIN
        UPDATE dbo.inventario_Categorias_Producto
        SET
            nombre_categoria = ISNULL(@nombre_categoria, nombre_categoria),
            descripcion = ISNULL(@descripcion, descripcion),
            updated_at = ISNULL(@updated_at, GETDATE())
        WHERE id_categoria = @id_categoria;
        RETURN;
    END

    IF @Action = 'DELETE'
    BEGIN
        DELETE FROM dbo.inventario_Categorias_Producto
        WHERE id_categoria = @id_categoria;
        RETURN;
    END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InventarioProductos_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InventarioProductos_CRUD]
    @Action VARCHAR(20), -- 'CREATE', 'READ', 'UPDATE', 'DELETE', 'READ_ALL'
    @id_producto INT = NULL,
    @codigo_sku NVARCHAR(100) = NULL,
    @nombre_producto NVARCHAR(255) = NULL,
    @descripcion NVARCHAR(1000) = NULL,
    @id_unidad_medida_base INT = NULL,
    @es_consumible BIT = NULL,
    @id_categoria INT = NULL,
    @precio_unitario DECIMAL(18,2) = NULL,
    @activo BIT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- CREATE
    IF @Action = 'CREATE'
    BEGIN
        INSERT INTO [dbo].[inventario_Productos] (
            [codigo_sku],
            [nombre_producto],
            [descripcion],
            [id_unidad_medida_base],
            [es_consumible],
            [id_categoria],
            [created_at],
            [precio_unitario],
            [activo]
        )
        VALUES (
            @codigo_sku,
            @nombre_producto,
            @descripcion,
            @id_unidad_medida_base,
            ISNULL(@es_consumible, 0),
            @id_categoria,
            GETDATE(),
            @precio_unitario,
            ISNULL(@activo, 1)
        )
        SELECT SCOPE_IDENTITY() AS id_producto;
    END

    -- READ (single record)
    ELSE IF @Action = 'READ'
    BEGIN
        SELECT 
            [id_producto],
            [codigo_sku],
            [nombre_producto],
            [descripcion],
            [id_unidad_medida_base],
            [es_consumible],
            [id_categoria],
            [created_at],
            [updated_at],
            [precio_unitario],
            [activo]
        FROM 
            [dbo].[inventario_Productos]
        WHERE 
            [id_producto] = @id_producto AND [activo]=1;
    END

    -- READ ALL
    ELSE IF @Action = 'READ_ALL'
    BEGIN
        SELECT 
            [id_producto],
            [codigo_sku],
            [nombre_producto],
            [descripcion],
            [id_unidad_medida_base],
            [es_consumible],
            [id_categoria],
            [created_at],
            [updated_at],
            [precio_unitario],
            [activo]
        FROM 
            [dbo].[inventario_Productos]
        WHERE
            [activo] = 1;
    END

    -- UPDATE
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE [dbo].[inventario_Productos]
        SET 
            [codigo_sku] = ISNULL(@codigo_sku, [codigo_sku]),
            [nombre_producto] = ISNULL(@nombre_producto, [nombre_producto]),
            [descripcion] = ISNULL(@descripcion, [descripcion]),
            [id_unidad_medida_base] = ISNULL(@id_unidad_medida_base, [id_unidad_medida_base]),
            [es_consumible] = ISNULL(@es_consumible, [es_consumible]),
            [id_categoria] = ISNULL(@id_categoria, [id_categoria]),
            [precio_unitario] = ISNULL(@precio_unitario, [precio_unitario]),
            [activo] = ISNULL(@activo, [activo]),
            [updated_at] = GETDATE()
        WHERE 
            [id_producto] = @id_producto;
        SELECT @@ROWCOUNT AS RowsAffected;
    END

    -- DELETE (logical delete)
    ELSE IF @Action = 'DELETE'
    BEGIN
        UPDATE [dbo].[inventario_Productos]
        SET 
            [activo] = 0,
            [updated_at] = GETDATE()
        WHERE 
            [id_producto] = @id_producto;
        SELECT @@ROWCOUNT AS RowsAffected;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InventarioUnidadesMedida_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===============================================
-- CRUD para UNIDAD DE MEDIDA
-- ===============================================
CREATE   PROCEDURE [dbo].[sp_InventarioUnidadesMedida_CRUD]
    @Action VARCHAR(20),
    @id_unidad INT = NULL,
    @nombre_unidad VARCHAR(255) = NULL,
    @abreviatura VARCHAR(50) = NULL,
    @created_at DATETIME = NULL,
    @updated_at DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'CREATE'
    BEGIN
        INSERT INTO dbo.inventario_Unidades_Medida
        (
            nombre_unidad,
            abreviatura,
            created_at,
            updated_at
        )
        VALUES
        (
            @nombre_unidad,
            @abreviatura,
            ISNULL(@created_at, GETDATE()),
            ISNULL(@updated_at, GETDATE())
        );
        SELECT SCOPE_IDENTITY() AS id_unidad;
        RETURN;
    END

    IF @Action = 'READ'
    BEGIN
        SELECT
            id_unidad,
            nombre_unidad,
            abreviatura,
            created_at,
            updated_at
        FROM dbo.inventario_Unidades_Medida
        WHERE id_unidad = @id_unidad;
        RETURN;
    END

    IF @Action = 'READ_ALL'
    BEGIN
        SELECT
            id_unidad,
            nombre_unidad,
            abreviatura,
            created_at,
            updated_at
        FROM dbo.inventario_Unidades_Medida;
        RETURN;
    END

    IF @Action = 'UPDATE'
    BEGIN
        UPDATE dbo.inventario_Unidades_Medida
        SET
            nombre_unidad = ISNULL(@nombre_unidad, nombre_unidad),
            abreviatura = ISNULL(@abreviatura, abreviatura),
            updated_at = ISNULL(@updated_at, GETDATE())
        WHERE id_unidad = @id_unidad;
        RETURN;
    END

    IF @Action = 'DELETE'
    BEGIN
        DELETE FROM dbo.inventario_Unidades_Medida
        WHERE id_unidad = @id_unidad;
        RETURN;
    END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Menu_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Menu_CRUD]
    @Accion VARCHAR(50),
    @id_menu INT = NULL,
    @titulo NVARCHAR(100) = NULL,
    @descripcion NVARCHAR(255) = NULL,
    @url NVARCHAR(255) = NULL,
    @icono NVARCHAR(50) = NULL,
    @orden INT = NULL,
    @id_menu_padre INT = NULL,
    @es_padre BIT = NULL,
    @activo BIT = NULL,
    @key_translate NVARCHAR(100) = NULL,
    @id_rol INT = NULL,  -- Para acciones de MENU_ROL
    @id_usuario_creacion BIGINT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- CREATE MENU ITEM
    IF @Accion = 'CREATE_MENU'
    BEGIN
        INSERT INTO MENU (
            titulo, descripcion, url, icono, orden, 
            id_menu_padre, es_padre, activo, key_translate, id_usuario_creacion
        )
        VALUES (
            @titulo, @descripcion, @url, @icono, @orden, 
            @id_menu_padre, @es_padre, @activo, @key_translate, @id_usuario_creacion
        );
        
        SELECT SCOPE_IDENTITY() AS id_menu;
        RETURN;
    END

    -- UPDATE MENU ITEM
    IF @Accion = 'UPDATE_MENU'
    BEGIN
        UPDATE MENU SET
            titulo = ISNULL(@titulo, titulo),
            descripcion = ISNULL(@descripcion, descripcion),
            url = ISNULL(@url, url),
            icono = ISNULL(@icono, icono),
            orden = ISNULL(@orden, orden),
            id_menu_padre = ISNULL(@id_menu_padre, id_menu_padre),
            es_padre = ISNULL(@es_padre, es_padre),
            activo = ISNULL(@activo, activo),
            key_translate = ISNULL(@key_translate, key_translate)
        WHERE id_menu = @id_menu;
        
        SELECT @id_menu AS id_menu;
        RETURN;
    END

    -- DELETE MENU ITEM
    IF @Accion = 'DELETE_MENU'
    BEGIN
        -- Primero eliminar las relaciones con roles
        DELETE FROM MENU_ROL WHERE id_menu = @id_menu;
        
        -- Luego eliminar el ítem de menú
        DELETE FROM MENU WHERE id_menu = @id_menu;
        
        SELECT @id_menu AS id_menu;
        RETURN;
    END

    -- GET MENU FOR ROLE
    IF @Accion = 'GET_MENU_FOR_ROLE'
    BEGIN
        SELECT 
            m.id_menu, m.titulo, m.descripcion, m.url, m.icono, 
            m.orden, m.id_menu_padre, m.es_padre, m.key_translate, 'Dashboard' menu_padre_titulo, m.activo
        FROM MENU m
        INNER JOIN MENU_ROL mr ON m.id_menu = mr.id_menu
        WHERE mr.id_rol = @id_rol AND m.activo = 1 AND mr.activo = 1
        ORDER BY m.orden;
        RETURN;
    END

    -- GET ALL MENU ITEMS (FOR ADMIN)
    IF @Accion = 'GET_ALL_MENU'
    BEGIN
        SELECT 
            m.id_menu, m.titulo, m.descripcion, m.url, m.icono, 
            m.orden, m.id_menu_padre, m.es_padre, cast(m.activo as bit)  activo, m.key_translate,
            mp.titulo AS menu_padre_titulo
        FROM MENU m
        LEFT JOIN MENU mp ON m.id_menu_padre = mp.id_menu
        ORDER BY m.orden;
        RETURN;
    END

    -- ASSIGN MENU TO ROLE
    IF @Accion = 'ASSIGN_MENU_TO_ROLE'
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM MENU_ROL WHERE id_menu = @id_menu AND id_rol = @id_rol)
        BEGIN
            INSERT INTO MENU_ROL (id_menu, id_rol)
            VALUES (@id_menu, @id_rol);
        END
        ELSE
        BEGIN
            UPDATE MENU_ROL SET activo = 1 
            WHERE id_menu = @id_menu AND id_rol = @id_rol;
        END
        
        SELECT @id_menu AS id_menu, @id_rol AS id_rol;
        RETURN;
    END

    -- REMOVE MENU FROM ROLE
    IF @Accion = 'REMOVE_MENU_FROM_ROLE'
    BEGIN
        UPDATE MENU_ROL SET activo = 0 
        WHERE id_menu = @id_menu AND id_rol = @id_rol;
        
        SELECT @id_menu AS id_menu, @id_rol AS id_rol;
        RETURN;
    END

    -- GET MENU WITH ROLE ASSIGNMENTS
    IF @Accion = 'GET_MENU_WITH_ROLES'
    BEGIN
        SELECT 
            m.id_menu, m.titulo, 
            r.id_rol, r.nombre_rol,
            cast(CASE WHEN mr.id_menu_rol IS NOT NULL THEN 1 ELSE 0 END as bit) AS asignado
        FROM MENU m
        CROSS JOIN ROLES r
        LEFT JOIN MENU_ROL mr ON m.id_menu = mr.id_menu AND r.id_rol = mr.id_rol AND mr.activo = 1
        WHERE m.activo = 1
        ORDER BY m.orden, r.nombre_rol;
        RETURN;
    END
END


select * from USUARIO_ROLES
GO
/****** Object:  StoredProcedure [dbo].[sp_Notificacion_Proyecto_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
														  CREATE   PROCEDURE [dbo].[sp_Notificacion_Proyecto_CRUD]
    @Accion VARCHAR(20),
    @IdNotificacionProyecto INT = NULL,
    @IdProyecto INT = NULL,
    @NotificacionesActivas BIT = NULL,
    @TablasAVerificar VARCHAR(500) = NULL,
    @HoraEnvio TIME = NULL,
    @CorreosDestinatarios VARCHAR(500) = NULL,
    @Activo BIT = NULL,
    @IdUsuarioRegister INT = NULL,
    @FechaRegistro DATETIME = NULL,
    @FechaUltimaNotificacion DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- CREATE (Insertar)
    IF @Accion = 'CREATE'
    BEGIN
        INSERT INTO [dbo].[tbl_Notificacion_Proyecto] (
            [IdProyecto],
            [NotificacionesActivas],
            [TablasAVerificar],
            [HoraEnvio],
            [CorreosDestinatarios],
            [Activo],
            [IdUsuarioRegister],
            [FechaRegistro]
        )
        VALUES (
            @IdProyecto,
            ISNULL(@NotificacionesActivas, 0),
            ISNULL(@TablasAVerificar, 'tbl_Bitacora'),
            ISNULL(@HoraEnvio, '17:00:00'), -- 5 PM por defecto
            @CorreosDestinatarios,
            ISNULL(@Activo, 1),
            @IdUsuarioRegister,
            ISNULL(@FechaRegistro, GETDATE())
        )
        
        SELECT SCOPE_IDENTITY() AS IdNotificacionProyecto;
    END

    -- READ (Obtener todos)
    ELSE IF @Accion = 'READ_ALL'
    BEGIN
        SELECT 
            np.[IdNotificacionProyecto],
            np.[IdProyecto],
            np.[NotificacionesActivas],
            np.[TablasAVerificar],
            np.[HoraEnvio],
            np.[CorreosDestinatarios],
            np.[Activo],
            np.[IdUsuarioRegister],
            np.[FechaRegistro],
            np.[FechaUltimaNotificacion]
        FROM [dbo].[tbl_Notificacion_Proyecto] np
        WHERE np.[Activo] = 1;
    END

    -- READ (Obtener por ID)
    ELSE IF @Accion = 'READ'
    BEGIN
        SELECT 
            np.[IdNotificacionProyecto],
            np.[IdProyecto],
            np.[NotificacionesActivas],
            np.[TablasAVerificar],
            np.[HoraEnvio],
            np.[CorreosDestinatarios],
            np.[Activo],
            np.[IdUsuarioRegister],
            np.[FechaRegistro],
            np.[FechaUltimaNotificacion]
        FROM [dbo].[tbl_Notificacion_Proyecto] np
        WHERE np.[IdNotificacionProyecto] = @IdNotificacionProyecto;
    END

    -- READ (Obtener por proyecto)
    ELSE IF @Accion = 'READ_BY_PROJECT'
    BEGIN
        SELECT 
            np.[IdNotificacionProyecto],
            np.[IdProyecto],
            np.[NotificacionesActivas],
            np.[TablasAVerificar],
            np.[HoraEnvio],
            np.[CorreosDestinatarios],
            np.[Activo],
            np.[IdUsuarioRegister],
            np.[FechaRegistro],
            np.[FechaUltimaNotificacion]
        FROM [dbo].[tbl_Notificacion_Proyecto] np
        WHERE np.[IdProyecto] = @IdProyecto AND np.[Activo] = 1;
    END

    -- READ (Obtener configuraciones activas para notificaciones)
    ELSE IF @Accion = 'READ_ACTIVE'
    BEGIN
        SELECT 
            np.[IdNotificacionProyecto],
            np.[IdProyecto],
            np.[NotificacionesActivas],
            np.[TablasAVerificar],
            np.[CorreosDestinatarios],
            np.[FechaUltimaNotificacion]
        FROM [dbo].[tbl_Notificacion_Proyecto] np
        WHERE np.[Activo] = 1 
        AND np.[NotificacionesActivas] = 1
        AND (
            np.[FechaUltimaNotificacion] IS NULL 
            OR CONVERT(DATE, np.[FechaUltimaNotificacion]) < CONVERT(DATE, GETDATE())
        );
    END

    -- VERIFY_RECORDS (Verificar registros faltantes)
    ELSE IF @Accion = 'VERIFY_RECORDS'
    BEGIN
        -- Tabla temporal para almacenar resultados
        CREATE TABLE #RegistrosFaltantes (
            IdProyecto INT,
            NombreProyecto VARCHAR(100),
            TablaVerificada VARCHAR(100),
            FechaVerificacion DATETIME
        )
        
        -- Obtener todas las configuraciones activas
        DECLARE @Configuraciones TABLE (
            ConfigIdNotificacionProyecto INT,
            ConfigIdProyecto INT,
            ConfigTablasAVerificar VARCHAR(500)
        )
        
        INSERT INTO @Configuraciones
        SELECT 
            IdNotificacionProyecto,
            IdProyecto,
            TablasAVerificar
        FROM tbl_Notificacion_Proyecto
        WHERE Activo = 1 AND NotificacionesActivas = 1
        
        -- Variables para procesar las tablas (usamos nombres diferentes a los parámetros)
        DECLARE @CurrentProyectoId INT
        DECLARE @CurrentTablasAVerificar VARCHAR(500)
        DECLARE @TablaActual VARCHAR(100)
        DECLARE @Hoy DATE = GETDATE()-1
        
        -- Cursor para recorrer las configuraciones
        DECLARE config_cursor CURSOR FOR
        SELECT ConfigIdProyecto, ConfigTablasAVerificar FROM @Configuraciones
        
        OPEN config_cursor
        FETCH NEXT FROM config_cursor INTO @CurrentProyectoId, @CurrentTablasAVerificar
        
        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Procesar cada tabla en la lista
            DECLARE @Pos INT = 1
            DECLARE @NextPos INT
            DECLARE @Delimiter CHAR(1) = ','
            
            WHILE @Pos <= LEN(@CurrentTablasAVerificar)
            BEGIN
                SET @NextPos = CHARINDEX(@Delimiter, @CurrentTablasAVerificar, @Pos)
                
                IF @NextPos = 0 
                    SET @NextPos = LEN(@CurrentTablasAVerificar) + 1
                
                SET @TablaActual = LTRIM(RTRIM(SUBSTRING(@CurrentTablasAVerificar, @Pos, @NextPos - @Pos)))
                
                IF @TablaActual <> ''
                BEGIN
                    -- Verificar si la tabla existe en la base de datos
                    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @TablaActual)
                    BEGIN
                        -- Verificar si hay registros para hoy
                        DECLARE @Sql NVARCHAR(MAX)
                        SET @Sql = N'
                            IF NOT EXISTS (
                                SELECT 1 FROM ' + QUOTENAME(@TablaActual) + ' 
                                WHERE IdProyecto = @ProyectoId 
                                AND CONVERT(DATE, FechaBitacora) = @HoyFecha
                                AND activo = 1
                            )
                            BEGIN
                                INSERT INTO #RegistrosFaltantes
                                SELECT 
                                    p.IdProyecto,
                                    p.descripcionCorta AS NombreProyecto,
                                    @TablaParam AS TablaVerificada,
                                    @HoyFecha AS FechaVerificacion
                                FROM tbl_Proyecto p
                                WHERE p.IdProyecto = @ProyectoId
                                AND p.activo = 1
                            END'
                        
                        EXEC sp_executesql @Sql, 
                            N'@ProyectoId INT, @HoyFecha DATE, @TablaParam VARCHAR(100)',
                            @ProyectoId = @CurrentProyectoId, @HoyFecha = @Hoy, @TablaParam = @TablaActual
                    END
                END
                
                SET @Pos = @NextPos + 1
            END
            
            FETCH NEXT FROM config_cursor INTO @CurrentProyectoId, @CurrentTablasAVerificar
        END
        
        CLOSE config_cursor
        DEALLOCATE config_cursor
        
        -- Retornar los registros faltantes
        SELECT * FROM #RegistrosFaltantes
        
        DROP TABLE #RegistrosFaltantes
    END

    -- UPDATE (Actualizar)
    ELSE IF @Accion = 'UPDATE'
    BEGIN
        UPDATE [dbo].[tbl_Notificacion_Proyecto]
        SET 
            [IdProyecto] = ISNULL(@IdProyecto, [IdProyecto]),
            [NotificacionesActivas] = ISNULL(@NotificacionesActivas, [NotificacionesActivas]),
            [TablasAVerificar] = ISNULL(@TablasAVerificar, [TablasAVerificar]),
            [HoraEnvio] = ISNULL(@HoraEnvio, [HoraEnvio]),
            [CorreosDestinatarios] = ISNULL(@CorreosDestinatarios, [CorreosDestinatarios]),
            [Activo] = ISNULL(@Activo, [Activo]),
            [IdUsuarioRegister] = ISNULL(@IdUsuarioRegister, [IdUsuarioRegister])
        WHERE [IdNotificacionProyecto] = @IdNotificacionProyecto;
        
        SELECT @IdNotificacionProyecto AS IdNotificacionProyecto;
    END

    -- UPDATE (Actualizar fecha de última notificación)
    ELSE IF @Accion = 'UPDATE_LAST_NOTIFICATION'
    BEGIN
        UPDATE [dbo].[tbl_Notificacion_Proyecto]
        SET 
            [FechaUltimaNotificacion] = @FechaUltimaNotificacion
        WHERE [IdNotificacionProyecto] = @IdNotificacionProyecto;
        
        SELECT @@ROWCOUNT AS RowsAffected;
    END

    -- DELETE (Eliminar lógico)
    ELSE IF @Accion = 'DELETE'
    BEGIN
        UPDATE [dbo].[tbl_Notificacion_Proyecto]
        SET [Activo] = 0
        WHERE [IdNotificacionProyecto] = @IdNotificacionProyecto;
        
        SELECT @@ROWCOUNT AS RowsAffected;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Obra_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



















   CREATE PROCEDURE [dbo].[sp_Obra_CRUD]
    @Accion VARCHAR(10), -- CREATE, READ, UPDATE, DELETE
    @ObrasId INT = NULL,
    @ObrasNombre NVARCHAR(100) = NULL,
    @ObrasClave NVARCHAR(50) = NULL,
    @ObrasTipo NVARCHAR(50) = NULL,
    @ObrasEstatus NVARCHAR(20) = NULL,
    @ObraAutomatico BIT = NULL,
    @ObrasCiudad NVARCHAR(100) = NULL,
    @Usuario NVARCHAR(50) = NULL,
    @ClienteId INT = NULL,
    @ResponsableId INT = NULL,
    @Presupuesto DECIMAL(18,2) = NULL,
    @FechaInicio DATE = NULL,
    @FechaFin DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    -- CREATE: Insertar nueva obra
    IF @Accion = 'CREATE'
    BEGIN
        IF EXISTS (SELECT 1 FROM Obras WHERE ObrasClave = @ObrasClave)
        BEGIN
            RAISERROR('Ya existe una obra con esta clave', 16, 1);
            RETURN;
        END
        
        INSERT INTO Obras (
            ObrasNombre, ObrasClave, ObrasTipo, ObrasEstatus, 
            ObraAutomatico, ObrasCiudad, UsuarioCreacion,
            ClienteId, ResponsableId, Presupuesto, FechaInicio, FechaFin
        )
        VALUES (
            @ObrasNombre, @ObrasClave, @ObrasTipo, ISNULL(@ObrasEstatus, 'Activo'), 
            ISNULL(@ObraAutomatico, 0), @ObrasCiudad, @Usuario,
            @ClienteId, @ResponsableId, @Presupuesto, @FechaInicio, @FechaFin
        );
        
        SELECT SCOPE_IDENTITY() AS ObrasId;
    END
    
    -- READ: Obtener obras (todas o una específica)
    ELSE IF @Accion = 'READ'
    BEGIN
        IF @ObrasId IS NULL
        BEGIN
            -- Obtener todas las obras activas
            SELECT 
                O.ObrasId, O.ObrasNombre, O.ObrasClave, O.ObrasTipo, 
                O.ObrasEstatus, O.ObraAutomatico, O.ObrasCiudad,
                O.FechaCreacion, O.FechaModificacion,
                O.UsuarioCreacion, O.UsuarioModificacion,
                O.ClienteId, C.Nombre AS ClienteNombre,
                O.ResponsableId, R.Nombre AS ResponsableNombre,
                O.Presupuesto, O.FechaInicio, O.FechaFin
            FROM Obras O
            LEFT JOIN Clientes C ON O.ClienteId = C.ClienteId
            LEFT JOIN Responsables R ON O.ResponsableId = R.ResponsableId
            WHERE O.ObrasEstatus <> 'Inactivo'
            ORDER BY O.ObrasNombre;
        END
        ELSE
        BEGIN
            -- Obtener una obra específica
            SELECT 
                O.ObrasId, O.ObrasNombre, O.ObrasClave, O.ObrasTipo, 
                O.ObrasEstatus, O.ObraAutomatico, O.ObrasCiudad,
                O.FechaCreacion, O.FechaModificacion,
                O.UsuarioCreacion, O.UsuarioModificacion,
                O.ClienteId, C.Nombre AS ClienteNombre,
                O.ResponsableId, R.Nombre AS ResponsableNombre,
                O.Presupuesto, O.FechaInicio, O.FechaFin
            FROM Obras O
            LEFT JOIN Clientes C ON O.ClienteId = C.ClienteId
            LEFT JOIN Responsables R ON O.ResponsableId = R.ResponsableId
            WHERE O.ObrasId = @ObrasId;
        END
    END
    
    -- UPDATE: Actualizar obra existente
    ELSE IF @Accion = 'UPDATE'
    BEGIN
        UPDATE Obras SET
            ObrasNombre = @ObrasNombre,
            ObrasClave = @ObrasClave,
            ObrasTipo = @ObrasTipo,
            ObrasEstatus = @ObrasEstatus,
            ObraAutomatico = @ObraAutomatico,
            ObrasCiudad = @ObrasCiudad,
            FechaModificacion = GETDATE(),
            UsuarioModificacion = @Usuario,
            ClienteId = @ClienteId,
            ResponsableId = @ResponsableId,
            Presupuesto = @Presupuesto,
            FechaInicio = @FechaInicio,
            FechaFin = @FechaFin
        WHERE ObrasId = @ObrasId;
        
        SELECT @@ROWCOUNT AS FilasAfectadas;
    END
    
    -- DELETE: Eliminación lógica de obra
    ELSE IF @Accion = 'DELETE'
    BEGIN
        UPDATE Obras SET
            ObrasEstatus = 'Inactivo',
            FechaModificacion = GETDATE(),
            UsuarioModificacion = @Usuario
        WHERE ObrasId = @ObrasId;
        
        SELECT @@ROWCOUNT AS FilasAfectadas;
    END
    
    -- Acción no reconocida
    ELSE
    BEGIN
        RAISERROR('Acción no válida. Use CREATE, READ, UPDATE o DELETE', 16, 1);
    END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ProyectoClasificacion_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_ProyectoClasificacion_CRUD]
    @Accion VARCHAR(10),
    @IdProyecto_Clasificacion INT = NULL,
    @Descripcion VARCHAR(100) = NULL,
    @Activo BIT = NULL,
    @IdUsuarioRegister INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- LISTAR TODAS LAS CLASIFICACIONES
    IF @Accion = 'LIST'
    BEGIN
        SELECT 
            IdProyecto_Clasificacion,
            descripcion AS Descripcion,
            activo AS Activo,
            IdUsuarioRegister,
            FechaRegistro
        FROM tbl_Proyecto_clasificacion
        WHERE activo = 1 OR activo IS NULL
        ORDER BY descripcion;
    END

    -- OBTENER UNA CLASIFICACION POR ID
    ELSE IF @Accion = 'READ'
    BEGIN
        SELECT 
            IdProyecto_Clasificacion,
            descripcion AS Descripcion,
            activo AS Activo,
            IdUsuarioRegister,
            FechaRegistro
        FROM tbl_Proyecto_clasificacion
        WHERE IdProyecto_Clasificacion = @IdProyecto_Clasificacion;
    END

    -- CREAR UNA NUEVA CLASIFICACION
    ELSE IF @Accion = 'CREATE'
    BEGIN
        INSERT INTO tbl_Proyecto_clasificacion (
            descripcion,
            activo,
            IdUsuarioRegister
        )
        VALUES (
            @Descripcion,
            ISNULL(@Activo, 1),
            @IdUsuarioRegister
        );

        SELECT SCOPE_IDENTITY() AS IdProyecto_Clasificacion;
    END

    -- ACTUALIZAR UNA CLASIFICACION
    ELSE IF @Accion = 'UPDATE'
    BEGIN
        UPDATE tbl_Proyecto_clasificacion
        SET 
            descripcion = ISNULL(@Descripcion, descripcion),
            activo = ISNULL(@Activo, activo)
        WHERE IdProyecto_Clasificacion = @IdProyecto_Clasificacion;

        SELECT @@ROWCOUNT AS RowsAffected;
    END

    -- ELIMINAR (DESACTIVAR) UNA CLASIFICACION
    ELSE IF @Accion = 'DELETE'
    BEGIN
        UPDATE tbl_Proyecto_clasificacion
        SET activo = 0
        WHERE IdProyecto_Clasificacion = @IdProyecto_Clasificacion;

        SELECT @@ROWCOUNT AS RowsAffected;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ProyectoDocumento_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   CREATE PROCEDURE [dbo].[sp_ProyectoDocumento_CRUD]
    @Accion VARCHAR(10),
    @IdProyectoDocumento INT = NULL,
    @IdProyecto INT = NULL,
    @IdContrato INT = NULL,
    @NombreDocumento VARCHAR(100) = NULL,
    @RutaDocumento VARCHAR(255) = NULL,
    @TipoDocumento VARCHAR(50) = NULL,
    @IdUsuarioRegister INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- CREATE (Insert)
    IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO tbl_ProyectoDocumento (IdProyecto, IdContrato, NombreDocumento, RutaDocumento, TipoDocumento, FechaRegistro, IdUsuarioRegister, Activo)
        VALUES (@IdProyecto, @IdContrato, @NombreDocumento, @RutaDocumento, @TipoDocumento, GETDATE(), @IdUsuarioRegister, 1)
        
        SELECT SCOPE_IDENTITY() AS IdProyectoDocumento
    END
    
    -- READ (Select)
    ELSE IF @Accion = 'SELECT'
    BEGIN
        IF @IdProyectoDocumento IS NOT NULL
            SELECT * FROM tbl_ProyectoDocumento WHERE IdProyectoDocumento = @IdProyectoDocumento AND Activo = 1
        ELSE IF @IdProyecto IS NOT NULL
            SELECT * FROM tbl_ProyectoDocumento WHERE IdProyecto = @IdProyecto AND Activo = 1
        ELSE IF @IdContrato IS NOT NULL
            SELECT * FROM tbl_ProyectoDocumento WHERE IdContrato = @IdContrato AND Activo = 1
        ELSE
            SELECT * FROM tbl_ProyectoDocumento WHERE Activo = 1
    END
    
    -- UPDATE
    ELSE IF @Accion = 'UPDATE'
    BEGIN
        UPDATE tbl_ProyectoDocumento SET
            IdProyecto = @IdProyecto,
            IdContrato = @IdContrato,
            NombreDocumento = @NombreDocumento,
            RutaDocumento = @RutaDocumento,
            TipoDocumento = @TipoDocumento
        WHERE IdProyectoDocumento = @IdProyectoDocumento
    END
    
    -- DELETE (Soft delete)
    ELSE IF @Accion = 'DELETE'
    BEGIN
        UPDATE tbl_ProyectoDocumento SET
            Activo = 0
        WHERE IdProyectoDocumento = @IdProyectoDocumento
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Proyectos_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 CREATE PROCEDURE [dbo].[sp_Proyectos_CRUD]
    @Accion VARCHAR(20),  -- CREATE, READ, UPDATE, DELETE, LIST
    @IdProyecto INT = NULL,
    @Descripcion VARCHAR(500) = NULL,
    @DescripcionCorta VARCHAR(50) = NULL,
    @IdEstado INT = NULL,
    @Activo BIT = NULL,
    @IdUsuarioRegister INT = NULL,
    @FechaInicio DATE = NULL,
    @FechaFinal DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    -- CREATE: Insertar nuevo proyecto
    IF @Accion = 'CREATE'
    BEGIN
        --IF @Descripcion IS NULL OR @DescripcionCorta IS NULL OR @IdUsuarioRegister IS NULL
        --BEGIN
        --    RAISERROR('Descripción, DescripciónCorta e IdUsuarioRegister son campos requeridos', 16, 1);
        --    RETURN;
        --END
        
        INSERT INTO tbl_Proyecto (
            --IdProyecto,
            Descripcion, 
            DescripcionCorta, 
            IdEstado,
            Activo, 
            IdUsuarioRegister, 
            FechaRegistro,
            FechaInicio,
            FechaFinal
        )
        VALUES (
            -- (SELECT ISNULL(MAX(IdProyecto), 0) + 1 FROM tbl_Proyecto),
            @Descripcion, 
            @DescripcionCorta, 
            @IdEstado,
            ISNULL(@Activo, 1), 
            @IdUsuarioRegister, 
            GETDATE(),
            @FechaInicio,
            @FechaFinal
        );
        
        SELECT SCOPE_IDENTITY() AS IdProyecto;
    END
    
    -- READ: Obtener proyecto por ID
    ELSE IF @Accion = 'READ'
    BEGIN
        IF @IdProyecto IS NULL
        BEGIN
            RAISERROR('Se requiere el ID del proyecto', 16, 1);
            RETURN;
        END
        
        SELECT 
            IdProyecto, 
            Descripcion, 
            DescripcionCorta, 
            IdEstado,
            Activo,
            IdUsuarioRegister,
            FechaRegistro,
            FechaInicio,
            FechaFinal
        FROM tbl_Proyecto
        WHERE IdProyecto = @IdProyecto;
    END
    
    -- LIST: Obtener todos los proyectos activos
    ELSE IF @Accion = 'LIST'
    BEGIN
        SELECT 
            IdProyecto, 
            Descripcion, 
            DescripcionCorta, 
            IdEstado,
            Activo,
            IdUsuarioRegister,
            FechaRegistro,
            FechaInicio,
            FechaFinal
        FROM tbl_Proyecto
        WHERE Activo = 1 OR @Activo IS NULL
        ORDER BY FechaRegistro DESC;
    END
    
    -- UPDATE: Actualizar proyecto existente
    ELSE IF @Accion = 'UPDATE'
    BEGIN
        IF @IdProyecto IS NULL
        BEGIN
            RAISERROR('Se requiere el ID del proyecto', 16, 1);
            RETURN;
        END
        
        -- Verificar que el proyecto existe
        IF NOT EXISTS (SELECT 1 FROM tbl_Proyecto WHERE IdProyecto = @IdProyecto)
        BEGIN
            RAISERROR('El proyecto especificado no existe', 16, 1);
            RETURN;
        END
        
        -- Actualizar solo los campos proporcionados
        DECLARE @SQL NVARCHAR(MAX) = N'UPDATE tbl_Proyecto SET ';
        
        IF @Descripcion IS NOT NULL
            SET @SQL = @SQL + 'Descripcion = @Descripcion, ';
        
        IF @DescripcionCorta IS NOT NULL
            SET @SQL = @SQL + 'DescripcionCorta = @DescripcionCorta, ';
            
        IF @IdEstado IS NOT NULL
            SET @SQL = @SQL + 'IdEstado = @IdEstado, ';
            
        IF @Activo IS NOT NULL
            SET @SQL = @SQL + 'Activo = @Activo, ';
            
        IF @FechaInicio IS NOT NULL
            SET @SQL = @SQL + 'FechaInicio = @FechaInicio, ';
            
        IF @FechaFinal IS NOT NULL
            SET @SQL = @SQL + 'FechaFinal = @FechaFinal, ';
        
        -- Eliminar la última coma y espacio
        SET @SQL = LEFT(@SQL, LEN(@SQL) - 1);
        
        SET @SQL = @SQL + ' WHERE IdProyecto = @IdProyecto';
        
        -- Ejecutar el UPDATE dinámico
        EXEC sp_executesql @SQL, 
             N'@IdProyecto INT, @Descripcion VARCHAR(500), @DescripcionCorta VARCHAR(50), 
               @IdEstado INT, @Activo BIT, @FechaInicio DATE, @FechaFinal DATE',
             @IdProyecto, @Descripcion, @DescripcionCorta, @IdEstado, 
             @Activo, @FechaInicio, @FechaFinal;
        
        SELECT @@ROWCOUNT AS FilasAfectadas;
    END
    
    -- DELETE: Eliminación lógica (desactivar)
    ELSE IF @Accion = 'DELETE'
    BEGIN
        IF @IdProyecto IS NULL
        BEGIN
            RAISERROR('Se requiere el ID del proyecto', 16, 1);
            RETURN;
        END
        
        UPDATE tbl_Proyecto SET
            Activo = 0
        WHERE IdProyecto = @IdProyecto;
        
        SELECT @@ROWCOUNT AS FilasAfectadas;
    END
    
    -- Acción no reconocida
    ELSE
    BEGIN
        RAISERROR('Acción no válida. Use: CREATE, READ, LIST, UPDATE o DELETE', 16, 1);
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Responsable_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	 CREATE PROCEDURE [dbo].[sp_Responsable_CRUD]
    @Accion VARCHAR(10),
    @ResponsableId INT = NULL,
    @Nombre NVARCHAR(100) = NULL,
    @Puesto NVARCHAR(100) = NULL,
    @Telefono NVARCHAR(20) = NULL,
    @Email NVARCHAR(100) = NULL,
    @Usuario NVARCHAR(50) = NULL,
    @Estatus NVARCHAR(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    -- CREATE
    IF @Accion = 'CREATE'
    BEGIN
        INSERT INTO Responsables (Nombre, Puesto, Telefono, Email, UsuarioCreacion, Estatus)
        VALUES (@Nombre, @Puesto, @Telefono, @Email, @Usuario, ISNULL(@Estatus, 'Activo'));
        
        SELECT SCOPE_IDENTITY() AS ResponsableId;
    END
    
    -- READ
    ELSE IF @Accion = 'READ'
    BEGIN
        IF @ResponsableId IS NULL
        BEGIN
            SELECT * FROM Responsables WHERE Estatus <> 'Inactivo' ORDER BY Nombre;
        END
        ELSE
        BEGIN
            SELECT * FROM Responsables WHERE ResponsableId = @ResponsableId;
        END
    END
    
    -- UPDATE
    ELSE IF @Accion = 'UPDATE'
    BEGIN
        UPDATE Responsables SET
            Nombre = @Nombre,
            Puesto = @Puesto,
            Telefono = @Telefono,
            Email = @Email,
            FechaModificacion = GETDATE(),
            UsuarioModificacion = @Usuario,
            Estatus = @Estatus
        WHERE ResponsableId = @ResponsableId;
        
        SELECT @@ROWCOUNT AS FilasAfectadas;
    END
    
    -- DELETE (Eliminación lógica)
    ELSE IF @Accion = 'DELETE'
    BEGIN
        UPDATE Responsables SET
            Estatus = 'Inactivo',
            FechaModificacion = GETDATE(),
            UsuarioModificacion = @Usuario
        WHERE ResponsableId = @ResponsableId;
        
        SELECT @@ROWCOUNT AS FilasAfectadas;
    END
    
    ELSE
    BEGIN
        RAISERROR('Acción no válida. Use CREATE, READ, UPDATE o DELETE', 16, 1);
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuario_Proyecto_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
						  CREATE PROCEDURE [dbo].[sp_Usuario_Proyecto_CRUD]
    @Accion VARCHAR(10),
    @Id_Usuario_Proyecto INT = NULL,
    @id_usuario BIGINT = NULL,
    @IdProyecto INT = NULL,
    @activo BIT = NULL,
    @IdUsuarioRegister INT = NULL,
    @FechaRegistro DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- CREATE (Insertar)
    IF @Accion = 'CREATE'
    BEGIN
        INSERT INTO [dbo].[tbl_Usuario_Proyecto] (
            [id_usuario],
            [IdProyecto],
            [activo],
            [IdUsuarioRegister],
            [FechaRegistro]
        )
        VALUES (
            @id_usuario,
            @IdProyecto,
            ISNULL(@activo, 1),
            @IdUsuarioRegister,
            ISNULL(@FechaRegistro, GETDATE())
        )
        
        SELECT SCOPE_IDENTITY() AS Id_Usuario_Proyecto;
    END

    -- READ (Obtener todos)
    ELSE IF @Accion = 'READ_ALL'
    BEGIN
        SELECT 
            up.[Id_Usuario_Proyecto],
            up.[id_usuario],
            up.[IdProyecto],
            up.[activo],
            up.[IdUsuarioRegister],
            up.[FechaRegistro]
        FROM [dbo].[tbl_Usuario_Proyecto] up
        WHERE up.[activo] = 1;
    END

    -- READ (Obtener por ID)
    ELSE IF @Accion = 'READ'
    BEGIN
        SELECT 
            up.[Id_Usuario_Proyecto],
            up.[id_usuario],
            up.[IdProyecto],
            up.[activo],
            up.[IdUsuarioRegister],
            up.[FechaRegistro]
        FROM [dbo].[tbl_Usuario_Proyecto] up
        WHERE up.[Id_Usuario_Proyecto] = @Id_Usuario_Proyecto;
    END

    -- READ (Obtener por usuario)
    ELSE IF @Accion = 'READ_BY_USER'
    BEGIN
        SELECT 
            up.[Id_Usuario_Proyecto],
            up.[id_usuario],
            up.[IdProyecto],
            up.[activo],
            up.[IdUsuarioRegister],
            up.[FechaRegistro]
        FROM [dbo].[tbl_Usuario_Proyecto] up
        WHERE up.[id_usuario] = @id_usuario AND up.[activo] = 1;
    END

    -- READ (Obtener por proyecto)
    ELSE IF @Accion = 'READ_BY_PROJECT'
    BEGIN
        SELECT 
            up.[Id_Usuario_Proyecto],
            up.[id_usuario],
            up.[IdProyecto],
            up.[activo],
            up.[IdUsuarioRegister],
            up.[FechaRegistro]
        FROM [dbo].[tbl_Usuario_Proyecto] up
        WHERE up.[IdProyecto] = @IdProyecto AND up.[activo] = 1;
    END

    -- UPDATE (Actualizar)
    ELSE IF @Accion = 'UPDATE'
    BEGIN
        UPDATE [dbo].[tbl_Usuario_Proyecto]
        SET 
            [id_usuario] = ISNULL(@id_usuario, [id_usuario]),
            [IdProyecto] = ISNULL(@IdProyecto, [IdProyecto]),
            [activo] = ISNULL(@activo, [activo]),
            [IdUsuarioRegister] = ISNULL(@IdUsuarioRegister, [IdUsuarioRegister])
        WHERE [Id_Usuario_Proyecto] = @Id_Usuario_Proyecto;
        
        SELECT @Id_Usuario_Proyecto AS Id_Usuario_Proyecto;
    END

    -- DELETE (Eliminar lógico)
    ELSE IF @Accion = 'DELETE'
    BEGIN
        UPDATE [dbo].[tbl_Usuario_Proyecto]
        SET [activo] = 0
        WHERE [Id_Usuario_Proyecto] = @Id_Usuario_Proyecto;
        
        SELECT @@ROWCOUNT AS RowsAffected;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UsuarioRoles_CRUD]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_UsuarioRoles_CRUD]
    @Accion NVARCHAR(50),
    @id_usuario_rol INT = NULL,
    @id_usuario INT = NULL,
    @id_rol INT = NULL,
    @usuario_modificacion int = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- INSERTAR nueva asignación
    IF @Accion = 'CREATE'
    BEGIN
        -- Verificar si ya existe la asignación
        IF EXISTS (SELECT 1 FROM USUARIO_ROLES WHERE id_usuario = @id_usuario AND id_rol = @id_rol)
        BEGIN
            RAISERROR('El usuario ya tiene asignado este rol', 16, 1);
            RETURN;
        END

        INSERT INTO USUARIO_ROLES (id_usuario, id_rol, fecha_asignacion, usuario_modificacion)
        VALUES (@id_usuario, @id_rol, GETDATE(), @usuario_modificacion);

        SELECT SCOPE_IDENTITY() AS id_usuario_rol;
        RETURN;
    END

    -- LEER todas las asignaciones
    IF @Accion = 'READ'
    BEGIN
        SELECT 
            ur.id_usuario_rol,
            ur.id_usuario,
            ur.id_rol,
            ur.fecha_asignacion,
            ur.usuario_modificacion,
            u.NombreUsuario,
            r.nombre_rol
        FROM 
            USUARIO_ROLES ur
            INNER JOIN USUARIOS u ON ur.id_usuario = u.id_usuario
            INNER JOIN ROLES r ON ur.id_rol = r.id_rol;
        RETURN;
    END

    -- LEER asignaciones por usuario
    IF @Accion = 'READ_BY_USUARIO'
    BEGIN
        SELECT 
            ur.id_usuario_rol,
            ur.id_usuario,
            ur.id_rol,
            ur.fecha_asignacion,
            ur.usuario_modificacion,
            u.NombreUsuario,
            r.nombre_rol
        FROM 
            USUARIO_ROLES ur
            INNER JOIN USUARIOS u ON ur.id_usuario = u.id_usuario
            INNER JOIN ROLES r ON ur.id_rol = r.id_rol
        WHERE 
            ur.id_usuario = @id_usuario;
        RETURN;
    END

    -- LEER una asignación específica
    IF @Accion = 'READ_BY_ID'
    BEGIN
        SELECT 
            ur.id_usuario_rol,
            ur.id_usuario,
            ur.id_rol,
            ur.fecha_asignacion,
            ur.usuario_modificacion,
            u.NombreUsuario,
            r.nombre_rol
        FROM 
            USUARIO_ROLES ur
            INNER JOIN USUARIOS u ON ur.id_usuario = u.id_usuario
            INNER JOIN ROLES r ON ur.id_rol = r.id_rol
        WHERE 
            ur.id_usuario_rol = @id_usuario_rol;
        RETURN;
    END

    -- ELIMINAR asignación
    IF @Accion = 'DELETE'
    BEGIN
        DELETE FROM USUARIO_ROLES 
        WHERE id_usuario_rol = @id_usuario_rol;
        
        SELECT @@ROWCOUNT AS rows_affected;
        RETURN;
    END

    -- LEER roles disponibles para un usuario (los que no tiene asignados)
    IF @Accion = 'READ_ROLES_DISPONIBLES'
    BEGIN
        SELECT 
            r.id_rol,
            r.nombre_rol,
            r.descripcion
        FROM 
            ROLES r
        WHERE 
            r.id_rol NOT IN (
                SELECT id_rol 
                FROM USUARIO_ROLES 
                WHERE id_usuario = @id_usuario
            );
        RETURN;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[usuarios_crud]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
						 CREATE PROCEDURE [dbo].[usuarios_crud]
    @accion NVARCHAR(100),
    @id_usuario BIGINT = NULL,
    @num_id NVARCHAR(100) = NULL,
    @NombreUsuario NVARCHAR(100) = NULL,
    @PasswordHash NVARCHAR(100) = NULL,
    @nombres NVARCHAR(100) = NULL,
    @apellidos NVARCHAR(100) = NULL,
    @Email NVARCHAR(100) = NULL,
    @fecha_creacion DATETIME = NULL,
    @fecha_nacimiento DATE = NULL,
    @foto_perfil NVARCHAR(500) = NULL,
    @foto_portada NVARCHAR(500) = NULL,
    @password_temp BIT = NULL,
    @two_factor BIT = NULL,	
    @activo BIT = NULL,
    @Token NVARCHAR(100) = NULL,
    @IdUsuario INT = null OUTPUT 
AS
BEGIN
    SET NOCOUNT ON;

    -- Login: Obtener usuario por nombre de usuario o email
	IF @accion = 'login'
	BEGIN
		SELECT * FROM V_Usuarios 
		WHERE (NombreUsuario = @NombreUsuario OR Email = @Email)
		--AND activo = 1; -- Solo usuarios activos
		RETURN;
	END
    
    -- Obtener todos los usuarios activos
    IF @accion = 'read'
    BEGIN
        SELECT id_usuario, num_id, NombreUsuario, PasswordHash, nombre, apellido, 
               Email, fecha_creacion, fecha_nacimiento, 
               foto_perfil, foto_portada, password_temp, activo, two_factor
        FROM V_Usuarios
        WHERE @activo IS NULL OR activo = @activo;
        RETURN;
    END
    
    -- Obtener usuario por ID
    ELSE IF @accion = 'read_by_id'
    BEGIN
        SELECT id_usuario, num_id, NombreUsuario, PasswordHash, nombre, apellido, 
               Email, fecha_creacion, fecha_nacimiento, 
               foto_perfil, foto_portada, password_temp, activo, two_factor
        FROM V_Usuarios
        WHERE id_usuario = @id_usuario;
        RETURN;
    END
    
    -- Obtener usuario por nombre de usuario
    ELSE IF @accion = 'read_by_username'
    BEGIN
        SELECT id_usuario, num_id, NombreUsuario, PasswordHash, nombre, apellido, 
               Email, fecha_creacion, fecha_nacimiento, 
               foto_perfil, foto_portada, password_temp, activo, two_factor
        FROM V_Usuarios
        WHERE NombreUsuario = @NombreUsuario;
        RETURN;
    END
    
    -- Insertar nuevo usuario
    ELSE IF @accion = 'insert'
    BEGIN
        INSERT INTO USUARIOS (
            num_id, NombreUsuario, PasswordHash, nombre, apellido, 
            Email, fecha_creacion, fecha_nacimiento, 
            foto_perfil, foto_portada, password_temp, activo, two_factor
        )
        VALUES (
            @num_id, @NombreUsuario, @PasswordHash, @nombres, @apellidos, 
            @Email, ISNULL(@fecha_creacion, GETDATE()), @fecha_nacimiento,
            @foto_perfil, @foto_portada, ISNULL(@password_temp, 1), ISNULL(@activo, 1), ISNULL(@two_factor, 0)
        );
        
        SET @IdUsuario = SCOPE_IDENTITY();
        RETURN;
    END
    
    -- Actualizar usuario
    ELSE IF @accion = 'update'
    BEGIN
        UPDATE USUARIOS
        SET 
            num_id = @num_id,
            NombreUsuario = @NombreUsuario,
            PasswordHash = ISNULL(@PasswordHash, PasswordHash),
            nombre = @nombres,
            apellido = @apellidos,
            Email = @Email,
            fecha_creacion = @fecha_creacion,
            fecha_nacimiento = @fecha_nacimiento,
            foto_perfil = @foto_perfil,
            foto_portada = @foto_portada,
            password_temp = ISNULL(@password_temp, password_temp),
            activo = ISNULL(@activo, activo),
            two_factor = ISNULL(@two_factor, two_factor)
        WHERE id_usuario = @id_usuario;
        RETURN;
    END
    
    -- Desactivar usuario (borrado lógico)
    ELSE IF @accion = 'delete'
    BEGIN
        UPDATE USUARIOS
        SET activo = 0
        WHERE id_usuario = @id_usuario;
        RETURN;
    END
    
    -- Eliminar usuario permanentemente
    ELSE IF @accion = 'delete_permanent'
    BEGIN
        DELETE FROM USUARIOS
        WHERE id_usuario = @id_usuario;
        RETURN;
    END
    
    -- Validar si nombre de usuario existe
    IF @Accion = 'ValidarUsuario'
    BEGIN
        SELECT COUNT(*) AS Existe
        FROM Usuarios
        WHERE NombreUsuario = @NombreUsuario;
        RETURN;
    END
    
    -- Validar si email existe
    IF @Accion = 'ValidarEmail'
    BEGIN
        SELECT COUNT(*) AS Existe
        FROM Usuarios
        WHERE Email = @Email;
        RETURN;
    END

    -- Obtener hash de contraseña para validación
    IF @Accion = 'ValidarPassword'
    BEGIN
        SELECT PasswordHash
        FROM Usuarios
        WHERE id_usuario = @id_usuario;
        RETURN;
    END

    -- Actualizar contraseña
    IF @Accion = 'ActualizarPassword'
    BEGIN
        UPDATE Usuarios
        SET 
            PasswordHash = @PasswordHash, 
            password_temp = 0,
            fecha_creacion = GETDATE()
        WHERE id_usuario = @id_usuario;
        RETURN;
    END
    
    -- Restablecer contraseña (generar una temporal)
    IF @Accion = 'RestablecerPassword'
    BEGIN
        UPDATE Usuarios
        SET 
            PasswordHash = @PasswordHash,
            password_temp = @password_temp,
            fecha_creacion = GETDATE()
        WHERE id_usuario = @id_usuario;

        SELECT Email
        FROM Usuarios
        WHERE id_usuario = @id_usuario;
        RETURN;
    END

    -- Generar token para verificación (2FA, recuperación, etc.)
    IF @accion = 'generate_token'
    BEGIN
        -- Invalidar tokens previos
        UPDATE USUARIO_TOKEN_VERIFICACION
        SET EsValido = 0
        WHERE id_usuario = @id_usuario AND TipoToken = '2FA';
        
        -- Insertar nuevo token
        INSERT INTO USUARIO_TOKEN_VERIFICACION (
            id_usuario, Token, Expiracion, EsValido, TipoToken
        )
        VALUES (
            @id_usuario, @token, DATEADD(MINUTE, 15, GETDATE()), 1, '2FA'
        );
        
        RETURN;
    END

    -- Validar token generado
    IF @accion = 'validate_token'
    BEGIN
        SELECT COUNT(*) AS TokenValido
        FROM USUARIO_TOKEN_VERIFICACION
        WHERE id_usuario = @id_usuario
          AND Token = @token
          AND Expiracion > GETDATE()
          AND EsValido = 1;
        
        -- Marcar el token como no válido
        UPDATE USUARIO_TOKEN_VERIFICACION
        SET EsValido = 0
        WHERE id_usuario = @id_usuario AND Token = @token;
        RETURN;
    END

    -- Validar token 2FA y obtener ID de usuario
    IF @accion = 'ValidarToken2FA'
    BEGIN
        SELECT TOP 1 @IdUsuario = id_usuario
        FROM USUARIO_TOKEN_VERIFICACION
        WHERE Token = @Token
          AND EsValido = 1
          AND Expiracion > GETDATE()
          AND TipoToken = '2FA';
        
        -- Retornar -1 si no encuentra un token válido
        IF @IdUsuario IS NULL
            RETURN -1;

        -- Marcar el token como usado
        UPDATE USUARIO_TOKEN_VERIFICACION
        SET EsValido = 0
        WHERE Token = @Token;

        -- Marcar el usuario como validado
        UPDATE USUARIOS
        SET two_factor = 1
        WHERE id_usuario = @IdUsuario;

        RETURN 0; -- Éxito
    END

    -- Habilitar/deshabilitar autenticación de dos factores
    IF @accion = 'toggle_two_factor'
    BEGIN
        UPDATE USUARIOS
        SET two_factor = ISNULL(@two_factor, 1 - two_factor)
        WHERE id_usuario = @id_usuario;
        RETURN;
    END
    
    -- Activar/desactivar usuario
    IF @accion = 'toggle_status'
    BEGIN
        UPDATE USUARIOS
        SET activo = ISNULL(@activo, 1 - activo)
        WHERE id_usuario = @id_usuario;
        RETURN;
    END
    
    -- Buscar usuarios por criterios múltiples
    IF @accion = 'search'
    BEGIN
        SELECT id_usuario, num_id, NombreUsuario, nombre, apellido, 
               Email, fecha_creacion, activo
        FROM V_Usuarios
        WHERE 
            (@NombreUsuario IS NULL OR NombreUsuario LIKE '%' + @NombreUsuario + '%')
            AND (@nombres IS NULL OR nombre LIKE '%' + @nombres + '%')
            AND (@apellidos IS NULL OR apellido LIKE '%' + @apellidos + '%')
            AND (@Email IS NULL OR Email LIKE '%' + @Email + '%')
            AND (@activo IS NULL OR activo = @activo);
        RETURN;
    END
    
    -- Obtener estadísticas de usuarios
    IF @accion = 'stats'
    BEGIN
        SELECT 
            COUNT(*) AS TotalUsuarios,
            SUM(CASE WHEN activo = 1 THEN 1 ELSE 0 END) AS UsuariosActivos,
            SUM(CASE WHEN activo = 0 THEN 1 ELSE 0 END) AS UsuariosInactivos,
            SUM(CASE WHEN two_factor = 1 THEN 1 ELSE 0 END) AS UsuariosCon2FA,
            SUM(CASE WHEN password_temp = 1 THEN 1 ELSE 0 END) AS UsuariosConPasswordTemp,
            MIN(fecha_creacion) AS UsuarioMasAntiguo,
            MAX(fecha_creacion) AS UsuarioMasReciente
        FROM USUARIOS;
        RETURN;
    END
    
    -- Obtener tokens de usuario
    IF @accion = 'get_tokens'
    BEGIN
        SELECT Token, Expiracion, TipoToken, EsValido
        FROM USUARIO_TOKEN_VERIFICACION
        WHERE id_usuario = @id_usuario
        ORDER BY Expiracion DESC;
        RETURN;
    END
    
    -- Invalidar todos los tokens de un usuario
    IF @accion = 'invalidate_tokens'
    BEGIN
        UPDATE USUARIO_TOKEN_VERIFICACION
        SET EsValido = 0
        WHERE id_usuario = @id_usuario;
        RETURN;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[usuarios_crud_acciones_adicionales]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

						CREATE PROCEDURE [dbo].[usuarios_crud_acciones_adicionales]
    @Accion NVARCHAR(50),
    @NombreUsuario NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @Accion = 'ValidarUsuario'
    BEGIN
        SELECT COUNT(*)
        FROM usuarios
        WHERE NombreUsuario = @NombreUsuario;
    END
END

GO
/****** Object:  StoredProcedure [dbo].[usuarios_ObtenerUsuarioPorNombre]    Script Date: 03/07/2025 05:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para obtener usuario por nombre
CREATE PROCEDURE [dbo].[usuarios_ObtenerUsuarioPorNombre]
    @NombreUsuario NVARCHAR(100)
AS
BEGIN
    SELECT * FROM Usuarios WHERE NombreUsuario = @NombreUsuario;
END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "USUARIOS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 11
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Usuarios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Usuarios'
GO
USE [master]
GO
ALTER DATABASE [db_ab7f1d_dbthefuentes] SET  READ_WRITE 
GO
