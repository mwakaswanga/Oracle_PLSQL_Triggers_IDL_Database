/*
 -- Student Name:	Fredrick J. Sigalla
 -- Stud ID:		A00277360
 -- Project Name:	Irish Dancing Lessons - IDL
 -- Module:			Advanced Databases
 -- Course:			MSc. In Data Analytics
 -- Date Tested:	13 May 2020
*/

Drop Table Lesson;
Drop Table Venue;
Drop Table Dancer;
Drop Table Teacher;
Drop Table Dancing_School;
Drop Table College;

/* Creating Table College */
Drop Table College;
Create Table College (
College_Id Number(3),
Name Varchar2(53) Constraint College_Name_Nn Not Null,
City Varchar2(11),
County Varchar2(10),
Specialism Varchar2(11),
Yr_Established Number(4),
Campus_Size Number(4),
Constraint College_Specialism_Chck Check(Specialism In( 'Engineering' , 'Business' , 'Science', 'Sport')),
Constraint College_College_Id_PK Primary Key(College_Id));

/* Creating Table Dancing_School*/
Drop Table Dancing_School;
Create Table Dancing_School(
Dancing_School_Id Number(4),
Name Varchar2(42) Constraint Dancing_School_Danc_Id_Nn Not Null,
City Varchar2(11),
County Varchar2(10),
Specialism Varchar2(13),
Yr_Established Number(4),
Email Varchar2(18),
Web_Site Varchar2(17),
Constraint Dancing_Sc_Specialism_Chck Check(Specialism In( 'Children', 'Teenagers', 'Adults', 'Retired', 'Elite Dancers')),
Constraint Dancing_Sc_Dancing_Sc_Id_PK Primary Key(Dancing_School_Id));

/* Creating Table Teacher*/
Drop Table Teacher;
Create Table Teacher(
Teacher_Id Number(3),
FName Varchar2(7) Constraint Teacher_Fname_Nn Not Null,
Sname Varchar2(9) Constraint Teacher_Sname_Nn Not Null,
Address Varchar2(15),
Town Varchar2(15),
County Varchar2(10),
Specialism Varchar2(9),
Date_Of_Birth Date,
Gender Varchar2(6),
Mobile_No Varchar2(9),
Reputation Varchar2(9),
Qualifications Varchar2(7),
College_Id Number(3),
Dancing_School_Id Number(4),
Constraint Teacher_Teacher_Id_PK Primary Key(Teacher_Id),
Constraint Teacher_College_Id_FK Foreign Key(College_Id) References College(College_Id),
Constraint Teacher_Qualification_Chck Check(Qualifications In ( 'Level 1', 'Level 2', 'Level 3')),
Constraint Teacher_Reputation_Chck Check(Reputation In ( 'Fair', 'Good', 'Excellent')),
Constraint Teacher_Dancing_School_Id_FK Foreign Key(Dancing_School_Id) References Dancing_School(Dancing_School_Id));

/* Creating Table Dancer*/
Drop Table Dancer;
Create Table Dancer(
Dancer_Id Number(4),
ForeName Varchar2(8) Constraint Dancer_ForeName_Nn Not Null,
Surname Varchar2(9) Constraint Dancer_Surname_Nn Not Null,
Address Varchar2(15),
Town Varchar2(15),
County Varchar2(9),
Date_Of_Birth Date,
Gender Varchar2(6),
Height Number(4,2),
Fav_Dance Varchar2(9),
Commitment Varchar2(9),
Weakness Varchar2(20),
Constraint Dancer_Dancer_Id_PK Primary Key(Dancer_Id),
Constraint Dancer_Commitment_Chck Check(Commitment In( 'Fair', 'Good', 'Excellent')));

