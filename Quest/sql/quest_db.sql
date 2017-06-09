drop database quest_db;
create database quest_db;
use quest_db;

create table board(
	boardFlag int,
	bCompleteFlag int,
	boardNo int auto_increment primary key,
	userIndex int,
	date Date,
	policeCount int,
	readCount int,
	title varchar(50),
	addrNo int,
	reward1 varchar(30),
	reward2 varchar(30),
	reward3 varchar(30),
	people int,
	contactNo int,
	stTime varchar(20),
	playTime varchar(20),
	content varchar(500)
);

create table user(
	userIndex int auto_increment primary key,
	userId varchar(30),
	password varchar(30),
	nickname varchar(30),
	starPoint float,
	doCount int
);


create table apply(
	boardNo int,
	rewardNo int,
	contactAnswer varchar(50),
	content varchar(500),
	userIndex int,
	aCompleteFlag int
);

create table comment(
	boardNo int,
	userIndex int,
	date Date,
	content varchar(500)
);

create table score(
	user1Index int,
	user2Index int,
	boardNo int,
	sCompleteFlag int,
	user1StarPoint float,
	user2StarPoint float
);
create table bookmark(	
	boardNo int,	
	userIndex int,
	bookdate date	
);	
	
create table police(	
	boardNo int,	
	userIndex int
);	


create table contact (
	contact varchar(30),
	contactNo int
);

insert into contact values ("kakaotalk", 1);
insert into contact values ("email", 2);
insert into contact values ("phone", 3);

