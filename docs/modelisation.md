# Modélisation — Base de données Tifosi

## Tables principales

### ingredient
- id_ingredient (PK)
- nom

### focaccia
- id_focaccia (PK)
- nom
- prix

### marque
- id_marque (PK)
- nom

### boisson
- id_boisson (PK)
- nom
- id_marque (FK)

### menu
- id_menu (PK)
- nom
- prix
- id_focaccia (FK)

### client
- id_client (PK)
- nom
- email




## Tables de liaison

### comprend
Relation entre focaccia et ingredient
- id_focaccia (FK)
- id_ingredient (FK)
- quantite

### contient
Relation entre menu et boisson
- id_menu (FK)
- id_boisson (FK)

### achat
Relation entre client et menu
- id_client (FK)
- id_menu (FK)
- date_achat



## Hypothèses

- Une focaccia peut être présente dans plusieurs menus
- Chaque menu contient exactement une focaccia
- Une foccacia a besoin de plusieurs ingrédients
- Un ingrédient peut être utilisé dans plusieurs foccacias 
- La quantité d’ingrédient par focaccia sera fixée à 1