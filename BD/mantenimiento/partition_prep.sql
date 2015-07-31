ALTER DATABASE dbSG2000_Pruebas
ADD FILEGROUP partfile_1FG;
GO
DECLARE @data_path nvarchar(256);
SET @data_path = 'E:\sql2008\DATA\'
					
					
print @data_path
EXECUTE (
'ALTER DATABASE dbSG2000_Pruebas
ADD FILE
(
	NAME = partfile_1dat1,
	FILENAME = '''+ @data_path + 't1dat1.ndf'',
	SIZE = 5MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB
),
(
	NAME = partfile_1dat2,
	FILENAME = '''+ @data_path + 't1dat2.ndf'',
	SIZE = 5MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB
)
TO FILEGROUP partfile_1FG'
);
GO
ALTER DATABASE dbSG2000_Pruebas
ADD FILEGROUP partfile_2FG;
GO
DECLARE @data_path nvarchar(256);
SET @data_path = 'E:\sql2008\DATA\'

EXECUTE (
'ALTER DATABASE dbSG2000_Pruebas
ADD FILE
(
	NAME = partfile_2dat1,
	FILENAME = '''+ @data_path + 't2dat1.ndf'',
	SIZE = 5MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB
),
(
	NAME = partfile_2dat2,
	FILENAME = '''+ @data_path + 't2dat2.ndf'',
	SIZE = 5MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB
)
TO FILEGROUP partfile_2FG'
);
GO
ALTER DATABASE dbSG2000_Pruebas
ADD FILEGROUP partfile_3FG;
GO
DECLARE @data_path nvarchar(256);
SET @data_path = 'E:\sql2008\DATA\'

EXECUTE (
'ALTER DATABASE dbSG2000_Pruebas
ADD FILE
(
	NAME = partfile_3dat1,
	FILENAME = '''+ @data_path + 't3dat1.ndf'',
	SIZE = 5MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB
),
(
	NAME = partfile_3dat2,
	FILENAME = '''+ @data_path + 't3dat2.ndf'',
	SIZE = 5MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB
)
TO FILEGROUP partfile_3FG'
);
GO
ALTER DATABASE dbSG2000_Pruebas
ADD FILEGROUP partfile_4FG;
GO
DECLARE @data_path nvarchar(256);

SET @data_path = 'E:\sql2008\DATA\'

EXECUTE (
'ALTER DATABASE dbSG2000_Pruebas
ADD FILE
(
	NAME = partfile_4dat1,
	FILENAME = '''+ @data_path + 't4dat1.ndf'',
	SIZE = 5MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB
),
(
	NAME = partfile_4dat2,
	FILENAME = '''+ @data_path + 't4dat2.ndf'',
	SIZE = 5MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB
)
TO FILEGROUP partfile_4FG'
);
GO



ALTER DATABASE dbSG2000_Pruebas
ADD FILEGROUP DATA2_FG;
GO
DECLARE @data_path nvarchar(256);
SET @data_path = 'E:\sql2008\DATA\'

EXECUTE (
'ALTER DATABASE dbSG2000_Pruebas
ADD FILE
(
	NAME = DATA2_FG_1,
	FILENAME = '''+ @data_path + 'data2_1.ndf'',
	SIZE = 5MB
),
(
	NAME = DATA2_FG_2,
	FILENAME = '''+ @data_path + 'data2_2.ndf'',
	SIZE = 5MB
)
TO FILEGROUP DATA2_FG'
);
GO