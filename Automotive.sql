create database Automotive;
use Automotive;
select * from automotive_manufacture;
select * from supplier_details;

alter table supplier_details
rename column ï»¿Supplier_ID to Supplier_ID;

#Find the total number of orders.
select count(*) AS Total_Orders
from automotive_manufacture;

#Find the total number of different automotive parts.
select count(distinct `Part_Name`) AS Total_Automotive_Part
from automotive_manufacture;

#Find the total Ordered Quantity.
select sum(`Ordered_Qty`) AS Total_Quantity
from automotive_manufacture;

#Find the total Cost.
select sum(`Total_Cost`) AS Total_Cost
from automotive_manufacture;

#Find the average Unit Cost.
select avg(`Unit_Cost`) AS Avg_Cost
from automotive_manufacture;

#Find the maximum & minimum  Unit Cost.
select max(`Unit_Cost`) AS Maximum_cost,
min(`Unit_Cost`) AS Minimum_cost
from automotive_manufacture;

#Find the number of orders for each supplier.
select Supplier_Name, count(*) AS Number_Orders
from automotive_manufacture
group by Supplier_Name;

#Find the total Ordered Quantity by supplier.
select Supplier_Name, sum(`Ordered_Qty`)
AS Total_Quantity
from automotive_manufacture
group by Supplier_Name;

#Find the total Delivered Quantity by supplier.
select Supplier_Name, sum(`Delivered_Qty`) AS Total_Delivered
from automotive_manufacture
group by Supplier_Name;

#Find the average Lead Time by supplier.
select Supplier_Name,sum(`Lead_Time_Days`) AS Average_Lead_Time
from automotive_manufacture
group by supplier_Name;

#Find the total Ordered Quantity by Part Category.
select Part_Category, sum(`Ordered_Qty`) AS Total_Ordered
from automotive_manufacture
group by Part_Category;

#Find the total Cost by Region.
select Region, sum(`Total_Cost`) AS Total_Region
from automotive_manufacture
group by Region;

#Find the number of orders by Warehouse.
select `Warehouse`, count(*) AS Number_Orders
from automotive_manufacture
group by `Warehouse`;

#Find the average Unit Cost by Material.
select Material, avg(Unit_Cost) AS Average_Material
from automotive_manufacture
group by Material;

#Find the number of on-time orders.
select On_Time, count(*) AS Number_Orders
from automotive_manufacture
group by On_Time;

#Find the number of delayed orders.
select count(*) AS Number_Delayed_orders
from automotive_manufacture
where On_Time = 'NO';

#Find the On-Time Delivery %.
select avg(case when On_Time = 'Yes'
 Then 0.1 else 0 end) * 100 AS On_Time_Delivery_Percentage
 from automotive_manufacture;
 
 #Find the number of on-time orders by supplier.
 select Supplier_Name,count(*) AS On_Time_Orders
 from automotive_manufacture
 where On_Time = 'Yes'
 group by Supplier_Name;
 
 #Find the number of delayed orders by supplier.
select Supplier_Name,count(*) AS Delayed_Orders
from automotive_manufacture
where On_Time = 'No'
group by Supplier_Name;

#Find suppliers having more than 5 delayed orders.
select Supplier_Name, count(*) AS Delayed_Orders
from automotive_manufacture
where On_Time = 'No'
group by Supplier_Name
having count(*) > 5;

#Find the supplier with the highest average Lead Time.
select Supplier_Name, avg(`Lead_Time_Days`) AS Average_Lead_Time
from automotive_manufacture
group by Supplier_Name
order by  Average_Lead_Time desc
limit 1;

#Find orders where Delivered Quantity is less than Ordered Quantity.
select *
from automotive_manufacture
where Delivered_Qty < Ordered_Qty;

#Find the total shortage quantity. 
select sum(Ordered_Qty - Delivered_Qty) AS Total_Shortage_Quantity
from automotive_manufacture
where Delivered_Qty < Ordered_Qty;

#Find the shortage quantity by supplier.
select Supplier_Name,sum(Ordered_Qty - Delivered_Qty) AS Shortage_quantity
from automotive_manufacture
where Delivered_Qty < Ordered_Qty
group by Supplier_Name;

#Find the total Defect Quantity.
select sum(`Defect_Qty`) AS Total_Defect_Qty
from automotive_manufacture;

#Calculate the Defect Rate %.
select sum(`Defect_Qty`)*100 /sum(Delivered_Qty) AS Defect_Rate
from automotive_manufacture;

#Find the Defect Quantity by supplier.
select Supplier_Name, sum(`Defect_Qty`) AS Total_Defect_Qty
from automotive_manufacture
group by Supplier_Name;

#Find the Defect Quantity by Part Category.
select Part_Category, sum(`Defect_Qty`) AS Defect_Quantity
from automotive_manufacture
group by Part_Category;

#Find the Defect Rate by supplier.
select Supplier_Name, sum(`Defect_Qty`)*100 / sum(`Delivered_Qty`) AS Defect_Rate
from automotive_manufacture
group by Supplier_Name;

