use ddrk;

insert into portal value ('123.123.123.123', 'DDRKRealEstates.com');

-- departmentid, department
insert into employeerole values 
(1,'Public Relations'),
(2,'Information Technology'),
(3, 'Quality Assurance');

-- furnishingid, type
insert into furnishing values
(1,'Fully Furnished'),
(2,'Semi Furnished'),
(3,'Not Furnished');

-- typeid type
insert into residentialtype values
(1,'Flat'),
(2,'Bungalow'),
(3,'Penthouse');

-- typeid type
insert into commercialtype values
(1,'Office Space'),
(2,'Shop'),
(3,'Showroom'),
(4,'Warehouse'),
(5,'Industrial Shed'),
(6,'Industrial Building');

-- typeid type
insert into plottype values
(1,'Residential'),
(2,'Commercial'),
(3,'Agricultural');

-- statusid status
insert into status values
(1,'Sale'),
(2,'Rent'),
(3,'PG'),
(4,'Lease');

-- memberid, name, email, password
insert into member values
(1,'divij','divij@gmail.com','12345'),
(2,'drishti','drishti@gmail.com','12345'),
(3,'giriraj','giriraj@gmail.com','12345'),
(4,'gowardhan','gowardha@gmail.com','12345'),
(5,'govind','govind@gmail.com','12345'),
(6,'harshita','harshita@gmail.com','12345'),
(7,'harish','harish@gmail.com','12345'),
(8,'ishaand','ishaan@gmail.com','12345'),
(9,'ishita','ishita@gmail.com','12345'),
(10,'indu','indu@gmail.com','12345');

insert into member values
(11,'jayesh','jayesh@gmail.com','12345'),
(12,'jignesh','jignesh@gmail.com','12345'),
(13,'jyoti','jyoti@gmail.com','12345'),
(14,'karan','karan@gmail.com','12345'),
(15,'kamlesh','kamlesh@gmail.com','12345'),
(16,'kritika','kritika@gmail.com','12345'),
(17,'kajol','kajol@gmail.com','12345'),
(18,'lalit','lalit@gmail.com','12345'),
(19,'leena','leena@gmail.com','12345'),
(20,'lokesh','lokesh@gmail.com','12345'),
(21,'loveena','loveena@gmail.com','12345'),
(22,'mahesh','mahesh@gmail.com','12345'),
(23,'mandit','mandit@gmail.com','12345'),
(24,'mayank','mayank@gmail.com','12345'),
(25,'manisha','manisha@gmail.com','12345'),
(26,'neeraj','neeraj@gmail.com','12345'),
(27,'nishika','nishika@gmail.com','12345'),
(28,'pradeep','pradeep@gmail.com','12345'),
(29,'priyanshi','priyanshi@gmail.com','12345'),
(30,'qautabudin','qautabudin@gmail.com','12345');


-- phonenoid. phoneno, memberid
insert into phoneno values
(1,'1234567930',1),
(2,'1234567931',2),
(3,'1234567932',3),
(4,'1234567933',4),
(5,'1234567934',5),
(6,'1234567935',6),
(7,'1234567936',7),
(8,'1234567937',8),
(9,'1234567938',9),
(10,'1234567939',10);

-- employeeid. name, email, password, address, departmentid
insert into employee values
(1,'aakash','aakashddrk@gmail.com','123456','43 /, Yashodhan Apt,  Bunglows Road, Andheri',1),
(2,'aadarsh','aadarshddrk@gmail.com','123456','B/12, Ashok Silk Mills Compound, Sion Bandra Link Road, Opp 90ft Road',2),
(3,'abhinav','abhinavddrk@gmail.com','123456','1622/32, Nai Walan, Shri Kishan Das Road',3),
(4,'ajay', 'ajayddrk@gmail.com','123456','246,old#128, Pycrofts Road, Royapettah',2),
(5,'anusha','anushaddrk@gmail.com','123456', '2/83,old#128, Purali street',1),
(6,'baljeet','baljeetddrk@gmail.com','123456',' F 21 Sector 8',2),
(7,'biswa','biswaddrk@gmail.com','123456','104, Luhadia Tower, C-Scheme Ashok Marg',3),
(8,'babita','babitaddrk@gmail.com','123456','606, Harekrishna Complex, Opp Kothawala Flats, Ellisbridge',3),
(9,'divya','divyaddrk@gmail.com','123456','C Military Lane Raj Indl Complex, 44 Marol Maroshi Road, Marol, J.b.nagar',1),
(10,'deshraj','deshrajddrk@gmail.com','123456','22, Pandaram St, Purasaiwalkam',1);

