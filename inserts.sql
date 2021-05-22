select * from cars;
select * from drivers;
select * from brigade;
select * from area;
select * from `cargo transportation`;
select * from mileage;
select * from lockmiths;
select * from welders;
select * from `repair`;
select * from `garage facilities`;
select * from routs;
select * from person;
select * from jobPosition;
select * from employee; 

INSERT INTO person (`firstName`, `lastName`, `email`, `phone`) VALUES ('Олексій', 'Чижов', 'aderf@net', '+380111111111');
INSERT INTO person (`firstName`, `lastName`, `email`, `phone`) VALUES ('Микита', 'Венарт', 'gjdo@net', '+380222222222');
INSERT INTO person (`firstName`, `lastName`, `email`, `phone`) VALUES ('Альберт', 'Розмареллі', 'NNN@net', '+380994765937');
INSERT INTO person (`firstName`, `lastName`, `email`, `phone`) VALUES ('Альберт', 'Вескер', 'alb@net', '+380994768473');
INSERT INTO person (`firstName`, `lastName`, `email`, `phone`) VALUES ('Люцій', 'Блок', 'goj@net', '+380969475937');
INSERT INTO person (`firstName`, `lastName`, `email`, `phone`) VALUES ('Самсон', 'Вебер', 'out@net', '+380994000007');
INSERT INTO person (`firstName`, `lastName`, `email`, `phone`) VALUES ('Тайлер', 'Дерден', 'into@net', '+380111115937');
INSERT INTO person (`firstName`, `lastName`, `email`, `phone`) VALUES ('Закир', 'Ганди', 'up@net', '+380992222937');
INSERT INTO person (`firstName`, `lastName`, `email`, `phone`) VALUES ('Нільс', 'Нільсон', 'down@net', '+380994733337');
INSERT INTO person (`firstName`, `lastName`, `email`, `phone`) VALUES ('Осип', 'Дефо', 'hot@net', '+380944445937');
INSERT INTO person (`firstName`, `lastName`, `email`, `phone`) VALUES ('Франц', 'Зайцев', 'intro@net', '+380994765555');
INSERT INTO person (`firstName`, `lastName`, `email`, `phone`) VALUES ('Потап', 'Капиця', 'uotro@net', '+380966665937');
INSERT INTO person (`firstName`, `lastName`, `email`, `phone`) VALUES ('Эдмунд', 'Клінтон', 'AAA@net', '+380994767777');
INSERT INTO person (`firstName`, `lastName`, `email`, `phone`) VALUES ('Рамон', 'Лайтман', 'BBB@net', '+380994765888');
INSERT INTO person (`firstName`, `lastName`, `email`, `phone`) VALUES ('Клод', 'Шенон', 'CCC@net', '+380999995937');
INSERT INTO person (`firstName`, `lastName`, `email`, `phone`) VALUES ('Ясон', 'Масляков', 'DDD@net', '+380994760037');

INSERT INTO `jobPosition`(`code`,`name`)VALUES('captain','Начальник ділянки');
INSERT INTO `jobPosition`(`code`,`name`)VALUES('brigadier','Бригадир');
INSERT INTO `jobPosition`(`code`,`name`)VALUES('driver','водій');
INSERT INTO `jobPosition`(`code`,`name`)VALUES('welders','зварник');
INSERT INTO `jobPosition`(`code`,`name`)VALUES('lockmiths','слюсар');

