CREATE TABLE IF NOT EXISTS Person (
	SSN CHAR(14),
    Birthdate DATE NOT NULL,
    Email TEXT NOT NULL , 
    First_Name VARCHAR(10) NOT NULL,
    Middle_Name VARCHAR(10),
    Last_Name VARCHAR(10) NOT NULL,
    PRIMARY KEY (SSN)
);

CREATE TABLE Person_Phone_NO (
	SSN CHAR(14),
    Phone_NO TEXT,
    PRIMARY KEY (SSN , Phone_NO),
    FOREIGN KEY (SSN) REFERENCES Person(SSN)
);

CREATE TABLE Customer(
	CSSN CHAR(14) , 
    City VARCHAR(10) NOT NULL ,
    Street_NO INTEGER NOT NULL,
    Building_NO INTEGER NOT NULL,
    PRIMARY KEY (CSSN),
    FOREIGN KEY (CSSN) REFERENCES Person(SSN)
);

CREATE TABLE Employee (
	ESSN CHAR(14) ,
    Salary FLOAT NOT NULL ,
    Center_ID CHAR(14) ,
    PRIMARY KEY (ESSN),
    FOREIGN KEY (Center_ID) REFERENCES Service_Center(Center_ID),
    FOREIGN KEY(ESSN) REFERENCES Person(SSN)
);

CREATE TABLE Supplier (
	S_SSN CHAR(14) ,
    Webiste TEXT ,
    PRIMARY KEY(S_SSN),
    FOREIGN KEY (S_SSN) REFERENCES Person(SSN)
);

CREATE TABLE Sales_Man (
	SM_SSN CHAR(14) ,
    Sales_Made INTEGER NOT NULL , 
    PRIMARY KEY (SM_SSN) ,
    FOREIGN KEY(SM_SSN) REFERENCES Employee(ESSN)
);

CREATE TABLE Engineer(
	ESSN char(14) , 
    Specialization TEXT NOT NULL ,
    PRIMARY KEY (ESSN),
    FOREIGN KEY (ESSN) REFERENCES Employee(ESSN)
);

CREATE TABLE Performs(
	SSN CHAR(14),
    Task_ID CHAR(14),
    PRIMARY KEY (SSN , Task_ID) ,
    FOREIGN KEY (SSN) REFERENCES Engineer(SSN),
    FOREIGN KEY (Task_ID) REFERENCES Maintenance_Task(Task_ID)
);

CREATE TABLE Maintenance_Task(
	Taks_ID CHAR(14),
    Task_Date DATE NOT NULL,
    Price FLOAT NOT NULL ,
    Center_ID CHAR(14) ,
    Plate_NO TEXT NOT NULL ,
    Order_ID CHAR(14) ,
    Component_Model TEXT ,
    PRIMARY KEY (Task_ID) ,
    FOREIGN KEY (Center_ID) REFERENCES Service_Center(Center_ID),
    FOREIGN KEY (Order_ID) REFERENCES Repair_Order(Order_ID),
    FOREIGN KEY (Component_Model) REFERENCES Car_Component(Model)
);

CREATE TABLE Service_Center(
	Center_ID CHAR(14),
    NO_OF_Employees INTEGER NOT NULL DEFAULT 1,
    City VARCHAR(10) NOT NULL ,
    Street_NO INTEGER NOT NULL,
    Building_NO INTEGER NOT NULL,
    M_SSN CHAR(14),
    PRIMARY KEY (Center_ID) ,
    FOREIGN KEY (M_SSN) REFERENCES Employee(ESSN)
);

CREATE TABLE CAR (
	Plate_NO TEXT ,
    Model_Name VARCHAR(10),
    Model_Year INTEGER NOT NULL,
    SSN CHAR(14),
    PRIMARY KEY(Plate_NO),
    FOREIGN KEY (Model_Name) REFERENCES Model(Model_Name),
    FOREIGN KEY (Model_YEAR) REFERENCES Model(Model_YEAR)
);

CREATE TABLE Model(
	Model_Name VARCHAR(10),
    Model_Year INTEGER,
    Brand VARCHAR(10) NOT NULL,
    PRIMARY KEY(Model_Name , Model_Year)
);

CREATE TABLE Center_Order(
	Order_ID CHAR(14),
    Order_Status VARCHAR(14) NOT NULL,
    Payment_Method VARCHAR(10) NOT NULL,
    Order_Date DATE NOT NULL,
    Total_Cost FLOAT NOT NULL,
    PRIMARY KEY(Order_ID)
);

CREATE TABLE Repair_Order(
	Order_ID CHAR(14),
    C_SSN CHAR(14),
    City VARCHAR(10) NOT NULL ,
    Street_NO INTEGER NOT NULL,
    Building_NO INTEGER NOT NULL ,
    PRIMARY KEY(Order_ID),
    FOREIGN KEY (Order_ID) REFERENCES Center_Order(Order_ID),
    FOREIGN KEY (C_SSN) REFERENCES Customer(CSSN)
);

CREATE TABLE Purchase_Order(
	Order_ID CHAR(14),
    Deliver_Date DATE NOT NULL ,
    S_SSN CHAR(14),
    PRIMARY KEY(Order_ID),
    FOREIGN KEY (Order_ID) REFERENCES Center_Order(Order_ID),
    FOREIGN KEY(S_SSN) REFERENCES Supplier(S_SSN)
);

CREATE TABLE Consist_OF(
	Order_ID CHAR(14),
    Component_Model TEXT ,
    Quantity INTEGER NOT NULL,
    PRIMARY KEY(Order_ID),
    FOREIGN KEY (Order_ID) REFERENCES Center_Order(Order_ID),
    FOREIGN KEY(Component_Model) REFERENCES Car_Component(Model)
);

CREATE TABLE Offers(
	Component_Model TEXT ,
    SSN CHAR(14),
    PRIMARY KEY(Component_Model , SSN),
    FOREIGN KEY(Component_Model) REFERENCES Car_Component(Model),
    FOREIGN KEY(SSN) REFERENCES Supplier(S_SSN)
);

CREATE TABLE Car_Component(
	Model TEXT,
    Price FLOAT NOT NULL,
    PRIMARY KEY(Model)
);

CREATE TABLE Body(
	Model TEXT,
    Chassis_Type VARCHAR (14) NOT NULL,
    PRIMARY KEY(Model),
    FOREIGN KEY(Model) REFERENCES Car_Component(Model)
);

CREATE TABLE Battery(
	Model TEXT,
    Expiry_Date DATE NOT NULL,
    PRIMARY KEY(Model),
    FOREIGN KEY(Model) REFERENCES Car_Component(Model)
);

CREATE TABLE Transmission(
	Model TEXT,
    Transmission_Type VARCHAR (10) NOT NULL,
    PRIMARY KEY(Model),
    FOREIGN KEY(Model) REFERENCES Car_Component(Model)
);

CREATE TABLE Car_Engine(
	Model TEXT,
    Lubricant_Type VARCHAR(14) NOT NULL,
    Horse_Power INTEGER NOT NULL,
    PRIMARY KEY(Model),
    FOREIGN KEY(Model) REFERENCES Car_Component(Model)
);
    

    