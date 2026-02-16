-- 1. Afficher la liste des noms des focaccias par ordre alphabétique croissant
-- Résultat attendu : 8 focaccias triées de A à Z
SELECT nom
FROM focaccia
ORDER BY nom ASC;

-- 2. Afficher le nombre total d'ingrédients
-- Résultat attendu : 25
SELECT COUNT(*) 
AS total_ingredients
FROM ingredient;

-- 3. Afficher le prix moyen des focaccias
-- Résultat attendu : moyenne des 8 prix
SELECT AVG(prix) 
AS prix_moyen_focaccias
FROM focaccia;

-- 4. Afficher la liste des boissons avec leur marque, triée par nom de boisson
SELECT boisson.nom AS boisson, marque.nom AS marque
FROM boisson
JOIN marque ON boisson.id_marque = marque.id_marque
ORDER BY boisson.nom ASC;


-- 5. Afficher la liste des ingrédients pour une Raclaccia
-- Résultat attendu : liste des ingrédients + quantités pour la focaccia "Raclaccia"
SELECT i.nom AS ingredient, c.quantite
FROM comprend c
JOIN focaccia f ON c.id_focaccia = f.id_focaccia
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE f.nom = 'Raclaccia'
ORDER BY i.nom;

-- 6. Afficher le nom et le nombre d'ingrédients pour chaque foccacia
-- Résultat attendu : 8 lignes (1 par focaccia) + nb_ingredients
SELECT f.nom AS focaccia, COUNT(*) AS nb_ingredients
FROM comprend c
JOIN focaccia f ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY f.nom;

-- 7. Afficher le nom de la focaccia qui a le plus d'ingrédients
-- Résultat attendu : 1 ligne (la focaccia max + nb_ingredients)
SELECT f.nom AS focaccia, COUNT(*) AS nb_ingredients
FROM comprend c
JOIN focaccia f ON c.id_focaccia = f.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY nb_ingredients DESC
LIMIT 1;

-- 8. Afficher la liste des focaccia qui contiennent de l'ail
-- Résultat attendu : liste des focaccias contenant l'ingrédient "Ail"
SELECT f.nom AS focaccia
FROM comprend c
JOIN focaccia f ON f.id_focaccia = c.id_focaccia
JOIN ingredient i ON i.id_ingredient = c.id_ingredient
WHERE i.nom = 'Ail'
ORDER BY f.nom;

-- 9. Afficher la liste des ingrédients inutilisés
-- Résultat attendu : ingrédients présents dans ingredient mais absents de comprend
SELECT i.nom AS ingredient_inutilise
FROM ingredient i
LEFT JOIN comprend c ON c.id_ingredient = i.id_ingredient
WHERE c.id_ingredient IS NULL
ORDER BY i.nom;

-- 10. Afficher la liste des focaccia qui n'ont pas de champignons
-- Résultat attendu : focaccias qui ne contiennent pas l'ingrédient "Champignon"
SELECT f.nom AS focaccia
FROM focaccia f
WHERE f.id_focaccia NOT IN (
    SELECT c.id_focaccia
    FROM comprend c
    JOIN ingredient i ON c.id_ingredient = i.id_ingredient
    WHERE i.nom = "Champignon"
)
ORDER BY f.nom;
