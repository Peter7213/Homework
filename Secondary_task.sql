create table if not exists Bosses(
id SERIAL primary key,
name VARCHAR(60) not null);

create table if not exists Departments(
id SERIAL primary key,
name VARCHAR(60) not null);

create table if not exists Employees(
id Serial primary key,
name VARCHAR(60) not null,
Department_id integer not null references Departments(id),
Boss_id integer references Bosses(id));


--Нашел в гугле как сделать внешний ключ, который ссылается на первичный ключ
--внутри одной таблицы. Но пока механизм мне не очень понятен, решил сделать вот так.