/* Creating Table Venue*/
Drop Table Venue;
Create Table Venue(
Venue_Id Number(2),
Length Number(3),
Width Number(3),
Floor_Type  Varchar2(8),
Heating Varchar2(8),
Yr_Running_Cost Number(5),
Constraint Venue_Venue_Id_PK Primary Key(Venue_Id),
Constraint Venue_Heating_Chck Check(Heating In( 'None', 'Oil', 'Gas', 'Electric')));

/* Creating Table Lesson */
Drop Table Lesson;
Create Table Lesson(
Teacher_Id Number(3),
Dancer_Id Number(4),
Venue_Id Number(2),
Lesson_Date Date,
Teacher_Fee Number(4),
Topic Varchar2(11),
Progress  Varchar2(9),
Constraint Lesson_Teacher_Id_FK Foreign Key(Teacher_Id) References Teacher(Teacher_Id),
Constraint Lesson_Dancer_Id_FK Foreign Key(Dancer_Id) References Dancer(Dancer_Id),
Constraint Lesson_Venue_Id_FK Foreign Key(Venue_Id) References Venue(Venue_Id),
Constraint Lesson_Progress_Chck Check(Progress In( 'Poor', 'Fair', 'Good', 'Excellent')),
Constraint Lesson_First_Four_CPK Primary Key(Teacher_Id, Dancer_Id, Venue_Id, Lesson_Date));


/* Table Name: College  */
/*College_Id,Name,City,County,Specialism,Yr_Established,Campus_Size */
Insert Into  College Values (10,'Dublin City University','Dublin','Dublin','Engineering','1945',4000);
Insert Into  College Values (20,'Maynooth University','Mynooth','Antrim','Business','1946',4001);
Insert Into  College Values (30,'Trinity College Dublin','Dublin','Dublin','Science','1947',4002);
Insert Into  College Values (40,'The University of Limerick','Limerick','Limerick','Sport','1948',4003);
Insert Into  College Values (50,'University College Dublin','Dublin','Dublin','Business','1949',4004);
Insert Into  College Values (60,'University College Cork','Cork','Cork','Science','1950',4005);
Insert Into  College Values (70,'Technological University Dublin','Dublin','Dublin','Engineering','1951',4006);
Insert Into  College Values (80,'Blanchardstown ','Kilkenny','Louth','Business','1952',NULL);
Insert Into  College Values (90,'National College of Ireland','Dublin','Dublin','Science','1953',4008);
Insert Into  College Values (100,'St. Angelas College','Armagh','Armagh','Sport','1954',4009);
Insert Into  College Values (110,'Pontifical University','Derry','Derry','Business','1955',4010);
Insert Into  College Values (120,'National College of Art and Design','Waterford','Waterford','Science','1956',4011);
Insert Into  College Values (130,'Mary Immaculate College','Sligo','Sligo','Engineering','1957',4012);
Insert Into  College Values (140,'Tallaght','Mississauga','Toronto','Business','1958',4013);
Insert Into  College Values (150,'Letterkenny Institute of Technology','Letterkenny','Wexford','Science','1959',4014);
Insert Into  College Values (160,'Galway-Mayo Institute of Technology','Galway','HDate16','Engineering','1960',4015);
Insert Into  College Values (170,'Dun Laoghaire Institute of Art, Design and Technology','Canberra','Canberra','Engineering','1961',4016);
Insert Into  College Values (180,'Royal College of Surgeons Ireland','Tyrone','Tyrone','Business','1962',4017);
Insert Into  College Values (190,'Athlone Institute of Technology','Athlone','Westhmeath','Science','1963',4018);
Insert Into  College Values (200,'Cork Institute of Technology','Cork','Cork','Engineering','1964',4019);