CREATE TABLE `address` (
  `addrNo` int(11) NOT NULL AUTO_INCREMENT,
  `sido` varchar(4) DEFAULT NULL,
  `gungu` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`addrNo`)
) ENGINE=InnoDB AUTO_INCREMENT=4837 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'서울','강남구'),(32,'서울','강동구'),(56,'서울','강북구'),(71,'서울','강서구'),(101,'서울','관악구'),(121,'서울','광진구'),(139,'서울','구로구'),(161,'서울','금천구'),(173,'서울','노원구'),(197,'서울','도봉구'),(215,'서울','동대문구'),(235,'서울','동작구'),(256,'서울','마포구'),(286,'서울','서대문구'),(315,'서울','서초구'),(339,'서울','성동구'),(363,'서울','성북구'),(415,'서울','송파구'),(450,'서울','양천구'),(470,'서울','영등포구'),(514,'서울','용산구'),(554,'서울','은평구'),(573,'서울','종로구'),(665,'서울','중구'),(745,'서울','중랑구'),(787,'부산','금정구'),(810,'부산','남구'),(834,'부산','동구'),(852,'부산','동래구'),(870,'부산','부산진구'),(901,'부산','북구'),(918,'부산','사상구'),(933,'부산','사하구'),(955,'부산','서구'),(981,'부산','수영구'),(994,'부산','연제구'),(1008,'부산','영도구'),(1075,'부산','해운대구'),(1098,'부산','기장군'),(1118,'대구','달서구'),(1265,'대구','수성구'),(1355,'대구','달성군'),(1364,'인천','계양구'),(1416,'인천','남동구'),(1451,'인천','부평구'),(1504,'인천','연수구'),(1562,'인천','강화군'),(1575,'인천','옹진군'),(1582,'광주','광산구'),(1783,'대전','대덕구'),(1871,'대전','유성구'),(1997,'울산','울주군'),(2009,'강원','강릉시'),(2046,'강원','동해시'),(2076,'강원','삼척시'),(2104,'강원','속초시'),(2111,'강원','원주시'),(2133,'강원','춘천시'),(2170,'강원','태백시'),(2189,'강원','고성군'),(2194,'강원','양구군'),(2197,'강원','양양군'),(2202,'강원','영월군'),(2210,'강원','인제군'),(2214,'강원','정선군'),(2222,'강원','철원군'),(2228,'강원','평창군'),(2236,'강원','홍천군'),(2243,'강원','화천군'),(2248,'강원','횡성군'),(2257,'경기','고양시 덕양구'),(2283,'경기','고양시 일산동구'),(2300,'경기','고양시 일산서구'),(2309,'경기','과천시'),(2317,'경기','광명시'),(2342,'경기','광주시'),(2356,'경기','구리시'),(2369,'경기','군포시'),(2385,'경기','김포시'),(2398,'경기','남양주시'),(2416,'경기','동두천시'),(2430,'경기','부천시 소사구'),(2441,'경기','부천시 오정구'),(2449,'경기','부천시 원미구'),(2467,'경기','성남시 분당구'),(2483,'경기','성남시 수정구'),(2501,'경기','성남시 중원구'),(2513,'경기','수원시 권선구'),(2528,'경기','수원시 영통구'),(2540,'경기','수원시 장안구'),(2554,'경기','수원시 팔달구'),(2575,'경기','시흥시'),(2601,'경기','안산시 단원구'),(2619,'경기','안산시 상록구'),(2638,'경기','안성시'),(2667,'경기','안양시 동안구'),(2680,'경기','안양시 만안구'),(2697,'경기','양주시'),(2717,'경기','오산시'),(2733,'경기','용인시 기흥구'),(2750,'경기','용인시 수지구'),(2760,'경기','용인시 처인구'),(2774,'경기','의왕시'),(2784,'경기','의정부시'),(2804,'경기','이천시'),(2821,'경기','파주시'),(2855,'경기','평택시'),(2883,'경기','포천시'),(2897,'경기','하남시'),(2920,'경기','화성시'),(2953,'경기','가평군'),(2958,'경기','양평군'),(2970,'경기','여주군'),(2980,'경기','연천군'),(2990,'경남','거제시'),(3010,'경남','김해시'),(3034,'경남','밀양시'),(3050,'경남','사천시'),(3074,'경남','양산시'),(3089,'경남','진주시'),(3129,'경남','창원시 마산합포구'),(3178,'경남','창원시 마산회원구'),(3196,'경남','창원시 성산구'),(3217,'경남','창원시 의창구'),(3237,'경남','창원시 진해구'),(3272,'경남','통영시'),(3288,'경남','거창군'),(3313,'경남','남해군'),(3319,'경남','산청군'),(3330,'경남','의령군'),(3342,'경남','창녕군'),(3355,'경남','하동군'),(3368,'경남','함안군'),(3377,'경남','함양군'),(3387,'경남','합천군'),(3404,'경북','경산시'),(3423,'경북','경주시'),(3458,'경북','구미시'),(3490,'경북','김천시'),(3512,'경북','문경시'),(3525,'경북','상주시'),(3563,'경북','안동시'),(3596,'경북','영주시'),(3621,'경북','영천시'),(3651,'경북','포항시 남구'),(3665,'경북','포항시 북구'),(3686,'경북','고령군'),(3692,'경북','군위군'),(3700,'경북','봉화군'),(3710,'경북','성주군'),(3719,'경북','영덕군'),(3726,'경북','영양군'),(3732,'경북','예천군'),(3741,'경북','울릉군'),(3742,'경북','울진군'),(3749,'경북','의성군'),(3766,'경북','청도군'),(3775,'경북','청송군'),(3783,'경북','칠곡군'),(3790,'전남','광양시'),(3803,'전남','나주시'),(3834,'전남','목포시'),(3879,'전남','순천시'),(3908,'전남','여수시'),(3943,'전남','강진군'),(3954,'전남','고흥군'),(3967,'전남','곡성군'),(3978,'전남','구례군'),(3985,'전남','담양군'),(3993,'전남','무안군'),(4002,'전남','보성군'),(4014,'전남','신안군'),(4028,'전남','영광군'),(4038,'전남','영암군'),(4047,'전남','완도군'),(4058,'전남','장성군'),(4068,'전남','장흥군'),(4078,'전남','진도군'),(4084,'전남','함평군'),(4091,'전남','해남군'),(4099,'전남','화순군'),(4106,'전북','군산시'),(4145,'전북','김제시'),(4172,'전북','남원시'),(4200,'전북','익산시'),(4235,'전북','전주시 덕진구'),(4263,'전북','전주시 완산구'),(4299,'전북','정읍시'),(4323,'전북','고창군'),(4335,'전북','무주군'),(4339,'전북','부안군'),(4349,'전북','순창군'),(4359,'전북','완주군'),(4369,'전북','임실군'),(4379,'전북','장수군'),(4386,'전북','진안군'),(4395,'제주','제주시'),(4439,'제주','서귀포시'),(4463,'충남','계룡시'),(4466,'충남','공주시'),(4489,'충남','논산시'),(4509,'충남','보령시'),(4527,'충남','서산시'),(4541,'충남','아산시'),(4567,'충남','천안시 동남구'),(4585,'충남','천안시 서북구'),(4602,'충남','금산군'),(4610,'충남','당진군'),(4620,'충남','부여군'),(4634,'충남','서천군'),(4642,'충남','연기군'),(4646,'충남','예산군'),(4656,'충남','청양군'),(4663,'충남','태안군'),(4670,'충남','홍성군'),(4680,'충북','제천시'),(4696,'충북','청주시 상당구'),(4722,'충북','청주시 흥덕구'),(4754,'충북','충주시'),(4783,'충북','괴산군'),(4794,'충북','단양군'),(4798,'충북','보은군'),(4807,'충북','영동군'),(4816,'충북','옥천군'),(4821,'충북','음성군'),(4828,'충북','증평군'),(4830,'충북','진천군'),(4836,'충북','청원군');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

	
insert into board values
(0,0,0,1,"2017-01-01",0,0,"심부름할게요",1,"원두커피","5000원","심부름",1,1,"2017-01-02","30m","맡겨만 주세요!!");
insert into board values
(0,0,0,2,"2017-01-01",1,2,"배달합니다",5,"원두커피","5000원","심부름",1,3,"2017-01-05","over3h","오토바이 보유!! 유경험자");
insert into board values
(0,1,0,3,"2017-01-05",0,5,"청소가능",100,"원두커피","5000원","",1,2,"2017-01-08","3h","구석구석 싹싹~");
insert into board values
(0,1,0,4,"2017-01-10",3,6,"대리시험 봐드려요",571,"원두커피","5000원","심부름",1,1,"2017-01-12","3h","영어회화관련 보장합니다!! ");
insert into board values
(0,2,0,5,"2017-01-11",0,1,"놀아드립니다",1999,"상품권","50000원","",1,3,"2017-01-12","3h","놀이공원 같이 가드리고~ 커피샵도 같이 가드리고 ");
insert into board values
(1,0,0,6,"2017-01-02",2,8,"청소하실분",2181,"원두커피","5000원","심부름",1,2,"2017-01-02","3h","15평 원룸청소입니다. 쉽죠??!!");
insert into board values
(1,0,0,7,"2017-01-03",6,9,"이사짐센터~~",1571,"원두커피","5000원","심부름",1,1,"2017-01-06","3h","전문 포장이사 잘하시는분. 견적주셈");
insert into board values
(1,1,0,8,"2017-01-07",1,10,"1시간 얘봐주실분",511,"원두커피","5000원","",1,1,"2017-01-09","3h","오후 2~3시 1시간만 봐주세요 ");
insert into board values
(1,1,0,9,"2017-01-09",0,20,"요리 부탁합니다.",9,"원두커피","5000원","심부름",1,3,"2017-01-12","3h","김치찌개가 너무 먹고픈데 ㅠ.ㅠ. 같이 먹어주심 좋구요");
insert into board values
(1,2,0,10,"2017-01-10",2,30,"구매대행이요요",181,"원두커피","5000원","",1,2,"2017-01-12","3h","유럽여행 가시는분!! 필독하셈");

