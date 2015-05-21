CREATE TABLE Hotel(
hotelID    CHAR(4) PRIMARY KEY,
hotelName  VARCHAR(30),
city  CHAR(30) CHECK(city IN('Guelph','Kitchener','Waterloo','Toronto')),
hotelPhone VARCHAR(30),
hotelAddress VARCHAR(50),
hotelImg VARCHAR(30)
);
CREATE TABLE Room(
hotelID  CHAR(4),
roomNo  CHAR(4),
price DECIMAL(5,2) CHECK(VALUE BETWEEN 50.00 AND 250.00),
rmtype CHAR(30) CHECK(rmType IN('Single','Double','Queen','King')),
roomImg VARCHAR(30),
CONSTRAINT rooma FOREIGN KEY (hotelId) REFERENCES Hotel(hotelId),
PRIMARY KEY(hotelId,roomNo)
);
CREATE TABLE Guest(
guestID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
guestName VARCHAR(30) ,
guestPassword VARCHAR(30),
guestAddress VARCHAR(50),
guestAffilication VARCHAR(30),
UNIQUE(guestName)
);
CREATE TABLE Booking(
hotelID CHAR(4) ,
roomNo  CHAR(4) ,
guestID  INT,
startDate  DATE,
endDate  DATE,
CONSTRAINT booka FOREIGN KEY (hotelId) REFERENCES Hotel(hotelId),
CONSTRAINT bookb FOREIGN KEY (hotelId,roomNo) REFERENCES Room(hotelId,roomNo),
CONSTRAINT bookc FOREIGN KEY (guestId) REFERENCES Guest(guestId),
PRIMARY KEY(hotelId,roomNo,guestId,startDate)
);
