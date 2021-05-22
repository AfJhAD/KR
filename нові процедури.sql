use mydb;

-- 1
delimiter $$
-- drop procedure if exists task1;
create procedure task1()
begin
	select `car name` from cars;
end $$
delimiter $$
call task1()$$

-- 2_1
delimiter $$
-- drop procedure if exists task2_1;
create procedure task2_1()
begin
	select person.firstName, person.lastName, jobPosition.name
	from employee
	join person on employee.person_id = person.id 
	join jobPosition on employee.jobPosition_id = jobPosition.id
	where jobPosition.name='водій';
    select count(*)
	from employee
	join person on employee.person_id = person.id 
	join jobPosition on employee.jobPosition_id = jobPosition.id
	where jobPosition.name='водій';
end$$
DELIMITER $$
call task2_1()$$

-- 2_2
delimiter $$
-- drop procedure if exists task2_2;
create procedure task2_2(IN name_car VARCHAR(45))
begin
    select person.firstName, person.lastName, jobPosition.name
	from employee
	join person on employee.person_id = person.id 
	join jobPosition on employee.jobPosition_id = jobPosition.id
    join drivers on drivers.employee_id=employee.person_id
    join cars on drivers.автомобілі_idАвтомобілі=cars.id
    where jobPosition.name='водій' and cars.`car name`=name_car;
    select count(*)
	from employee
	join person on employee.person_id = person.id 
	join jobPosition on employee.jobPosition_id = jobPosition.id
    join drivers on drivers.employee_id=employee.person_id
    join cars on drivers.автомобілі_idАвтомобілі=cars.id
    where jobPosition.name='водій' and cars.`car name`=name_car;
end$$
DELIMITER $$
call task2_2('Рута 23')$$

-- 3
delimiter $$
-- drop procedure if exists task3;
create procedure task3()
begin
	select person.firstName, person.lastName, jobPosition.name, cars.`car name` 
	from employee
	join person on employee.person_id = person.id 
	join jobPosition on employee.jobPosition_id = jobPosition.id
    join drivers on drivers.employee_id=employee.person_id
    join cars on drivers.автомобілі_idАвтомобілі=cars.id
	where jobPosition.name='водій';
end$$
DELIMITER $$
call task3$$

-- 4
delimiter $$
-- drop procedure if exists task4;
create procedure task4()
begin
	select cars.`car name`, routs.id as 'маршрути' from routs
    join cars on routs.автомобілі_idАвтомобілі=cars.id;
end$$
DELIMITER $$
call task4$$

-- 5_1
delimiter $$
-- drop procedure if exists task5_1;
create procedure task5_1(IN type_car VARCHAR(45))
begin
	select mileage.date, mileage.kilometrage, cars.`car name`, `garage facilities`.type
    from mileage
    join cars on cars.id = mileage.автомобілі_idАвтомобілі 
    join `garage facilities` on cars.гаражні_господарства_idгаражні_господарства = `garage facilities`.id
    where `garage facilities`.type = type_car;
end$$
DELIMITER $$
call task5_1('Автобус')$$

-- 5_2
delimiter $$
-- drop procedure if exists task5_2;
create procedure task5_2(IN car VARCHAR(45), IN date1 DATE, IN date2 DATE)
begin
	select mileage.date, mileage.kilometrage, mileage.date, cars.`car name`
    from mileage
    join cars on cars.id = mileage.автомобілі_idАвтомобілі 
    where cars.`car name` = car and mileage.date between date1 and date2;
end$$
DELIMITER $$
call task5_2('Стрий Авто А0756', '2016-01-01', '2019-01-01')$$

-- 6_1
delimiter $$
-- drop procedure if exists task6_1;
create procedure task6_1(IN type_car VARCHAR(45))
begin
	select count(cost), sum(cost)
    from `repair`
    join cars on cars.id = `repair`.автомобілі_idАвтомобілі
    join `garage facilities` on cars.гаражні_господарства_idгаражні_господарства = `garage facilities`.id
    where `garage facilities`.type = type_car;
end$$
DELIMITER $$
call task6_1('Автобус')$$

