use mydb;

-- 1
delimiter $$
-- drop procedure if exists task1;
create procedure task1()
begin
	select Назва from Автомобілі;
end $$
delimiter $$
call task1()$$

-- 2_1
delimiter $$
-- drop procedure if exists task2_1;
create procedure task2_1()
begin
	select Імя from водії;
	select count(*) from водії;
end$$
DELIMITER $$
call task2_1()$$

-- 2_2
delimiter $$
-- drop procedure if exists task2_2;
create procedure task2_2(IN name_car VARCHAR(45))
begin
	select Імя as result
    from водії 
    where Машина = name_car;
    select count(Імя)
    from водії
    where Машина = name_car;
end$$
DELIMITER $$
call task2_2('Рута 37')$$

-- 3
delimiter $$
-- drop procedure if exists task3;
create procedure task3()
begin
	select Імя, Машина from водії;
end$$
DELIMITER $$
call task3$$

-- 4
delimiter $$
-- drop procedure if exists task4;
create procedure task4()
begin
	select Машина, Маршрут from маршрути;
end$$
DELIMITER $$
call task4$$

-- 5_1
delimiter $$
-- drop procedure if exists task5_1;
create procedure task5_1(IN type_car VARCHAR(45))
begin
	select пробіг.Дата, пробіг.Кілометраж, Автомобілі.Назва, Автомобілі.Тип
    from пробіг
    inner join Автомобілі
    on Автомобілі.Назва = пробіг.Автомобіль 
    where Тип = type_car;
end$$
DELIMITER $$
call task5_1('Автобус')$$

-- 5_2
delimiter $$
-- drop procedure if exists task5_2;
create procedure task5_2(IN car VARCHAR(45), IN date1 DATE, IN date2 DATE)
begin
	select пробіг.Дата, пробіг.Кілометраж, Автомобілі.Назва, Автомобілі.Тип
    from пробіг
    inner join Автомобілі
    on Автомобілі.Назва = пробіг.Автомобіль
    where пробіг.Дата between date1 and date2 AND пробіг.Автомобіль = car;
end$$
DELIMITER $$
call task5_2('Рута 37', '2019-07-06', '2020-08-06')$$

-- 6_1
delimiter $$
-- drop procedure if exists task6_1;
create procedure task6_1(IN type_car VARCHAR(45))
begin
	select count(idРемонт), sum(Вартість)
    from ремонт
    inner join автомобілі
    on автомобілі.назва = ремонт.машина
    where Тип = type_car;
end$$
DELIMITER $$
call task6_1('Автобус')$$

-- 6_2
delimiter $$
-- drop procedure if exists task6_2;
create procedure task6_2(IN marka_car VARCHAR(45))
begin
	select count(idРемонт), sum(Вартість)
    from ремонт
    inner join автомобілі
    on автомобілі.назва = ремонт.машина
    where Марка = marka_car;
end$$
DELIMITER $$ 
call task6_2('Богдан')$$

-- 6_3
delimiter $$
-- drop procedure if exists task6_3;
create procedure task6_3(IN car VARCHAR(45), IN date1 DATE, IN date2 DATE)
begin
	select count(idРемонт), sum(Вартість)
    from ремонт
    inner join автомобілі
    on автомобілі.назва = ремонт.машина
    where ремонт.Дата between date1 and date2 AND Машина = car;
end$$
DELIMITER $$
call task6_3('Богдан-3355', '2016-07-06', '2020-08-06')$$

-- 7
delimiter $$
-- drop procedure if exists task7;
create procedure task7(IN name_person varchar(45))
begin
	if (exists(select імя from водії where імя = name_person)) then begin
		
		select name_person
		union
		select Бригадир from бригади 
		inner join водії on водії.Бригада = бригади.Бригада where водії.Імя = name_person
		union
		select `Начальник ділянки` from ділянки 
		inner join бригади on бригади.Ділянка = ділянки.Ділянка where бригади.Бригадир = (
		select Бригадир from бригади 
		inner join водії on водії.Бригада = бригади.Бригада where водії.Імя = name_person)
        union
        select "Водій";
        end;
        
    elseif (exists(select імя from Зварники where імя = name_person)) then begin
		select name_person
		union
		select Бригадир from бригади 
		inner join Зварники on Зварники.Бригада = бригади.Бригада where Зварники.Імя = name_person
		union
		select `Начальник ділянки` from ділянки 
		inner join бригади on бригади.Ділянка = ділянки.Ділянка where бригади.Бригадир = (
		select Бригадир from бригади 
		inner join Зварники on Зварники.Бригада = бригади.Бригада where Зварники.Імя = name_person)
        union
        select "Зварювальник";
        end;
        
    elseif (exists(select імя from Слюсарі where імя = name_person)) then begin
		select name_person
		union
		select Бригадир from бригади 
		inner join Слюсарі on Слюсарі.Бригада = бригади.Бригада where Слюсарі.Імя = name_person
		union
		select `Начальник ділянки` from ділянки 
		inner join бригади on бригади.Ділянка = ділянки.Ділянка where бригади.Бригадир = (
		select Бригадир from бригади 
		inner join Слюсарі on Слюсарі.Бригада = бригади.Бригада where Слюсарі.Імя = name_person)
        union
        select "Слюсар";
        end;
        
	elseif (exists(select Бригадир from Бригади where Бригадир = name_person)) then begin
		select name_person
		union
		select `Начальник ділянки` from ділянки 
		inner join Бригади on Бригади.ділянка = ділянки.ділянка where Бригади.Бригадир = name_person
        union
        select "Бригадир";
        end;
        
	elseif (exists(select ділянка from Ділянки where `Начальник ділянки` = name_person)) then begin
		select name_person
        union
        select "Начальник ділянки";
        end;
        
	else select "some problems";
	end if;
