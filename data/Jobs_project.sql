Select count (*) from data_analyst_jobs;
-- 1. How many rows are in the data_analyst_jobs table? There are 1793 Rows in data_analyst_jobs
SELECT company from data_analyst_jobs
LIMIT 10;
--2. What company is associated with the job posting on the 10th row? ExxonMObil 
Select count (*) from data_analyst_jobs
WHERE location = 'TN' or Location = 'KY';
--How many postings are in Tennessee and/or in both? there are 21 in TN and 27 in Both.