-- 6_2
delimiter $$
-- drop procedure if exists task6_2;
create procedure task6_2(IN marka_car VARCHAR(45))
begin
	select count(cost), sum(cost)
    from `repair`
    join cars on cars.id = `repair`.автомобілі_idАвтомобілі
    where cars.brand = marka_car;
end$$
DELIMITER $$ 
call task6_2('Рута')$$

-- 6_3
delimiter $$
-- drop procedure if exists task6_3;
create procedure task6_3(IN car VARCHAR(45), IN date1 DATE, IN date2 DATE)
begin
	select count(cost), sum(cost)
    from `repair`
    join cars on cars.id = `repair`.автомобілі_idАвтомобілі
    where cars.`car name` = car and `repair`.date between date1 and date2;
end$$
DELIMITER $$
call task6_3('Стрий Авто А075', '2016-07-06', '2020-08-06')$$

-- 7
delimiter $$
-- drop procedure if exists task7;
create procedure task7(IN firstName_person varchar(45),in lastName_person varchar(45))
begin
	if (exists(select firstName from person 
    join employee on person.id = employee.person_id 
    join jobPosition on jobPosition.id = employee.jobPosition_id 
    where firstName = firstName_person and lastName = lastName_person and jobPosition.name = 'водій')) then begin
		
		select firstName_person, lastName_person
		union
		select firstName, lastName from person 
        join employee on person.id = employee.person_id 
        join jobPosition on jobPosition.id = employee.jobPosition_id 
        join brigade on employee.id = brigade.employee_id
        where jobPosition.name = 'Бригадир' and brigade.`№team` = 1 
		union
        select "Водій", null;
        end;
        
    elseif (exists(select firstName from person 
    join employee on person.id = employee.person_id 
    join jobPosition on jobPosition.id = employee.jobPosition_id 
    where firstName = firstName_person and lastName = lastName_person and jobPosition.name = 'зварник')) then begin
    
		select firstName_person, lastName_person
		union
		select firstName, lastName from person 
        join employee on person.id = employee.person_id 
        join jobPosition on jobPosition.id = employee.jobPosition_id 
        join brigade on employee.id = brigade.employee_id
        where jobPosition.name = 'Бригадир' and brigade.`№team` = 2 
		union
        select "зварник", null;
        end;
        
    elseif (exists(select firstName from person 
    join employee on person.id = employee.person_id 
    join jobPosition on jobPosition.id = employee.jobPosition_id 
    where firstName = firstName_person and lastName = lastName_person and jobPosition.name = 'слюсар')) then begin
    
		select firstName_person, lastName_person
		union
		select firstName, lastName from person 
        join employee on person.id = employee.person_id 
        join jobPosition on jobPosition.id = employee.jobPosition_id 
        join brigade on employee.id = brigade.employee_id
        where jobPosition.name = 'Бригадир' and brigade.`№team` = 2 
		union
        select "слюсар", null;
        end;
        
	elseif (exists(select firstName from person 
    join employee on person.id = employee.person_id 
    join jobPosition on jobPosition.id = employee.jobPosition_id 
    where firstName = firstName_person and lastName = lastName_person and jobPosition.name = 'Бригадир')) then begin
    
		select firstName_person, lastName_person
		union
		select firstName, lastName from person 
        join employee on person.id = employee.person_id 
        join jobPosition on jobPosition.id = employee.jobPosition_id 
        join area on employee.id = area.employee_id
        where jobPosition.name = 'Начальник ділянки' 
		union
        select "Бригадир", null;
        end;
        
	elseif (exists(select firstName from person 
    join employee on person.id = employee.person_id 
    join jobPosition on jobPosition.id = employee.jobPosition_id 
    where firstName = firstName_person and lastName = lastName_person and jobPosition.name = 'Начальник ділянки' )) then begin
    
		select firstName_person, lastName_person
		union
        select "Начальник ділянки", null;
        end;
        
	else select "some problems";
	end if;
end$$
DELIMITER $$
call task7('Альберт','Вескер')$$
call task7('Олексій', 'Чижов')$$
call task7('Микита', 'Венарт')$$
call task7('Рамон', 'Лайтман')$$
call task7('Потап', 'Капиця')$$

-- 8_1
delimiter $$
-- drop procedure if exists task8_1;
create procedure task8_1()
begin
	select if((select count(*) from `garage facilities`)!=0, 'гаражні господарства є', 'гаражних господарств немає');
