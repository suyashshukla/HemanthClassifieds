SET IDENTITY_INSERT [dbo].[Ad] ON
INSERT INTO [dbo].[Ad] ([id], [userId], [type], [status], [postedOn]) VALUES (1, 1, N'sale', N'active', N'2019-05-22 00:00:00')
INSERT INTO [dbo].[Ad] ([id], [userId], [type], [status], [postedOn]) VALUES (2, 2, N'sale', N'active', N'2019-05-23 00:00:00')
INSERT INTO [dbo].[Ad] ([id], [userId], [type], [status], [postedOn]) VALUES (3, 2, N'sale', N'active', N'2019-05-25 00:00:00')
INSERT INTO [dbo].[Ad] ([id], [userId], [type], [status], [postedOn]) VALUES (4, 3, N'sale', N'expired', N'2019-05-25 00:00:00')
INSERT INTO [dbo].[Ad] ([id], [userId], [type], [status], [postedOn]) VALUES (5, 3, N'sale', N'expired', N'2019-05-25 00:00:00')
INSERT INTO [dbo].[Ad] ([id], [userId], [type], [status], [postedOn]) VALUES (6, 3, N'sale', N'expired', N'2019-05-25 00:00:00')
SET IDENTITY_INSERT [dbo].[Ad] OFF
