# Résultats des requêtes de test — BDD Tifosi

Source : exécution des requêtes dans phpMyAdmin (base `tifosi`)

---

## Requête 1 — Focaccias triées A → Z


### Résultat obtenu
127.0.0.1/tifosi/focaccia/		http://localhost/phpmyadmin/index.php?route=/database/sql&db=tifosi

   Affichage des lignes 0 -  7 (total de 8, traitement en 0,0001 seconde(s).) [nom: AMÉRICAINE... - TRADIZIONE...]


SELECT nom
FROM focaccia
ORDER BY nom ASC;


nom   	
Américaine	
Emmentalaccia	
Gorgonzollaccia	
Hawaienne	
Mozaccia	
Paysanne	
Raclaccia	
Tradizione	


### Commentaire
Conforme à l’attendu

---

## Requête 2 — Nombre total d’ingrédients


### Résultat obtenu
total_ingredients = 25

### Commentaire
Conforme à l’attendu

---

## Requête 3 — Prix moyen des focaccias


### Résultat obtenu
prix_moyen_focaccias = 10.375

### Commentaire
Conforme à l’attendu

---

## Requête 4 — Boissons + marque (tri boisson)


### Résultat obtenu
127.0.0.1/tifosi/		http://localhost/phpmyadmin/index.php?route=/database/sql&db=tifosi

   Affichage des lignes 0 - 11 (total de 12, traitement en 0,0017 seconde(s).)


SELECT boisson.nom AS boisson, marque.nom AS marque
FROM boisson
JOIN marque ON boisson.id_marque = marque.id_marque
ORDER BY boisson.nom ASC;


boisson	marque	
Capri-sun	Coca-Cola	
Coca-cola original	Coca-Cola	
Coca-cola zéro	Coca-Cola	
Eau de source	Cristalline	
Fanta citron	Coca-Cola	
Fanta orange	Coca-Cola	
Lipton Peach	Pepsico	
Lipton zéro citron	Pepsico	
Monster energy ultra blue	Monster	
Monster energy ultra gold	Monster	
Pepsi	Pepsico	
Pepsi Max Zéro	Pepsico	


### Commentaire
Conforme à l’attendu

---

## Requête 5 — Ingrédients de “Raclaccia”


### Résultat obtenu
127.0.0.1/tifosi/		http://localhost/phpmyadmin/index.php?route=/database/sql&db=tifosi

   Affichage des lignes 0 -  6 (total de 7, traitement en 0,0002 seconde(s).)


SELECT i.nom AS ingredient, c.quantite
FROM comprend c
JOIN focaccia f ON c.id_focaccia = f.id_focaccia
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE f.nom = 'Raclaccia'
ORDER BY i.nom;


ingredient	quantite	
Ail	2	
Base Tomate	200	
Champignon	40	
Cresson	20	
Parmesan	50	
Poivre	1	
Raclette	50	


### Commentaire
Conforme à l’attendu

---

## Requête 6 — Nombre d’ingrédients par focaccia


### Résultat obtenu
127.0.0.1/tifosi/f/		http://localhost/phpmyadmin/index.php?route=/database/sql&db=tifosi

   Affichage des lignes 0 -  7 (total de 8, traitement en 0,0002 seconde(s).)


SELECT f.nom AS focaccia, COUNT(*) AS nb_ingredients
FROM comprend c
JOIN focaccia f ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY f.nom;


focaccia	nb_ingredients	
Américaine	8	
Emmentalaccia	7	
Gorgonzollaccia	8	
Hawaienne	9	
Mozaccia	10	
Paysanne	12	
Raclaccia	7	
Tradizione	9	


### Commentaire
Conforme à l’attendu


---

## Requête 7 — Focaccia avec le plus d’ingrédients


### Résultat obtenu
127.0.0.1/tifosi/f/		http://localhost/phpmyadmin/index.php?route=/database/sql&db=tifosi
La requête SQL a été exécutée avec succès.

SELECT f.nom AS focaccia, COUNT(*) AS nb_ingredients
FROM comprend c
JOIN focaccia f ON c.id_focaccia = f.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY nb_ingredients DESC
LIMIT 1;



Paysanne	12	


### Commentaire
Conforme à l’attendu

---

## Requête 8 — Focaccias contenant de l’ail


### Résultat obtenu
127.0.0.1/tifosi/f/		http://localhost/phpmyadmin/index.php?route=/database/sql&db=tifosi

   Affichage des lignes 0 -  3 (total de 4, traitement en 0,0010 seconde(s).)


SELECT f.nom AS focaccia
FROM comprend c
JOIN focaccia f ON f.id_focaccia = c.id_focaccia
JOIN ingredient i ON i.id_ingredient = c.id_ingredient
WHERE i.nom = 'Ail'
ORDER BY f.nom;


focaccia	
Gorgonzollaccia	
Mozaccia	
Paysanne	
Raclaccia	


### Commentaire
Conforme à l’attendu

---

## Requête 9 — Ingrédients inutilisés


### Résultat obtenu
127.0.0.1/tifosi/ingredient/		http://localhost/phpmyadmin/index.php?route=/database/sql&db=tifosi

   Affichage des lignes 0 -  1 (total de 2, traitement en 0,0003 seconde(s).)


SELECT i.nom AS ingredient_inutilise
FROM ingredient i
LEFT JOIN comprend c ON c.id_ingredient = i.id_ingredient
WHERE c.id_ingredient IS NULL
ORDER BY i.nom;


ingredient_inutilise	
Salami	
Tomate cerise	


### Commentaire
Conforme à l’attendu

---

## Requête 10 — Focaccias sans champignons


### Résultat obtenu
127.0.0.1/tifosi/focaccia/		http://localhost/phpmyadmin/index.php?route=/database/sql&db=tifosi

   Affichage des lignes 0 -  1 (total de 2, traitement en 0,0003 seconde(s).)


SELECT f.nom AS focaccia
FROM focaccia f
WHERE f.id_focaccia NOT IN (
    SELECT c.id_focaccia
    FROM comprend c
    JOIN ingredient i ON c.id_ingredient = i.id_ingredient
    WHERE i.nom = "Champignon"
)
ORDER BY f.nom;


focaccia	
Américaine	
Hawaienne	


### Commentaire
Conforme à l’attendu