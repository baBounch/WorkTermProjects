USE master
GO

IF DB_ID('Email') IS NOT NULL
	DROP DATABASE Email
GO

CREATE DATABASE Email
GO
USE Email
GO

CREATE TABLE SentEmails(
	IsSent			BIT					NOT NULL,
	Message			VARCHAR(255)		NOT NULL,
	Subject			VARCHAR(50)			NOT NULL,
	SentDate		DATE
);

INSERT INTO SentEmails(IsSent, Message, Subject, SentDate)
VALUES (0, 'Saving in drafts til I write this part', 'RE: Hello World', NULL),
(1, 'Hello World, how is it going?', 'Hello World', '2020-02-15'),
(1, 'I still see it.', 'Everything', '2020-03-18'),
(1, 'Hi, How are you?', 'Hi', '2019-10-27'),
(1, 'The reports are ready - Ferris', 'RE: Report 2020 February', '2020-03-01'),
(1, 'Data is nearly ready. You should be able to generate it by early march. - Dr. Bool', 'Report 2020 February', '2020-02-27'),
(1, 'Hey, You forgot your wallet in the office.', 'Forgot Wallet', '2020-04-10');

SELECT * FROM SentEmails WHERE IsSent = 1 AND SentDate >= '2020-03-01' ORDER BY SentDate DESC;

UPDATE SentEmails
SET Message = 'Good, How about you?', IsSent = 1, SentDate = GETDATE()
WHERE Subject = 'RE: Hello World';

UPDATE SentEmails
SET SentDate = GETDATE()
WHERE SentDate > GETDATE();

UPDATE SentEmails
SET IsSent = 0, SentDate = NULL
WHERE Subject = 'Forgot Wallet';

SELECT * FROM SentEmails WHERE IsSent = 1 ORDER BY SentDate DESC;