insert into bookmark values(1,1);
insert into bookmark values(1,5);
insert into bookmark values(3,3);
insert into bookmark values(4,2);
insert into bookmark values(1,9);
insert into bookmark values(5,2);
insert into bookmark values(2,1);
insert into bookmark values(7,4);
insert into bookmark values(8,8);
insert into bookmark values(9,4);

insert into police values(1,1);
insert into police values(1,5);
insert into police values(3,3);
insert into police values(4,2);
insert into police values(1,9);
insert into police values(5,2);
insert into police values(2,1);
insert into police values(7,4);
insert into police values(8,8);
insert into police values(9,4);

insert into apply values(1,1,"핸펀","저 잘해요",3,1);
insert into apply values(1,2,"0001","뽑아주셈",5,1);
insert into apply values(3,1,"email","저요저요",8,1);
insert into apply values(2,2,"phone","저밖에 읍네요ㅋ",6,1);
insert into apply values(7,1,"ID:jjang","좀잘~",2,1);

insert into comment values(1,2,"2017-01-05","졸귀");
insert into comment values(1,5,"2017-01-15","2빠");
insert into comment values(1,7,"2017-01-25","3빠");
insert into comment values(2,8,"2017-01-13","여기 졸맛");
insert into comment values(4,1,"2017-01-04","개재미");
insert into comment values(7,3,"2017-01-08","푸헤헤헤헤헤");


