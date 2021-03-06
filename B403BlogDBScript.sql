USE [master]
GO
/****** Object:  Database [B403Blog]    Script Date: 21.05.2019 15:43:20 ******/
CREATE DATABASE [B403Blog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'B403Blog', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.LOCALHOST\MSSQL\DATA\B403Blog.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'B403Blog_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.LOCALHOST\MSSQL\DATA\B403Blog_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [B403Blog] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [B403Blog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [B403Blog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [B403Blog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [B403Blog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [B403Blog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [B403Blog] SET ARITHABORT OFF 
GO
ALTER DATABASE [B403Blog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [B403Blog] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [B403Blog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [B403Blog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [B403Blog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [B403Blog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [B403Blog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [B403Blog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [B403Blog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [B403Blog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [B403Blog] SET  DISABLE_BROKER 
GO
ALTER DATABASE [B403Blog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [B403Blog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [B403Blog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [B403Blog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [B403Blog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [B403Blog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [B403Blog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [B403Blog] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [B403Blog] SET  MULTI_USER 
GO
ALTER DATABASE [B403Blog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [B403Blog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [B403Blog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [B403Blog] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [B403Blog]
GO
/****** Object:  Table [dbo].[Etiket]    Script Date: 21.05.2019 15:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiket](
	[EtiketId] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Etiket] PRIMARY KEY CLUSTERED 
(
	[EtiketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 21.05.2019 15:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[KategoriId] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](500) NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 21.05.2019 15:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciId] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Soyadi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](500) NULL,
	[KullaniciAdi] [nvarchar](50) NOT NULL,
	[Parola] [nvarchar](200) NOT NULL,
	[MailAdres] [nvarchar](250) NOT NULL,
	[Cinsiyet] [bit] NULL,
	[DogumTarihi] [date] NULL,
	[ResimID] [int] NULL,
	[KayitTarihi] [datetime] NOT NULL,
	[Yazar] [bit] NULL,
	[Onaylandi] [bit] NULL,
	[Aktif] [bit] NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[KullaniciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KullaniciRol]    Script Date: 21.05.2019 15:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullaniciRol](
	[KullaniciRolId] [int] IDENTITY(1,1) NOT NULL,
	[RolID] [int] NOT NULL,
	[KullaniciID] [int] NOT NULL,
 CONSTRAINT [PK_KullaniciRol] PRIMARY KEY CLUSTERED 
(
	[RolID] ASC,
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Makale]    Script Date: 21.05.2019 15:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Makale](
	[MakaleId] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [nvarchar](100) NOT NULL,
	[İcerik] [nvarchar](max) NOT NULL,
	[EklenmeTarihi] [datetime] NULL,
	[KategoriID] [int] NOT NULL,
	[GoruntulenmeSayisi] [int] NOT NULL,
	[Begeni] [int] NOT NULL,
	[YazarID] [int] NOT NULL,
	[ResimID] [int] NULL,
 CONSTRAINT [PK_Makale] PRIMARY KEY CLUSTERED 
(
	[MakaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MakaleEtiket]    Script Date: 21.05.2019 15:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MakaleEtiket](
	[MakaleID] [int] NOT NULL,
	[EtiketID] [int] NOT NULL,
 CONSTRAINT [PK_MakaleEtiket] PRIMARY KEY CLUSTERED 
(
	[MakaleID] ASC,
	[EtiketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resim]    Script Date: 21.05.2019 15:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resim](
	[ResimId] [int] IDENTITY(1,1) NOT NULL,
	[KucukBoyut] [nvarchar](250) NULL,
	[OrtaBoyut] [nvarchar](250) NULL,
	[BuyukBoyut] [nvarchar](250) NULL,
	[Video] [nvarchar](250) NULL,
	[MakaleID] [int] NULL,
	[KullaniciID] [int] NULL,
 CONSTRAINT [PK_Resim] PRIMARY KEY CLUSTERED 
(
	[ResimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rol]    Script Date: 21.05.2019 15:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[RolId] [int] IDENTITY(1,1) NOT NULL,
	[RolAdi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[RolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YazarTakip]    Script Date: 21.05.2019 15:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YazarTakip](
	[YazarID] [int] NOT NULL,
	[KullaniciID] [int] NOT NULL,
 CONSTRAINT [PK_YazarTakip] PRIMARY KEY CLUSTERED 
(
	[YazarID] ASC,
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Yorum]    Script Date: 21.05.2019 15:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorum](
	[YorumId] [int] IDENTITY(1,1) NOT NULL,
	[Yorum] [nvarchar](1500) NOT NULL,
	[MakaleID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NULL,
	[AdSoyad] [nvarchar](150) NOT NULL,
	[Begeni] [int] NULL,
 CONSTRAINT [PK_Yorum] PRIMARY KEY CLUSTERED 
(
	[YorumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Kullanici] ADD  CONSTRAINT [DF_Kullanici_KayitTarihi]  DEFAULT (getdate()) FOR [KayitTarihi]
GO
ALTER TABLE [dbo].[Makale] ADD  CONSTRAINT [DF_Makale_EklenmeTarihi]  DEFAULT (getdate()) FOR [EklenmeTarihi]
GO
ALTER TABLE [dbo].[Makale] ADD  CONSTRAINT [DF_Makale_GoruntulenmeSayisi]  DEFAULT ((0)) FOR [GoruntulenmeSayisi]
GO
ALTER TABLE [dbo].[Makale] ADD  CONSTRAINT [DF_Makale_Begeni]  DEFAULT ((0)) FOR [Begeni]
GO
ALTER TABLE [dbo].[Yorum] ADD  CONSTRAINT [DF_Yorum_EklenmeTarihi]  DEFAULT (getdate()) FOR [EklenmeTarihi]
GO
ALTER TABLE [dbo].[Yorum] ADD  CONSTRAINT [DF_Yorum_Begeni]  DEFAULT ((0)) FOR [Begeni]
GO
ALTER TABLE [dbo].[Kullanici]  WITH CHECK ADD  CONSTRAINT [FK_Kullanici_Resim] FOREIGN KEY([ResimID])
REFERENCES [dbo].[Resim] ([ResimId])
GO
ALTER TABLE [dbo].[Kullanici] CHECK CONSTRAINT [FK_Kullanici_Resim]
GO
ALTER TABLE [dbo].[KullaniciRol]  WITH CHECK ADD  CONSTRAINT [FK_KullaniciRol_Kullanici1] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciId])
GO
ALTER TABLE [dbo].[KullaniciRol] CHECK CONSTRAINT [FK_KullaniciRol_Kullanici1]
GO
ALTER TABLE [dbo].[KullaniciRol]  WITH CHECK ADD  CONSTRAINT [FK_KullaniciRol_Rol] FOREIGN KEY([RolID])
REFERENCES [dbo].[Rol] ([RolId])
GO
ALTER TABLE [dbo].[KullaniciRol] CHECK CONSTRAINT [FK_KullaniciRol_Rol]
GO
ALTER TABLE [dbo].[Makale]  WITH CHECK ADD  CONSTRAINT [FK_Makale_Kategori] FOREIGN KEY([KategoriID])
REFERENCES [dbo].[Kategori] ([KategoriId])
GO
ALTER TABLE [dbo].[Makale] CHECK CONSTRAINT [FK_Makale_Kategori]
GO
ALTER TABLE [dbo].[Makale]  WITH CHECK ADD  CONSTRAINT [FK_Makale_Kullanici] FOREIGN KEY([YazarID])
REFERENCES [dbo].[Kullanici] ([KullaniciId])
GO
ALTER TABLE [dbo].[Makale] CHECK CONSTRAINT [FK_Makale_Kullanici]
GO
ALTER TABLE [dbo].[Makale]  WITH CHECK ADD  CONSTRAINT [FK_Makale_Resim] FOREIGN KEY([ResimID])
REFERENCES [dbo].[Resim] ([ResimId])
GO
ALTER TABLE [dbo].[Makale] CHECK CONSTRAINT [FK_Makale_Resim]
GO
ALTER TABLE [dbo].[MakaleEtiket]  WITH CHECK ADD  CONSTRAINT [FK_MakaleEtiket_Etiket] FOREIGN KEY([EtiketID])
REFERENCES [dbo].[Etiket] ([EtiketId])
GO
ALTER TABLE [dbo].[MakaleEtiket] CHECK CONSTRAINT [FK_MakaleEtiket_Etiket]
GO
ALTER TABLE [dbo].[MakaleEtiket]  WITH CHECK ADD  CONSTRAINT [FK_MakaleEtiket_Makale] FOREIGN KEY([MakaleID])
REFERENCES [dbo].[Makale] ([MakaleId])
GO
ALTER TABLE [dbo].[MakaleEtiket] CHECK CONSTRAINT [FK_MakaleEtiket_Makale]
GO
ALTER TABLE [dbo].[Resim]  WITH CHECK ADD  CONSTRAINT [FK_Resim_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciId])
GO
ALTER TABLE [dbo].[Resim] CHECK CONSTRAINT [FK_Resim_Kullanici]
GO
ALTER TABLE [dbo].[Resim]  WITH CHECK ADD  CONSTRAINT [FK_Resim_Makale] FOREIGN KEY([MakaleID])
REFERENCES [dbo].[Makale] ([MakaleId])
GO
ALTER TABLE [dbo].[Resim] CHECK CONSTRAINT [FK_Resim_Makale]
GO
ALTER TABLE [dbo].[YazarTakip]  WITH CHECK ADD  CONSTRAINT [FK_YazarTakip_Kullanici1] FOREIGN KEY([YazarID])
REFERENCES [dbo].[Kullanici] ([KullaniciId])
GO
ALTER TABLE [dbo].[YazarTakip] CHECK CONSTRAINT [FK_YazarTakip_Kullanici1]
GO
ALTER TABLE [dbo].[YazarTakip]  WITH CHECK ADD  CONSTRAINT [FK_YazarTakip_Kullanici2] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciId])
GO
ALTER TABLE [dbo].[YazarTakip] CHECK CONSTRAINT [FK_YazarTakip_Kullanici2]
GO
ALTER TABLE [dbo].[Yorum]  WITH CHECK ADD  CONSTRAINT [FK_Yorum_Makale] FOREIGN KEY([MakaleID])
REFERENCES [dbo].[Makale] ([MakaleId])
GO
ALTER TABLE [dbo].[Yorum] CHECK CONSTRAINT [FK_Yorum_Makale]
GO
USE [master]
GO
ALTER DATABASE [B403Blog] SET  READ_WRITE 
GO
