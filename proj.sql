create database sltb;
use sltb;
create table Bus(
chassiid varchar(30)not null,
Busownerid varchar(30),
Beginningstationid varchar(30),
Endingstationid varchar(30),
bushiringprice int,
conductorid varchar(30),
driverid varchar(30),
noofsheets int,
primary key (chassiid )

);
 create table busstation(
busstationid varchar(30) not null primary key,
busstationname varchar(30));
create table busstop(
busstopid varchar(30) not null primary key,
busstopname varchar(30));
create table busstops(
busstopid varchar(30) not null,

travelid varchar(30)not null,
primary key(busstopid,travelid),
foreign key(travelid)references travel(travelid),
foreign key(busstopid)references busstop(busstopid));

create table travel(
travelid varchar(30)not null primary key,
chassiid varchar(30)not null,
travelbeginningtime time,
travelendingtime time,
foreign key(chassiid)references Bus(chassiid));
create table Busowner (
Busownerid varchar(30) not null primary key,
chassiid varchar(30),
owner’sfname varchar(30),
owner’slname varchar(30)

);
alter table Busowner
add foreign key(chassiid)references Bus(chassiid);
alter table Bus
add foreign key(Busownerid)references Busowner(Busownerid);
alter table Bus
add foreign key(driverid)references driver(driverid);
alter table Bus
add foreign key(conductorid)references Conductor(conductorid);
alter table Bus
add foreign key(beginningstationid)references busstation(busstationid);
alter table Bus
add foreign key(endingstationid)references busstation(busstationid);

create table Orders(
orderid varchar(30) not null primary key,
userid varchar(30),
chassiid varchar(30),
wantdate date,
wanttime time,
availability varchar(30),
ordercondition varchar(30),
deliverdate date,
delivertime time,
prefertype varchar(30),
foreign key(chassiid)references Bus(chassiid));
create table Timetable (
choiceid varchar(30) not null primary key,
chassiid varchar(30),
preferbeginningstationid varchar(30),
preferendingstationid varchar(30),
preferbegintime time, 
preferbegindate date,
foreign key(chassiid)references Bus(chassiid),
foreign key(preferbeginningstationid)references busstation(busstationid),
foreign key(preferendingstationid)references busstation(busstationid)
);
create table Contactinformation(
contactid varchar(30)not null primary key,
contactname varchar(30),
emailaddress varchar(30)
);
create table ContacttelephoneNo(
contactid varchar(30)not null ,
telephoneno int not null,
primary key(contactid,telephoneno),
foreign key(contactid)references Contactinformation(contactid));
create table Notice(
noticeid varchar(30)not null primary key,
userid varchar(30),
noticetype varchar(30),
description varchar(30),
postdate date,
posttime time);
create table Complain(
complainid varchar(30)not null primary key ,
userid varchar(30),
complaintype varchar(30),
postdate date,
posttime time,
description varchar(30),
complaincondition varchar(30));
create table item(
itemid varchar(30) ,
itemtype varchar(30),
description varchar(30));
alter table item
add primary key (itemid);
create table Lost(
itemid varchar(30) not null primary key ,
lostdate date,
losttime time,
chassiid varchar(30),
userid varchar(30),
foreign key(chassiid)references Bus(chassiid),
foreign key(itemid)references item(itemid));
create table Collect(
itemid varchar(30) not null primary key,
conductorid varchar(30),
collectdate date,
collecttime time,
foreign key(itemid)references item(itemid)
);
create table user(
userid varchar(30) not null primary key ,
dob date,
address varchar(30),
usertype varchar(30),
user’semailaddress varchar(30),
appusemobileno int);
 alter table Lost
 add foreign key(userid)references user(userid);
 alter table Complain
 add foreign key(userid)references user(userid);
 alter table Notice
 add foreign key(userid)references user(userid);
 alter table Orders
 add foreign key(userid)references user(userid);
 create table choice(
 choiceid varchar(30) not null ,
 userid varchar(30) not null ,
 primary key(choiceid,userid),
 foreign key(userid)references user(userid),
 foreign key(choiceid)references Timetable(choiceid));
 create table Conductor(
 conductorid varchar(30) not null primary key,
 chassiid varchar(30),
 conductorpayment int,
 conductor’sfname varchar(30),conductor’slname varchar(30),
 appusemobileno int,
 emailaddress varchar(30),
 foreign key(chassiid)references Bus(chassiid)
 );
 alter table Collect
 add foreign key(conductorid)references Conductor(conductorid);
 create table driver(
 driverid varchar(30) not null primary key,
 chassiid varchar(30),
 driverpayment int,
 driver’sfname varchar(30) ,
 driver’slname varchar(30) ,
 appusemobileno int,
 emailaddress varchar(30),
  foreign key(chassiid)references Bus(chassiid)
 );
 create table institute(
 instituteid varchar(30) not null primary key,
 institutename varchar(30),
 address varchar(30),
 appusetelephoneno int,
 emailaddress varchar(30));
 create table ticket(
 ticketid varchar(30) not null primary key,
 tickettype varchar(30) ,
 ticketsize int,
 price int,
 passengerbeginningstopid varchar(30),
 passengerendingstopid varchar(30),
 foreign key(passengerbeginningstopid)references busstop(busstopid),
foreign key(passengerendingstopid)references busstop(busstopid)
 );
 create table issue(
 conductorid varchar(30) not null,
 ticketid varchar(30) not null,
 primary key(conductorid,ticketid),
 foreign key(conductorid)references Conductor(conductorid),
 foreign key(ticketid)references ticket(ticketid));
 create table seasonticketuser(
 userid varchar(30) not null primary key,
 ticketid varchar(30) not null , 
 instituteid varchar(30) not null,
 foreign key(ticketid)references ticket(ticketid),
 foreign key(userid)references user(userid),
 foreign key(instituteid)references institute(instituteid)
 );
 create table seasonticket(
 ticketid varchar(30) not null primary key,
 userid varchar(30),
 beginningdate date,
 endingdate date,
  foreign key(ticketid)references ticket(ticketid),
 foreign key(userid)references user(userid)
 );
 
select * from Bus;
select * from busstation;
select * from busstop;
select * from driver;
select * from user;
select * from Conductor;
select * from Lost;
select * from item;
 select * from busstops;
select * from Busowner;
select * from travel;
select * from choice;
select * from Orders;
select * from Timetable;
select * from Contactinformation;
select * from Contacttelephoneno;
select * from Notice;
select * from Complain;
select * from institute;
select * from ticket;
select * from seasonticket;
select * from seasonticketuser;
select * from Collect;





