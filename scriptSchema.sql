create schema personalmaster authorization ohzgliaz;

-- Tabla de grupos empresariales

create table personalmaster.business_group(
	id_business_group varchar(20) not null, -- PK
	name varchar(200) not null
);

alter table personalmaster.business_group
add constraint business_group_PK primary key (id_business_group);

-- Tabla de marcas

create table personalmaster.brand(
    id_brand varchar(20) not null, --PK
	id_business_group varchar(20) not null, -- FK
	name varchar(200) not null
);

alter table personalmaster.brand
add constraint brand_PK primary key (id_brand);

-- FK's
alter table personalmaster.brand
add constraint brand_FK 
				foreign key (id_business_group) 
				references personalmaster.business_group (id_business_group);

-- Tabla de modelos

create table personalmaster.model(
    id_model varchar(20) not null, --PK
	id_brand varchar(20) not null, -- FK
	name varchar(200) not null
);

alter table personalmaster.model
add constraint model_PK primary key (id_model);

-- FK's
alter table personalmaster.model
add constraint brand_FK 
				foreign key (id_brand) 
				references personalmaster.brand (id_brand);

-- Tabla de monedas

create table personalmaster.currency(
	id_currency varchar(20) not null, -- PK
	name varchar(200) not null,
	symbol varchar(100) not null
);
alter table personalmaster.currency
add constraint currency_PK primary key (id_currency);

-- Tabla de colores

create table personalmaster.color(
	id_color varchar(20) not null, -- PK
	name varchar(200) not null
);

alter table personalmaster.color
add constraint color_PK primary key(id_color);

-- Tabla de aseguradoras

create table personalmaster.insurance_company(
	id_insurance_company varchar(20) not null, -- PK
	name varchar(200) not null
);

alter table personalmaster.insurance_company
add constraint insurance_company_PK primary key(id_insurance_company);

-- Tabla coche. 

create table personalmaster.car(
	id_car varchar(10) not null, -- PK
	id_model varchar(10) not null, -- FK
	id_color varchar(10) not null, -- FK
	id_insurance_company varchar(10) not null, -- FK
	purchase_date date not null,
	total_km varchar(20) not null,
	insurance_policy_number varchar(50) not null,
	license_plate varchar(255) null
);

-- PK
alter table personalmaster.car
add constraint car_PK primary key (id_car);

-- FK's
alter table personalmaster.car
add constraint model_FK 
				foreign key (id_model) 
				references personalmaster.model (id_model);


alter table personalmaster.car
add constraint color_FK
				foreign key(id_color)
				references personalmaster.color(id_color);

alter table personalmaster.car
add constraint insurance_company_FK
				foreign key(id_insurance_company)
				references personalmaster.insurance_company(id_insurance_company);


-- Tabla de revisiones

create table personalmaster.maintenance_check(
	id_maintenance_check varchar(20) not null, -- PK
	id_currency varchar(20) not null,
	id_car varchar(20) not null, -- FK
    check_date date not null,
	km varchar(512) not null,
    cost varchar(512) not null
);
alter table personalmaster.maintenance_check
add constraint maintenance_check_PK primary key(id_maintenance_check);
-- FK's
alter table personalmaster.maintenance_check
add constraint maintenance_check_FK 
				foreign key (id_currency) 
				references personalmaster.currency (id_currency);

alter table personalmaster.maintenance_check				
add constraint maintenance_check_car_FK 
				foreign key (id_car) 
				references personalmaster.car (id_car);
			

-- Cargamos coches

-- Grupos empresariales		
			
insert into personalmaster.business_group(id_business_group, name) 
values (1,'VAN');

insert into personalmaster.business_group(id_business_group, name) 
values (2,'Hyundai');

		
		
-- Marcas
			
insert into personalmaster.brand (id_brand, id_business_group, name) values(1,1,'VW');
insert into personalmaster.brand (id_brand, id_business_group, name) values(2,1, 'Audi');
insert into personalmaster.brand (id_brand, id_business_group, name) values(3,1, 'KIA');
insert into personalmaster.brand (id_brand, id_business_group, name) values(4,2,'Genesis');


-- Modelos
			

insert into personalmaster.model (id_model, id_brand, name) values(1,1,'Arteon');
insert into personalmaster.model (id_model, id_brand, name) values(2,1,'Touareg');
insert into personalmaster.model (id_model, id_brand, name) values(3,2,'A1');
insert into personalmaster.model (id_model, id_brand, name) values(4,2,'A3');
insert into personalmaster.model (id_model, id_brand, name) values(5,3,'Picanto');
insert into personalmaster.model (id_model, id_brand, name) values(6,3,'Rio');
insert into personalmaster.model (id_model, id_brand, name) values(7,4,'GV80');
insert into personalmaster.model (id_model, id_brand, name) values(8,4,'G70');


-- Colores		

		
insert into personalmaster.color(id_color, name) 
values (1, 'Red');

insert into personalmaster.color(id_color, name) 
values (2, 'Black' );

-- Aseguradoras		

		
insert into personalmaster.insurance_company(id_insurance_company, name) 
values (1, 'MAPFRE');

insert into personalmaster.insurance_company(id_insurance_company, name) 
values (2, 'AXA' );

-- Monedas		
		
insert into personalmaster.currency(id_currency, name, symbol) 
values (1, 'Euro', '€' );

insert into personalmaster.currency(id_currency, name, symbol) 
values (2, 'Dólar', '$' );
		

-- Coches ---

insert into personalmaster.car 
(id_car, id_model, id_color, id_insurance_company, purchase_date, total_km, insurance_policy_number, license_plate)
values(1,1, 1, 1, '08/09/2020', '50','12345', '1234FGH');

insert into personalmaster.car 
(id_car, id_model, id_color, id_insurance_company, purchase_date, total_km, insurance_policy_number, license_plate)
values(2,2, 2, 2, '09/09/2020', '1100', '123456', '1234FFH');

insert into personalmaster.car 
(id_car, id_model, id_color, id_insurance_company, purchase_date, total_km, insurance_policy_number, license_plate)
values(3,2, 1, 2, '10/05/2020', '1100', '123456', '1234FFH');


-- Revisiones	

		
insert into personalmaster.maintenance_check(id_maintenance_check, id_car, check_date, km, cost, id_currency) 
values ('1MC1', 1, '08/09/2021', '100', '200', 1);
insert into personalmaster.maintenance_check(id_maintenance_check, id_car, check_date, km, cost, id_currency) 
values ('1MC2', 2, '08/09/2022', '1300', '400', 2);
insert into personalmaster.maintenance_check(id_maintenance_check, id_car, check_date, km, cost, id_currency) 
values ('1MC3', 3, '08/09/2022', '1300', '400', 2);