insert into user values (0,'1_ID', '111', '1_nick',0, 0);	
insert into user values (0,'2_ID', '111', '2_nick',0, 0);	
insert into user values (0,'3_ID', '111', '3_nick',0, 0);	
insert into user values (0,'4_ID', '111', '4_nick',0, 0);	
insert into user values (0,'5_ID', '111', '5_nick',0, 0);
insert into user values(0,"6_id","111", "6_nick",0,0);
insert into user values(0,"7_id","111", "7_nick",0,0);
insert into user values(0,"8_id","111", "8_nick",0,0);
insert into user values(0,"9_id","111", "9_nick",0,0);
insert into user values(,"10_id","111", "10_nick",0,0);
insert into user values (0,'11_ID', '111', '11_nick',0, 0);	
insert into user values (0,'12_ID', '111', '12_nick',0, 0);	
insert into user values (0,'13_ID', '111', '13_nick',0, 0);	
insert into user values (0,'14_ID', '111', '14_nick',0, 0);	
insert into user values (0,'15_ID', '111', '15_nick',0, 0);
insert into user values(0,"16_id","111", "16_nick",0,0);
insert into user values(0,"17_id","111", "17_nick",0,0);
insert into user values(0,"18_id","111", "18_nick",0,0);
insert into user values(0,"19_id","111", "19_nick",0,0);
insert into user values(0,"20_id","111", "20_nick",0,0);


