CREATE TABLE Position (
	Pos_Numb int IDENTITY(1,1),
	Pos_Abbr Varchar(20),
	Pos_Title Varchar(50),
	Min_Salary float,
	Max_Salary float,
	PRIMARY KEY (Pos_Numb)
)

CREATE TABLE Target (
	Target_Code int NOT NULL,
	Target_Description_En Varchar(255) NOT NULL,
	PRIMARY KEY (Target_Code)
)

CREATE TABLE Order_Method (
	Order_Method_Code int IDENTITY(1,1),
	Order_Method_En Varchar(255) NOT NULL,
	PRIMARY KEY (Order_Method_Code)
)

CREATE TABLE Country (
	Country_Code int NOT NULL,
	Country Varchar(50) NOT NULL,
	[Language] Varchar(255) NOT NULL,
	PRIMARY KEY (Country_Code)
)

CREATE TABLE Promotion (
	Pr_Number smallInt NOT NULL,
	Date_Start DateTime,
	Date_End DateTime,
	[Description] Varchar(255),
	PRIMARY KEY (Pr_Number)
)

CREATE TABLE Product_Line (
	Prod_Line_Code int IDENTITY(1,1),
	Prod_Line_En Varchar(80) NOT NULL,
	PRIMARY KEY (Prod_Line_Code),
)

CREATE TABLE Return_Reason (
	Return_Reason_Code int IDENTITY(1,1),
	Return_Description_En Varchar(50) NOT NULL,
	PRIMARY KEY (Return_Reason_Code)
)

CREATE TABLE Retailer_Type (
	Retailer_Type_Code int IDENTITY(1,1),
 	Type_name_En Varchar(255) NOT NULL,
	PRIMARY KEY (Retailer_Type_Code)
)

CREATE TABLE Order_finance (
	Finance_Code int IDENTITY(1,1),
	Finance_Type Varchar(10) NOT NULL CHECK(Finance_Type IN ('Expense', 'Revenue')),
	Finance_Description Varchar(255),
	PRIMARY KEY (Finance_Code)
)

CREATE TABLE Customer (
	Id int IDENTITY(1,1),
	Fname Varchar(255),
	Lname Varchar(255),
	[Address] Varchar(255),
	City Varchar(40),
	[State] Varchar(255),
	Zip Varchar(6),
	Phone Varchar(20),
	Company_Name Varchar(255),
	[Type] Char,
	Discount int,
	Max_quantity_order int,
	PRIMARY KEY (id)
)

CREATE TABLE Vacation (
	Vac_Id int IDENTITY(1,1),
	Transport Varchar(255),
	Duration int NOT NULL,
	Min_People int NOT NULL,
	Max_Peoeple int NOT NULL,
	Child_Proof bit NOT NULL,
	PRIMARY KEY (Vac_id)
)

CREATE TABLE Bonus (
	Bonus_Date DATE NOT NULL,
	Bonus_Amo float NOT NULL,
	Emp_Id int NOT NULL,
	CONSTRAINT [PK_BONUS] PRIMARY KEY CLUSTERED ([Emp_Id] ASC, [Bonus_Date] ASC)
)

CREATE TABLE Training (
	[Year] smallInt,
	Course Varchar(255),
	Emp_Id int,
	CONSTRAINT [PK_TRAINING] PRIMARY KEY CLUSTERED ([Emp_Id] ASC, [Year] ASC, [Course] ASC)
)

CREATE TABLE Pref_Appraisal (
	Target_Code int NOT NULL,
	[Description] Varchar(255) NOT NULL,
	Manager_Id int NOT NULL,
	Emp_Id int NOT NULL,
	[Timestamp] DATETIME NOT NULL,
	CONSTRAINT [PK_PREF_APPRAISAL] PRIMARY KEY CLUSTERED ([Target_Code] ASC, [Manager_Id] ASC, [Emp_Id] ASC, [Timestamp] ASC)
)

CREATE TABLE Employee (
	Emp_Id int IDENTITY(1,1),
	Emp_FirstName Varchar(20) NOT NULL,
	Emp_LastName Varchar(20) NOT NULL,
	Street Varchar(100),
	City Varchar(30),
	[State] Varchar(2),
	Zip_Code Varchar(10),
	Phone Varchar(20),
	[Status] Varchar(2),
	Ss_Number Varchar(10),
	[Start_Date] DATETIME,
	Termination_Date DATETIME,
	Birth_Date DATETIME,
	Bene_Health_Ins Char,
	Bene_Life_Ins Char,
	Bene_Day_Care Char,
	Sex Char,
	Salary float,
	Phone_Work Varchar(20),
	Extension Varchar(6),
	Fax Varchar(20),
	Email Varchar(50),
	Cv Varchar(50),
	Manager_Id int,
	Branch_Code int NOT NULL,
	Pos_Numb int NOT NULL,
	PRIMARY KEY (Emp_Id)
)

CREATE TABLE Department (
	Dept_Id int IDENTITY(1,1),
	Dept_Name Varchar(255) NOT NULL,
	Dept_Head_Id int NOT NULL,
	PRIMARY KEY (Dept_Id)
)

CREATE TABLE Branch (
	Branch_Code int IDENTITY(1,1),
	Address1 Varchar(50) NOT NULL,
	Address2 Varchar(50),
	City Varchar(40),
	Region Varchar(50),
	Postal_Zone Varchar(10),	
	Dept_Id int NOT NULL,
	Country_Code int,
	PRIMARY KEY (Branch_Code)
)

