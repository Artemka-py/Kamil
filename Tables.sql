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
('Отдел кадров'),('Отдел учета товара на складе'),('Отдел обслуживания'),('Отдел бухгалтерии'),('Отдел маркетинга'),('Отдел логистики'),('Отдел комерции'),('Отдел рекламы и PR'),('Отдел продаж'),('Производственный отдел')
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
('Администратор','2000','2'),('Кладовщик','5000','3'),('Директор','20000','1'),('Кассир','1000','4'),('Бухгалтер','2500','5'),('Охранник','1500','6'),('Официант','3000','9'),('Шеф-повар','8000','7'),('Су-шеф','6000','8'),('Повар','5400','10')
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
('Администратор'),('Кладовщик'),('Директор'),('Кассир'),('Гость'),('Клиент'),('Официант'),('Бухгалтер'),('Шеф-повар'),('Су-щеф')
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
('Алексеенко','Артём','Алексеевич','1234','567891'),('Лыткин','Артём','Николаевич','5678','123456'),
('Татар','Камиль','Татарстанович','2345','456789'),('Щаников','Иван','Максимович','1234','456123'),
('Пузанков','Леха','Борисовчи','1475','258369'),('Галкина','Ольга','Михална','7536','159735'),
('Долдонов','Долдон','Долдонович','3456','158358'),('Ульянов','Сергей','Сергеич','4867','268975'),
('Селиверстова','Елена','Владимировна','7512','246953'),('Архипыч','Олег','Седычный','3615','234567')
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
('Романов','Кондрат','Ефимович','74954625745'),('Шаров','Антон','Филиппович','74954504376'),('Абрамов','Георгий','Иосифович','74950997219 '),
('Тарасов','Мстислав','Дмитрьевич', '74957127097'),('Селезнёв','Селезнёв','Селезнёв','74955913461'),('Потапов','Вениамин','Улебович','74952135904'),
('Лебедев','Ермак','Христофорович','74959472565'),('Кононов','Святослав','Лукьянович','74958719784'),('Савельев','Гаянэ','Созонович','74958562181'),('Пузанов','Григорий','Кукурузович','74959599549')
GO

INSERT INTO [Blida] (Name_Blida,Prica_Blide, ID_Postavhik) VALUES
('Лазанья','500', '1'),('Гречка','100', '2'),('Калифорния','300', '3'),
('Каша с маслом','1000', '4'),('Роллы','200', '5'),
('Темное','350', '6'),('Sushi','125', '7'),('Sugar','10', '8'),
('Вода','200', '9'),('Хлеб','50', '10')
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
('Фомин','Климент','Павлович','0199','213151','01.02.2001'),('Кононов','Евгений','Проклович','1111','111111','01.03.2001'),
('Муравьёв','Илья','Гордеевич','112','111112','11.04.2001'),('Тихонов','Иван','Романович','1113','111113','01.05.2001'),
('Соловьёв','Исаак','Витальевич','1114','111114','05.06.2001'),('Аксёнов','Анатолий','Богуславович','2221','222221','05.05.1995'),
('Зайцев','Макар','Феликсович','2222','222222','02.02.2001'),('Королёв','Касьян','Владиславович','2223','222223','08.09.1999'),
('Моисеев','Герман','Феликсович','2224','222224','03.12.2000'),('Артемьев','Ибрагил','Куприянови','2225','222225','12.12.1975')
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
('1', 'Деньги','Высшее','2 года','Мастер'),('2','Семья','Среднее','Нет','Нет'),('3','Карьера','Высшее','10 лет','Квалификация'),
('4','Карьера','Нет','Нет','Нет'),('5','Деньги','Школное','Нет','Есть'),('6','Трудоустройство','Высшее','Нет','Мастер'),
('7','Навыки','Высшее','1 год','Нет'),('8','Карьера','Высшее','2 года','Нет'),('9','Нет','Нет','Нет','Нет'),
('10','Трудоустройство','Второе высшее','1 год','Квалификация')
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
('Пузанов','Алексей','Борисович', '4121', '543122', '1','1','1'),('Ляпина','Мария','Александровна','1246','215476', '2','2','2'),
('Дмитров','Дмитрий','Евгеньевич','4152','967363', '3','3','3'),('Богданович','Дмитрий','Александрович','3214','654216', '4','4','4'),
('Емельянов','Андрея','Алексеевич','4214','435325', '5','5','5'),('Григорьев','Дмитрий','Владиславович','1296','658322', '6','6','6'),
('Кузьников','Жнец','Кирилович','1587','817942', '7','7','7'),('Фюрер','Гитлер','Максимович','4752','128975', '8','8','8'),
('Калупаев','Сергей','Адольфович','1212','978075', '9','9','9'),('Кильков','Колчан','Кутузович','2142','981215', '10','10','10')
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
('1','Проспал', '1'),('2','Опоздал', '2'),('3','Выпивал', '3'),('4','Гулял', '4'),('5','Унижал', '5'),('6','Укар булки', '6'),
('7','Украл деньги', '7'),('8','Курение в туалете', '8'),('9','Смерь', '9'),('10','Болезнь', '10')
GO