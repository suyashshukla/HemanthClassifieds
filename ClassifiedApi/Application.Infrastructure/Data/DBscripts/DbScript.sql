
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
/****** Object:  Table [dbo].[Category]    Script Date: 05-Apr-20 2:18:12 AM ******/
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
/****** Object:  Table [dbo].[Ad]    Script Date: 05-Apr-20 2:18:12 AM ******/
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
/****** Object:  View [dbo].[AdView]    Script Date: 05-Apr-20 2:18:12 AM ******/
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
/****** Object:  View [dbo].[AdInfoView]    Script Date: 05-Apr-20 2:18:12 AM ******/
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
/****** Object:  Table [dbo].[Offer]    Script Date: 05-Apr-20 2:18:12 AM ******/
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
/****** Object:  Table [dbo].[ReportedAd]    Script Date: 05-Apr-20 2:18:12 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 05-Apr-20 2:18:12 AM ******/
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
/****** Object:  Table [dbo].[UserRole]    Script Date: 05-Apr-20 2:18:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ad] ON 

INSERT [dbo].[Ad] ([Id], [UserId], [CategoryId], [Type], [PostedOn], [ContactFlag], [Title], [Description], [Price], [ImageUrls], [FieldValues], [ExpiryDate], [OfferCount], [CommentCount], [RemovedReason], [RemovedBy], [RemovedOn]) VALUES (1, 1, 1, 1, CAST(N'2019-07-10T19:56:36.000' AS DateTime), 1, N'Yamaha YZF R15', N'Yamaha YZF R15 is a premium fully faired motorcycle in the 150cc segment.', 83700, N'[{"url":"bike-yamaha.jpg"},{"url":"bike-yamaha.jpg"},{"url":"bike-yamaha1.jpg"},{"url":"harley.jpg"},{"url":"bike-yamaha.jpg"},{"url":"bike-yamaha.jpg"}]', N'[{"FieldName":"Milage","FieldValue":"200"}]', CAST(N'2019-05-18T00:00:00.000' AS DateTime), 22, 12, NULL, NULL, NULL)
INSERT [dbo].[Ad] ([Id], [UserId], [CategoryId], [Type], [PostedOn], [ContactFlag], [Title], [Description], [Price], [ImageUrls], [FieldValues], [ExpiryDate], [OfferCount], [CommentCount], [RemovedReason], [RemovedBy], [RemovedOn]) VALUES (2, 1, 1, 1, CAST(N'2019-07-10T19:56:36.000' AS DateTime), 1, N'Harely Bike', N'The Harely Bike is a premium fully faired motorcycle in the 150cc segment.', 83700, N'[{"url":"harley.jpg"},{"url":"bike-yamaha.jpg"},{"url":"bike-yamaha1.jpg"},{"url":"harley.jpg"},{"url":"bike-yamaha.jpg"},{"url":"bike-yamaha.jpg"}]', N'[{"FieldName":"Milage","FieldValue":"200"}]', CAST(N'2019-05-18T00:00:00.000' AS DateTime), 20, 12, NULL, NULL, NULL)
INSERT [dbo].[Ad] ([Id], [UserId], [CategoryId], [Type], [PostedOn], [ContactFlag], [Title], [Description], [Price], [ImageUrls], [FieldValues], [ExpiryDate], [OfferCount], [CommentCount], [RemovedReason], [RemovedBy], [RemovedOn]) VALUES (7, 2, 1, 1, CAST(N'2019-07-10T19:56:36.000' AS DateTime), 1, N'Yamaha YZF R15', N'The Yamaha R15 v3 is a premium fully faired motorcycle in the 150cc segment.', 75000, N'[{"url":"bike-yamaha.jpg"},{"url":"bike-yamaha.jpg"},{"url":"bike-yamaha1.jpg"},{"url":"harley.jpg"},{"url":"bike-yamaha.jpg"},{"url":"bike-yamaha.jpg"}]', N'[{"FieldName":"Milage","FieldValue":"200"}]', CAST(N'2019-05-18T00:00:00.000' AS DateTime), 0, 0, NULL, NULL, NULL)
INSERT [dbo].[Ad] ([Id], [UserId], [CategoryId], [Type], [PostedOn], [ContactFlag], [Title], [Description], [Price], [ImageUrls], [FieldValues], [ExpiryDate], [OfferCount], [CommentCount], [RemovedReason], [RemovedBy], [RemovedOn]) VALUES (8, 1, 1, 1, CAST(N'2019-07-10T19:56:36.000' AS DateTime), 1, N'Harely Bike', N'The Harely Bike is a premium fully faired motorcycle in the 150cc segment.', 83700, N'[{"url":"harley.jpg"},{"url":"bike-yamaha.jpg"},{"url":"bike-yamaha1.jpg"},{"url":"harley.jpg"},{"url":"bike-yamaha.jpg"},{"url":"bike-yamaha.jpg"}]', N'[{"FieldName":"Milage","FieldValue":"200"}]', CAST(N'2019-05-18T00:00:00.000' AS DateTime), 18, 12, NULL, NULL, NULL)
INSERT [dbo].[Ad] ([Id], [UserId], [CategoryId], [Type], [PostedOn], [ContactFlag], [Title], [Description], [Price], [ImageUrls], [FieldValues], [ExpiryDate], [OfferCount], [CommentCount], [RemovedReason], [RemovedBy], [RemovedOn]) VALUES (1007, 1, 1, 1, CAST(N'2019-07-10T19:56:36.000' AS DateTime), 1, N'Harelt Bike', N'The Harely Bike is a premium fully faired motorcycle in the 150cc segment.', 95000, N'[{"url":"harley.jpg"},{"url":"bike-yamaha.jpg"},{"url":"bike-yamaha1.jpg"},{"url":"harley.jpg"},{"url":"bike-yamaha.jpg"},{"url":"bike-yamaha.jpg"}]', N'[{"FieldName":"Milage","FieldValue":"200"}]', CAST(N'2019-12-31T00:00:00.000' AS DateTime), 1, 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Ad] OFF
INSERT [dbo].[Category] ([Id], [Name], [Icon], [CreatedOn], [Description], [CreatedBy], [Fields]) VALUES (1, N'Vehicle', N'fas fa-motorcycle', CAST(N'2019-02-04T00:00:00.000' AS DateTime), N'Ad related to vehicle', 0, N'[{"FieldType":"Number","FieldName":"Milage"}]')
SET IDENTITY_INSERT [dbo].[Offer] ON 

INSERT [dbo].[Offer] ([Id], [AdId], [UserId], [Price], [Message], [MadeOn]) VALUES (16, 1, 1, 75000, N'I want this product', CAST(N'2019-12-09T12:14:15.383' AS DateTime))
INSERT [dbo].[Offer] ([Id], [AdId], [UserId], [Price], [Message], [MadeOn]) VALUES (17, 2, 1, 75000, N'sdfsdfgdsf ad2', CAST(N'2019-12-09T12:19:48.613' AS DateTime))
INSERT [dbo].[Offer] ([Id], [AdId], [UserId], [Price], [Message], [MadeOn]) VALUES (18, 2, 1, 75000, N'afasfdsad', CAST(N'2019-12-09T12:21:14.700' AS DateTime))
INSERT [dbo].[Offer] ([Id], [AdId], [UserId], [Price], [Message], [MadeOn]) VALUES (1002, 1, 4, 75004, N'dsafasf', CAST(N'2019-12-16T11:43:44.243' AS DateTime))
INSERT [dbo].[Offer] ([Id], [AdId], [UserId], [Price], [Message], [MadeOn]) VALUES (1003, 1007, 4, 75001, N'asdasdf', CAST(N'2019-12-18T05:39:58.633' AS DateTime))
SET IDENTITY_INSERT [dbo].[Offer] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [Name], [Icon], [Phone], [Mail], [Location]) VALUES (1, N'Anjali', N'user-icon.png', N'9792632762', N'anjali@gmail.com', N'Hyderabad Corp Office')
INSERT [dbo].[Person] ([Id], [Name], [Icon], [Phone], [Mail], [Location]) VALUES (2, N'Deepak', N'admin-icon.jpg', N'9863626373', N'deepak@gmail.com', N'bangalore')
INSERT [dbo].[Person] ([Id], [Name], [Icon], [Phone], [Mail], [Location]) VALUES (3, N'Ranjan', N'user-icon.png', N'9723823663', N'ranjan@gmail.com', N'hyderabad')
INSERT [dbo].[Person] ([Id], [Name], [Icon], [Phone], [Mail], [Location]) VALUES (4, N'Hemanth', N'user-icon.png', N'9798467894', N'hemanth@gmail.com', N'Hyderabad')
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[ReportedAd] ON 

INSERT [dbo].[ReportedAd] ([Id], [AdId], [UserId], [Message], [MadeOn]) VALUES (1, 2, 1, N'ReportCategory: fraud and fraud ad', CAST(N'2019-12-09T12:20:19.940' AS DateTime))
INSERT [dbo].[ReportedAd] ([Id], [AdId], [UserId], [Message], [MadeOn]) VALUES (2, 1, 4, N'ReportCategory: censored and trfrhgsdhtdwads', CAST(N'2019-12-17T05:13:59.523' AS DateTime))
INSERT [dbo].[ReportedAd] ([Id], [AdId], [UserId], [Message], [MadeOn]) VALUES (4, 1007, 4, N'ReportCategory: censored and ,m;klm;lkm', CAST(N'2019-12-18T05:40:06.403' AS DateTime))
SET IDENTITY_INSERT [dbo].[ReportedAd] OFF
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

