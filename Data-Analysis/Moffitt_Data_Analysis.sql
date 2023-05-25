-- UPDATE tags
-- SET id = CASE
-- 	WHEN id = 100 then 1
-- END
-- WHERE id = 100;

SELECT DISTINCT COUNT(Sample_Id)
FROM datacnadfflipped;

SELECT *
FROM datacnadfflipped t1, datacnadfflipped t2
WHERE t1.Sample_Id != t2.Sample_Id;
SELECT COUNT(*)
FROM (SELECT DISTINCT Tumor_Sample_Barcode
FROM mutationsdf
ORDER BY Tumor_Sample_Barcode)T;

SELECT COUNT(*)
FROM patients;

SELECT DISTINCT MSI_SCORE
FROM patients
ORDER BY MSI_SCORE DESC;

SELECT COUNT(*)
FROM patients
WHERE MSI_STATUS = 'MSI';
-- Shows the number of MSI patients

SELECT COUNT(*)
FROM patients
WHERE MSI_STATUS = 'MSS'
	  AND SEX = 'Female';
-- Shows the number of MSI patients

SELECT PATIENT_ID, COUNT(PATIENT_ID)
FROM patients
GROUP BY PATIENT_ID;
-- Shows the number of mutuations each patient has

SELECT t.Total, COUNT(*) AS NumberPerCategory
FROM (SELECT PATIENT_ID, COUNT(PATIENT_ID) AS Total
      FROM patients
      GROUP BY PATIENT_ID) t
GROUP BY t.Total
ORDER BY t.Total;
-- Shows the number of people per each number of mutuations

SELECT A.PATIENT_ID, A.IDENTIFIER
FROM patients A, patients B
WHERE A.PATIENT_ID = B.PATIENT_ID 
      AND A.IDENTIFIER < B.IDENTIFIER;
-- Finds all unique cases of patients with their mutations

SELECT DISTINCT A.PATIENT_ID
FROM patients A, patients B
WHERE A.PATIENT_ID = B.PATIENT_ID 
      AND A.IDENTIFIER < B.IDENTIFIER
ORDER BY PATIENT_ID;
-- Finds all cases of patients with multiple mutations

SELECT COUNT(PATIENT_ID) AS NumPatientsWithMultiples
FROM (SELECT DISTINCT A.PATIENT_ID
      FROM patients A, patients B
      WHERE A.PATIENT_ID = B.PATIENT_ID 
			AND A.IDENTIFIER < B.IDENTIFIER
	  ORDER BY PATIENT_ID) t;
-- Finds number cases of patients with multiple mutations

SELECT MAX(AGE_AT_DIAGNOSIS)
FROM patients;
-- Finds max age of patients to determine necessary upper bound for the graph

SELECT MIN(AGE_AT_DIAGNOSIS)
FROM patients;
-- Finds min age of patients to determine necessary lower bound for the graph

SELECT MAX(OS_MONTHS)
FROM patients;
-- Finds max age of patients to determine necessary upper bound for the graph

SELECT MIN(OS_MONTHS)
FROM patients;
-- Finds min age of patients to determine necessary lower bound for the graph

SELECT AGE_AT_DIAGNOSIS, AVG(OS_MONTHS) AS AVG_OS_MONTHS
FROM patients
GROUP BY AGE_AT_DIAGNOSIS
ORDER BY AGE_AT_DIAGNOSIS;

SELECT AGE_AT_DIAGNOSIS, VITAL_STATUS, AVG(OS_MONTHS) AS AVG_OS_MONTHS
FROM patients
GROUP BY AGE_AT_DIAGNOSIS, VITAL_STATUS
ORDER BY AGE_AT_DIAGNOSIS, VITAL_STATUS;

SELECT AGE_AT_DIAGNOSIS, SEX, AVG(OS_MONTHS) AS AVG_OS_MONTHS
FROM patients
GROUP BY AGE_AT_DIAGNOSIS, SEX
ORDER BY AGE_AT_DIAGNOSIS, SEX;

SELECT AGE_AT_DIAGNOSIS, VITAL_STATUS, SEX, AVG(OS_MONTHS) AS AVG_OS_MONTHS
FROM patients
GROUP BY AGE_AT_DIAGNOSIS, VITAL_STATUS, SEX
ORDER BY AGE_AT_DIAGNOSIS, VITAL_STATUS, SEX;

SELECT *
FROM patient_info
WHERE TIME_TO_METASTASIS_MONTHS = -50000;



     
create trigger ProjectCountTableConditions
before update on tags
begin
if (SELECT COUNT(*) FROM users WHERE = :new.Username) = 0 insert into diff values (ID, Username, Password) end if
end;

SELECT DISTINCT reciever
FROM connections;
WHERE sender = 'John3'
UNION 
SELECT DISTINCT sender
FROM connections
WHERE reciever = 'John3';



SELECT * 
FROM tags
WHERE id = (SELECT AVG(id)
				  FROM tags);

select t.tag_name AS tTagName, m.tag_name AS mTagName
from (select tag_name, count(*) as number from tags group by tag_name) t, (select tag_name, count(*) as number from tags group by tag_name) m
where t.number > 0 AND t.tag_name = m.tag_name;

SELECT * 
FROM tags
WHERE (id, tag_name) IN  (SELECT id, tag_name
						  FROM tags
                          WHERE id = 1 OR id = 2);

SELECT tag2.username, tag2.tag_name
FROM tags AS tag1, tags AS tag2
WHERE tag1.username = 'Jack Daniels' AND tag1.username != tag2.username AND tag1.tag_name = tag2.tag_name;

SELECT tag2.username, COUNT(tag2.tag_name) AS count
FROM tags AS tag1, tags AS tag2
WHERE tag1.username = 'Jack Daniels' AND tag1.username != tag2.username AND tag1.tag_name = tag2.tag_name
GROUP BY tag2.username;

SELECT *
FROM tags AS tag1, tags AS tag2
WHERE tag1.username = 'Jack Daniels' AND tag1.username != tag2.username;


