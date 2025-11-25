create database churn_db;
use churn_db;

desc customer_data;


select * from customer_data;

-- How many customers are in each gender, and what percentage do they represent?
select gender, count(*) as total_count,
			    count(*) * 100 / (select count(*) from customer_data) as percentage
from customer_data
group by gender;

-- How many customers have each contract type, and what is their percentage share?
SELECT Contract, Count(*) as TotalCount,
Count(*)  / (Select Count(*) from customer_data)  as Percentage
from customer_data
Group by Contract;

-- Revenue by Customer Status
SELECT Customer_Status, Count(Customer_Status) as TotalCount, Sum(Total_Revenue) as TotalRev,
Sum(Total_Revenue) / (Select sum(Total_Revenue) from customer_data) * 100  as RevPercentage
from customer_data
Group by Customer_Status;

-- State-wise Customer Share
SELECT State, Count(State) as TotalCount,
Count(State) * 100.0/ (Select Count(*) from customer_data)  as Percentage
from customer_data
Group by State
Order by Percentage desc;


-- Data Exploration – Check Nulls
SELECT 
    SUM(CASE WHEN Customer_ID = '' THEN 1 ELSE 0 END) AS Customer_ID_Null_Count,
    SUM(CASE WHEN Gender = '' THEN 1 ELSE 0 END) AS Gender_Null_Count,
    SUM(CASE WHEN Age = '' THEN 1 ELSE 0 END) AS Age_Null_Count,
    SUM(CASE WHEN Married = '' THEN 1 ELSE 0 END) AS Married_Null_Count,
    SUM(CASE WHEN State = '' THEN 1 ELSE 0 END) AS State_Null_Count,
    SUM(CASE WHEN Number_of_Referrals = '' THEN 1 ELSE 0 END) AS Number_of_Referrals_Null_Count,
    SUM(CASE WHEN Tenure_in_Months = '' THEN 1 ELSE 0 END) AS Tenure_in_Months_Null_Count,
    SUM(CASE WHEN Value_Deal = '' THEN 1 ELSE 0 END) AS Value_Deal_Null_Count,
    SUM(CASE WHEN Phone_Service = '' THEN 1 ELSE 0 END) AS Phone_Service_Null_Count,
    SUM(CASE WHEN Multiple_Lines = '' THEN 1 ELSE 0 END) AS Multiple_Lines_Null_Count,
    SUM(CASE WHEN Internet_Service = '' THEN 1 ELSE 0 END) AS Internet_Service_Null_Count,
    SUM(CASE WHEN Internet_Type = '' THEN 1 ELSE 0 END) AS Internet_Type_Null_Count,
    SUM(CASE WHEN Online_Security = '' THEN 1 ELSE 0 END) AS Online_Security_Null_Count,
    SUM(CASE WHEN Online_Backup = '' THEN 1 ELSE 0 END) AS Online_Backup_Null_Count,
    SUM(CASE WHEN Device_Protection_Plan = '' THEN 1 ELSE 0 END) AS Device_Protection_Plan_Null_Count,
    SUM(CASE WHEN Premium_Support = '' THEN 1 ELSE 0 END) AS Premium_Support_Null_Count,
    SUM(CASE WHEN Streaming_TV = '' THEN 1 ELSE 0 END) AS Streaming_TV_Null_Count,
    SUM(CASE WHEN Streaming_Movies = '' THEN 1 ELSE 0 END) AS Streaming_Movies_Null_Count,
    SUM(CASE WHEN Streaming_Music = '' THEN 1 ELSE 0 END) AS Streaming_Music_Null_Count,
    SUM(CASE WHEN Unlimited_Data = '' THEN 1 ELSE 0 END) AS Unlimited_Data_Null_Count,
    SUM(CASE WHEN Contract = '' THEN 1 ELSE 0 END) AS Contract_Null_Count,
    SUM(CASE WHEN Paperless_Billing = '' THEN 1 ELSE 0 END) AS Paperless_Billing_Null_Count,
    SUM(CASE WHEN Payment_Method = '' THEN 1 ELSE 0 END) AS Payment_Method_Null_Count,
    SUM(CASE WHEN Monthly_Charge = '' THEN 1 ELSE 0 END) AS Monthly_Charge_Null_Count,
    SUM(CASE WHEN Total_Charges = '' THEN 1 ELSE 0 END) AS Total_Charges_Null_Count,
    SUM(CASE WHEN Total_Refunds = '' THEN 1 ELSE 0 END) AS Total_Refunds_Null_Count,
    SUM(CASE WHEN Total_Extra_Data_Charges = '' THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_Null_Count,
    SUM(CASE WHEN Total_Long_Distance_Charges = '' THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_Null_Count,
    SUM(CASE WHEN Total_Revenue = '' THEN 1 ELSE 0 END) AS Total_Revenue_Null_Count,
    SUM(CASE WHEN Customer_Status = '' THEN 1 ELSE 0 END) AS Customer_Status_Null_Count,
    SUM(CASE WHEN Churn_Category = '' THEN 1 ELSE 0 END) AS Churn_Category_Null_Count,
    SUM(CASE WHEN Churn_Reason = '' THEN 1 ELSE 0 END) AS Churn_Reason_Null_Count
FROM customer_data;


-- Remove null and insert the new data into Prod table
CREATE TABLE prod_Churn AS
SELECT 
    Customer_ID,
    Gender,
    Age,
    Married,
    State,
    Number_of_Referrals,
    Tenure_in_Months,
    CASE WHEN Value_Deal = '' THEN 'None' ELSE Value_Deal END AS Value_Deal,
    Phone_Service,
    CASE WHEN Multiple_Lines = '' THEN 'No' ELSE Multiple_Lines END AS Multiple_Lines,
    Internet_Service,
    CASE WHEN Internet_Type = '' THEN 'None' ELSE Internet_Type END AS Internet_Type,
    CASE WHEN Online_Security = '' THEN 'No' ELSE Online_Security END AS Online_Security,
    CASE WHEN Online_Backup = '' THEN 'No' ELSE Online_Backup END AS Online_Backup,
    CASE WHEN Device_Protection_Plan = '' THEN 'No' ELSE Device_Protection_Plan END AS Device_Protection_Plan,
    CASE WHEN Premium_Support = '' THEN 'No' ELSE Premium_Support END AS Premium_Support,
    CASE WHEN Streaming_TV = '' THEN 'No' ELSE Streaming_TV END AS Streaming_TV,
    CASE WHEN Streaming_Movies = '' THEN 'No' ELSE Streaming_Movies END AS Streaming_Movies,
    CASE WHEN Streaming_Music = '' THEN 'No' ELSE Streaming_Music END AS Streaming_Music,
    CASE WHEN Unlimited_Data = '' THEN 'No' ELSE Unlimited_Data END AS Unlimited_Data,
    Contract,
    Paperless_Billing,
    Payment_Method,
    Monthly_Charge,
    Total_Charges,
    Total_Refunds,
    Total_Extra_Data_Charges,
    Total_Long_Distance_Charges,
    Total_Revenue,
    Customer_Status,
    CASE WHEN Churn_Category = '' THEN 'Others' ELSE Churn_Category END AS Churn_Category,
    CASE WHEN Churn_Reason = '' THEN 'Others' ELSE Churn_Reason END AS Churn_Reason
FROM customer_data;

select * from prod_churn;

Create View vw_ChurnData as
	select * from prod_Churn where Customer_Status In ('Churned', 'Stayed');


Create View vw_JoinData as
	select * from prod_Churn where Customer_Status = 'Joined';




