-- Active: 1692775137903@@127.0.0.1@3306@exemple
--1 
SELECT * FROM employe LIMIT 0,100;
SELECT nom, dateemb, nosup, nodep, salaire
FROM employe;
/*exercice 3. */
 

SELECT nom, salaire, nodep
FROM employe
WHERE titre = 'Représentant' AND nodep = 35 AND salaire > 20000 LIMIT 0,100;
/* 2023-08-23 13:19:07 [2 ms] */ 
SELECT nom, prenom
FROM employe
WHERE nom < prenom LIMIT 0,100;
/* 2023-08-23 15:21:41 [2 ms] */ 
SELECT nom, salaire, nodep
FROM employe
WHERE titre = 'Représentant' AND nodep = 35 AND salaire > 20000 LIMIT 0,100;
/* 2023-08-23 15:26:11 [4 ms] */ 
SELECT nom, titre, salaire
FROM employe
WHERE titre = 'Représentant' OR titre = 'Président' LIMIT 0,100;
/* 2023-08-23 15:27:57 [3 ms] */ 
SELECT nom, titre, nodep, salaire
FROM employe
WHERE nodep = 34 AND (titre = 'Représentant' OR titre = 'Secrétaire') LIMIT 0,100;
/* 2023-08-23 15:29:08 [3 ms] */ 
SELECT nom, salaire
FROM employe
WHERE salaire BETWEEN 20000 AND 30000 LIMIT 0,100;
/* 2023-08-23 15:35:05 [3 ms] */ 
SELECT nom
FROM employe
WHERE nom LIKE 'H%' LIMIT 0,100;
/* 2023-08-23 15:35:54 [3 ms] */ 
SELECT nom
FROM employe
WHERE nom LIKE '%n' LIMIT 0,100;
/* 2023-08-23 15:37:10 [3 ms] */ 
SELECT nom
FROM employe
WHERE SUBSTRING(nom, 3, 1) = 'u' LIMIT 0,100;
/* 2023-08-23 15:38:57 [4 ms] */ 
SELECT salaire, nom
FROM employe
WHERE nodep = 41
ORDER BY salaire ASC LIMIT 0,100;
/* 2023-08-23 15:40:27 [3 ms] */ 
SELECT salaire, nom
FROM employe
WHERE nodep = 41
ORDER BY salaire DESC LIMIT 0,100;
/* 2023-08-23 15:54:43 [3 ms] */ 
SELECT titre, salaire, nom
FROM employe
ORDER BY titre ASC, salaire DESC LIMIT 0,100;
/* 2023-08-23 15:58:32 [3 ms] */ 
SELECT tauxcom, salaire, nom
FROM employe
ORDER BY tauxcom ASC LIMIT 0,100;
/* 2023-08-23 16:14:29 [3 ms] */ 
SELECT nom, salaire, tauxcom, titre
FROM employe
WHERE tauxcom IS NULL LIMIT 0,100;
/* 2023-08-24 09:40:20 [9 ms] */ 
SELECT nom, salaire, tauxcom, titre
FROM employe
WHERE tauxcom IS NOT NULL LIMIT 0,100;
/* 2023-08-24 09:59:48 [3 ms] */ 
SELECT nom, salaire, nodep
FROM employe
WHERE titre = 'Représentant' AND nodep = 35 AND salaire > 20000 LIMIT 0,100;
/* 2023-08-25 09:40:55 [3 ms] */ 
SELECT tauxcom, salaire, nom
FROM employe
ORDER BY tauxcom ASC LIMIT 0,100;
/* 2023-08-25 09:41:51 [5 ms] */ 
SELECT * FROM employe LIMIT 0,100;
/* 2023-08-25 09:43:58 [2 ms] */ 
SELECT dateemb, nosup, titre FROM employe LIMIT 0,100;
/* 2023-08-28 09:07:45 [3 ms] */ 
SELECT nom, salaire, tauxcom, titre
FROM employe
WHERE tauxcom < 15 LIMIT 0,100;
/* 2023-08-28 09:08:03 [2 ms] */ 
SELECT nom, salaire, tauxcom, titre
FROM employe
WHERE tauxcom > 15 LIMIT 0,100;
/* 2023-08-28 09:09:23 [14 ms] */ 
SELECT nom, salaire, tauxcom, salaire * tauxcom AS commission
FROM employe
WHERE tauxcom IS NOT NULL LIMIT 0,100;
/* 2023-08-28 09:12:16 [2 ms] */ 
SELECT nom, salaire, tauxcom, salaire * tauxcom AS commission
FROM employe
WHERE tauxcom IS NOT NULL
ORDER BY tauxcom ASC LIMIT 0,100;
/* 2023-08-28 09:13:24 [3 ms] */ 
SELECT CONCAT(nom, ' ', prenom) AS nom_complet
FROM employe LIMIT 0,100;
/* 2023-08-28 09:43:16 [15 ms] */ 
SELECT SUBSTRING(nom, 1, 5) AS cinqpremiereslettres
FROM employe LIMIT 0,100;
/* 2023-08-28 09:45:41 [3 ms] */ 
SELECT nom,
       UPPER(nom) AS nom_majuscules,
       LOWER(nom) AS nom_minuscules