end$$
DELIMITER $$
call task7('Шорин Богдан')$$

-- 8_1
delimiter $$
-- drop procedure if exists task8_1;
create procedure task8_1()
begin
	select if((select count(*) from гаражні_господарства)!=0, 'гаражні господарства є', 'гаражних господарств немає');
end$$
DELIMITER $$
call task8_1()$$

-- 8_2
delimiter $$
-- drop procedure if exists task8_2;
create procedure task8_2(IN type_car varchar(45))
begin
	select if((select count(*) from гаражні_господарства where Тип = type_car)!=0, 'гаражне господарство такого типу є', 'гаражного господарства такого типу немає');
end$$
DELIMITER $$
call task8_2('Таксі')$$

-- 9
delimiter $$
-- drop procedure if exists task9;
create procedure task9()
begin
	select автомобілі.Назва, автомобілі.Тип, гаражні_господарства.Назва as `Гаражне господарство` from автомобілі 
	inner join гаражні_господарства on гаражні_господарства.Тип = автомобілі.Тип;
end$$
DELIMITER $$
call task9()$$

-- 10
delimiter $$
-- drop procedure if exists task10;
create procedure task10(IN car VARCHAR(45), IN date1 DATE, IN date2 DATE)
begin
	select * from вантажоперевезення
    where Дата between date1 and date2 AND Машина = car;
end$$
DELIMITER $$
call task10('ЗІЛ-138', '2017-07-06', '2020-08-06')$$

-- 11_1
delimiter $$
-- drop procedure if exists task11_1;
create procedure task11_1(IN element_car VARCHAR(45), IN type_car varchar(45))
begin
    
    select count(idРемонт)
    from ремонт
    inner join автомобілі
    on автомобілі.назва = ремонт.машина
    where `ремонт`.`Вузел/Агрегат` = element_car AND Тип = type_car;
end$$
DELIMITER $$
call task11_1('шасі', 'Автобус')$$

-- 11_2
delimiter $$
-- drop procedure if exists task11_2;
create procedure task11_2(IN element_car VARCHAR(45), IN marka_car varchar(45))
begin
	select count(idРемонт)
    from ремонт
    inner join автомобілі
    on автомобілі.назва = ремонт.машина
    where `ремонт`.`Вузел/Агрегат` = element_car AND Марка = marka_car;
end$$
DELIMITER $$
call task11_2('шасі', 'Рута')$$

-- 11_3
delimiter $$
-- drop procedure if exists task11_3;
create procedure task11_3(IN element_car varchar(45), IN car VARCHAR(45), IN date1 DATE, IN date2 DATE)
begin
	select count(idРемонт)
    from ремонт
    inner join автомобілі
    on автомобілі.назва = ремонт.машина
    where Дата between date1 and date2 AND Машина = car AND `ремонт`.`Вузел/Агрегат` = element_car;
end$$
DELIMITER $$
call task11_3('двигун', 'Богдан-3355', '2016-07-06', '2020-08-06')$$

-- 12
delimiter $$
-- drop procedure if exists task12;
create procedure task12(IN date1 DATE, IN date2 DATE)
begin
	select Назва, `Дата появи`, `Дата списання` from автомобілі
    where `Дата появи` between date1 and date2 OR `Дата списання` between date1 and date2;
end$$
DELIMITER $$
call task12('2017-07-23', '2017-08-23')$$

-- 13_1
delimiter $$
-- drop procedure if exists task13;
create procedure task13(IN person_name varchar(45))
begin
	if (exists(select Бригадир from Бригади where Бригадир = person_name)) then begin
		select "Бригадир"
        union
		select Імя from водії
		inner join бригади on водії.Бригада = бригади.Бригада where Бригадир = person_name
		union
		select Імя from зварники
		inner join бригади on зварники.Бригада = бригади.Бригада where Бригадир = person_name
		union
		select Імя from слюсарі
		inner join бригади on слюсарі.Бригада = бригади.Бригада where Бригадир = person_name;
        end;
        
	elseif (exists(select `Начальник ділянки` from ділянки where `Начальник ділянки` = person_name)) then begin
		select "Начальник ділянки"
        union
		select Бригадир from Бригади
		inner join ділянки on бригади.Ділянка = ділянки.Ділянка where `Начальник ділянки` = person_name;
        end;
        
	else select "some problems";
    end if;
end$$
DELIMITER $$
call task13('Китаєв Олег')$$

-- 14_1
delimiter $$
-- drop procedure if exists task14_1;
create procedure task14_1(IN name_worker VARCHAR(45), IN car varchar(45))
begin
	select Дата, Машина, `Вузел/Агрегат` from ремонт
    where (Зварник = name_worker and Машина = car) or (Слюсар = name_worker and Машина = car) ;
end$$
DELIMITER $$
call task14_1('Ачкасов Валерій', 'Богдан-3355')$$

-- 14_2
delimiter $$
-- drop procedure if exists task14_2;
create procedure task14_2(IN name_person VARCHAR(45), IN date1 DATE, IN date2 DATE)
begin
	select Дата, Машина, `Вузел/Агрегат` from ремонт
    where Дата between date1 and date2 AND (Зварник = name_person or Слюсар = name_person);
end$$
DELIMITER $$
call task14_2('Анохин Іван', '2016-07-06', '2020-08-06')$$