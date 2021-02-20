-- 1. How many rows are in the data_analyst_jobs table? There are 1793 Rows in data_analyst_jobs
Select count (*) from data_analyst_jobs;
--2. What company is associated with the job posting on the 10th row? ExxonMObil
SELECT company from data_analyst_jobs
LIMIT 10;
--3.How many postings are in Tennessee and/or in both? there are 21 in TN and 27 in Both.
Select count (*) from data_analyst_jobs
WHERE location = 'TN' or Location = 'KY';
--4.How many postings in Tennessee have a star rating above 4? There are 3 star rating above 4
SELECT count(star_rating) from data_analyst_jobs
WHERE location = 'TN' AND star_rating > '4';
--5.How many postings in the dataset have a review count between 500 and 1000? (151)
SELECT count(review_count) from data_analyst_jobs
WHERE review_count between '500' and  '1000';
--6. Which state shows the highest average rating? NE
SELECT location AS state, ROUND(AVG(star_rating),2) AS Avg_rating
from data_analyst_jobs
WHERE star_rating is not NULL
GROUP BY Location
ORDER BY avg_rating desc
limit 1;
--6 in Subquery
SELECT location as state, ROUND(AVG(star_rating), 2) as avg_stars
FROM (SELECT DISTINCT company, location, star_rating
	FROM data_analyst_jobs
	WHERE location IS NOT NULL and star_rating IS NOT NULL) sub
GROUP BY location
ORDER BY avg_stars DESC;

--7A.Select unique job titles from the data_analyst_jobs table. 
SELECT DISTINCT title AS Unique_titles
from data_analyst_jobs;
--7b. How many are there? 881
SELECT COUNT(DISTINCT title)
from data_analyst_jobs;
--8. How many unique job titles are there for California companies? 230
SELECT COUNT(DISTINCT title)
from data_analyst_jobs
WHERE location = 'CA';
--9A.Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations.
SELECT avg(star_rating), company
FROM data_analyst_jobs
WHERE review_count > 5000
group by company;

--9b.How many companies are there with more that 5000 reviews across all locations? 40
SELECT distinct company, ROUND(avg(star_rating),1) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000 and company is not NULL
GROUP BY company
ORDER BY avg_rating DESC;
--10.Add the code to order the query in #9 from highest to lowest average star rating. 6 rating > 5000 
SELECT ROUND(avg(star_rating),2) AS star_rating, company
FROM data_analyst_jobs
WHERE review_count > 5000
group by company
Order by star_rating DESC;
--11.Find all the job titles that contain the word ‘Analyst’. 
SELECT  title
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';

--11b. How many different job titles are there? 774
SELECT count(distinct title)
FROM data_analyst_jobs
WHERE lower(title) like '%analyst%';
--12.titles with word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common? 107 and first three is for Tableau etc.

SELECT title 
FROM data_analyst_jobs
WHERE UPPER(title) NOT LIKE '%ANALYST%'
AND UPPER(title) NOT LIKE '%ANALYTICS%';

--BONUS
SELECT  domain, count(title) AS Num_Pos
FROM data_analyst_jobs
WHERE domain is NOT null AND LOWER(skill) LIKE '%sql%' AND days_since_posting> 21
GROUP by domain
ORDER BY num_pos DESC
LIMIT 4;
--OR
SELECT domain AS industry,
		COUNT(*) AS hard_to_fill
FROM data_analyst_jobs
WHERE UPPER(skill) LIKE '%SQL%'
AND days_since_posting > 21
AND domain IS NOT NULL
GROUP BY industry
ORDER BY hard_to_fill DESC;


