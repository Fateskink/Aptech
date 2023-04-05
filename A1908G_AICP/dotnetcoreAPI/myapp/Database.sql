/*
Write a html file of Register new user, with modern colors, responsively bootstrap(latest version)
This page must contain these colors: #FDF4F5
#E8A0BF
#BA90C6
#C0DBEA
FirstName, LastName ,Email,Password
This page must have Header, Footer, responsive mobile first
Header must not be hidden when scrolling down
have some sub menu, footer must have Copyright, modern color
*/
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Password VARCHAR(100) NOT NULL,
    OrderHistory VARCHAR(MAX),
    Preferences VARCHAR(MAX)
);
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100) NOT NULL,
    Description VARCHAR(MAX),
    ImageURL VARCHAR(MAX),
    Price DECIMAL(10,2) NOT NULL
);

CREATE TABLE ProductReviews (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    ProductID INT NOT NULL,
    Rating INT NOT NULL,
    ReviewText VARCHAR(MAX),
    CONSTRAINT FK_ProductReviews_UserID FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT FK_ProductReviews_ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE ShoppingCart (
    CartID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    CONSTRAINT FK_ShoppingCart_UserID FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT FK_ShoppingCart_ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Orders (
    OrderId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    TotalPrice DECIMAL(18,2) NOT NULL,
    OrderStatus VARCHAR(20) NOT NULL,
    CONSTRAINT FK_Orders_Users FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

CREATE TABLE OrderDetails (
    OrderDetailId INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(18,2) NOT NULL,
    CONSTRAINT FK_OrderDetails_Order FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    CONSTRAINT FK_OrderDetails_Product FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);

CREATE TABLE Newsletters (
    NewsletterID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    Email VARCHAR(100) NOT NULL,
    CONSTRAINT FK_Newsletters_UserID FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Wishlists (
    WishlistID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    ProductID INT NOT NULL,
    CONSTRAINT FK_Wishlists_UserID FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT FK_Wishlists_ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE GiftCards (
    GiftCardID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_GiftCards_UserID FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Password VARCHAR(100) NOT NULL
);