/* Table Name:Dancing_School*/
/*Dancing_School_Id,Name,City,County,Specialism,Yr_Established,Email,Web_Site */
Insert Into  Dancing_School Values (1000,'Athlone Music College','Athlone','Westhmeath','Children',1961,'info@popo.ie','www.popo.ie');
Insert Into  Dancing_School Values (1100,'Limerick School of Music','Limerick','Limerick','Teenagers',1962,'info@abc.ie','www.abc.ie');
Insert Into  Dancing_School Values (1200,'Nenagh Music School','Nenagh','Limerick','Adults',1963,'info@totoz.ie','www.totoz.ie');
Insert Into  Dancing_School Values (1300,'Trinity College','Dublin 4','Dublin','Retired',1964,'info@23dc.com','www.23dc.com');
Insert Into  Dancing_School Values (1400,'Cork Music Center','Cork','Cork','Elite Dancers',1961,'info@aitie.it','www.aitie.it');
Insert Into  Dancing_School Values (1500,'Royal Irish Academy of Music','Ballyroe',' Kildare','Teenagers',1962,'info@sigalla.org','www.sigalla.org');
Insert Into  Dancing_School Values (1600,'BIMM Dublin','Dublin','Dublin','Retired',1963,'info@frex.ac','www.frex.ac');
Insert Into  Dancing_School Values (1700,'Belfast Music Academy','Dromiskin','Belfast','Elite Dancers',1964,'info@aditya.in','www.aditya.in');
Insert Into  Dancing_School Values (1800,'Griffith College','Ballycumber',' Offaly','Retired',1961,'info@akshaya.com','www.akshaya.com');
Insert Into  Dancing_School Values (1900,'Ulster College Of Music','Ulster','Ulster','Elite Dancers',1962,'info@radv.edu','www.radv.edu');
Insert Into  Dancing_School Values (2000,'Rap Ireland DJ School','Athlone','Westhmeath','Retired',1963,'info@pth.com','www.pth.com');
Insert Into  Dancing_School Values (2100,'Waltons New School of Music','Cork','Cork','Elite Dancers',1964,'info@deroc.edu','www.deroc.edu');
Insert Into  Dancing_School Values (2200,'WIT Music School','Limerick','Limerick','Teenagers',1947,'info@nikhil.org','www.nikhil.org');
Insert Into  Dancing_School Values (2300,'Mandela','Vaughan','Vaughan','Children',1948,'info@ansu.edu','www.ansu.edu');
Insert Into  Dancing_School Values (2400,'DIT - Conservatory Of Music And Drama','Dublin','Dublin','Teenagers',1949,'info@pankash.com','www.pankash.com');
Insert Into  Dancing_School Values (2500,'Cork City Music College','Cork','Cork','Adults',1950,'info@nyash.ie','www.nyash.ie');
Insert Into  Dancing_School Values (2600,'CIT Cork School of Music','Cork','Cork','Retired',1951,'info@xulohk.com','www.xulohk.com');
Insert Into  Dancing_School Values (2700,'Nyerere','Dundakh','Westhmeath','Elite Dancers',1952,'info@debrah.ie','www.debrah.ie');
Insert Into  Dancing_School Values (2800,'Longford School of Music','Longford','Longford','Teenagers',1953,'info@mwakilasa.org','www.mwakilasa.org');
Insert Into  Dancing_School Values (2900,'Birr House of Talent','Birr','Westhmeath','Teenagers',1954,'info@muk.ac.ug','www.muk.ac.ug');