end$$
DELIMITER $$
call task8_1()$$

-- 8_2
delimiter $$
-- drop procedure if exists task8_2;
create procedure task8_2(IN type_car varchar(45))
begin
	select if((select count(*) from `garage facilities` where type = type_car)!=0, 'гаражне господарство такого типу є', 'гаражного господарства такого типу немає');
end$$
DELIMITER $$
call task8_2('Таксі')$$
call task8_2('Автобус')$$

-- 9
delimiter $$
-- drop procedure if exists task9;
create procedure task9()
begin
	select cars.`car name`, `garage facilities`.type, `garage facilities`.name as `Гаражне господарство` from cars 
	join `garage facilities` on `garage facilities`.id = cars.гаражні_господарства_idгаражні_господарства;
end$$
DELIMITER $$
call task9()$$

-- 10
delimiter $$
-- drop procedure if exists task10;
create procedure task10(IN car VARCHAR(45), IN date1 DATE, IN date2 DATE)
begin
	select `cargo transportation`.`id`,`date`,amount  from `cargo transportation`
    join cars on cars.id = `cargo transportation`.`№car`
    where `date` between date1 and date2 AND cars.`car name` = car;
end$$
DELIMITER $$
call task10('ГАЗ-51', '2015-07-06', '2020-08-06')$$

-- 11_1
delimiter $$
-- drop procedure if exists task11_1;
create procedure task11_1(IN element_car VARCHAR(45), IN type_car varchar(45))
begin
    select count(cost) from `repair`
    join cars on cars.id = `repair`.автомобілі_idАвтомобілі
    join `garage facilities` on `garage facilities`.id = cars.гаражні_господарства_idгаражні_господарства
    where `repair`.unit = element_car AND `garage facilities`.type = type_car;
end$$
DELIMITER $$
call task11_1('двигун', 'Автобус')$$

-- 11_2
delimiter $$
-- drop procedure if exists task11_2;
create procedure task11_2(IN element_car VARCHAR(45), IN marka_car varchar(45))
begin
	select count(cost) from `repair`
    join cars on cars.id = `repair`.автомобілі_idАвтомобілі
    where `repair`.unit = element_car AND cars.brand = marka_car;
end$$
DELIMITER $$
call task11_2('двигун', 'Рута')$$

-- 11_3
delimiter $$
-- drop procedure if exists task11_3;
create procedure task11_3(IN element_car varchar(45), IN car VARCHAR(45), IN date1 DATE, IN date2 DATE)
begin
	select count(cost) from `repair`
    join cars on cars.id = `repair`.автомобілі_idАвтомобілі
    where `repair`.unit = element_car AND (`repair`.date between date1 and date2) and cars.`car name` = car;
end$$
DELIMITER $$
call task11_3('двигун', 'Богдан-3355', '2016-07-06', '2020-08-06')$$

-- 12
delimiter $$
-- drop procedure if exists task12;
create procedure task12(IN date1 DATE, IN date2 DATE)
begin
	select `car name`, `date of appearance`, `date of write-off` from cars
    where `date of appearance` between date1 and date2 OR `date of write-off` between date1 and date2;
end$$
DELIMITER $$
call task12('2015-07-23', '2020-08-23')$$