insert into board values
(0,0,0,1,"2017-01-01",0,0,"심부름할게요",1,"원두커피","5000원","심부름",1,1,"2017-01-02","30m","맡겨만 주세요!!");
insert into board values
(0,0,0,2,"2017-01-01",1,2,"배달합니다",5,"원두커피","5000원","심부름",1,3,"2017-01-05","3h","오토바이 보유!! 유경험자");
insert into board values
(0,1,0,3,"2017-01-05",0,5,"청소가능",100,"원두커피","5000원","",1,2,"2017-01-08","over3h","구석구석 싹싹~");
insert into board values
(0,1,0,4,"2017-01-10",3,6,"대리시험 봐드려요",571,"원두커피","5000원","심부름",1,1,"2017-01-12","30m","영어회화관련 보장합니다!! ");
insert into board values
(0,2,0,5,"2017-01-11",0,1,"놀아드립니다",1999,"상품권","50000원","",1,3,"2017-01-12","30m","놀이공원 같이 가드리고~ 커피샵도 같이 가드리고 ");
insert into board values
(1,0,0,6,"2017-01-02",2,8,"청소하실분",2181,"원두커피","5000원","심부름",1,2,"2017-01-02","30m","15평 원룸청소입니다. 쉽죠??!!");
insert into board values
(1,0,0,7,"2017-01-03",6,9,"이사짐센터~~",1571,"원두커피","5000원","심부름",1,1,"2017-01-06","3h","전문 포장이사 잘하시는분. 견적주셈");
insert into board values
(1,1,0,8,"2017-01-07",1,10,"1시간 얘봐주실분",511,"원두커피","5000원","",1,1,"2017-01-09","3h","오후 2~3시 1시간만 봐주세요 ");
insert into board values
(1,1,0,9,"2017-01-09",0,20,"요리 부탁합니다.",9,"원두커피","5000원","심부름",1,3,"2017-01-12","over3h","김치찌개가 너무 먹고픈데 ㅠ.ㅠ. 같이 먹어주심 좋구요");
insert into board values
(1,2,0,10,"2017-01-10",2,30,"구매대행이요요",181,"원두커피","5000원","",1,2,"2017-01-12","3h","유럽여행 가시는분!! 필독하셈");
insert into board values
(0,0,0,1,"2017-01-01",0,0,"심부름할게요",1,"원두커피","5000원","심부름",1,1,"2017-01-02","3h","맡겨만 주세요!!");
insert into board values
(0,0,0,2,"2017-01-01",1,2,"배달합니다",5,"원두커피","5000원","심부름",1,3,"2017-01-05","30m","오토바이 보유!! 유경험자");
insert into board values
(0,1,0,3,"2017-01-05",0,5,"청소가능",100,"원두커피","5000원","",1,2,"2017-01-08","3h","구석구석 싹싹~");
insert into board values
(0,1,0,4,"2017-01-10",3,6,"대리시험 봐드려요",571,"원두커피","5000원","심부름",1,1,"2017-01-12","30m","영어회화관련 보장합니다!! ");
insert into board values
(0,2,0,5,"2017-01-11",0,1,"놀아드립니다",1999,"상품권","50000원","",1,3,"2017-01-12","3h","놀이공원 같이 가드리고~ 커피샵도 같이 가드리고 ");
insert into board values
(1,0,0,6,"2017-01-02",2,8,"청소하실분",2181,"원두커피","5000원","심부름",1,2,"2017-01-02","30m","15평 원룸청소입니다. 쉽죠??!!");
insert into board values
(1,0,0,7,"2017-01-03",6,9,"이사짐센터~~",1571,"원두커피","5000원","심부름",1,1,"2017-01-06","3h","전문 포장이사 잘하시는분. 견적주셈");
insert into board values
(1,1,0,8,"2017-01-07",1,10,"1시간 얘봐주실분",511,"원두커피","5000원","",1,1,"2017-01-09","3h","오후 2~3시 1시간만 봐주세요 ");
insert into board values
(1,1,0,9,"2017-01-09",0,20,"요리 부탁합니다.",9,"원두커피","5000원","심부름",1,3,"2017-01-12","3h","김치찌개가 너무 먹고픈데 ㅠ.ㅠ. 같이 먹어주심 좋구요");
insert into board values
(1,2,0,10,"2017-01-10",2,30,"구매대행이요요",181,"원두커피","5000원","",1,2,"2017-01-12","3h","유럽여행 가시는분!! 필독하셈");
insert into board values
(0,0,0,1,"2017-01-01",0,0,"심부름할게요",1,"원두커피","5000원","심부름",1,1,"2017-01-02","3h","맡겨만 주세요!!");
insert into board values
(0,0,0,2,"2017-01-01",1,2,"배달합니다",5,"원두커피","5000원","심부름",1,3,"2017-01-05","3h","오토바이 보유!! 유경험자");
insert into board values
(0,1,0,3,"2017-01-05",0,5,"청소가능",100,"원두커피","5000원","",1,2,"2017-01-08","3h","구석구석 싹싹~");
insert into board values
(0,1,0,4,"2017-01-10",3,6,"대리시험 봐드려요",571,"원두커피","5000원","심부름",1,1,"2017-01-12","30m","영어회화관련 보장합니다!! ");
insert into board values
(0,2,0,5,"2017-01-11",0,1,"놀아드립니다",1999,"상품권","50000원","",1,3,"2017-01-12","3h","놀이공원 같이 가드리고~ 커피샵도 같이 가드리고 ");
insert into board values
(1,0,0,6,"2017-01-02",2,8,"청소하실분",2181,"원두커피","5000원","심부름",1,2,"2017-01-02","3h","15평 원룸청소입니다. 쉽죠??!!");
insert into board values
(1,0,0,7,"2017-01-03",6,9,"이사짐센터~~",1571,"원두커피","5000원","심부름",1,1,"2017-01-06","3h","전문 포장이사 잘하시는분. 견적주셈");
insert into board values
(1,1,0,8,"2017-01-07",1,10,"1시간 얘봐주실분",511,"원두커피","5000원","",1,1,"2017-01-09","3h","오후 2~3시 1시간만 봐주세요 ");
insert into board values
(1,1,0,9,"2017-01-09",0,20,"요리 부탁합니다.",9,"원두커피","5000원","심부름",1,3,"2017-01-12","3h","김치찌개가 너무 먹고픈데 ㅠ.ㅠ. 같이 먹어주심 좋구요");
insert into board values
(1,2,0,10,"2017-01-10",2,30,"구매대행이요요",181,"원두커피","5000원","",1,2,"2017-01-12","3h","유럽여행 가시는분!! 필독하셈");



