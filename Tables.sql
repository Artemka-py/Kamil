--DROP DATABASE Sushi
--go

CREATE DATABASE Sushi
GO

USE Sushi
GO

CREATE TABLE [dbo].[Otdel]
(
    [ID_Otdel] [int] not null IDENTITY(1,1),
    [Name_Otdel] [VARCHAR] (40),
    constraint [PK_Otdel] primary key clustered
	([ID_Otdel] ASC) on [PRIMARY],
    constraint [UK_Name_Otdel] UNIQUE ([Name_Otdel])
)
GO

INSERT INTO [Otdel] (Name_Otdel) VALUES
('����� ������'),('����� ����� ������ �� ������'),('����� ������������'),('����� �����������'),('����� ����������'),('����� ���������'),('����� ��������'),('����� ������� � PR'),('����� ������'),('���������������� �����')
GO
CREATE TABLE [dbo].[Dolgnost]
(
    [ID_Dolgnost] [int] not null identity (1,1),
	[Name_Dolgnost] [varchar] (40) not null,
	[Oklad_of_Dolgnost] [decimal] (32,2) not null,
    [ID_Otdel] [int] not null,
    constraint [PK_Dolgnost] primary key clustered
	([ID_Dolgnost] ASC) on [PRIMARY],
	constraint [UQ_Name_Dolgnost] unique ([Name_Dolgnost]),
    CONSTRAINT [FK_Otdel_Dolg] FOREIGN KEY ([ID_Otdel])
    REFERENCES [Otdel] ([ID_Otdel]),
	constraint CH_Oklad_Dolgnost check ([Oklad_of_Dolgnost] > 0)
)
GO

INSERT INTO [Dolgnost] (Name_Dolgnost, Oklad_of_Dolgnost, ID_Otdel) VALUES
('�������������','2000','2'),('���������','5000','3'),('��������','20000','1'),('������','1000','4'),('���������','2500','5'),('��������','1500','6'),('��������','3000','9'),('���-�����','8000','7'),('��-���','6000','8'),('�����','5400','10')
GO



CREATE TABLE [dbo].[Role]
(
    [ID_Role] [int] not null IDENTITY(1,1),
    [Name_Role] [varchar] (40) not NULL,
    CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED
    ([ID_Role] ASC) on [PRIMARY],
    CONSTRAINT [UQ_Name_Role] UNIQUE ([Name_Role])
)
GO

INSERT INTO [Role] (Name_Role) VALUES
('�������������'),('���������'),('��������'),('������'),('�����'),('������'),('��������'),('���������'),('���-�����'),('��-���')
GO

CREATE TABLE [dbo].[Authorization]
(
    [ID_Authorization] [int] not null IDENTITY(1,1),
    [Login] [VARCHAR] (30) not null,
    [Password] [VARCHAR] (30) not null,
	[ID_Role] [int] not null,
	CONSTRAINT [PK_Authorization] PRIMARY KEY CLUSTERED
    ([ID_Authorization] ASC) on [PRIMARY],
	CONSTRAINT [FK_Authorization_Role] FOREIGN KEY ([ID_Role])
	REFERENCES [Role] ([ID_Role]),
	constraint CH_Login check ([Login] like '%[a-z]%' or [Login] like '%[A-Z]%' or [Login] like '%[0-9]%'),
	constraint CH_Password check ([Password] like '%[a-z]%' or [Password] like '%[A-Z]%' or [Password] like '%[0-9]%')
)
GO

INSERT INTO [Authorization] (Login, Password, ID_Role) VALUES
('dfgg','123', '1'),('fdg','228', '2'),('Hyz','321', '3'),('Golova', 'qwerty', '4'),('Mashina', '123qwerty', '5'),
('Dead','qwe123', '6'),('Svarnya','temnoe', '7'),('Zyx', '000', '8'),('521','125122', '9'),('Dragon','231', '10')
GO


CREATE TABLE [dbo].[Postavhik]
(
    [ID_Postavhik] [int] not null IDENTITY(1,1),
    [Familia_Postavhik] [VARCHAR] (40) not null,
    [Name_Postavhik] [VARCHAR] (40) not null,
    [Otchestvo_Postavik] [VARCHAR] (40) not null,
    [Seria_Document] [VARCHAR] (4) not null,
    [Nomer_Document] [VARCHAR] (6) not null,
    CONSTRAINT [PK_Postavhik] PRIMARY KEY CLUSTERED
    ([ID_Postavhik] ASC) on [PRIMARY]
)
GO