FROM employe
WHERE nom = 'Vrante' LIMIT 0,100;
/* 2023-08-28 09:47:28 [4 ms] */ 
SELECT nom,
       CHAR_LENGTH(nom) AS nombre_de_caracteres
FROM employe LIMIT 0,100;
/* 2023-08-28 10:16:19 [15 ms] */

--EXEMPLE 2

/*Rechercher le prénom des employés et le numéro de la région de leur
département*/
SELECT
    employe.prenom AS prenom_employe,
    nodep AS numero_region
FROM employe

/*Rechercher le numéro du département, le nom du département, le
nom des employés classés par numéro de département (renommer les
tables utilisées).*/
SELECT
    dept.nodept AS numero_departement,
    dept.nom AS nom_departement,
    employe.nom AS nom_employe
FROM
    dept 
JOIN
    employe  ON dept.nodept = employe.nodep
ORDER BY
    dept.nodept;

/*Rechercher le nom des employés du département Distribution.*/
SELECT
    employe.nom AS nom_employe
FROM
    employe
JOIN
    dept ON employe.nodep = dept.nodept
WHERE
    dept.nom = 'Distribution';


/*Rechercher le nom et le salaire des employés qui gagnent plus que
leur patron, et le nom et le salaire de leur patron.*/
SELECT
    employe.nom AS nom_employe,
    employe.salaire AS salaire_employe,
    nosup.nom AS nom_patron,
    nosup.salaire AS salaire_patron
FROM
    employe
JOIN
    employe nosup ON employe.nosup = nosup.noemp
WHERE
    employe.salaire > nosup.salaire

/*Rechercher le nom et le titre des employés qui ont le même titre que
Amartakaldire.*/

SELECT e.nom, e.titre
FROM employe e
WHERE titre =
(SELECT titre FROM employe WHERE nom = 'Amartakaldire');

/*Rechercher le nom, le salaire et le numéro de département des
employés qui gagnent plus qu'un seul employé du département 31,
classés par numéro de département et salaire*/
SELECT
    E.nom AS nom_employe,
    E.salaire AS salaire_employe,
    E.nodep AS numero_departement
FROM
    employe E
WHERE
    E.salaire > (SELECT MIN(salaire) FROM employe WHERE nodep = 31)
    AND E.nodep <> 31
ORDER BY
    E.nodep, E.salaire;


/* Rechercher le nom, le salaire et le numéro de département des
employés qui gagnent plus que tous les employés du département 31,
classés par numéro de département et salaire */

SELECT
    E.nom AS nom_employe,
    E.salaire AS salaire_employe,
    E.nodep AS numero_departement
FROM
    employe E
WHERE
    E.salaire > ALL (SELECT salaire FROM employe WHERE nodep = 31)
ORDER BY
    E.nodep, E.salaire;

/*Rechercher le nom et le titre des employés du service 31 qui ont un
titre que l'on trouve dans le département 32 */
SELECT nom, titre
FROM employe
WHERE nodep = 31
AND titre IN (SELECT titre FROM employe WHERE nodep = 32);


/*Rechercher le nom et le titre des employés du service 31 qui ont un
titre que l'on trouve dans le département 32*/
SELECT nom, titre
FROM employe
WHERE nodep = 31
AND titre IN (SELECT titre FROM employe WHERE nodep = 32);


