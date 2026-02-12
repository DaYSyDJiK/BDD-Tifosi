-- (1) Sécurité : supprimer la base si elle existe déjà

drop database if exists tifosi;

-- (2) Création de la base de données create database tifosi avec encodage

create database tifosy
    character set utf8mb4
    collate utf8mb4_general_ci;

-- (3) Se placer dans la base

use tifosy;





---- TABLES PRINCIPALES

-- INGREDIENTS

create table ingredient (
    id_ingredient int auto_increment primary key, nom varchar(255) not null,
    constraint uq_ingredient_nom unique (nom)
) engine=InnoDB;
