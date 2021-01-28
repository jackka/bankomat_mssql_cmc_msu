USE [Bankomat]
GO

IF OBJECT_ID('dbo.atm_state', 'U') IS NOT NULL
	DROP TABLE [dbo].[atm_state];
GO

CREATE TABLE [dbo].[atm_state] (
  [id] [int] PRIMARY KEY NOT NULL,
  [printed_counter] [int]  NULL,
  [printer_roll_size] [int]  NULL,
  [jail_counter] [int]  NULL,
  [jail_capacity_size] [int]  NULL,
  [storage_opened] [bit]  NULL,
  [cur_operation_id] [int]  NULL,
  [tray_opened] [bit]  NULL,
  [failed_attempts] [tinyint]  NULL,
  [max_attempts] [tinyint]  NULL
) ON [PRIMARY]
GO


IF OBJECT_ID('dbo.cards', 'U') IS NOT NULL
	DROP TABLE [dbo].[cards];
GO

CREATE TABLE [dbo].[cards] (
  [id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [number] varchar(50) NOT NULL,
  [balance] [bigint]  NULL,
  [jailed][bit]  NULL,
  [blocked][bit]  NULL,
  [pin] [smallint] NOT NULL
) ON [PRIMARY]
GO


IF OBJECT_ID('dbo.cash_storage', 'U') IS NOT NULL
	DROP TABLE [dbo].[cash_storage];
GO

CREATE TABLE [dbo].[cash_storage] (
  [nom_id] [tinyint] PRIMARY KEY NOT NULL,
  [nominal] [int]  NULL,
  [quantity] [int]  NULL
) ON [PRIMARY]
GO
 
 
IF OBJECT_ID('dbo.display_msgs', 'U') IS NOT NULL
	DROP TABLE [dbo].[display_msgs];
GO

CREATE TABLE [dbo].[display_msgs] (
  [id] [int] NOT NULL,
  [lang] [int] NOT NULL,
  [display_msg] text
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[display_msgs] ADD PRIMARY KEY([id],[lang]); 
GO 
 

IF OBJECT_ID('dbo.jailed_cards', 'U') IS NOT NULL
	DROP TABLE [dbo].[jailed_cards];
GO

CREATE TABLE [dbo].[jailed_cards] (
  [log_id] [int] NOT NULL,
  [card_id] [int] NOT NULL,
  [reason] char(10)
)  ON [PRIMARY]
GO
ALTER TABLE [dbo].[jailed_cards] ADD PRIMARY KEY ([log_id],[card_id]);
GO


IF OBJECT_ID('dbo.operations', 'U') IS NOT NULL
	DROP TABLE [dbo].[operations];
GO

CREATE TABLE [dbo].[operations] (
  [id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [name] char(10)
) ON [PRIMARY]
GO


IF OBJECT_ID('dbo.transacts_log', 'U') IS NOT NULL
	DROP TABLE [dbo].[transacts_log];
GO

CREATE TABLE [dbo].[transacts_log] (
  [id] [int] IDENTITY(1,1) NOT NULL,
  [t_stamp] datetime default CURRENT_TIMESTAMP NOT NULL,
  [card_id] [int] NOT NULL,
  [op_type] [int]  NULL,
  [amount] [int]  NULL
) ON [PRIMARY]
GO
ALTER TABLE [transacts_log] ADD PRIMARY KEY ([ID],[t_stamp]);
GO


IF OBJECT_ID('dbo.transacts_nomin', 'U') IS NOT NULL
	DROP TABLE [dbo].[transacts_nomin];
GO

CREATE TABLE [dbo].[transacts_nomin] (
  [transact_id] [int] NOT NULL,
  [nom_id] [tinyint] NOT NULL,
  [quantity] [int]  NULL
) ON [PRIMARY]
GO


IF OBJECT_ID('dbo.failed_attempts', 'U') IS NOT NULL
	DROP VIEW [dbo].[failed_attempts];
GO

CREATE VIEW [dbo].[failed_attempts] AS
   SELECT ProductID, ProductName FROM Products WHERE Discontinued=0

GO
















