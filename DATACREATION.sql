-- Create ProductDim Table
CREATE TABLE product_dim (
    Product_ID INT PRIMARY KEY,
    Name VARCHAR(200) NOT NULL,
    Category VARCHAR(80) NOT NULL,
    Sub_Category VARCHAR(255) NOT NULL
);

-- Create LocalDim Table
CREATE TABLE local_dim (
    Local_ID INT PRIMARY KEY,
    Region VARCHAR(80) NOT NULL,
    Country VARCHAR(80) NOT NULL,
    City VARCHAR(80) NOT NULL,
    State VARCHAR(80) NOT NULL,
    Postal_Code INT NOT NULL
);

-- Create CustomerDim Table
CREATE TABLE customer_dim (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(80) NOT NULL,
    Segment VARCHAR(80) NOT NULL
);

-- Create DateDim Table
CREATE TABLE date_dim (
    Date_ID INT PRIMARY KEY,
    Year INT NOT NULL,
    Month INT NOT NULL,
    Day INT NOT NULL,
    Quarter INT NOT NULL
);

-- Create Facts Table
CREATE TABLE facts_table (
    Order_ID INT PRIMARY KEY,
    Product_ID INT NOT NULL,
    Local_ID INT NOT NULL,
    Date_ID INT NOT NULL,
    Customer_ID INT NOT NULL,
    Sales FLOAT NOT NULL,
    Discount FLOAT NOT NULL,
    Quantity INT NOT NULL,
    Profit FLOAT NOT NULL,
    
    -- Foreign Key Constraints
    CONSTRAINT fk_product FOREIGN KEY (Product_ID) REFERENCES product_dim(Product_ID),
    CONSTRAINT fk_local FOREIGN KEY (Local_ID) REFERENCES local_dim(Local_ID),
    CONSTRAINT fk_date FOREIGN KEY (Date_ID) REFERENCES date_dim(Date_ID),
    CONSTRAINT fk_customer FOREIGN KEY (Customer_ID) REFERENCES customer_dim(Customer_ID)
);
