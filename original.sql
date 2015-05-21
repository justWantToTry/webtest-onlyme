CREATE TABLE Hotel(
hotelId    CHAR(4) PRIMARY KEY,
hotelName  VARCHAR(30),
city  CHAR(30) CHECK(city IN('Guelph','Kitchener','Waterloo','Toronto'))
);
CREATE TABLE Room(
hotelId  CHAR(4),
roomNo  CHAR(4),
price DECIMAL(5,2) CHECK(VALUE BETWEEN 50.00 AND 250.00),
rmType CHAR(30) CHECK(rmType IN('Single','Double','Queen','King')),
CONSTRAINT rooma FOREIGN KEY (hotelId) REFERENCES Hotel(hotelId),
PRIMARY KEY(hotelId,roomNo)
);
CREATE TABLE Guest(
guestId CHAR(4) PRIMARY KEY,
guestName VARCHAR(30),
guestAddress VARCHAR(50),
guestAffilication VARCHAR(30)
);
CREATE TABLE Booking(
hotelId CHAR(4) ,
roomNo  CHAR(4) ,
guestId  CHAR(4),
startDate  DATE,
endDate  DATE,
CONSTRAINT booka FOREIGN KEY (hotelId) REFERENCES Hotel(hotelId),
CONSTRAINT bookb FOREIGN KEY (hotelId,roomNo) REFERENCES Room(hotelId,roomNo),
CONSTRAINT bookc FOREIGN KEY (guestId) REFERENCES Guest(guestId),
PRIMARY KEY(hotelId,roomNo,guestId,startDate)
);
CREATE TABLE BookingLog(
hotelId CHAR(4) ,
roomNo  CHAR(4) ,
guestId  CHAR(4) ,
startDate  DATE,
endDate  DATE,
userId VARCHAR(30),
changeTime DATETIME,
PRIMARY KEY(hotelId,roomNo,userId,changeTime,guestId,startDate)
);