INSERT INTO `employee`(`jobPosition_id`,`person_id`) VALUES(1,1);
INSERT INTO `employee`(`jobPosition_id`,`person_id`) VALUES(2,2);
INSERT INTO `employee`(`jobPosition_id`,`person_id`) VALUES(2,3);
INSERT INTO `employee`(`jobPosition_id`,`person_id`) VALUES(3,4);
INSERT INTO `employee`(`jobPosition_id`,`person_id`) VALUES(3,5);
INSERT INTO `employee`(`jobPosition_id`,`person_id`) VALUES(3,6);
INSERT INTO `employee`(`jobPosition_id`,`person_id`) VALUES(3,7);
INSERT INTO `employee`(`jobPosition_id`,`person_id`) VALUES(3,8);
INSERT INTO `employee`(`jobPosition_id`,`person_id`) VALUES(3,9);
INSERT INTO `employee`(`jobPosition_id`,`person_id`) VALUES(3,10);
INSERT INTO `employee`(`jobPosition_id`,`person_id`) VALUES(4,11);
INSERT INTO `employee`(`jobPosition_id`,`person_id`) VALUES(4,12);
INSERT INTO `employee`(`jobPosition_id`,`person_id`) VALUES(4,13);
INSERT INTO `employee`(`jobPosition_id`,`person_id`) VALUES(5,14);
INSERT INTO `employee`(`jobPosition_id`,`person_id`) VALUES(5,15);
INSERT INTO `employee`(`jobPosition_id`,`person_id`) VALUES(5,16);

INSERT INTO `garage facilities`(`name`,`type`) VALUES('Г-1','автобус');
INSERT INTO `garage facilities`(`name`,`type`) VALUES('Г-2','вантажівка');
INSERT INTO `garage facilities`(`name`,`type`) VALUES('Г-3','таксі');

INSERT INTO `cars`(`car name`,`brand`,`date of appearance`,`date of write-off`,`гаражні_господарства_idгаражні_господарства`) 
VALUES('ЛАЗ-697', 'ЛАЗ', '2015-07-23','2018-08-23', 1);
INSERT INTO `cars`(`car name`,`brand`,`date of appearance`,`date of write-off`,`гаражні_господарства_idгаражні_господарства`) 
VALUES('Рута 22', 'Рута', '2015-07-23','2018-08-23', 1);
INSERT INTO `cars`(`car name`,`brand`,`date of appearance`,`date of write-off`,`гаражні_господарства_idгаражні_господарства`) 
VALUES('Рута 23', 'Рута', '2015-08-23', NULL, 1);
INSERT INTO `cars`(`car name`,`brand`,`date of appearance`,`date of write-off`,`гаражні_господарства_idгаражні_господарства`) 
VALUES('Стрий Авто А075', 'Стрий Авто','2016-07-23', NULL, 1);
INSERT INTO `cars`(`car name`,`brand`,`date of appearance`,`date of write-off`,`гаражні_господарства_idгаражні_господарства`) 
VALUES('Стрий Авто А0756', 'Стрий Авто', '2016-07-23', NULL, 1);
INSERT INTO `cars`(`car name`,`brand`,`date of appearance`,`date of write-off`,`гаражні_господарства_idгаражні_господарства`) 
VALUES('Богдан-3355', 'Богдан', '2015-07-23', '2018-07-23', 2);
INSERT INTO `cars`(`car name`,`brand`,`date of appearance`,`date of write-off`,`гаражні_господарства_idгаражні_господарства`) 
VALUES('ГАЗ-51', 'ГАЗ', '2015-07-23', NULL, 2);
INSERT INTO `cars`(`car name`,`brand`,`date of appearance`,`date of write-off`,`гаражні_господарства_idгаражні_господарства`) 
VALUES('ГАЗ-68', 'ГАЗ', '2015-07-23', NULL, 2);
INSERT INTO `cars`(`car name`,`brand`,`date of appearance`,`date of write-off`,`гаражні_господарства_idгаражні_господарства`) 
VALUES('ЗІЛ-4331', 'ЗІЛ', '2016-07-23', NULL, 2);
INSERT INTO `cars`(`car name`,`brand`,`date of appearance`,`date of write-off`,`гаражні_господарства_idгаражні_господарства`) 
VALUES('Богдан А091', 'Богдан', '2016-07-23', NULL, 2);

INSERT INTO `area`(`employee_id`) VALUES(1);

INSERT INTO `routs`(`автомобілі_idАвтомобілі`) VALUES(1);
INSERT INTO `routs`(`автомобілі_idАвтомобілі`) VALUES(2);
INSERT INTO `routs`(`автомобілі_idАвтомобілі`) VALUES(3);
INSERT INTO `routs`(`автомобілі_idАвтомобілі`) VALUES(4);

