SET IDENTITY_INSERT [dbo].[Offer] ON
INSERT INTO [dbo].[Offer] ([id], [adId], [userId], [price], [message], [madeOn]) VALUES (1, 1, 3, CAST(60000.0000 AS Money), N'hi, i''''m offering 60000 for this bike', N'2019-05-30 00:00:00')
INSERT INTO [dbo].[Offer] ([id], [adId], [userId], [price], [message], [madeOn]) VALUES (2, 1, 2, CAST(70000.0000 AS Money), N'hi, i''''m offering 70000 for this bike', N'2019-05-31 00:00:00')
INSERT INTO [dbo].[Offer] ([id], [adId], [userId], [price], [message], [madeOn]) VALUES (3, 2, 1, CAST(20000.0000 AS Money), N'my offer price for this xbox is 20000 rs', N'2019-06-02 00:00:00')
INSERT INTO [dbo].[Offer] ([id], [adId], [userId], [price], [message], [madeOn]) VALUES (4, 3, 2, CAST(90000.0000 AS Money), N'are you ok with 90000?', N'2019-06-01 00:00:00')
SET IDENTITY_INSERT [dbo].[Offer] OFF
