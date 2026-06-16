SELECT COUNT(*) AS Total_Rows
FROM Placements;

/*check table structure*/
SELECT COLUMN_NAME,
       DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Placements';


/*Check for NULL values*/
SELECT
COUNT(*) AS TotalRows,
COUNT(Date) AS PlacementDate_Count,
COUNT(Sales_manager_BDM) AS BDM_Count,
COUNT(Job_Title) AS Position_Count,
COUNT(Prime_Vendor) AS Vendor_Count,
COUNT(End_Client_Company) AS Client_Count,
COUNT(City) AS City_Count,
COUNT(State) AS State_Count,
COUNT(Payment_Terms) AS Payment_Count,
COUNT(Type) AS Employment_Count,
COUNT(Bill_Rate) AS BillRate_Count,
COUNT(Pay_Rate) AS PayRate_Count,
COUNT(Margin) AS Margin_Count
FROM Placements;


/*Check duplicates*/
SELECT *
FROM
( SELECT *,
        ROW_NUMBER() OVER
        (
        PARTITION BY
        date, Sales_manager_BDM,Job_Title, End_Client_Company
        ORDER BY Date
        ) AS rn
    From Placements
) x
Where rn>1;

/*Check unique BDMs*/
SELECT DISTINCT Sales_Manager_BDM
FROM Placements
ORDER BY Sales_Manager_BDM;

/*Check employment types*/
SELECT DISTINCT Type
FROM Placements;
