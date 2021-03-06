USE [master]
GO
/****** Object:  Database [ClassifiedNew]    Script Date: 06-Dec-19 11:02:23 AM ******/
CREATE DATABASE [ClassifiedNew]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClassifiedNew', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLH\MSSQL\DATA\ClassifiedNew.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClassifiedNew_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLH\MSSQL\DATA\ClassifiedNew_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ClassifiedNew] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClassifiedNew].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClassifiedNew] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClassifiedNew] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClassifiedNew] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClassifiedNew] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClassifiedNew] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClassifiedNew] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ClassifiedNew] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClassifiedNew] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClassifiedNew] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClassifiedNew] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClassifiedNew] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClassifiedNew] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClassifiedNew] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClassifiedNew] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClassifiedNew] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ClassifiedNew] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClassifiedNew] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClassifiedNew] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClassifiedNew] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClassifiedNew] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClassifiedNew] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClassifiedNew] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClassifiedNew] SET RECOVERY FULL 
GO
ALTER DATABASE [ClassifiedNew] SET  MULTI_USER 
GO
ALTER DATABASE [ClassifiedNew] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClassifiedNew] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClassifiedNew] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClassifiedNew] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClassifiedNew] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ClassifiedNew', N'ON'
GO
ALTER DATABASE [ClassifiedNew] SET QUERY_STORE = OFF
GO
USE [ClassifiedNew]
GO
/****** Object:  Table [dbo].[Ad]    Script Date: 06-Dec-19 11:02:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[type] [int] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[price] [real] NOT NULL,
	[status] [int] NOT NULL,
	[postedOn] [datetime] NOT NULL,
	[contactFlag] [bit] NOT NULL,
	[expiryDate] [datetime] NOT NULL,
	[offerCount] [int] NULL,
	[commentCount] [int] NULL,
	[removedReason] [nvarchar](max) NULL,
	[removedBy] [int] NULL,
	[removedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 06-Dec-19 11:02:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[icon] [nvarchar](50) NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[createdBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 06-Dec-19 11:02:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[adId] [int] NOT NULL,
	[url] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 06-Dec-19 11:02:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[icon] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[mail] [nvarchar](50) NOT NULL,
	[location] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AdView]    Script Date: 06-Dec-19 11:02:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AdView]
AS
SELECT        dbo.Ad.id, dbo.Ad.type, dbo.Category.name, dbo.Category.icon, dbo.Ad.title, dbo.Ad.description, dbo.Ad.price, dbo.Ad.status, dbo.Ad.postedOn, dbo.Ad.expiryDate, dbo.Ad.offerCount, dbo.Ad.commentCount, 
                         dbo.Image.id AS imageId, dbo.Image.url AS imageUrl, dbo.Person.name AS userName, dbo.Person.icon AS userIconUri
FROM            dbo.Ad INNER JOIN
                         dbo.Category ON dbo.Ad.categoryId = dbo.Category.id INNER JOIN
                         dbo.Image ON dbo.Ad.id = dbo.Image.adId INNER JOIN
                         dbo.Person ON dbo.Ad.userId = dbo.Person.id
GO
/****** Object:  View [dbo].[AdInfoView]    Script Date: 06-Dec-19 11:02:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AdInfoView]
AS
SELECT        dbo.Ad.id, dbo.Ad.userId, dbo.Ad.type, dbo.Category.name, dbo.Category.icon, dbo.Ad.title, dbo.Ad.description, dbo.Ad.price, dbo.Ad.status, dbo.Ad.postedOn, dbo.Ad.contactFlag, dbo.Ad.expiryDate, dbo.Ad.offerCount, 
                         dbo.Ad.commentCount, dbo.Ad.removedReason, dbo.Ad.removedBy, dbo.Ad.removedOn
FROM            dbo.Ad INNER JOIN
                         dbo.Category ON dbo.Ad.categoryId = dbo.Category.id
GO
/****** Object:  Table [dbo].[AdFieldValue]    Script Date: 06-Dec-19 11:02:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdFieldValue](
	[adId] [int] NULL,
	[fieldId] [int] NULL,
	[value] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryField]    Script Date: 06-Dec-19 11:02:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryField](
	[categoryId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[fieldType] [nvarchar](50) NOT NULL,
	[fieldName] [nvarchar](50) NOT NULL,
	[value] [nvarchar](50) NULL,
	[mandatoryFlag] [int] NOT NULL,
 CONSTRAINT [PK_CategoryField] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offer]    Script Date: 06-Dec-19 11:02:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[adId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[price] [money] NULL,
	[message] [nvarchar](max) NULL,
	[madeOn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportedAd]    Script Date: 06-Dec-19 11:02:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportedAd](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[adId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[message] [nvarchar](max) NOT NULL,
	[madeOn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 06-Dec-19 11:02:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleId] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 06-Dec-19 11:02:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[userId] [int] NOT NULL,
	[roleId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ad]  WITH CHECK ADD  CONSTRAINT [FK_Ad_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Ad] CHECK CONSTRAINT [FK_Ad_Category]
GO
ALTER TABLE [dbo].[Ad]  WITH CHECK ADD  CONSTRAINT [FK_Ad_Person] FOREIGN KEY([userId])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Ad] CHECK CONSTRAINT [FK_Ad_Person]
GO
ALTER TABLE [dbo].[AdFieldValue]  WITH CHECK ADD  CONSTRAINT [FK_Ad_AdFieldValue] FOREIGN KEY([adId])
REFERENCES [dbo].[Ad] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AdFieldValue] CHECK CONSTRAINT [FK_Ad_AdFieldValue]
GO
ALTER TABLE [dbo].[AdFieldValue]  WITH CHECK ADD  CONSTRAINT [FK_CategoryField_AdFieldValue] FOREIGN KEY([fieldId])
REFERENCES [dbo].[CategoryField] ([Id])
GO
ALTER TABLE [dbo].[AdFieldValue] CHECK CONSTRAINT [FK_CategoryField_AdFieldValue]
GO
ALTER TABLE [dbo].[CategoryField]  WITH CHECK ADD  CONSTRAINT [FK_CategoryField_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryField] CHECK CONSTRAINT [FK_CategoryField_Category]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Ad] FOREIGN KEY([adId])
REFERENCES [dbo].[Ad] ([id])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Ad]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [FK_Offer_Ad] FOREIGN KEY([adId])
REFERENCES [dbo].[Ad] ([id])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [FK_Offer_Ad]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [FK_Offer_Person] FOREIGN KEY([userId])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [FK_Offer_Person]
GO
ALTER TABLE [dbo].[ReportedAd]  WITH CHECK ADD  CONSTRAINT [FK_ReportAd_Ad] FOREIGN KEY([adId])
REFERENCES [dbo].[Ad] ([id])
GO
ALTER TABLE [dbo].[ReportedAd] CHECK CONSTRAINT [FK_ReportAd_Ad]
GO
ALTER TABLE [dbo].[ReportedAd]  WITH CHECK ADD  CONSTRAINT [FK_ReportAd_Person] FOREIGN KEY([userId])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[ReportedAd] CHECK CONSTRAINT [FK_ReportAd_Person]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Person] FOREIGN KEY([userId])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Person]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Ad"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Category"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AdInfoView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AdInfoView'
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Ad"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Category"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Image"
            Begin Extent = 
               Top = 6
               Left = 458
               Bottom = 119
               Right = 628
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Person"
            Begin Extent = 
               Top = 6
               Left = 666
               Bottom = 136
               Right = 836
            End
            DisplayFlags = 280
            TopColumn = 2
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AdView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AdView'
GO
USE [master]
GO
ALTER DATABASE [ClassifiedNew] SET  READ_WRITE 
GO