-- phonenoid, phoneno, employeeid
insert into empphoneno values
(1,'1234567890',1),
(2,'1234567891',2),
(3,'1234567892',3),
(4,'1234567893',4),
(5,'1234567894',5),
(6,'1234567895',6),
(7,'1234567896',7),
(8,'1234567897',8),
(9,'1234567898',9),
(10,'1234567899',10);

-- propertyid, statusid, price, memberid
insert into property values
(1,1,2500000,1),
(2,2,40000,2),
(3,1,7565000,3),
(4,3,5500,4),
(5,1,1500000,5),
(6,1,2560000,6),
(7,4,160000,7),
(8,1,25000000,7),
(9,4,84000,9),
(10,4,578000,2),
(11,1,15000000,1),
(12,1,35600000,6),
(13,4,66000,4),
(14,4,290000,4),
(15,4,95000,4);

insert into property values
(16,1,3550000,11 ),
(17,2,38000, 11 ),
(18,3,15000, 12),
(19,1,8500000, 12),
(20,2,42000, 12),
(21,4,280000, 14),
(22,1,6500000, 14),
(23,3,16000, 16),
(24,1,5500000,17 ),
(25,4,150000, 18),
(26,2,37500, 20),
(27,4,200000, 20),
(28,1,7000000, 20),
(29,2,24000, 21),
(30,1,6900000, 25),
(31,4,140000, 25),
(32,2,45000, 25),
(33,1,4600000, 26),
(34,2,45000, 26),
(35,4,160000, 29),
(36,1,9500000, 29),
(37,2,50000, 29),
(38,3,18000, 29),
(39,4,85000, 30),
(40,2,22000, 30);

-- locationid, city, locality, society, pincode, propertyid
insert into location VALUES
(1,'Bangalore','Hebbal','Concorde Napa valley',560024,1),
(2,'Chennai','RA Puram','Metropolis Fair Oaks',600028,2),
(3,'Pune','Balewadi','Green Meadows Villas',411045,3),
(4,'Mumbai','Powai','JRC Palladio',400076,4),
(5,'Mumbai','Marine Drive','Abhee Prakruthi Villa',400002,5),
(6,'Mysore','Gokulam', 'Terra Alegria',570002,6),
(7,'Kochi','Ernakulam','Antaliea Homes',683541,7),
(8,'Bangalore','Binnypete','42 Queens Square',560023,8),
(9,'Pune','Lavale', 'Nanda Prakruthi',411021,9),
(10,'Mumbai','Thane', 'Manya MagnaVille',400601,10),
(11,'Delhi','Hauz Khas','NVT Life Square',110016,11),
(12,'Delhi','Lajpat Nagar','Earth N Sky Nature Villas',110024,12),
(13,'Delhi','Hauz Khas', 'LGCL New Life',110016,13),
(14,'Bangalore','Rajajinagar','Renaissance Nature Walk',560010,14),
(15,'Pune','Baner', 'Prestige Silver Oak',411045,15);

insert  into location values
(16,'Mumbai','Marine Drive','laxmanji apartments',400002, 16),
(17,'Mumbai','Powai','namoi residency',400076, 17),
(18,'Delhi','Hauz Khas','wave estates',110016, 18),
(19,'Delhi','Lajpat Nagar','lodha aprtments',110024,19 ),
(20,'Pune','Baner','kohinoor falcon',411045, 20),
(21,'Chennai','RA Puram','escon estates',600028, 21),
(22,'Bangalore','Binnypete','parkwest',560023, 22),
(23,'Pune','Balewadi','bella casa',411045, 23),
(24,'Mysore','Gokulam','natwarlal tower',570002,24 ),
(25,'Bangalore','Rajajinagar','sunny enclave',560010,25 ),
(26,'Chandigarh','sector 105','the views',140051, 26),
(27,'Noida','sector 125-a','amarpali group',110096, 27),
(28,'Kochi','Ernakulam','thiluma apartments',683541, 28),
(29,'Chandigarh','sector 99','pearl group',140058, 29),
(30,'Gurgaon','BRD area','reeva views',120068, 30),
(31,'Pune','Baner','whitefield views',411045, 31),
(32,'Mumbai','Thane','hiranandani estate',620013, 32),
(33,'Chandigarh','kharar road','TSK builders',140058, 33),
(34,'Delhi','Lajpat Nagar','rubal apartments',110024,34),
(35,'Bangalore','Hebbal','tree views',560024,35),
(36,'Mysore','kollum','gree fields',570002, 36),
(37,'Pune','sb road','the maximus',412045, 37),
(38,'Gurgaon','BRD area','elante arena',120068,38 ),
(39,'Pune','hinjawadi','lodha group',412006, 39),
(40,'Kochi','Ernakulam','chaddha group',683541, 40);

