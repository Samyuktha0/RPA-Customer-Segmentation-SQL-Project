 -- Create tables for customer segmentation

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Location VARCHAR(100),
    AnnualIncome DECIMAL(10, 2),
    SpendingScore INT
);

CREATE TABLE Segments (
    SegmentID INT PRIMARY KEY,
    SegmentName VARCHAR(50),
    Description TEXT
);

CREATE TABLE CustomerSegments (
    CustomerID INT,
    SegmentID INT,
    PRIMARY KEY (CustomerID, SegmentID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (SegmentID) REFERENCES Segments(SegmentID)
);
-- Insert sample customers
INSERT INTO Customers (CustomerID, Name, Age, Gender, Location, AnnualIncome, SpendingScore)
VALUES 
(1, 'Alice Smith', 28, 'Female', 'New York', 75000, 85),
(2, 'Bob Johnson', 35, 'Male', 'Los Angeles', 60000, 60),
(3, 'Charlie Lee', 22, 'Male', 'Chicago', 50000, 90);

-- Insert customer segments
INSERT INTO Segments (SegmentID, SegmentName, Description)
VALUES 
(1, 'High Income, High Spending', 'Customers with high income and spending scores'),
(2, 'Moderate Income, Moderate Spending', 'Customers with moderate income and spending scores'),
(3, 'Low Income, Low Spending', 'Customers with low income and spending scores');

-- Map customers to segments
INSERT INTO CustomerSegments (CustomerID, SegmentID)
VALUES 
(1, 1),
(2, 2),
(3, 3);
