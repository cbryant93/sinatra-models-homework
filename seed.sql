DROP TABLE IF EXISTS users;

create table users (
  id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	gender VARCHAR(50),
	ip_address VARCHAR(20)
);
insert into users (first_name, last_name, email, gender, ip_address) values ('Josée', 'Barthot', 'tbarthot0@shareasale.com', 'Male', '170.222.151.63');
insert into users (first_name, last_name, email, gender, ip_address) values ('Cléopatre', 'Gibbett', 'dgibbett1@typepad.com', 'Female', '66.55.77.241');
insert into users (first_name, last_name, email, gender, ip_address) values ('André', 'Perotti', 'sperotti2@fema.gov', 'Male', '188.165.142.201');
insert into users (first_name, last_name, email, gender, ip_address) values ('Nadège', 'Parram', 'jparram3@blinklist.com', 'Female', '10.210.7.71');
insert into users (first_name, last_name, email, gender, ip_address) values ('Dafnée', 'Leavry', 'jleavry4@barnesandnoble.com', 'Female', '12.211.89.202');
insert into users (first_name, last_name, email, gender, ip_address) values ('Gisèle', 'Buckam', 'ybuckam5@feedburner.com', 'Male', '63.199.145.66');
insert into users (first_name, last_name, email, gender, ip_address) values ('Göran', 'Pappi', 'mpappi6@discuz.net', 'Male', '222.59.189.92');
insert into users (first_name, last_name, email, gender, ip_address) values ('Mårten', 'Bromell', 'tbromell7@ucoz.com', 'Male', '192.187.69.16');
insert into users (first_name, last_name, email, gender, ip_address) values ('Stéphanie', 'Crippen', 'ycrippen8@senate.gov', 'Male', '0.60.180.49');
insert into users (first_name, last_name, email, gender, ip_address) values ('Laurène', 'Tomaszczyk', 'gtomaszczyk9@ehow.com', 'Male', '41.139.80.107');
