/*Q10. BDM Ranking based on placement volume*/
SELECT
    Sales_Manager_BDM,
    COUNT(*) AS Placements,
    RANK() OVER
    (
        ORDER BY COUNT(*) DESC
    ) AS Recruiter_Rank
FROM Placements
GROUP BY Sales_Manager_BDM;


/*Q11. Margin Ranking of Sales_Managers*/
SELECT
    Sales_Manager_BDM,
    SUM(Margin) AS Total_Margin,
    RANK() OVER
    (
        ORDER BY SUM(Margin)  DESC
    ) AS Margin_Rank
FROM Placements
GROUP BY Sales_Manager_BDM;


/*Q12. Top 10 Clients by Margin*/
SELECT TOP 10
    End_Client_Company,
    SUM(Margin) AS Total_Margin
FROM Placements
GROUP BY End_Client_Company
ORDER BY Total_Margin DESC;

/*Q13. Top 10 States by Margin*/
SELECT TOP 10
    State,
    SUM(Margin) AS Total_Margin
FROM Placements
GROUP BY State
ORDER BY Total_Margin DESC;

/*Q14. Running Margin Trend*/
SELECT
    Date,
    Margin,
    SUM(Margin) OVER
    (
        ORDER BY Date
    ) AS Running_Margin
FROM Placements;

/*Q15. Yearly revenue and margin Analysis*/
SELECT
    YEAR(Date) AS Placement_Year,
    SUM(Bill_Rate) AS Revenue,
    SUM(Margin) AS Margin
FROM Placements
GROUP BY YEAR(Date)
ORDER BY Placement_Year;

/*Q16. Highest Margin Placements*/
SELECT TOP 3
    Sales_Manager_BDM,
    Job_Title,
    End_Client_Company,
    Margin
FROM Placements
ORDER BY Margin DESC;


/*Q17. Highest Paying Clients*/
SELECT TOP 10
    End_Client_Company,
    AVG(Bill_Rate) AS Avg_Bill_Rate
FROM Placements
GROUP BY End_Client_Company
ORDER BY Avg_Bill_Rate DESC;

/*Q18. Most Profitable Placement Type*/
SELECT
    Type,
    Round(AVG(Margin),2) AS Avg_Margin,
    SUM(Margin) AS Total_Margin
FROM Placements
GROUP BY Type
ORDER BY Total_Margin DESC;


/*Q19.Sales_Manager with most placements and Margin*/
With Recruiter_Performance AS
(SELECT
   Sales_Manager_BDM,
   COUNT(*) AS Placements,
   SUM(Margin) AS Total_Margin
   FROM Placements
   GROUP BY Sales_Manager_BDM
)

SELECT *
FROM Recruiter_Performance
ORDER BY Total_Margin DESC;

/*Q19.2 Ranking of BDM according placement and margin performance*/
SELECT
    Sales_Manager_BDM,
    SUM(Margin) AS Total_Margin,
    DENSE_RANK() OVER
    (
        ORDER BY SUM(Margin) DESC
    ) AS Dense_Rank
FROM Placements
GROUP BY Sales_Manager_BDM;


/*Q20.Year-over-Year Growth Dataset*/
SELECT
    YEAR(Date) AS Placement_Year,
    COUNT(*) AS Placements,
    SUM(Margin) AS Total_Margin
FROM Placements
GROUP BY YEAR(Date)
ORDER BY Placement_Year;