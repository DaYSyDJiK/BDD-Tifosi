-- Création de l'utilisation MySQL "tifosi"
-- A executer en tant qu'admin (root)



-- Création de l'utilisateur
create user if not exists 'tifosi'@'localhost'
identified by 'tifosi';

-- Donner les droits admin sur la base tifosi
grant all privileges on tifosi.* to 'tifosi'@'localhost';

-- Appliquer les modifications
flush privileges;