INSERT INTO [Postavhik] (Familia_Postavhik, Name_Postavhik, Otchestvo_Postavik,Seria_Document, Nomer_Document) VALUES
('����������','����','����������','1234','567891'),('������','����','����������','5678','123456'),
('�����','������','�������������','2345','456789'),('�������','����','����������','1234','456123'),
('��������','����','���������','1475','258369'),('�������','�����','�������','7536','159735'),
('��������','������','����������','3456','158358'),('�������','������','�������','4867','268975'),
('������������','�����','������������','7512','246953'),('�������','����','��������','3615','234567')
GO


CREATE TABLE [dbo].[Blida]
(
    [ID_Blida] [int] not null IDENTITY(1,1),
    [Name_Blida] [VARCHAR] (30) not null,
    [Prica_Blide] [int] not null,
	[ID_Postavhik] [int] not null,
	CONSTRAINT [PK_Blida] PRIMARY KEY CLUSTERED
    ([ID_Blida] ASC) on [PRIMARY],
	CONSTRAINT [FK_Blida_Postavhik] FOREIGN KEY ([ID_Postavhik])
	REFERENCES [Postavhik] ([ID_Postavhik]),
	constraint CH_Prica_Blide check (Prica_Blide > 0)
)
GO

CREATE TABLE [dbo].[Klinet]
(
    [ID_Klinet] [int] not null IDENTITY(1,1),
    [Familia_Klinet] [VARCHAR] (40) not null,
    [Name_Klinet] [VARCHAR] (40) not null,
    [Otchestvo_Klinet] [VARCHAR] (40) not null,
    [Nomet_Telefona] [VARCHAR] (11) not null,
	CONSTRAINT [PK_Klinet] PRIMARY KEY CLUSTERED
    ([ID_Klinet] ASC) on [PRIMARY],
	Constraint CH_Nomet_Telefona check ([Nomet_Telefona] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)
GO

INSERT INTO [Klinet] (Familia_Klinet, Name_Klinet,Otchestvo_Klinet,Nomet_Telefona) VALUES
('�������','�������','��������','74954625745'),('�����','�����','����������','74954504376'),('�������','�������','���������','74950997219 '),
('�������','��������','����������', '74957127097'),('�������','�������','�������','74955913461'),('�������','��������','��������','74952135904'),
('�������','�����','�������������','74959472565'),('�������','���������','����������','74958719784'),('��������','�����','���������','74958562181'),('�������','��������','�����������','74959599549')
GO

INSERT INTO [Blida] (Name_Blida,Prica_Blide, ID_Postavhik) VALUES
('�������','500', '1'),('������','100', '2'),('����������','300', '3'),
('���� � ������','1000', '4'),('�����','200', '5'),
('������','350', '6'),('Sushi','125', '7'),('Sugar','10', '8'),
('����','200', '9'),('����','50', '10')
GO
CREATE TABLE [dbo].[Zakaz]
(
    [ID_Zakaz] [int] not null IDENTITY(1,1),
	[ID_Blida] [int] not null,
	[ID_Klinet] [int] not null,
	CONSTRAINT [PK_Zakaz] PRIMARY KEY CLUSTERED
    ([ID_Zakaz] ASC) on [PRIMARY],
	CONSTRAINT [FK_Zakaz_Blida] FOREIGN KEY ([ID_Blida])
	REFERENCES [Blida] ([ID_Blida]),
	CONSTRAINT [FK_Blida_Klinet] FOREIGN KEY ([ID_Klinet])
	REFERENCES [Klinet] ([ID_Klinet])
)
GO

INSERT INTO [Zakaz] (ID_Blida, ID_Klinet) VALUES 
('1','1'),('2','2'),('3','3'),('4','4'),('5','5'),('6','6'),('7','7'),('8','8'),('9','9'),('10','10')
GO

CREATE TABLE [dbo].[Soiskatel]
(
    [ID_Soiskatel] [int] not null IDENTITY(1,1),
    [Familia_Soiskatel] [VARCHAR] (40) not null,
    [Name_Soiskatel] [VARCHAR] (40) not null,
    [Otchestvo_Soiskatel] [VARCHAR] (40) not null,
    [Seria_Document] [VARCHAR] (4) not null,
    [Nomer_Document] [VARCHAR] (6) not null,
    [Data_Rojdrnia] [VARCHAR] (10) not null,
	CONSTRAINT [PK_Soiskatel] PRIMARY KEY CLUSTERED
    ([ID_Soiskatel] ASC) on [PRIMARY],
	constraint CH_Data check ([Data_Rojdrnia] like '[0-9][0-9][.][0-9][0-9][.][0-9][0-9][0-9][0-9]')
)
GO

INSERT INTO [Soiskatel] (Familia_Soiskatel,Name_Soiskatel,
Otchestvo_Soiskatel,Seria_Document,Nomer_Document,Data_Rojdrnia) VALUES
('�����','�������','��������','0199','213151','01.02.2001'),('�������','�������','���������','1111','111111','01.03.2001'),
('��������','����','���������','112','111112','11.04.2001'),('�������','����','���������','1113','111113','01.05.2001'),
('��������','�����','����������','1114','111114','05.06.2001'),('������','��������','������������','2221','222221','05.05.1995'),
('������','�����','����������','2222','222222','02.02.2001'),('������','������','�������������','2223','222223','08.09.1999'),
('�������','������','����������','2224','222224','03.12.2000'),('��������','�������','����������','2225','222225','12.12.1975')
GO

CREATE TABLE [dbo].[Rezume]
(
    [ID_Rezume] [int] not null IDENTITY(1,1),
	[ID_Soiskatel] [int] not null,
    [Cel] [varchar] (40) not null,
    [Obrazovanii] [VARCHAR] (40) not null,
    [Opit_Raboti] [VARCHAR] (40) not null,
    [Proff_Naviki] [VARCHAR] (40) not null,
	CONSTRAINT [PK_Rezume] PRIMARY KEY CLUSTERED
    ([ID_Rezume] ASC) on [PRIMARY],
	CONSTRAINT [FK_Rezume_Soiskatel] FOREIGN KEY ([ID_Soiskatel])
	REFERENCES [Soiskatel] ([ID_Soiskatel])
)
GO

INSERT INTO [Rezume] (ID_Soiskatel, Cel,Obrazovanii,Opit_Raboti,Proff_Naviki) VALUES
('1', '������','������','2 ����','������'),('2','�����','�������','���','���'),('3','�������','������','10 ���','������������'),
('4','�������','���','���','���'),('5','������','�������','���','����'),('6','���������������','������','���','������'),
('7','������','������','1 ���','���'),('8','�������','������','2 ����','���'),('9','���','���','���','���'),
('10','���������������','������ ������','1 ���','������������')
GO


CREATE TABLE [dbo].[Prikaz_o_Prieme]
(
    [ID_Prikaz_o_Prieme] [int] not null IDENTITY(1,1),
    [ID_Dolgnost] [int] not null,
    [ID_Soiskatel] [int] not null,
    CONSTRAINT [PK_Prikaz_o_Prieme] PRIMARY KEY CLUSTERED
    ([ID_Prikaz_o_Prieme] ASC) on [PRIMARY],
    CONSTRAINT [FK_Prikaz_o_Prieme_Dolgnost] FOREIGN KEY ([ID_Dolgnost])
	REFERENCES [Dolgnost] ([ID_Dolgnost]),
    CONSTRAINT [FK_Prikaz_o_Prieme_Soiskatel] FOREIGN KEY ([ID_Soiskatel])
	REFERENCES [Soiskatel] ([ID_Soiskatel])
)
GO

INSERT INTO [Prikaz_o_Prieme] (ID_Dolgnost, ID_Soiskatel) VALUES
('1','1'),('2','2'),('3','3'),('4','4'),('5','5'),('6','6'),('7','7'),('8','8'),('9','9'),('10','10')
GO

CREATE TABLE [dbo].[Sotrudniki]
(
    [ID_Sotrudnika] [int] not null IDENTITY(1,1),
    [Familia_Sotrudnika] [VARCHAR] (20) not null,
    [Name_Sotrudnika] [VARCHAR] (20) not null,
    [Otchestvo_Sotrudnika] [VARCHAR] (20) not null,
    [Seria_Document] [VARCHAR] (4) not null,
    [Number_Document] [VARCHAR] (6) not null,
	[ID_Dolgnost] [int] not null,
	[ID_Authorization] [int] not null,
	[ID_Prikaz_o_Prieme] [int] not null,
	CONSTRAINT [PK_Sotrudniki] PRIMARY KEY CLUSTERED
    ([ID_Sotrudnika] ASC) on [PRIMARY],
	CONSTRAINT [FK_Sotrudnik_Dolgnost] FOREIGN KEY ([ID_Dolgnost]) 
	REFERENCES [Dolgnost] ([ID_Dolgnost]),
	CONSTRAINT [FK_Sotrudnik_Authorization] FOREIGN KEY ([ID_Authorization])
	REFERENCES [Authorization] ([ID_Authorization]),
	CONSTRAINT [FK_Sotrudnik_Prikaz_o_Prieme] FOREIGN KEY ([ID_Prikaz_o_Prieme])
	REFERENCES [Prikaz_o_Prieme] ([ID_Prikaz_o_Prieme])
)
GO

INSERT INTO [Sotrudniki] (Familia_Sotrudnika,Name_Sotrudnika,Otchestvo_Sotrudnika,Seria_Document,Number_Document, ID_Dolgnost, ID_Authorization, ID_Prikaz_o_Prieme) VALUES
('�������','�������','���������', '4121', '543122', '1','1','1'),('������','�����','�������������','1246','215476', '2','2','2'),
('�������','�������','����������','4152','967363', '3','3','3'),('����������','�������','�������������','3214','654216', '4','4','4'),
('���������','������','����������','4214','435325', '5','5','5'),('���������','�������','�������������','1296','658322', '6','6','6'),
('���������','����','���������','1587','817942', '7','7','7'),('�����','������','����������','4752','128975', '8','8','8'),
('��������','������','����������','1212','978075', '9','9','9'),('�������','������','���������','2142','981215', '10','10','10')
GO

CREATE TABLE [dbo].[Chek]
(
    [ID_Chek] [int] not null IDENTITY(1,1),
    [Number_of_Check] [int] not null,
	[ID_Sotrudnika] [int] not null,
	[ID_Zakaz] [int] not null,
	CONSTRAINT [PK_Chek] PRIMARY KEY CLUSTERED
    ([ID_Chek] ASC) on [PRIMARY],
	CONSTRAINT [FK_Chek_Sotrudniki] FOREIGN KEY ([ID_Sotrudnika])
	REFERENCES [Sotrudniki] ([ID_Sotrudnika]),
	CONSTRAINT [FK_Chek_Zakaz] FOREIGN KEY ([ID_Zakaz])
	REFERENCES [Zakaz] ([ID_Zakaz]),
	constraint CH_Number_Check check ([Number_of_Check] > 0)
)
GO

INSERT INTO [Chek] (Number_of_Check, ID_Sotrudnika, ID_Zakaz) VALUES
('1','1','1'),('2','2','2'),('3','3','3'),('4','4','4'),('5','5','5'),('6','6','6'),('7','7','7'),('8','8','8'),('9','9','9'),('10','10','10')
GO

CREATE TABLE [dbo].[Prikaz_ob_Ovolen]
(
    [ID_Prikaz_ob_Ovolen] [int] not null IDENTITY(1,1),
    [Nomer_Prikaz] [int] not null,
    [Prichina] [VARCHAR] (40) not null,
	[ID_Sotrudnika] [int] not null,
	CONSTRAINT [PK_Prikaz_ob_Ovolen] PRIMARY KEY CLUSTERED
    ([ID_Prikaz_ob_Ovolen] ASC) on [PRIMARY],
	CONSTRAINT [FK_Prikaz_ob_Ovolen_Sotrudniki] FOREIGN KEY ([ID_Sotrudnika])
	REFERENCES [Sotrudniki] ([ID_Sotrudnika])
)
GO
INSERT INTO [Prikaz_ob_Ovolen] (Nomer_Prikaz,Prichina, ID_Sotrudnika) VALUES
('1','�������', '1'),('2','�������', '2'),('3','�������', '3'),('4','�����', '4'),('5','������', '5'),('6','���� �����', '6'),
('7','����� ������', '7'),('8','������� � �������', '8'),('9','�����', '9'),('10','�������', '10')
GO