insert into board values
(0,0,0,1,"2017-01-01",0,0,"심부름할게요",1,"원두커피","5000원","심부름",1,1,"2017-01-02","3h","맡겨만 주세요!!");
insert into board values
(0,0,0,1,"2017-01-01",1,2,"배달합니다",5,"원두커피","5000원","심부름",1,3,"2017-01-05","3h","오토바이 보유!! 유경험자");
insert into board values
(0,1,0,1,"2017-01-05",0,5,"청소가능",100,"원두커피","5000원","",1,2,"2017-01-08","3h","구석구석 싹싹~");
insert into board values
(0,1,0,1,"2017-01-10",3,6,"대리시험 봐드려요",571,"원두커피","5000원","심부름",1,1,"2017-01-12","3h","영어회화관련 보장합니다!! ");
insert into board values
(0,2,0,1,"2017-01-11",0,1,"놀아드립니다",1999,"상품권","50000원","",1,3,"2017-01-12","30m","놀이공원 같이 가드리고~ 커피샵도 같이 가드리고 ");
insert into board values
(1,0,0,1,"2017-01-02",2,8,"청소하실분",2181,"원두커피","5000원","심부름",1,2,"2017-01-02","3h","15평 원룸청소입니다. 쉽죠??!!");
insert into board values
(1,0,0,1,"2017-01-03",6,9,"이사짐센터~~",1571,"원두커피","5000원","심부름",1,1,"2017-01-06","3h","전문 포장이사 잘하시는분. 견적주셈");
insert into board values
(1,1,0,1,"2017-01-07",1,10,"1시간 얘봐주실분",511,"원두커피","5000원","",1,1,"2017-01-09","30m","오후 2~3시 1시간만 봐주세요 ");
insert into board values
(1,1,0,1,"2017-01-09",0,20,"요리 부탁합니다.",9,"원두커피","5000원","심부름",1,3,"2017-01-12","3h","김치찌개가 너무 먹고픈데 ㅠ.ㅠ. 같이 먹어주심 좋구요");
insert into board values
(1,2,0,1,"2017-01-10",2,30,"구매대행이요요",181,"원두커피","5000원","",1,2,"2017-01-12","3h","유럽여행 가시는분!! 필독하셈");
insert into board values
(0,0,0,1,"2017-01-01",0,0,"심부름할게요",1,"원두커피","5000원","심부름",1,1,"2017-01-02","3h","맡겨만 주세요!!");


insert into board values
(1,0,0,1,"2017-01-01",0,0,"심부름할게요",1,"원두커피","5000원","심부름",1,1,"2017-01-03","30m","맡겨만 주세요!!");
insert into board values
(1,0,0,2,"2017-01-01",0,0,"심부름할게요",1,"원두커피","5000원","심부름",1,1,"2017-01-05","30m","맡겨만 주세요!!");
insert into board values
(1,0,0,1,"2017-01-01",0,0,"심부름할게요",1,"원두커피","5000원","심부름",1,1,"2017-03-02","30m","맡겨만 주세요!!");
insert into board values
(1,0,0,1,"2017-01-01",0,0,"심부름할게요",1,"원두커피","5000원","심부름",1,1,"2017-08-02","30m","맡겨만 주세요!!");
insert into board values
(1,0,0,2,"2017-01-01",0,0,"심부름할게요",1,"원두커피","5000원","심부름",1,1,"2017-04-02","30m","맡겨만 주세요!!");
insert into board values
(1,0,0,1,"2017-01-01",0,0,"심부름할게요",1,"원두커피","5000원","심부름",1,1,"2017-06-02","30m","맡겨만 주세요!!");


 truncate table bookmark;