-- propertyid, typeid, size
insert into plot values
(11,1,500),
(12,1,350),
(13,2,1000),
(14,3,20000),
(15,1,250);
insert into plot values
(36,1,600),
(37,2,370),
(38,2,2000),
(39,3,2500),
(40,1,7000);

-- propertyid, typeid, size, possession, builder
insert into commercial values
(6,1,2000,'2020-11-21','Ramesh'),
(7,2,250,'2018-10-10','Mahesh'),
(8,3,1500,'2017-06-09','Somesh'),
(9,6,20000,'2012-09-09','Rakesh'),
(10,5,15000,'2015-12-21','Lokesh');

-- propertyid, specifications, size, possession, builder
insert into Residential values
(1,'Ultimate reflection of the urban chic lifestyle',180,'16-10-19','Ultratech'),
(2,'An epitome of elegance and simplicity',195,'06-1-20','AFRCON'),
(3,'Beautifully crafted interiors as well as exteriors',225,'25-11-20','EMAAR'),
(4,'Spacious, well ventilated and Vastu compliant',210,'28-10-20','Laalaji'),
(5,'Stirring in luxury and enveloped by verdant surroundings',255,'17-9-20','Lodha');

-- propertyid, typeid, bhk, bathroom, floor, furnishingid
insert into residentialdetails values
(1,1,3,2,6,1),
(2,1,2,2,2,2),
(3,2,5,4,0,1),
(4,1,3,2,12,3),
(5,3,4,3,3,3);

-- faqid, question, memberid, answer, employeeid
insert into faq values
(1,'When will my Property become visible on the site?',1,'It takes maximum 24 hours for a property to get screened and become visible on search.',10),
(2,'How do I contact the Property Owner?',2,'After an enquiriry is made for a property, the owner will accept the request following which, the owner contact number will be visible.',9),
(3,'What is a free listing?',3,'DDRK offers one FREE listing to owners for posting a property. The Free listing will be visible on the site for 15 days.',8),
(4,'What documents I need to post property?',4,'You do not need any documents to post a property. RRDK will not ask for any documents.',7),
(5,'When will my Property become visible on the site?',5,'Your property will immediately become visible on the website.',6);

-- reviewid, rating, description, memberid, propertyid
insert into review values
(1,4,'Excellent locality and very peaceful environment',2,1),
(2,5,'Close to all some of the top educational institutes, hospitals, lifestyle and commercial centres, I.T. hubs and much more!',3,2),
(3,3,'Good location for family and working professional. It is very close to it offices and school, hospitals and banks.',6,3),
(4,4,'Beautifully designed with spacious and planned properties',9,4),
(5,5,'Prime and decent location with good environment.',7,5);

insert into review values
(6,4,'beautiful surrounding in the lap of nature',10,1),
(7,5,'super spacious with excellent infrastrucure',12 ,1 ),
(8,4,'prime location with ample amount of facilities',14 ,2 ),
(9,3,'good society but lacks in terms public facilities',16 ,2 ),
(10,5,'best in terms of location,community interactions',18 ,2 ),
(11,4,'great society but lacks only in terms of parking management',20 ,3 ),
(12,5,'one of the best in the localities',22 , 3),
(13,5,'this society is an architectural marvel',23 , 4),
(14,4,'great for sports enthusiasts' ,24 , 5),
(15,3,'water issues sometimes otherwise great place to live in' ,25 , 5);