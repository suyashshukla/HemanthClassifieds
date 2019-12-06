CREATE TABLE [dbo].[Person] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [name]     NVARCHAR (50) NOT NULL,
    [icon]     NVARCHAR (50) NOT NULL,
    [phone]    NVARCHAR (50) NOT NULL,
    [mail]     NVARCHAR (50) NOT NULL,
    [location] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[Field] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [fieldName]     NVARCHAR (50) NOT NULL,
    [fieldType]     NVARCHAR (50) NOT NULL,
    [value]         NVARCHAR (50) NULL,
    [mandatoryFlag] INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);
CREATE TABLE [dbo].[Ad] (
    [id]        INT           IDENTITY (1, 1) NOT NULL,
    [userId]    INT           NOT NULL,
    [type]      NVARCHAR (50) NOT NULL,
    [status]    NVARCHAR (50) NOT NULL,
    [postedOn]  DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Ad_Person] FOREIGN KEY ([userId]) REFERENCES [dbo].[Person] ([id])
    
);

CREATE TABLE [dbo].[Comment] (
    [id]          INT            IDENTITY (1, 1) NOT NULL,
    [userId]      INT            NOT NULL,
	[adId]		  INT           NOT NULL,
    [message]     NVARCHAR (MAX) NULL,
    [messageTime] DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Comment_Person] FOREIGN KEY ([userId]) REFERENCES [dbo].[Person] ([id]),
	CONSTRAINT [FK_Comment_Ad] FOREIGN KEY ([adId]) REFERENCES [dbo].[Ad] ([id])
);

CREATE TABLE [dbo].[Category] (
    [id]          INT            NOT NULL,
    [name]        NVARCHAR (50)  NOT NULL,
    [icon]        NVARCHAR (50)  NOT NULL,
    [createdOn]   DATETIME       NOT NULL,
    [description] NVARCHAR (MAX) NOT NULL,
    [createdBy]   NVARCHAR (50)  NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);
CREATE TABLE [dbo].[AdCategory] (
    [adId]       INT NOT NULL,
    [categoryId] INT NOT NULL,
    CONSTRAINT [FK_AdCategory_Ad] FOREIGN KEY ([adId]) REFERENCES [dbo].[Ad] ([id]),
    CONSTRAINT [FK_AdCategory_Category] FOREIGN KEY ([categoryId]) REFERENCES [dbo].[Category] ([id])
);

CREATE TABLE [dbo].[AdDetail] (
    [adId]         INT            NOT NULL,
    [contactFlag]  BIT            NOT NULL,
    [price]        MONEY          NOT NULL,
    [expiryDate]   DATETIME       NOT NULL,
    [offerCount]   INT            NULL,
    [commentCount] INT            NULL,
    [title]        NVARCHAR (50)  NOT NULL,
    [description]  NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [FK_AdDetails_Ad] FOREIGN KEY ([adId]) REFERENCES [dbo].[Ad] ([id])
);



CREATE TABLE [dbo].[CategoryField] (
    [categoryId] INT           NULL,
    [fieldId]    INT           NULL,
    [value]      NVARCHAR (50) NULL,
    CONSTRAINT [FK_CategoryField_Field] FOREIGN KEY ([fieldId]) REFERENCES [dbo].[Field] ([id]),
    CONSTRAINT [FK_CategoryField_Category] FOREIGN KEY ([categoryId]) REFERENCES [dbo].[Category] ([id]) ON DELETE CASCADE
);




CREATE TABLE [dbo].[Image] (
    [id]   INT            IDENTITY (1, 1) NOT NULL,
    [adId] INT            NOT NULL,
    [url]  NVARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Image_Ad] FOREIGN KEY ([adId]) REFERENCES [dbo].[Ad] ([id])
);

CREATE TABLE [dbo].[Offer] (
    [id]      INT            IDENTITY (1, 1) NOT NULL,
    [adId]    INT            NOT NULL,
    [userId]  INT            NOT NULL,
    [price]   MONEY          NULL,
    [message] NVARCHAR (MAX) NULL,
    [madeOn]  DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Offer_Person] FOREIGN KEY ([userId]) REFERENCES [dbo].[Person] ([id]),
    CONSTRAINT [FK_Offer_Ad] FOREIGN KEY ([adId]) REFERENCES [dbo].[Ad] ([id])
);



CREATE TABLE [dbo].[RemovedAd] (
    [id]        INT            IDENTITY (1, 1) NOT NULL,
    [adId]      INT            NOT NULL,
    [message]   NVARCHAR (MAX) NOT NULL,
    [expiredOn] DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_RemovedAd_Ad] FOREIGN KEY ([adId]) REFERENCES [dbo].[Ad] ([id])
);

CREATE TABLE [dbo].[ReportedAd] (
    [id]      INT            IDENTITY (1, 1) NOT NULL,
    [adId]    INT            NOT NULL,
    [userId]  INT            NOT NULL,
    [message] NVARCHAR (MAX) NOT NULL,
    [madeOn]  DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_ReportAd_Person] FOREIGN KEY ([userId]) REFERENCES [dbo].[Person] ([id]),
    CONSTRAINT [FK_ReportAd_Ad] FOREIGN KEY ([adId]) REFERENCES [dbo].[Ad] ([id])
);

CREATE TABLE [dbo].[Role] (
    [id]     INT           IDENTITY (1, 1) NOT NULL,
    [roleId] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[UserRole] (
    [userId] INT NOT NULL,
    [roleId] INT NOT NULL,
    CONSTRAINT [FK_UserRole_Person] FOREIGN KEY ([userId]) REFERENCES [dbo].[Person] ([id]),
    CONSTRAINT [FK_UserRole_Role] FOREIGN KEY ([roleId]) REFERENCES [dbo].[Role] ([id])
);


