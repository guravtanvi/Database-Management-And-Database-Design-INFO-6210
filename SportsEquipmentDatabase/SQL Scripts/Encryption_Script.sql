--1) To Encrypt PersonEmail

CREATE MASTER KEY ENCRYPTION BY
PASSWORD = 'Password123';

CREATE CERTIFICATE PersonEmail
WITH SUBJECT = 'PersonEmail';

CREATE SYMMETRIC KEY Email_key_1
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE PersonEmail;

ALTER TABLE Person ADD EncryptedEmail varbinary(128);

OPEN SYMMETRIC KEY Email_key_1
DECRYPTION BY CERTIFICATE PersonEmail;

UPDATE Person
SET EncryptedEmail = ENCRYPTBYKEY(key_GUID('Email_key_1'), PersonEmail);


--2) To Encrypt PersonContact


----Don’t Create it Again
CREATE MASTER KEY ENCRYPTION BY
PASSWORD = 'Password123';

CREATE CERTIFICATE PersonContact
WITH SUBJECT = 'PersonContact';

CREATE SYMMETRIC KEY Contact_key_1
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE PersonContact;

ALTER TABLE Person ADD EncryptedContact varbinary(128);

OPEN SYMMETRIC KEY Contact_key_1
DECRYPTION BY CERTIFICATE PersonContact;

UPDATE Person
SET EncryptedEmail = ENCRYPTBYKEY(key_GUID('Email_key_1'), PersonContact);

