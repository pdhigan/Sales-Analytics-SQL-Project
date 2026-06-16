/*Q1. Placements per BDM*/
SELECT
    Sales_Manager_BDM,
    COUNT(*) AS Total_Placements
FROM Placements
GROUP BY Sales_Manager_BDM
ORDER BY Total_Placements DESC;


/*Q2.Revenue and Margin Performance by BDM*/
SELECT
    Sales_Manager_BDM,
    SUM(Bill_Rate) AS Total_Bill_Rate,
    SUM(Margin) AS Total_Margin
FROM Placements
GROUP BY Sales_Manager_BDM
ORDER BY Total_Bill_Rate DESC;

/*Q3. Average Margin by BDM*/
SELECT
    Sales_Manager_BDM, Round(AVG(Margin),2) AS Avg_Margin
FROM Placements
GROUP BY Sales_Manager_BDM
ORDER BY Avg_Margin DESC;

/*Q4.Top 10 End Clients*/
SELECT TOP 10
END_CLIENT_COMPANY,
COUNT(*) AS Placements
From Placements
group by End_Client_Company
Order by Placements DESC;

/*Q5. Top 10 States with Placements*/
SELECT TOP 10 
State, COUNT(*) AS Placements
FROM Placements
GROUP BY State
ORDER BY Placements DESC;

/*Q6. Top 10 Role getting more Placements*/
SELECT TOP 10
    Job_Title,
    COUNT(*) AS Placements
FROM Placements
GROUP BY Job_Title
ORDER BY Placements DESC;

/*Q7. Placement Trend by Year*/
SELECT
    YEAR(Date) AS Placement_Year,
    COUNT(*) AS Placements
FROM Placements
GROUP BY YEAR(Date)
ORDER BY Placement_Year;


/*Q8. Placement as per tax classifications*/
SELECT
    Type,
    COUNT(*) AS Placements
FROM Placements
GROUP BY Type
ORDER BY Placements DESC;