/* Table Name:Teacher  */
/*Teacher_Id,FName,Sname,Address,Town,County,Specialism,Date_Of_Birth,Gender,Mobile_No,Reputation,Qualifications,College_Id,Dancing_School_Id */
Insert Into  Teacher Values (500,'Aaron','Hoey','Banagher','Banagher','Offaly','Jigs','25-Oct-87','Male','858371814','Fair','Level 1',10,2400);
Insert Into  Teacher Values (510,'Peter','McGinnity','Ballycumber','Ballycumber','Offaly','Reels','03-Nov-88','Male','828374814','Good','Level 2',20,2500);
Insert Into  Teacher Values (520,'Stephen','Melia','Edenderry','Edenderry','Offaly','Hornpipes','12-Mar-90','Male','858371800','Excellent','Level 3',30,2600);
Insert Into  Teacher Values (530,'JP','Neary','Geashill','Geashill','Offaly','Reels','19-Mar-70','Female','858371898','Fair','Level 1',40,2700);
Insert Into  Teacher Values (540,'Brian','Phillips','Cloghan','Cloghan','Offaly','Hornpipes','28-May-78','Male','858371000','Good','Level 2',50,2800);
Insert Into  Teacher Values (550,'Brendan','Reilly','Belmont','Belmont','Offaly','Jigs','18-Nov-95','Male','858371121','Excellent','Level 3',10,2900);
Insert Into  Teacher Values (560,'David','Reilly','Ballisodare','Ballisodare','Sligo','Reels','11-Feb-96','Male','858371213','Fair','Level 1',20,2400);
Insert Into  Teacher Values (570,'C','Kelly','Coolaney','Coolaney','Sligo','Hornpipes','18-Feb-85','Female','898371814','Good','Level 2',10,2500);
Insert Into  Teacher Values (580,'Darren','Kirwin','Inniscrone','Inniscrone','Sligo','Reels','18-Feb-84','Female','858871814','Excellent','Level 3',20,2600);
Insert Into  Teacher Values (590,'Nicky','Malone','Collooney','Collooney','Sligo','Hornpipes','24-Aug-82','Male','858378814','Excellent','Level 1',170,2700);
Insert Into  Teacher Values (600,'Ollie','McDonnell','Ballymote','Ballymote','Sligo','Jigs','24-Aug-86','Female','858371890','Fair','Level 2',180,2800);
Insert Into  Teacher Values (610,'Cathal','Hanlon','Grange','Grange','Sligo','Reels','03-Nov-97','Female','858371999','Good','Level 3',190,2900);
Insert Into  Teacher Values (620,'Seamus','Hanlon','Cliffoney','Cliffoney','Sligo','Hornpipes','03-Apr-91','Male','858377623','Excellent','Level 3',200,2400);
Insert Into  Teacher Values (630,'JP','Rooney','Ballincar','Ballincar','Sligo','Reels','14-Mar-93','Female','858370631','Fair','Level 3',90,2500);
Insert Into  Teacher Values (640,'Mark','Stanfield','Gurteen','Gurteen','Sligo','Hornpipes','07-Jun-81','Male','812371814','Good','Level 1',100,2600);
Insert Into  Teacher Values (650,'B','McConnon','Easky','Easky','Sligo','Hornpipes','13-Jun-80','Female','858968814','Excellent','Level 1',110,2700);
Insert Into  Teacher Values (660,'Colin','Nally','Sligo','Sligo','Sligo','Jigs','09-Dec-30','Male','858312345','Good','Level 1',90,1000);
Insert Into  Teacher Values (670,'Martin','Farrelly','Ballinlough','Ballinlough',' Roscommon','Reels','29-Jun-31','Male','858387114','Excellent','Level 1',100,1100);
Insert Into  Teacher Values (680,'Aidan','O Neill','Clontuskert','Clontuskert',' Roscommon','Hornpipes','13-Oct-33','Male','858371333','Fair','Level 1',110,1200);
Insert Into  Teacher Values (690,'K','Reilly','Ballaghaderreen','Ballaghaderreen',' Roscommon','Reels','17-Jun-35','Female','858371418','Good','Level 1',10,1300);