/*Rechercher le nom et le titre des employés du service 31 qui ont un
titre l'on ne trouve pas dans le département 32 */
SELECT nom, titre
FROM employe
WHERE nodep = 31
AND titre NOT IN (SELECT titre FROM employe WHERE nodep = 32);


/*Rechercher le nom, le titre et le salaire des employés qui ont le même
titre et le même salaire que Fairant.*/

SELECT nom, titre, salaire
FROM employe
WHERE titre = (SELECT titre FROM employe WHERE nom = 'Fairent')
AND salaire = (SELECT salaire FROM employe WHERE nom = 'Fairent');


/*Rechercher le numéro de département, le nom du département, le
nom des employés, en affichant aussi les départements dans lesquels
il n'y a personne, classés par numéro de département*/

SELECT d.nodept, d.nom AS nom_departement, IFNULL(e.nom, 'Aucun employé') AS nom_employe
        FROM dept d
        LEFT JOIN employe e ON d.nodept = e.nodep
        ORDER BY d.nodept


/* SELECT dept.nodept AS numero_departement, employe.titre, employe.nom AS nom_employe
FROM dept
LEFT JOIN employe ON dept.nodept = employe.nodep
-- Sélectionnez les départements dans lesquels il n'y a pas de correspondance
-- en utilisant une clause WHERE qui vérifie si le champ employe.nodep est NULL
WHERE employe.nodep IS NULL
ORDER BY dept.nodept; */


/* exercice partie 2 */


--1
SELECT dateemb, noemp, titre FROM employe ;

--2
SELECT nodep,
       AVG(salaire) AS moyenne_salaires,
       SUM(salaire) AS somme_salaires
FROM employe
GROUP BY nodep;

--3
SELECT nodep
FROM employe
GROUP BY nodep
HAVING COUNT(*) >= 3;

--4
SELECT SUBSTRING(nom, 1, 1) AS initiale, COUNT(*) AS nombre_d_employes
FROM employe
GROUP BY initiale
HAVING COUNT(*) >= 3;

--5
SELECT MAX(salaire) AS salaire_maximum,
       MIN(salaire) AS salaire_minimum,
       MAX(salaire) - MIN(salaire) AS ecart_salaire
FROM employe;

--6
SELECT COUNT(DISTINCT titre) AS nombre_de_titres_differents
FROM employe;

--7
SELECT titre, COUNT(*) AS nombre_d_employes
FROM employe
GROUP BY titre;

--8
SELECT nodep, COUNT(*) AS nombre_d_employes
FROM employe
GROUP BY nodep;

--9
SELECT titre, AVG(salaire) AS moyenne_salaires
FROM employe
GROUP BY titre
HAVING AVG(salaire) > (SELECT AVG(salaire) FROM employe WHERE titre = 'Représentant');

--10
SELECT COUNT(CASE WHEN salaire IS NOT NULL THEN 1 END) AS nombre_salaires_renseignes,
       COUNT(CASE WHEN tauxcom IS NOT NULL THEN 1 END) AS nombre_taux_commission_renseignes
FROM employe;


/* 
    Ajouter trois employés dans la base de données avec les données de votre choix.

    Ajouter un département
*/
INSERT INTO employe (nom, noemp, prenom, dateemb, nosup, titre, nodep, salaire, tauxcom)
VALUES
    ('Doe', 101, 'John', '2023-08-29', NULL, 'Ingénieur logiciel', 1, 60000, 0.05),
    ('Smith', 102, 'Jane', '2023-07-15', NULL, 'Designer UX', 2, 55000, 0.03),
    ('Johnson', 103, 'Michael', '2023-06-10', NULL, 'Analyste financier', 3, 70000, 0.02);

/* Pour l'instruction update:

    Augmenter de 10% le salaire de l'employe 17 */
UPDATE employe
SET salaire = salaire * 1.10
WHERE noemp = 17;


/* Pour l'instruction update:

    Changer le nom du département 45 en 'Logistique'*/

    UPDATE employe
SET titre = 'Logistique'
WHERE nodep = 45;

/* Pour l'instruction delete:

    Supprimer le dernier des employés que vous avez insérés précédemment. */
    DELETE FROM employe
WHERE noemp = (SELECT MAX(noemp) FROM employe);
