-- (1) Sécurité : supprimer la base si elle existe déjà
drop database if exists tifosi;

-- (2) Création de la base de données create database tifosi avec encodage
create database tifosi character set utf8mb4 collate utf8mb4_general_ci;

-- (3) Se placer dans la base
use tifosi;

-- TABLES PRINCIPALES
-- INGREDIENTS
create table ingredient (
    id_ingredient int auto_increment primary key,
    nom varchar(255) not null,
    unique (nom)
) engine = InnoDB;

create table focaccia (
    id_focaccia int auto_increment primary key,
    nom varchar(255) not null,
    prix decimal(6, 2) not null,
    unique (nom)
) engine = InnoDB;

create table marque (
    id_marque int auto_increment primary key,
    nom varchar(255) not null,
    unique (nom)
) engine = InnoDB;

create table boisson (
    id_boisson int auto_increment primary key,
    nom varchar(255) not null,
    id_marque int not null,
    foreign key (id_marque) references marque(id_marque)
) engine = InnoDB;

create table menu (
    id_menu int auto_increment primary key,
    nom varchar(255) not null,
    id_focaccia int not null,
    prix decimal(6, 2) not null,
    foreign key (id_focaccia) references focaccia(id_focaccia)
) engine = InnoDB;

create table client (
    id_client int auto_increment primary key,
    nom varchar(255) not null,
    email varchar(255) not null,
    unique (email)
) engine = InnoDB;

-- TABLES DE LIAISON
-- Foccacia <-> Ingrédient (N-N) + Quantité
create table comprend (
    id_focaccia int not null,
    id_ingredient int not null,
    quantite int not null default 1,
    primary key (id_focaccia, id_ingredient),
    foreign key (id_focaccia) references focaccia(id_focaccia),
    foreign key (id_ingredient) references ingredient(id_ingredient)
) engine = InnoDB;

-- Menu <-> Boisson (N-N) 
create table contient (
    id_menu int not null,
    id_boisson int not null,
    primary key (id_menu, id_boisson),
    foreign key (id_menu) references menu(id_menu),
    foreign key (id_boisson) references boisson(id_boisson)
) engine = InnoDB;

-- Achat : un client peut acheter plusieurs menus (plusieurs fois même)
create table achat (
    id_achat int auto_increment primary key,
    id_client int not null,
    id_menu int not null,
    date_achat datetime not null,
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
) engine = InnoDB;