/* Table Name:Dancer  */
/*Dancer_Id,ForeName,Surname,Address,Town,County,Date_Of_Birth,Gender,Height,Fav_Dance,Commitment,Weakness */
Insert Into  Dancer Values (11,'Maik','Taylor','Ballinlough','Ballinlough','Roscommon','14-Mar-93','Male',1.72,'Jigs ','Fair','time management');
Insert Into  Dancer Values (22,'Marcus','Hahnemann','Clontuskert','Clontuskert','Roscommon','7-Jun-81','Male',1.7,'Reels','Good','communication');
Insert Into  Dancer Values (33,'Kit','Symons','Ballaghaderreen','Ballaghaderreen','Roscommon','13-Jun-80','Female',1.6,'Hornpipes','Excellent','attention to details');
Insert Into  Dancer Values (44,'Chris','Coleman','Frenchpark','Frenchpark','Roscommon','9-Dec-30','Male',1.68,'Reels','Fair',NULL);
Insert Into  Dancer Values (55,'Steve','Finnan','Boyle','Boyle','Roscommon','29-Jun-31','Male',1.65,'Hornpipes','Excellent','attention to details');
Insert Into  Dancer Values (66,'Alain','Goma','Ballyfarnon','Ballyfarnon','Roscommon','13-Oct-33','Female',1.5,NULL,'Fair','attention to details');
Insert Into  Dancer Values (77,'Andy','Melville','Castlerea','Castlerea','Roscommon','17-Jun-35','Male',1.55,'Hornpipes','Excellent','attention to details');
Insert Into  Dancer Values (88,'Rufus','Brevett','Elphin','Elphin','Roscommon','9-Dec-30','Male',1.72,'Reels','Fair','attention to details');
Insert Into  Dancer Values (99,'Abdeslam','Ouaddou','Roscommon','Roscommon','Roscommon','29-Jun-31','Male',1.73,'Hornpipes','Excellent','attention to details');
Insert Into  Dancer Values (111,'Zatiyah','Knight','Inniscrone','Inniscrone',' Sligo','13-Oct-33','Female',1.77,NULL,'Fair','time management');
Insert Into  Dancer Values (222,'Callum','Willock','Collooney','Collooney',' Sligo','17-Jun-35','Female',1.5,'Reels','Good','communication');
Insert Into  Dancer Values (333,'Lee','Clark','Ballymote','Ballymote',' Sligo','11-Feb-96','Female',1.51,'Hornpipes','Excellent','attention to details');
Insert Into  Dancer Values (444,'Bjarne','Goldbaek','Grange','Grange',' Sligo','28-May-78','Female',1.66,'Reels',NULL,NULL);
Insert Into  Dancer Values (555,'Sean','Davis','Cliffoney','Cliffoney',' Sligo','18-Nov-95','Male',1.45,'Hornpipes','Excellent',NULL);
Insert Into  Dancer Values (666,'Barry','Hayles','Ballincar','Ballincar',' Sligo','11-Feb-96','Male',1.74,NULL,'Fair',NULL);
Insert Into  Dancer Values (777,'John','Collins','Frenchpark','Frenchpark','Roscommon','18-Feb-85','Male',1.69,'Hornpipes','Fair',NULL);
Insert Into  Dancer Values (888,'Paul','Trollope','Boyle','Boyle','Roscommon','18-Feb-84','Male',1.68,'Reels','Fair',NULL);
Insert Into  Dancer Values (999,'Thomas','Hutchison','Ballyfarnon','Ballyfarnon','Roscommon','28-May-78','Male',1.66,'Jigs ',NULL,NULL);
Insert Into  Dancer Values (1111,'Louis','Saha','Castlerea','Castlerea','Roscommon','18-Nov-95','Male',1.75,'Jigs ',NULL,'communication');
Insert Into  Dancer Values (2222,'Luis','Boa Morte','Elphin','Elphin','Roscommon','11-Feb-96','Male',1.8,'Jigs ','Fair','communication');