INSERT INTO mileage(`date`,`kilometrage`,`автомобілі_idАвтомобілі`) VALUES('2017-01-01',100, 3);
INSERT INTO mileage(`date`,`kilometrage`,`автомобілі_idАвтомобілі`) VALUES('2017-08-23',120, 4);
INSERT INTO mileage(`date`,`kilometrage`,`автомобілі_idАвтомобілі`) VALUES('2018-08-23',150, 5);
INSERT INTO mileage(`date`,`kilometrage`,`автомобілі_idАвтомобілі`) VALUES('2016-08-23',600, 7);
INSERT INTO mileage(`date`,`kilometrage`,`автомобілі_idАвтомобілі`) VALUES('2016-12-24',650, 8);

INSERT INTO `cargo transportation`(`date`,`№car`,`amount`) VALUES('2016-08-23',7, 20);
INSERT INTO `cargo transportation`(`date`,`№car`,`amount`) VALUES('2016-12-24',8, 50);

INSERT INTO `brigade`(`employee_id`,`ділянки_№district`) VALUES(2, 1);
INSERT INTO `brigade`(`employee_id`,`ділянки_№district`) VALUES(3, 1);

INSERT INTO `welders`(`бригади_Бригада`,`employee_id`) VALUES(2, 11);
INSERT INTO `welders`(`бригади_Бригада`,`employee_id`) VALUES(2, 12);
INSERT INTO `welders`(`бригади_Бригада`,`employee_id`) VALUES(2, 13);

INSERT INTO `lockmiths`(`бригади_Бригада`,`employee_id`) VALUES(2, 14);
INSERT INTO `lockmiths`(`бригади_Бригада`,`employee_id`) VALUES(2, 15);
INSERT INTO `lockmiths`(`бригади_Бригада`,`employee_id`) VALUES(2, 16);

INSERT INTO `drivers`(`автомобілі_idАвтомобілі`,`бригади_Бригада`,`employee_id`) VALUES(3, 1, 4);
INSERT INTO `drivers`(`автомобілі_idАвтомобілі`,`бригади_Бригада`,`employee_id`) VALUES(4, 1, 5);
INSERT INTO `drivers`(`автомобілі_idАвтомобілі`,`бригади_Бригада`,`employee_id`) VALUES(5, 1, 6);
INSERT INTO `drivers`(`автомобілі_idАвтомобілі`,`бригади_Бригада`,`employee_id`) VALUES(7, 1, 7);
INSERT INTO `drivers`(`автомобілі_idАвтомобілі`,`бригади_Бригада`,`employee_id`) VALUES(8, 1, 8);
INSERT INTO `drivers`(`автомобілі_idАвтомобілі`,`бригади_Бригада`,`employee_id`) VALUES(9, 1, 9);
INSERT INTO `drivers`(`автомобілі_idАвтомобілі`,`бригади_Бригада`,`employee_id`) VALUES(10, 1, 10);

INSERT INTO `repair`(`date`,`cost`,`unit`,`автомобілі_idАвтомобілі`,`зварники_idЗварники`,`слюсарі_idСлюсарі`) 
VALUES('2018-08-20',10000, 'двигун',2,1,1);
INSERT INTO `repair`(`date`,`cost`,`unit`,`автомобілі_idАвтомобілі`,`зварники_idЗварники`,`слюсарі_idСлюсарі`) 
VALUES('2017-07-23',8000, 'КП',4,2,2);
INSERT INTO `repair`(`date`,`cost`,`unit`,`автомобілі_idАвтомобілі`,`зварники_idЗварники`,`слюсарі_idСлюсарі`) 
VALUES('2018-02-23',10000, 'двигун',6,3,3);
INSERT INTO `repair`(`date`,`cost`,`unit`,`автомобілі_idАвтомобілі`,`зварники_idЗварники`,`слюсарі_idСлюсарі`) 
VALUES('2020-08-20',12000, 'шасі',10,1,3);

-- INSERT INTO `welders`(`бригади_Бригада`,`employee_id`) VALUES(2, 4);