CREATE TABLE Product_Forecast (
	Product_Number Int,
	[Year] smallInt,
	[Month] Tinyint,
	Expected_Volume Int,
	CONSTRAINT [PK_PRODUCT_FORECAST] PRIMARY KEY CLUSTERED ([Product_Number] ASC, [Year] ASC, [Month] ASC)
)

CREATE TABLE Inventory (
	Inventory_Year SmallInt NOT NULL,
	Inventory_Month Tinyint NOT NULL,
	Product_Number int NOT NULL,
	Inventory_Count int NOT NULL,
	CONSTRAINT [PK_INVENTORY] PRIMARY KEY CLUSTERED ([Inventory_Year] ASC, [Inventory_Month] ASC, [Product_Number] ASC)
)

CREATE TABLE Storage (
	Storage_Code Int NOT NULL,
	City Varchar(50),
	Country_Code int,
	PRIMARY KEY (Storage_Code)
)

CREATE TABLE Campaign (
	Pr_Number smallInt NOT NULL,
	Product_Number int NOT NULL,
	Discount int NOT NULL,
	CONSTRAINT [PK_CAMPAIGN] PRIMARY KEY CLUSTERED ([Pr_Number] ASC, [Product_Number] ASC)
)

CREATE TABLE Product (
	Product_Number int IDENTITY(1,1),
	Introduction_Date DATE NOT NULL,
	Product_Type_Id int NOT NULL,
	Production_Cost Float NOT NULL,
	Margin Float NOT NULL,
	Product_Image Varchar(255) NOT NULL,
	Product_Name Varchar(255),
	Product_Description Varchar(255),
	Product_Size Varchar(20) CHECK(Product_Size IN ('x-small', 'small', 'medium', 'large', 'x-large', 'xx-large', 'xxx-large')),
	Product_Color Varchar(255),
	PRIMARY KEY (Product_Number)
)

CREATE TABLE Sales_Target (
	Emp_Id int NOT NULL,
	Sales_Year SmallInt NOT NULL,
	Sales_Period int NOT NULL,
	Retailer_Name Varchar(50) NOT NULL ,
	Product_Number int NOT NULL,
	Sales_Target Float NOT NULL,
	Retailer_Code int NOT NULL,
	CONSTRAINT [PK_SALES_TARGET] PRIMARY KEY CLUSTERED ([Emp_Id] ASC, [Sales_Year] ASC, [Sales_Period] ASC)
)

CREATE TABLE Product_Type (
	Product_Type_Code int IDENTITY(1,1),
	Product_Line_Code int,
	Product_Type_En Varchar(80) NOT NULL,
	PRIMARY KEY (Product_Type_Code)
)

CREATE TABLE [Order] (
	Order_Id int IDENTITY(1,1),
	Retailer_Site_Code int NOT NULL,
	Emp_Id int NOT NULL,
	Sales_Branch_Code int NOT NULL,
	Order_Date DATETIME NOT NULL,
	Order_Method_Code int NOT NULL,
	Finance_Code int,
	Region Varchar(50),
	PRIMARY KEY (Order_Id)
)

CREATE TABLE Order_Item (
	Order_Id int NOT NULL,
	Product_Id int NOT NULL,
	Quantity SmallInt NOT NULL,
	Ship_Date DATE NOT NULL,
	PRIMARY KEY (Order_Id)
)

CREATE TABLE Returned_Item (
	Return_Code int NOT NULL,
	Return_Date Datetime NOT NULL,
	Order_Detal_Code int NOT NULL,
	Return_Reason int NOT NULL,
	Return_Quantity int NOT NULL,
	PRIMARY KEY (Return_Code)
)

CREATE TABLE Retailer (
	Retailer_Code int IDENTITY(1,1),
	Retailer_CodeMr int,
	Company_Name Varchar(255) NOT NULL,
	Retailer_Type_Code int NOT NULL,
	PRIMARY KEY (Retailer_Code)
)

CREATE TABLE Retailer_Site (
	Retailer_Site_Code int IDENTITY(1,1),
	Retailer_Code int NOT NULL,
	Address1 Varchar(50) NOT NULL,
	Address2 Varchar(50),
	City Varchar(40),
	Region Varchar(50),
	Postal_Zone Varchar(10),
	Country_Code int,
	Active_Indicator bit,
	PRIMARY KEY (Retailer_Site_Code)
)

CREATE TABLE Booking (
	Booking_Id int IDENTITY(1,1),
	Price float NOT NULL,
	Transport_To Varchar(255),
	Transport_From Varchar(255),
	Vac_Id int NOT NULL,
	[Start_Date] DATE NOT NULL,
	PRIMARY KEY (Booking_Id)
)

CREATE TABLE Traveller (
	Customer_Id int NOT NULL,
	Booking_Id int NOT NULL,
	Iban Varchar(255),
	Birth_Date DATE NOT NULL,
	Sex Char NOT NULL,
	CONSTRAINT [PK_TRAVELLER] PRIMARY KEY CLUSTERED ([Customer_Id] ASC, [Booking_Id] ASC)
)

CREATE TABLE Accommodation (
	Acc_Id int IDENTITY(1,1),
	[Address] Varchar(255) NOT NULL,
	Contact Varchar(255),
	Phone_Number Varchar(20) NOT NULL,
	Country_Code int,
	PRIMARY KEY (Acc_Id)
)

CREATE TABLE Acc_vac (
	Acc_Id int NOT NULL,
	Vac_Id int NOT NULL,
	CONSTRAINT [PK_ACC_VAC] PRIMARY KEY CLUSTERED ([Acc_Id] ASC, [Vac_Id] ASC)
)