#Find suppliers with Defect Quantity greater than 100.
select Supplier_Name, sum(`Defect_Qty`) AS Supplier_Defect_Qty
from automotive_manufacture
group by Supplier_Name
having sum(`Defect_Qty`) > 100;

#ind the number of orders with Quality_Status = 'Fail'.
select count(*) AS Number_Orders
from automotive_manufacture
where Quality_Status = 'Fail';

#Find the number of Pass and Fail orders.
select Quality_Status ,count(*) AS Number_Orders
from automotive_manufacture
group by Quality_Status ;

#Find the quality status by supplier.
select Quality_Status, Supplier_Name, count(*) AS Number_Orders
from automotive_manufacture
group by Quality_Status,Supplier_Name;

#Find the supplier with the highest number of defective parts.
select Supplier_Name,sum(`Defect_Qty`) AS Total_Defect_Qty
from automotive_manufacture
group by Supplier_Name
order by Total_Defect_Qty desc
limit 1;

#Find the total procurement cost by supplier.
select  Supplier_Name,sum(Total_Cost) AS Total_Cost_Supplier
from automotive_manufacture
group by Supplier_Name;

#Find the top 10 orders with the highest Total Cost.
select Order_ID, Total_Cost
from automotive_manufacture
order by Total_Cost desc
limit 10;

#Identify suppliers with high procurement cost and poor delivery performance.
select Supplier_Name,sum(Total_Cost) AS Total_Cost,
avg(case when On_Time = "Yes" Then 1.0 else 0 end)
* 100 AS On_Time_Delivery_Percentage
from automotive_manufacture
group by Supplier_Name;

#Identify suppliers with high defect quantities and delayed deliveries.
select Supplier_Name, sum(`Defect_Qty`) AS Total_Defect_Qty,
sum(case when on_time = 'No' Then 1 else 0 end ) AS Delayed_deliveries
from automotive_manufacture
group by Supplier_Name
having sum(`Defect_Qty`) > 100
and sum(case when On_Time = 'No' Then 1 else 0 end) > 0;

#What is the total procurement cost?
select sum(Total_Cost) AS Total_Procurement_cost
from automotive_manufacture;

#What is the On-Time Delivery %?
select avg(case 
when On_Time  = 'Yes' Then 1.0 
else 0 end) * 100 AS On_Time_Delivery_Percentage
from automotive_manufacture;

#What is the Defect Rate %?
select sum(Defect_Qty)*100 / 
sum(Delivered_Qty) AS Defect_Rate_Percentage
from automotive_manufacture;

#Which supplier has the highest procurement cost?
select Supplier_Name, sum(Total_Cost) AS Total_Procurement_Cost
from automotive_manufacture
group by Supplier_Name
order by Total_Procurement_Cost desc
limit 1;

#Which supplier has the highest defect quantity?
select Supplier_Name, sum(Defect_Qty) AS Highest_Defect_Qty
from automotive_manufacture
group by Supplier_Name
order by Highest_Defect_Qty desc 
limit 1;

#Which supplier has the most delayed orders?
select Supplier_Name,count(On_Time) AS Delayed_Orders
from automotive_manufacture
where On_Time = "No"
group by Supplier_Name
order by Delayed_Orders desc
limit 1;

#. Which part category has the highest demand?
select Part_Category, sum(Ordered_Qty) AS Total_Ordered_Qty
from automotive_manufacture
group by Part_Category
order by Total_Ordered_Qty desc
limit 1;

#What is the total shortage quantity?
select sum(Ordered_Qty - Delivered_Qty) AS Total_shortage_quantity
from automotive_manufacture
where Delivered_Qty < Ordered_Qty;

#Find suppliers with poor delivery performance.
select Supplier_Name, 
avg(case 
when On_Time = "Yes" Then 1.0
else 0
end) * 100 AS On_Time_Delivery_Percentage
from automotive_manufacture
group by Supplier_Name
having On_Time_Delivery_Percentage < 80;

#Find suppliers with both high defects and high lead time.
select Supplier_Name, sum(`Defect_Qty`) AS Total_Defect_Qty,
Avg(`Lead_Time_Days`) AS Avg_Lead_Time_Days
from automotive_manufacture
group by Supplier_Name
having sum(`Defect_Qty`) > 100 and
avg(`Lead_Time_Days`) > 15;

#Combine Orders with Supplier Contact Details
select a.Order_ID ,
a.Part_Name,
a.Total_Cost,
s.Supplier_Name,
s.Contact_Person
from automotive_manufacture a
inner join supplier_details s
on a.Supplier_ID = s.Supplier_ID;


#Display all manufacturing records along with the Supplier Name.
select a.*,s.Supplier_Name
from automotive_manufacture a
join supplier_details s
on a.Supplier_ID = s.Supplier_ID;

