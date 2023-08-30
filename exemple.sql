-- Active: 1692775137903@@127.0.0.1@3306@exemple
-- Active: 1692775137903@@127.0.0.1@3306@exemple-- Active: 1692775137903@@127.0.0.1@3306@exemple

SELECT * FROM employe;
SELECT dateemb, nosup, titre FROM employe; 

SELECT nom, noemp, nodep FROM employe
WHERE titre = 'Secrétaire';


SELECT nom FROM employe
WHERE nodep > 40;


SELECT nom, prenom
FROM employe
WHERE nom < prenom;

SELECT nom, salaire, nodep
FROM employe
WHERE titre = 'Représentant' AND nodep = 35 AND salaire > 20000;

SELECT nom, titre, salaire
FROM employe
WHERE titre = 'Représentant' OR titre = 'Président';

SELECT nom, titre, nodep, salaire
FROM employe
WHERE nodep = 34 AND (titre = 'Représentant' OR titre = 'Secrétaire');

HERE titre = 'Représentant' AND nodep = 35 AND salaire > 20000 LIMIT 0,100;
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

--1
SELECT dateemb, noemp, titre FROM employe LIMIT 0,100;

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

