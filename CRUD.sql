select `car name`, brand, `date of appearance`, `date of write-off`, гаражні_господарства_idгаражні_господарства as garage_id from cars;
select id, автомобілі_idАвтомобілі as car_id, бригади_Бригада as brigade_id, employee_id from drivers;
select №team, employee_id, ділянки_№district as district_id from brigade;
select * from area;
select * from `cargo transportation`;
select id, date, kilometrage, автомобілі_idАвтомобілі as car_id from mileage;
select id, бригади_Бригада as brigade_id, employee_id from lockmiths;
select id, бригади_Бригада as brigade_id, employee_id from welders;
select id, date, cost, unit, автомобілі_idАвтомобілі as car_id, зварники_idЗварники as welders_id, слюсарі_idСлюсарі as lockmiths_id from `repair`;
select * from `garage facilities`;
select id, автомобілі_idАвтомобілі as car_id from routs;
select * from person;
select * from jobPosition;
select * from employee; 

INSERT INTO person (`firstName`, `lastName`, `email`, `phone`) VALUES ('Олексій', 'Чижов', 'aderf@net', '+380111111111');
delete from person where `phone` = '+380111111111';

INSERT INTO `jobPosition`(`code`,`name`)VALUES('captain','Начальник ділянки');
delete from `jobPosition` where `code` = 'workman';

INSERT INTO `employee`(`jobPosition_id`,`person_id`) VALUES(1,1);
delete from `employee` where `jobPosition_id` = 'workman';

INSERT INTO `garage facilities`(`name`,`type`) VALUES('Г-1','автобус');
delete from `garage facilities` where `name` = 'Г-1';

INSERT INTO `cars`(`car name`,`brand`,`date of appearance`,`date of write-off`,`гаражні_господарства_idгаражні_господарства`) 
VALUES('ЛАЗ-697', 'ЛАЗ', '2015-07-23','2018-08-23', 1);
delete from `cars` where `car name` = 'ЛАЗ-697';

INSERT INTO `area`(`employee_id`) VALUES(1);
delete from `area` where `employee_id` = 1;

INSERT INTO `routs`(`автомобілі_idАвтомобілі`) VALUES(1);
delete from `routs` where `автомобілі_idАвтомобілі` = 1;

INSERT INTO mileage(`date`,`kilometrage`,`автомобілі_idАвтомобілі`) VALUES('2017-01-01',100, 3);
delete from mileage where `date` = '2017-01-01';

INSERT INTO `cargo transportation`(`date`,`№car`,`amount`) VALUES('2016-08-23',7, 20);
delete from `cargo transportation` where `date` = '2017-01-01';

INSERT INTO `brigade`(`employee_id`,`ділянки_№district`) VALUES(2, 1);
delete from `brigade` where `ділянки_№district` = 1;

INSERT INTO `welders`(`бригади_Бригада`,`employee_id`) VALUES(2, 11);
delete from `welders` where `employee_id` = 11;

INSERT INTO `lockmiths`(`бригади_Бригада`,`employee_id`) VALUES(2, 14);
delete from `lockmiths` where `employee_id` = 11;

INSERT INTO `drivers`(`автомобілі_idАвтомобілі`,`бригади_Бригада`,`employee_id`) VALUES(3, 1, 4);
delete from `drivers` where `employee_id` = 11;

INSERT INTO `repair`(`date`,`cost`,`unit`,`автомобілі_idАвтомобілі`,`зварники_idЗварники`,`слюсарі_idСлюсарі`) 
VALUES('2018-08-20',10000, 'двигун',2,1,1);
delete from `repair` where `date` = '2018-08-20';
update `repair` 
	set `date`= '2018-08-21', `cost` = 10000, `unit` = 'двигун', `автомобілі_idАвтомобілі`=2,`зварники_idЗварники`=1,`слюсарі_idСлюсарі`=1
	where `date`= '2018-08-20';