insert into bookmark values(11,1,sysdate());
insert into bookmark values(11,1,sysdate());
insert into bookmark values(21,1,sysdate());
insert into bookmark values(31,1,sysdate());


insert into bookmark values(12,2,sysdate());
insert into bookmark values(22,2,sysdate());
insert into bookmark values(32,2,sysdate());
insert into bookmark values(2,2,sysdate());


insert into bookmark values(3,3,sysdate());
insert into bookmark values(13,3,sysdate());
insert into bookmark values(23,3,sysdate());
insert into bookmark values(33,3,sysdate());



insert into bookmark values(4,4,sysdate());
insert into bookmark values(14,4,sysdate());
insert into bookmark values(24,4,sysdate());
insert into bookmark values(34,4,sysdate());

insert into bookmark values(5,5,sysdate());
insert into bookmark values(15,5,sysdate());
insert into bookmark values(25,5,sysdate());
insert into bookmark values(35,5,sysdate());

insert into bookmark values(6,6,sysdate());

insert into bookmark values(16,6,sysdate());
insert into bookmark values(26,1,sysdate());
insert into bookmark values(36,6,sysdate());

insert into bookmark values(7,7,sysdate());
insert into bookmark values(17,7,sysdate());
insert into bookmark values(27,7,sysdate());
insert into bookmark values(37,1,sysdate());

insert into bookmark values(8,1,sysdate());


insert into bookmark values(9,9,sysdate());



insert into bookmark values(10,1,sysdate());










insert into apply values(46, 2, "contact", "나할꺼임", 1, 1);
insert into apply values(45, 2, "contact", "나할꺼임", 2, 1);
insert into apply values(44, 2, "contact", "나할꺼임", 1, 1);
insert into apply values(43, 2, "contact", "나할꺼임", 2, 1);
insert into apply values(42, 2, "contact", "나할꺼임", 1, 1);
insert into apply values(33, 2, "contact", "나할꺼임", 2, 1);
insert into apply values(31, 2, "contact", "나할꺼임", 2, 1);
insert into apply values(32, 2, "contact", "나할꺼임", 1, 1);
insert into apply values(30, 2, "contact", "나할꺼임", 2, 1);








insert into score values(1,2,1,0,3,4);
insert into score values(1,3,11,1,4,2);
insert into score values(1,4,21,2,5,3);
insert into score values(1,8,31,3,1,4);
insert into score values(1,2,41,3,0,5);

insert into score values(2,1,2,0,3,4);
insert into score values(2,3,12,1,4,2);
insert into score values(2,4,22,2,5,3);
insert into score values(2,8,32,3,1,4);
insert into score values(2,2,42,3,0,5);

alter table user add column loginCategory int;
update user set logincategory = 1;
alter table user change column password password varchar(100);

alter table user add column findPwQ int;
alter table user add column findPwA varchar(100);


insert into address values(0, '인천', '남구');
insert into address values(0, '인천', '서구');
insert into address values(0, '인천', '동구');
insert into address values(0, '인천', '중구');

insert into address values(0, '대전', '서구');
insert into address values(0, '대전', '동구');
insert into address values(0, '대전', '중구');

insert into address values(0, '울산', '중구');
insert into address values(0, '울산', '동구');
insert into address values(0, '울산', '남구');
insert into address values(0, '울산', '북구');

insert into address values(0, '대구', '중구');
insert into address values(0, '대구', '남구');
insert into address values(0, '대구', '동구');
insert into address values(0, '대구', '서구');
insert into address values(0, '대구', '북구');


insert into address values(0, '광주', '남구');
insert into address values(0, '광주', '동구');
insert into address values(0, '광주', '서구');
insert into address values(0, '광주', '북구');


alter table comment add column comment_group int;
alter table comment add column comment_seq int;
alter table comment add column comment_lv int;


create table boardFile(
	fileId int auto_increment primary key,
	boardNo int,
	uri varchar(200),
	size int,
	origin_file_name varchar(200),
	flag int
);

alter table boardfile add column dbfile longblog;