/* Table Name: Venue*/
/*Venue_Id,Length,Width,Floor_Type ,Heating,Yr_Running_Cost */
Insert Into Venue Values (1,120,100,'Concrete','None',22000);
Insert Into Venue Values (2,110,70,'Wood','Oil',22500);
Insert Into Venue Values (3,88,72,'Tiles','Gas',20000);
Insert Into Venue Values (4,67,50,'Concrete','Electric',NULL);
Insert Into Venue Values (5,120,76,'Wood','Gas',16000);
Insert Into Venue Values (6,110,54,'Tiles','Gas',17500);
Insert Into Venue Values (7,100,45,'Concrete','Gas',18000);
Insert Into Venue Values (8,66,45,'Wood','Gas',19000);
Insert Into Venue Values (9,78,70,'Tiles','Electric',20000);
Insert Into Venue Values (10,90,66,'Wood','Electric',23000);
Insert Into Venue Values (11,102,90,'Concrete','Gas',24000);
Insert Into Venue Values (12,99,78,'Wood','Electric',22000);
Insert Into Venue Values (13,88,76,'Concrete','Gas',21500);
Insert Into Venue Values (14,70,65,NULL,'Oil',25000);
Insert Into Venue Values (15,88,61,NULL,'Electric',21000);
Insert Into Venue Values (16,76,60,NULL,NULL,NULL);
Insert Into Venue Values (17,87,70,'Wood','Oil',17000);
Insert Into Venue Values (18,86,50,'Wood','Oil',17500);
Insert Into Venue Values (19,66,40,'Wood','Oil',16000);
Insert Into Venue Values (20,77,60,'Wood','Oil',19000);

/*Table Name:Lesson  */
/*  Teacher_Id,Dancer_Id,Venue_Id,Lesson_Date,Teacher_Fee,Topic,Progress */
Insert Into  Lesson Values (560,444,8,'26-Sep-19',5600,'Posture','Poor');
Insert Into  Lesson Values (570,555,9,'22-Jun-19',5700,'Turning','Fair');
Insert Into  Lesson Values (580,666,10,'4-Jan-19',5800,'Use of Feet','Good');
Insert Into  Lesson Values (590,777,11,'13-Dec-19',5900,'Arm Action','Excellent');
Insert Into  Lesson Values (600,888,16,'8-Sep-19',6000,'Use of Feet','Poor');
Insert Into  Lesson Values (610,999,17,'4-Jun-19',6100,'Arm Action','Fair');
Insert Into  Lesson Values (620,1111,18,'1-Mar-20',6200,'Posture','Poor');
Insert Into  Lesson Values (580,2222,19,'25-Nov-19',5800,'Turning','Fair');
Insert Into  Lesson Values (590,11,20,'21-Aug-10',5900,'Use of Feet','Good');
Insert Into  Lesson Values (600,22,11,'26-Sep-19',6000,'Arm Action','Excellent');
Insert Into  Lesson Values (590,555,12,'26-Sep-19',5900,'Use of Feet','Good');
Insert Into  Lesson Values (600,666,13,'9-Aug-20',6000,'Arm Action','Excellent');
Insert Into  Lesson Values (600,777,14,'16-Jan-20',6000,'Arm Action','Poor');
Insert Into  Lesson Values (500,888,15,'26-Oct-18',5000,'Arm Action','Fair');
Insert Into  Lesson Values (510,77,16,'26-Sep-19',5100,'Arm Action','Good');
Insert Into  Lesson Values (520,88,17,'26-Sep-19',5200,'Posture','Excellent');
Insert Into  Lesson Values (530,99,18,'13-Dec-21',5300,'Turning','Poor');
Insert Into  Lesson Values (540,666,19,'13-Dec-20',5400,'Use of Feet','Fair');
Insert Into  Lesson Values (520,777,20,'26-Sep-19',5200,'Arm Action','Good');
Insert Into  Lesson Values (530,333,3,'26-Sep-19',5300,'Posture','Fair');

/* Number of rows inserted for each table */
Select Count(*) From Lesson;
Select Count(*) From Venue;
Select Count(*) From Dancer;
Select Count(*) From Teacher;
Select Count(*) From Dancing_School;
Select Count(*) From College;

