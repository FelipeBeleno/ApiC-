DROP DATABASE SOCIALIMPACTAPP
CREATE DATABASE SOCIALIMPACTAPP;
USE SOCIALIMPACTAPP;

CREATE TABLE role (
	role_id int NOT NULL IDENTITY,
	name varchar(50) NOT NULL,
	description varchar(200),
	PRIMARY KEY(role_id)
);

CREATE TABLE document_type (
	document_type_id int NOT NULL,
	name varchar(50) NOT NULL,
	description varchar(200),
	PRIMARY KEY(document_type_id)
);


CREATE TABLE category_group(
		
	category_group_id int NOT NULL IDENTITY,
	name varchar(50) NOT NULL,
	description varchar(200),
	PRIMARY KEY(category_group_id)

);

CREATE TABLE [group](
	
	group_id int NOT NULL IDENTITY,
	name varchar(50) NOT NULL,
	description varchar(200),
	document_type_id int NOT NULL,
	number_document varchar(15) NOT NULL,
	category_group_id int NOT NULL,
	PRIMARY KEY(group_id),
	FOREIGN KEY(document_type_id) REFERENCES document_type(document_type_id),
	FOREIGN KEY(category_group_id) REFERENCES category_group(category_group_id)
);

CREATE TABLE address(
	address_id int NOT NULL IDENTITY,
	address varchar(200) NOT NULL,
	code_country  varchar(5),
	city varchar(100),
	departament varchar(100),
	postal_code varchar(100),
	PRIMARY KEY(address_id)
)

CREATE TABLE [user](
	user_id int NOT NULL IDENTITY,
	first_name varchar(50) NOT NULL,
	second_name varchar(50) NOT NULL,
	birthday date NOT NULL,
	email varchar(100) NOT NULL UNIQUE,
	password varchar(200) NOT NULL,
	phone_number  varchar(20),
	code_country varchar(5),
	number_document varchar(15) NOT NULL,
	group_id int NOT NULL,
	role_id int NOT NULL,
	document_type_id int NOT NULL,
	address_id int NOT NULL,
	PRIMARY KEY(user_id),
	FOREIGN KEY(document_type_id) REFERENCES document_type(document_type_id),
	FOREIGN KEY(role_id) REFERENCES role(role_id),
	FOREIGN KEY(group_id) REFERENCES [group](group_id),
	FOREIGN KEY(address_id) REFERENCES address(address_id)

);


CREATE TABLE category_event(
	category_event_id int NOT NULL IDENTITY,
	name varchar(50) NOT NULL,
	description varchar(200),
	PRIMARY KEY(category_event_id)
);

CREATE TABLE [event](
	event_id int NOT NULL IDENTITY,
	name varchar(50) NOT NULL,
	description varchar(200),
	group_id int NOT NULL,
	category_event_id int NOT NULL,
	PRIMARY KEY(event_id),
	FOREIGN KEY(group_id) REFERENCES [group](group_id),
	FOREIGN KEY(category_event_id) REFERENCES category_event(category_event_id)
);

CREATE TABLE collaborator_event(
	collaborator_event_id int NOT NULL IDENTITY,
	event_id int NOT NULL,
	user_id int NOT NULL,
	PRIMARY KEY(collaborator_event_id),
	FOREIGN KEY(event_id) REFERENCES [event] (event_id),
	FOREIGN KEY(user_id) REFERENCES [user](user_id)

);