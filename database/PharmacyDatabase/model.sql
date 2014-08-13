CREATE TABLE [dbo].[Clients] (
    [ClientID]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]       NVARCHAR (250) NULL,
    [IsMale]     BINARY (50)    NULL,
    [PhonNumber] NCHAR (20)     NULL,
    [Address]    NVARCHAR (250) NULL,
    [IsActive]   BINARY (50)    NOT NULL,
    [IsPatient]  BINARY (50)    NOT NULL,
    [Note]       NVARCHAR (500) NULL
);

GO
CREATE TABLE [dbo].[DrugAndRequest] (
    [DrugID]     BIGINT           NOT NULL,
    [RequestID]  BIGINT           NOT NULL,
    [TotalPrice] DECIMAL (18, 10) NOT NULL,
    [DateTime]   DATETIME         NOT NULL,
    [Note]       NVARCHAR (500)   NULL
);

GO
CREATE TABLE [dbo].[DrugAndStrores] (
    [DrugID]   BIGINT         NOT NULL,
    [StroreID] BIGINT         NOT NULL,
    [Notes]    NVARCHAR (500) NULL
);

GO
CREATE TABLE [dbo].[Drugs] (
    [DrugID]     BIGINT           IDENTITY (1, 1) NOT NULL,
    [Name]       NVARCHAR (250)   NOT NULL,
    [Type]       NVARCHAR (250)   NOT NULL,
    [Price]      DECIMAL (18, 10) NOT NULL,
    [IsActive]   BINARY (50)      NOT NULL,
    [Note]       NVARCHAR (500)   NULL,
    [ResourceID] BIGINT           NOT NULL
);

GO
CREATE TABLE [dbo].[DrugsAndPharmacies] (
    [DrugID]     BIGINT NOT NULL,
    [PharmacyID] BIGINT NOT NULL
);

GO
CREATE TABLE [dbo].[Pharmacies] (
    [PharmacyID]  BIGINT         IDENTITY (1, 1) NOT NULL,
    [Address]     NVARCHAR (500) NOT NULL,
    [PhoneNumber] NCHAR (20)     NULL,
    [IsActive]    BINARY (50)    NOT NULL,
    [Note]        NVARCHAR (500) NULL
);

GO
CREATE TABLE [dbo].[Requests] (
    [RequestID] BIGINT         NOT NULL,
    [Note]      NVARCHAR (500) NULL,
    [ClientID]  BIGINT         NOT NULL
);

GO
CREATE TABLE [dbo].[Resources] (
    [ResourceID]  BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (250) NOT NULL,
    [PhoneNumber] NCHAR (20)     NULL,
    [Address]     VARCHAR (250)  NULL,
    [IsActive]    BINARY (50)    NOT NULL,
    [Note]        NVARCHAR (500) NULL
);

GO
CREATE TABLE [dbo].[Stores] (
    [StoreID] BIGINT         NOT NULL,
    [Address] NVARCHAR (250) NOT NULL,
    [Note]    NVARCHAR (500) NULL
);

GO
ALTER TABLE [dbo].[DrugAndRequest]
    ADD CONSTRAINT [FK_DrugAndRequest_Drugs] FOREIGN KEY ([DrugID]) REFERENCES [dbo].[Drugs] ([DrugID]);

GO
ALTER TABLE [dbo].[DrugAndRequest]
    ADD CONSTRAINT [FK_DrugAndRequest_Requests] FOREIGN KEY ([RequestID]) REFERENCES [dbo].[Requests] ([RequestID]);

GO
ALTER TABLE [dbo].[DrugAndStrores]
    ADD CONSTRAINT [FK_DrugAndStrores_Drugs] FOREIGN KEY ([DrugID]) REFERENCES [dbo].[Drugs] ([DrugID]);

GO
ALTER TABLE [dbo].[DrugAndStrores]
    ADD CONSTRAINT [FK_DrugAndStrores_Stores] FOREIGN KEY ([StroreID]) REFERENCES [dbo].[Stores] ([StoreID]);

GO
ALTER TABLE [dbo].[Drugs]
    ADD CONSTRAINT [FK_Drugs_Resources] FOREIGN KEY ([ResourceID]) REFERENCES [dbo].[Resources] ([ResourceID]);

GO
ALTER TABLE [dbo].[DrugsAndPharmacies]
    ADD CONSTRAINT [FK_DrugsAndPharmacies_Drugs] FOREIGN KEY ([DrugID]) REFERENCES [dbo].[Drugs] ([DrugID]);

GO
ALTER TABLE [dbo].[DrugsAndPharmacies]
    ADD CONSTRAINT [FK_DrugsAndPharmacies_Pharmacies1] FOREIGN KEY ([PharmacyID]) REFERENCES [dbo].[Pharmacies] ([PharmacyID]);

GO
ALTER TABLE [dbo].[Requests]
    ADD CONSTRAINT [FK_Requests_Clients] FOREIGN KEY ([ClientID]) REFERENCES [dbo].[Clients] ([ClientID]);

GO
ALTER TABLE [dbo].[Clients]
    ADD CONSTRAINT [DF_Clients_IsActive] DEFAULT ((1)) FOR [IsActive];

GO
ALTER TABLE [dbo].[Clients]
    ADD CONSTRAINT [DF_Clients_IsPatient] DEFAULT ((1)) FOR [IsPatient];

GO
ALTER TABLE [dbo].[Drugs]
    ADD CONSTRAINT [DF_Drugs_IsActive] DEFAULT ((1)) FOR [IsActive];

GO
ALTER TABLE [dbo].[Pharmacies]
    ADD CONSTRAINT [DF_Pharmacies_IsActive] DEFAULT ((1)) FOR [IsActive];

GO
ALTER TABLE [dbo].[Resources]
    ADD CONSTRAINT [DF_Resources_IsActive] DEFAULT ((1)) FOR [IsActive];

GO
ALTER TABLE [dbo].[Clients]
    ADD CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED ([ClientID] ASC);

GO
ALTER TABLE [dbo].[DrugAndRequest]
    ADD CONSTRAINT [PK_DrugAndRequest] PRIMARY KEY CLUSTERED ([DrugID] ASC, [RequestID] ASC);

GO
ALTER TABLE [dbo].[DrugAndStrores]
    ADD CONSTRAINT [PK_DrugAndStrores] PRIMARY KEY CLUSTERED ([DrugID] ASC, [StroreID] ASC);

GO
ALTER TABLE [dbo].[Drugs]
    ADD CONSTRAINT [PK_Drugs] PRIMARY KEY CLUSTERED ([DrugID] ASC);

GO
ALTER TABLE [dbo].[DrugsAndPharmacies]
    ADD CONSTRAINT [PK_DrugsAndPharmacies] PRIMARY KEY CLUSTERED ([DrugID] ASC, [PharmacyID] ASC);

GO
ALTER TABLE [dbo].[Pharmacies]
    ADD CONSTRAINT [PK_Pharmacies] PRIMARY KEY CLUSTERED ([PharmacyID] ASC);

GO
ALTER TABLE [dbo].[Requests]
    ADD CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED ([RequestID] ASC);

GO
ALTER TABLE [dbo].[Resources]
    ADD CONSTRAINT [PK_Resources] PRIMARY KEY CLUSTERED ([ResourceID] ASC);

GO
ALTER TABLE [dbo].[Stores]
    ADD CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED ([StoreID] ASC);

GO
