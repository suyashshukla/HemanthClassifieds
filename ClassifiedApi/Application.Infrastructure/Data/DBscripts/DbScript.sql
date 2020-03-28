USE [master]
GO
/****** Object:  Database [Classified]    Script Date: 28-Mar-20 11:17:49 PM ******/
CREATE DATABASE [Classified]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Classified', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLH\MSSQL\DATA\Classified.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Classified_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLH\MSSQL\DATA\Classified_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Classified] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Classified].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Classified] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Classified] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Classified] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Classified] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Classified] SET ARITHABORT OFF 
GO
ALTER DATABASE [Classified] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Classified] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Classified] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Classified] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Classified] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Classified] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Classified] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Classified] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Classified] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Classified] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Classified] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Classified] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Classified] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Classified] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Classified] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Classified] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Classified] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Classified] SET RECOVERY FULL 
GO
ALTER DATABASE [Classified] SET  MULTI_USER 
GO
ALTER DATABASE [Classified] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Classified] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Classified] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Classified] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Classified] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Classified', N'ON'
GO
ALTER DATABASE [Classified] SET QUERY_STORE = OFF
GO
USE [Classified]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 28-Mar-20 11:17:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Icon] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Mail] [nvarchar](50) NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 28-Mar-20 11:17:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Icon] [nvarchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Fields] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ad]    Script Date: 28-Mar-20 11:17:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[PostedOn] [datetime] NOT NULL,
	[ContactFlag] [bit] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [real] NOT NULL,
	[ImageUrls] [nvarchar](max) NULL,
	[FieldValues] [nvarchar](max) NULL,
	[ExpiryDate] [datetime] NOT NULL,
	[OfferCount] [int] NULL,
	[CommentCount] [int] NULL,
	[RemovedReason] [nvarchar](max) NULL,
	[RemovedBy] [int] NULL,
	[RemovedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[AdView]    Script Date: 28-Mar-20 11:17:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AdView]
AS
SELECT        dbo.Ad.Id, dbo.Ad.Type, dbo.Ad.PostedOn, dbo.Ad.Title, dbo.Ad.Description, dbo.Ad.Price, dbo.Ad.ImageUrls, dbo.Ad.ExpiryDate, dbo.Ad.OfferCount, dbo.Ad.CommentCount, dbo.Category.Name AS CategoryName, 
                         dbo.Category.Icon AS CategoryIconUri, dbo.Person.Icon AS UserIconUri, dbo.Person.Name AS UserName, dbo.Person.Location,(CASE
                WHEN dbo.Ad.ExpiryDate > GETDATE()  THEN 1
                ELSE 0
            END) Status
FROM            dbo.Ad INNER JOIN
                         dbo.Category ON dbo.Ad.CategoryId = dbo.Category.Id INNER JOIN
                         dbo.Person ON dbo.Ad.UserId = dbo.Person.Id
GO
/****** Object:  View [dbo].[AdInfoView]    Script Date: 28-Mar-20 11:17:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AdInfoView]
AS
SELECT        dbo.Ad.Id, dbo.Ad.UserId, dbo.Ad.CategoryId, dbo.Ad.Type, dbo.Ad.PostedOn, dbo.Ad.ContactFlag, dbo.Ad.Title, dbo.Ad.Description, dbo.Ad.Price, dbo.Ad.ImageUrls, dbo.Ad.FieldValues, dbo.Ad.ExpiryDate, 
                         dbo.Ad.OfferCount, dbo.Ad.CommentCount, dbo.Ad.RemovedReason, dbo.Ad.RemovedBy, dbo.Ad.RemovedOn, dbo.Category.Name AS CategoryName, dbo.Category.Icon AS CategoryIconUri,(CASE
                WHEN dbo.Ad.ExpiryDate > GETDATE()  THEN 1
                ELSE 0
            END) Status
FROM            dbo.Ad INNER JOIN
                         dbo.Category ON dbo.Ad.CategoryId = dbo.Category.Id
GO
/****** Object:  Table [dbo].[Offer]    Script Date: 28-Mar-20 11:17:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Price] [real] NULL,
	[Message] [nvarchar](max) NULL,
	[MadeOn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportedAd]    Script Date: 28-Mar-20 11:17:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportedAd](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[MadeOn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 28-Mar-20 11:17:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 28-Mar-20 11:17:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ad]  WITH CHECK ADD  CONSTRAINT [FK_Ad_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Ad] CHECK CONSTRAINT [FK_Ad_Category]
GO
ALTER TABLE [dbo].[Ad]  WITH CHECK ADD  CONSTRAINT [FK_Ad_Person] FOREIGN KEY([UserId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Ad] CHECK CONSTRAINT [FK_Ad_Person]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [FK_Offer_Ad] FOREIGN KEY([AdId])
REFERENCES [dbo].[Ad] ([Id])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [FK_Offer_Ad]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [FK_Offer_Person] FOREIGN KEY([UserId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [FK_Offer_Person]
GO
ALTER TABLE [dbo].[ReportedAd]  WITH CHECK ADD  CONSTRAINT [FK_ReportAd_Ad] FOREIGN KEY([AdId])
REFERENCES [dbo].[Ad] ([Id])
GO
ALTER TABLE [dbo].[ReportedAd] CHECK CONSTRAINT [FK_ReportAd_Ad]
GO
ALTER TABLE [dbo].[ReportedAd]  WITH CHECK ADD  CONSTRAINT [FK_ReportAd_Person] FOREIGN KEY([UserId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[ReportedAd] CHECK CONSTRAINT [FK_ReportAd_Person]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Person] FOREIGN KEY([UserId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Person]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
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
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[56] 3) )"
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
            TopColumn = 2
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
               Bottom = 344
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 2
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
         Begin Table = "Person"
            Begin Extent = 
               Top = 6
               Left = 458
               Bottom = 136
               Right = 628
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
ALTER DATABASE [Classified] SET  READ_WRITE 
GO