-- 13
delimiter $$
-- drop procedure if exists task13;
create procedure task13(IN firstName_person varchar(45), IN lastName_person varchar(45))
begin
	if (exists(select firstName from person 
    join employee on person.id = employee.person_id 
    join jobPosition on jobPosition.id = employee.jobPosition_id 
    join brigade on employee.id = brigade.employee_id
    where firstName = firstName_person and lastName = lastName_person and jobPosition.name = 'Бригадир' and brigade.`№team` = 1 )) then begin
		select "Бригадир", null
        union
		select firstName, lastName from person 
        join employee on person.id = employee.person_id 
        join jobPosition on jobPosition.id = employee.jobPosition_id 
        where jobPosition.name = 'водій';
        end;
        
	elseif (exists(select firstName from person 
    join employee on person.id = employee.person_id 
    join jobPosition on jobPosition.id = employee.jobPosition_id 
    join brigade on employee.id = brigade.employee_id
    where firstName = firstName_person and lastName = lastName_person and jobPosition.name = 'Бригадир' and brigade.`№team` = 2 )) then begin
		select "Бригадир", null
        union
		select firstName, lastName from person 
        join employee on person.id = employee.person_id 
        join jobPosition on jobPosition.id = employee.jobPosition_id 
        where jobPosition.name = 'зварник'
        union
        select firstName, lastName from person 
        join employee on person.id = employee.person_id 
        join jobPosition on jobPosition.id = employee.jobPosition_id 
        where jobPosition.name = 'слюсар';
        end;
        
	elseif (exists(select firstName from person 
    join employee on person.id = employee.person_id 
    join jobPosition on jobPosition.id = employee.jobPosition_id 
    join area on employee.id = area.employee_id
    where firstName = firstName_person and lastName = lastName_person and jobPosition.name = 'Начальник ділянки')) then begin
		select "Начальник ділянки", null
        union
        select firstName, lastName from person 
        join employee on person.id = employee.person_id 
        join jobPosition on jobPosition.id = employee.jobPosition_id 
        join area on employee.id = area.employee_id
        where jobPosition.name = 'Начальник ділянки';
        end;
        
	else select "some problems";
    end if;
end$$
DELIMITER $$
call task13('Китаєв', 'Олег')$$
call task13('Олексій', 'Чижов')$$

-- 14_1
delimiter $$
-- drop procedure if exists task14_1;
create procedure task14_1(IN firstName_person varchar(45), IN lastName_person varchar(45), IN car varchar(45))
begin
	select `repair`.date, cars.`car name`, unit from `repair`
    join cars on `repair`.автомобілі_idАвтомобілі = cars.id
    join welders on welders.id = `repair`.зварники_idЗварники
    join lockmiths on lockmiths.id = `repair`.слюсарі_idСлюсарі
    join employee on (lockmiths.employee_id = employee.id or welders.employee_id = employee.id)
    join person on person.id = employee.person_id 
    join jobPosition on jobPosition.id = employee.jobPosition_id
    where (firstName = firstName_person and lastName = lastName_person and jobPosition.name = 'зварник' and cars.`car name` = car) 
    or (firstName = firstName_person and lastName = lastName_person and jobPosition.name = 'слюсар' and cars.`car name` = car);
end$$
DELIMITER $$
call task14_1('Рамон','Лайтман','Рута 22')$$
call task14_1('Франц','Зайцев','Рута 22')$$

-- 14_2
delimiter $$
-- drop procedure if exists task14_2;
create procedure task14_2(IN firstName_person varchar(45), IN lastName_person varchar(45), IN date1 DATE, IN date2 DATE)
begin
	select `repair`.date, cars.`car name`, unit from `repair`
    join cars on `repair`.автомобілі_idАвтомобілі = cars.id
    join welders on welders.id = `repair`.зварники_idЗварники
    join lockmiths on lockmiths.id = `repair`.слюсарі_idСлюсарі
    join employee on (lockmiths.employee_id = employee.id or welders.employee_id = employee.id)
    join person on person.id = employee.person_id 
    join jobPosition on jobPosition.id = employee.jobPosition_id
    where (firstName = firstName_person and lastName = lastName_person and jobPosition.name = 'зварник' and `repair`.date between date1 and date2) 
    or (firstName = firstName_person and lastName = lastName_person and jobPosition.name = 'слюсар' and `repair`.date between date1 and date2);
end$$
DELIMITER $$
call task14_2('Франц','Зайцев','2015-01-01','2021-01-01')$$
call task14_2('Ясон','Масляков','2015-01-01','2021-01-01')$$

-- smth
delimiter $$
-- drop procedure if exists welders();
create procedure drivers(in idcar int, in idbrig int, in ide int)
begin
	declare t int;
	set t = (select count(*) from welders where employee_id=ide);
    case 
    when t=0
	then 	INSERT INTO `drivers`(`автомобілі_idАвтомобілі`,`бригади_Бригада`,`employee_id`) VALUES(idcar, idbrig, ide);
    else 
    select 'Duplbicate' as 'Error message';
    end case;
end$$
DELIMITER $$
call drivers(6, 2, 13)$$