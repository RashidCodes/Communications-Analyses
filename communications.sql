USE PracticeDB;
GO

-- Create the table 
IF OBJECT_ID('communications') IS NOT NULL
   DROP TABLE communications;


CREATE TABLE communications
(
  [Message Id] VARCHAR(100),
  [Customer Id] VARCHAR(100),
  [Sent At] VARCHAR(100),
  Clicked INT,
  Converted INT,
  [Client Id] VARCHAR(100),
  Gender VARCHAR(10),
  [Customer Country] VARCHAR(100),
  Age VARCHAR(10),
  [Created At] VARCHAR(100),
  [Client Name] VARCHAR(100),
  [Product Type] VARCHAR(100),
  [Client Country] VARCHAR(100),
  Channel VARCHAR(100),
  [Message Number] VARCHAR(10)
);


-- Insert the data 
BULK INSERT
  PracticeDB.dbo.communications
FROM '/var/opt/mssql/communications.csv'
WITH (FORMAT = 'CSV', FIELDTERMINATOR=',', FIRSTROW=2);


