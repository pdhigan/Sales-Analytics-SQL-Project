USE StaffingAnalysis;

EXEC sp_rename
'Cybertec Data Report',
'Placements';

SELECT *
FROM Placements;

SELECT TOP 20 *
FROM Placements
order bY Margin DESC;

SELECT COUNT(*)
FROM Placements;
/*Validate record count.*/

SELECT
MIN(Date) AS 'First_placement',
MAX(Date) AS 'Last_placement'
FROM Placements;


/*Data Quality Checks*/
/*Null Check*/
SELECT *
FROM Placements
WHERE Sales_Manager_BDM IS NULL;


/*Duplicate Check*/
SELECT Date, Sales_Manager_BDM
FROM Placements
GROUP BY Date, Sales_Manager_BDM
HAVING COUNT(*) > 1;


EXEC sp_rename 'Placements.Poisition', 'Job_Title';

/*Exploratory Data Analysis*/

SELECT *
FROM Placements;       

/*Total Placements*/
SELECT COUNT(*) AS Total_Placements
FROM Placements;

/* Margin of every BDM*/
SELECT Sales_Manager_BDM, SUM(Margin) AS Total_Margin
FROM Placements
group by Sales_Manager_BDM
ORDER BY Total_Margin DESC;

/*Highest Margin Placement*/
SELECT TOP 1 *
FROM Placements
ORDER BY Margin DESC;

/*Average Margin*/
SELECT AVG(Margin) AS Avg_Margin
FROM Placements;

/*BDM Analysis*/

/*Top BDM by Placements*/
SELECT
Sales_Manager_BDM, COUNT(*) AS Placements
FROM Placements
GROUP BY Sales_Manager_BDM
ORDER BY Placements DESC;

/*Top BDM by Margin*/
SELECT
Sales_Manager_BDM,
SUM(Margin) AS Total_Margin
FROM Placements
GROUP BY Sales_Manager_BDM
ORDER BY Total_Margin DESC;

/*Ominder Singh generated the highest placement volume.
Chirag Lawania generated the second highest placement volume.*/


/*Client Analysis*/

/*Top Clients*/
SELECT
End_Client_Company,
COUNT(*) AS Placements
FROM Placements
GROUP BY End_Client_Company
ORDER BY Placements DESC;

/*5 Most Profitable Clients*/
SELECT TOP 10
End_Client_Company,
SUM(Margin) AS Total_Margin
FROM Placements
GROUP BY End_Client_Company
ORDER BY Total_Margin DESC;

SELECT
Sales_Manager_BDM,
COUNT(*) AS Placements,
RANK() OVER(
ORDER BY COUNT(*) DESC
) AS Ranking
FROM Placements
GROUP BY Sales_Manager_BDM;

/*Placements above average Margin*/
SELECT *
FROM Placements
WHERE Margin >
(
SELECT AVG(Margin)
FROM Placements
);