#Display Order_ID, Supplier_ID, and Supplier_Name.
select a.Order_ID,
a.Supplier_ID,
s.Supplier_Name
from automotive_manufacture a
join supplier_details s
on a.Supplier_ID = s.Supplier_ID;

#Find all orders supplied by suppliers located in Bengaluru.
select a.Order_ID,
a.Supplier_ID,
s.Supplier_Name
from automotive_manufacture a
join supplier_details s
on a.Supplier_ID = s.Supplier_ID
where s.Supplier_Location = "Bengaluru";

#Display the Supplier Name and Supplier Location for each manufacturing record.
select s.Supplier_Name,
s.Supplier_Location
from automotive_manufacture a
join supplier_details s
on a.Supplier_ID = s.Supplier_ID;

#Find the number of manufacturing records for each supplier.
select a.Supplier_ID,
 s.Supplier_Name
from automotive_manufacture a
join supplier_details s
on a.Supplier_ID = s.Supplier_ID
group by a.Supplier_ID , s.Supplier_Name;

#Find the total Order Quantity supplied by each supplier.
select a.Supplier_ID,
s.Supplier_Name,
sum(a.Ordered_Qty) AS Total_Order_qty
from automotive_manufacture a
join supplier_details s
on a.Supplier_ID = s.Supplier_ID
group by a.Supplier_ID , s.Supplier_Name;

#Find the total Defect Quantity for each supplier.
select s.Supplier_Name, sum(a.Defect_Qty) AS Total_Defect_Qty
from automotive_manufacture a
join supplier_details s
on a.Supplier_ID = s.Supplier_ID
group by s.Supplier_Name;

#Find suppliers who have On_Time = 'No'.
select distinct a.Supplier_Name
from automotive_manufacture a
join supplier_details s
on a.Supplier_ID = s.Supplier_ID 
where On_Time = 'No';

#Display all manufacturing records, including records where there is no matching supplier.
select a.*,s.Supplier_Name
from automotive_manufacture a
left join supplier_details s
on a.Supplier_ID = s.Supplier_ID;

#Find manufacturing records where the Supplier_ID does not exist in supplier_details.
select a.*, s.Supplier_Name
from automotive_manufacture a
left join supplier_details s
on a.Supplier_ID = s.Supplier_ID
where s.Supplier_ID is null;

#Display all suppliers and their corresponding manufacturing records, including suppliers who have no manufacturing records.
select s.Supplier_Name,
s.Supplier_ID,
a.Order_ID
from automotive_manufacture a
left join supplier_details s
on a.Supplier_ID = s.Supplier_ID ;

#Display All Registered Suppliers and Their Order Details
select a.*,s.Supplier_Name
from automotive_manufacture a
right join supplier_details s
on a.Supplier_ID = s.Supplier_ID;

#Identify Suppliers Without Any Orders
select s.Supplier_ID,
s.Supplier_Name,
s.Supplier_Location,
s.Contact_Person
from automotive_manufacture a
right join supplier_details s
on a.Supplier_ID = s.Supplier_ID;

#Count Total Orders Per Supplier (Including 0 Orders)
select s.Supplier_ID , 
s.Supplier_Name,
count(a.Order_ID) AS Total_Orders
from automotive_manufacture a
right join supplier_details s
on a.Supplier_ID = s.Supplier_ID
group by s.Supplier_ID  , s.Supplier_Name;

#Find suppliers who have no matching manufacturing records.
select s.Supplier_Name, s.Supplier_ID
from automotive_manufacture a
right join supplier_details s
on a.Supplier_ID = s.Supplier_ID 
where Order_ID is null;

#Display Supplier Name, Order ID, and Ordered Quantity for all suppliers.
select s.Supplier_Name, a.Order_ID , a.Ordered_Qty
from automotive_manufacture a
right join supplier_details s
on a.Supplier_ID = s.Supplier_ID ;

#Find the total Ordered Quantity for each supplier using RIGHT JOIN.
select s.Supplier_Name, sum(Ordered_Qty) AS Total_Ordered_Qty 
from automotive_manufacture a
right join supplier_details s
on a.Supplier_ID = s.Supplier_ID 
group by s.Supplier_Name ;

#Display suppliers located in Bengaluru and their manufacturing records.
select s.Supplier_Name, s.Supplier_Location
from automotive_manufacture a
right join supplier_details s
on a.Supplier_ID = s.Supplier_ID 
where s.Supplier_Location = 'Bengaluru';

#Display all supplier names and their On_Time status, including suppliers without manufacturing records.
select s.Supplier_Name, a.On_Time
from automotive_manufacture a
right join supplier_details s
on a.Supplier_ID = s.Supplier_ID ;

#Find the unique Supplier_IDs that appear in either automotive_manufacture or supplier_details.
select Supplier_ID 
from automotive_manufacture 

union
select Supplier_ID 
from supplier_details ;

#Union 
#Combine two result sets containing Supplier_ID and Order_ID using UNION.
select Supplier_ID ,Order_ID 
from automotive_manufacture 
union
select Supplier_ID , Order_ID 
from automotive_manufacture ;