/*
These SQL queries were performed in Google BigQuery to get a broad overview of the
Global Terrorism Database

Some data inspection queries were simultaneously carried out to point out potentional anomalies or duplicates in the dataset

*/



-- PART 1

-- Queries the whole database by ascending order of their date of occurance
SELECT *
FROM `qwiklabs-gcp-01-28c376c2a71a.terrorism_dataset.terrorism_table`
ORDER BY iyear, imonth, iday


-- Checking if duplicates are present in the database. Returns 201183
SELECT COUNT(DISTINCT(eventid))
FROM `qwiklabs-gcp-01-28c376c2a71a.terrorism_dataset.terrorism_table`   
SELECT COUNT(eventid)
FROM `qwiklabs-gcp-01-28c376c2a71a.terrorism_dataset.terrorism_table`

-- checking totatl number of rows. Returns 201183
SELECT COUNT(eventid)
FROM `qwiklabs-gcp-01-28c376c2a71a.terrorism_dataset.terrorism_table`   
SELECT COUNT(eventid)
FROM `qwiklabs-gcp-01-28c376c2a71a.terrorism_dataset.terrorism_table`

-- As the two queries return the same number of rows counts, there is no duplicates in the database







-- PART 2

-- Drawing some basic insights

-- Query to group the number of times a each country has been attacked, in descending order
SELECT COUNT(eventid) AS AttackCount, country_txt AS Country
FROM `qwiklabs-gcp-01-28c376c2a71a.terrorism_dataset.terrorism_table`
GROUP BY country_txt
ORDER BY COUNT(eventid) DESC;


-- Query to group together distinct attack_types and each of their counts in descending order
SELECT COUNT(eventid) AS AttackCount, attacktype1_txt AS AttackType
FROM `qwiklabs-gcp-01-28c376c2a71a.terrorism_dataset.terrorism_table`
GROUP BY attacktype1_txt
ORDER BY COUNT(eventid) DESC;


-- Query to group together distinct organisations and each of their counts in descending order
SELECT COUNT(eventid) AS AttackCount, gname AS Organisation
FROM `qwiklabs-gcp-01-28c376c2a71a.terrorism_dataset.terrorism_table`
GROUP BY gname
ORDER BY COUNT(eventid) DESC;


-- Query to group together distinct attack_types and each of their counts in descending order
SELECT COUNT(eventid) AS AttackCount, targtype1_txt AS TargetType
FROM `qwiklabs-gcp-01-28c376c2a71a.terrorism_dataset.terrorism_table`
GROUP BY targtype1_txt
ORDER BY COUNT(eventid) DESC;


-- Query to group together the number of attack each year from 1970 - 2019
SELECT COUNT(eventid) AS AttackCount, iyear AS Year
FROM `qwiklabs-gcp-01-28c376c2a71a.terrorism_dataset.terrorism_table`
GROUP BY iyear
ORDER BY COUNT(eventid) DESC;


-- Query to group together distinct Regions of the world and the number of times each has been attacked
SELECT COUNT(eventid) AS AttackCount, region_txt AS Region
FROM `qwiklabs-gcp-01-28c376c2a71a.terrorism_dataset.terrorism_table`
GROUP BY region_txt
ORDER BY COUNT(eventid) DESC;
