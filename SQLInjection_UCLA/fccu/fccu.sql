-- MySQL dump 10.11
--
-- Host: localhost    Database: fccu
-- ------------------------------------------------------
-- Server version	5.0.45-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--
DROP DATABASE IF EXISTS `fccu`;
CREATE DATABASE `fccu`;
USE `fccu`;

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `bal` float default NULL,
  `first` varchar(30) NOT NULL,
  `last` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `ssn` varchar(11) NOT NULL,
  `bday` int(11) NOT NULL,
  `email` varchar(30) default NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

GRANT ALL PRIVILEGES ON fccu.* TO 'fccu'@'localhost' IDENTIFIED BY 'fccubucks' WITH GRANT OPTION;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (211,8499,'CAMILLE','CANTU','3035','449-00-9198',32531121,'camille','XZa5haP'),(312,1715,'JONI','LAM','1830','181-00-1548',32550813,'joni','9dNNL7o'),(153,-191,'KIM','MERRILL','3704','461-00-1292',32471117,'kim','CVJ36x9B'),(764,1272,'KARINA','PEARCE','3457','138-00-1257',32530608,'karina','4Ay6vR7'),(995,747,'BETHANY','SWEENEY','2477','110-00-1032',32581108,'bethany','dEi5wQn78'),(776,1736,'HECTOR','WOODWARD','3617','403-00-1549',32450503,'hector','J8vg7bdj'),(897,579,'VAUGHN','BOGGS','3933','256-00-9965',32550819,'vaughn','B687ErkZ'),(908,244,'KEENAN','PACE','2321','839-00-9711',32600815,'keenan','9w69Y6C'),(910,-230,'JANELLE','CAMPBELL','2842','344-00-9964',32460206,'janelle','hjxUaq'),(110,1410,'HORACE','KEMP','3804','218-00-1288',32470825,'horace','ZCHLbSe'),(111,1389,'ULYSSES','VARGAS','1592','857-00-9197',32470427,'ulysses','X5B52CbzJ'),(212,7725,'MYRA','HUBER','3970','423-00-1005',32590213,'myra','zF4vx38'),(913,11608,'LOU','TRUJILLO','1163','934-00-1515',32630717,'lou','IsMVI5X6U'),(4714,4056,'BERTA','CHAVEZ','1223','949-00-9742',32530427,'berta','dxf2Not'),(2215,9632,'GRACIE','PECK','3800','302-00-1515',32600522,'gracie','6SH5srE'),(9916,14089,'HOPE','BOLDEN','2563','322-00-1256',32600925,'hope','97DfSvk2'),(8917,-138,'JANIS','MAYFIELD','3598','728-00-1003',32640624,'janis','k8WKy6'),(2018,-159,'RODNEY','JACKSON','3535','116-00-9193',32631028,'rodney','XZa5haP'),(3119,1279,'BENEDICT','LEBLANC','1096','840-00-1007',32480602,'benedict','dEi5wQn78'),(9920,5207,'TEDDY','SOLOMON','3789','681-00-9486',32490624,'teddy','FVG7725J'),(1121,9580,'WAYNE','WILLIAMSON','2177','236-00-9742',32460727,'wayne','4q2mE8'),(7622,11674,'RAFAEL','MCCRAY','3142','608-00-9740',32610418,'rafael','Hx633xXU4'),(9223,5345,'BENNETT','STEPHENS','2680','385-00-9962',32471113,'bennett','KMFfFZC'),(1924,-9,'DOLORES','OCHOA','3812','290-00-1294',32521108,'dolores','6SH5srE'),(3325,11345,'LOUELLA','WALKER','2100','774-00-1512',32580123,'louella','jP4socT6'),(326,7073,'CAREY','MERCADO','2261','357-00-1000',32581001,'carey','tJRJR5Mb'),(8927,2344,'CHRIS','MCGOWAN','1817','232-00-1515',32450220,'chris','2M5383E'),(5728,7805,'WALKER','TODD','1813','689-00-9192',32641011,'walker','Yw5Hj8S7c'),(7329,6209,'ALPHONSO','DONAHUE','3453','444-00-9704',32470918,'alphonso','gU26Mgv'),(3330,1962,'ALBERTA','JENKINS','1701','778-00-9484',32490103,'alberta','T4ZYn2ic'),(9231,-13,'ROSALINDA','MEADOWS','3760','333-00-9741',32550211,'rosalinda','Gt6b3X'),(8532,7186,'IONE','SCHNEIDER','1823','690-00-1515',32500703,'ione','YcFds2Vt'),(9233,4604,'CORNELL','FITZGERALD','2794','642-00-1033',32501105,'cornell','2NBEv3'),(3834,1965,'MELINDA','HINKLE','3792','671-00-9448',32530202,'melinda','hjxUaq'),(2635,6503,'LUCILE','LAW','2630','254-00-9480',32511016,'lucile','zE6ec5'),(9236,-182,'JOSE','HOLMES','1936','470-00-1547',32450514,'jose','schYEdq'),(5437,5615,'VALENCIA','BENSON','2259','937-00-9197',32570318,'valencia','jP4socT6'),(2238,11273,'REUBEN','COCHRAN','2744','417-00-9486',32550222,'reuben','3t8juzR6'),(9439,-198,'CAROLINA','HUTCHINS','2436','833-00-1801',32520113,'carolina','jP4socT6'),(2340,5454,'OLIVIA','MCNEIL','1034','356-00-1004',32530811,'olivia','ccu83k94'),(1541,12314,'CARLO','TERRELL','2412','416-00-9230',32520814,'carlo','I6jK3yyd'),(2842,8941,'ADELAIDE','OBRIEN','3300','554-00-9965',32590113,'adelaide','7X97qNek'),(5543,-170,'MEREDITH','REED','3966','483-00-1035',32500728,'meredith','ukv2x6R2'),(2444,6080,'RANDALL','BLAKE','1352','428-00-1773',32600413,'randall','ZCHLbSe'),(8545,5637,'KIMBERLEY','BAILEY','2232','840-00-1518',32500304,'kimberley','BLF2GhW'),(3746,5012,'AGNES','ROMERO','1222','284-00-9449',32540401,'agnes','MjUfEdRx'),(2947,13992,'YOLANDA','GALLEGOS','2950','221-00-1518',32620425,'yolanda','XCM4c55'),(1648,7760,'KIM','PACHECO','1753','220-00-9486',32640126,'kim1','4vcgAfByH'),(8849,2388,'CARY','ANDREWS','1776','762-00-1802',32480929,'cary','2tabkxi34'),(2350,6318,'RANDI','DALE','2673','759-00-9485',32510414,'randi','q3MGk8'),(2651,11439,'THEODORA','TANNER','2246','504-00-9993',32491007,'theodora','88Wbxv'),(9252,7301,'MALISSA','SPARKS','2020','186-00-1291',32471125,'malissa','7T6WsY'),(2053,3936,'SANDY','TILLMAN','3430','160-00-9487',32630806,'sandy','TVZzYeVZ8'),(2554,8469,'MAUDE','HARDING','2790','204-00-9449',32600102,'maude','yc6427'),(8955,2051,'CHRISTIAN','HODGES','1932','498-00-9486',32460101,'christian','8IAg2r'),(9256,9992,'DIANN','LOVE','3266','867-00-9193',32521006,'diann','6yob33'),(9157,471,'SHANDA','BINGHAM','3122','549-00-9704',32460409,'shanda','IsMVI5X6U'),(1958,14157,'BYRON','BUSH','2128','337-00-9449',32451125,'byron','88Wbxv'),(8059,6576,'TITUS','ROWLAND','2395','651-00-9452',32520928,'titus','I6jK3yyd'),(2260,9760,'IMELDA','GOOD','1634','921-00-1549',32571122,'imelda','jP4socT6'),(3161,491,'MADONNA','FRENCH','1449','332-00-1515',32590825,'madonna','bGfRG22'),(8762,9044,'TOM','DUNBAR','1815','600-00-9485',32600417,'tom','epL2Y57'),(9063,804,'WILLIAMS','GRAY','3529','858-00-1263',32460526,'williams','8pfQLRz'),(9964,11096,'SHARRON','JOHNS','2703','210-00-9451',32640718,'sharron','Iae4RZ97'),(1365,9913,'ORVILLE','MICHAEL','1319','344-00-9199',32490326,'orville','s8RA76g'),(4466,5468,'LEIF','NICHOLSON','2979','415-00-1039',32590720,'leif','ukv2x6R2'),(6167,797,'LUANN','DOWNS','3957','568-00-9707',32590808,'luann','jP4socT6'),(6368,6974,'GEORGINA','LLOYD','3269','469-00-9226',32630506,'georgina','Dor5YPF'),(6669,11077,'DAVE','COLE','1848','845-00-9481',32620523,'dave','FdB86m3F'),(8370,13515,'TILLIE','COVINGTON','1373','934-00-1036',32630415,'tillie','U8WgG4nH'),(2771,4023,'NORBERT','DUNCAN','2667','135-00-1769',32470110,'norbert','CVJ36x9B'),(2272,168,'NEIL','WILKINSON','3729','631-00-9453',32530616,'neil','2Y73hwo'),(3473,1395,'RUTH','DONOVAN','3320','871-00-1516',32561101,'ruth','G8XcJznB'),(9274,9652,'AUGUSTUS','HATFIELD','3765','827-00-1002',32521118,'augustus','Yw5Hj8S7c'),(8975,-91,'TESSIE','WOMACK','1355','248-00-9230',32540926,'tessie','8uy9Ins'),(276,10157,'JOCELYN','IRWIN','3716','572-00-1039',32631024,'jocelyn','o3fo92w6'),(377,11345,'WILTON','MAGEE','1253','524-00-1549',32620920,'wilton','2ZjYC9'),(678,9801,'LAVERNE','FRIEDMAN','1361','700-00-9229',32590115,'laverne','q3MGk8'),(9879,-66,'ALISSA','ERICKSON','2572','936-00-1294',32521117,'alissa','33dfcPm'),(2380,-152,'CHERI','BOOKER','3227','714-00-1550',32450913,'cheri','FVG7725J'),(2481,2737,'GLENN','BURKE','3668','214-00-1775',32600917,'glenn','L89624G'),(2482,7704,'KARI','ODELL','2887','542-00-1550',32500109,'kari','5JCaR8nS'),(5583,6546,'ROSARIO','FRANKS','2463','985-00-1551',32621014,'rosario','I6jK3yyd'),(5584,11176,'TAWANA','BOWERS','1777','242-00-9999',32560105,'tawana','jP4socT6'),(5285,3221,'SAUL','STOUT','3199','954-00-1802',32561018,'saul','BV6ps3x'),(2686,-11,'JESSICA','MATTHEWS','1032','553-00-1291',32460918,'jessica','4vcgAfByH'),(8987,9796,'EDNA','CHAN','2114','497-00-1769',32500206,'edna','96JMxN'),(9088,9423,'MAGDALENA','ODONNELL','3007','552-00-1775',32500428,'magdalena','DSh9JRaW'),(2289,13191,'MELLISA','LANGLEY','2040','537-00-1032',32551029,'mellisa','JLD32u'),(1390,10227,'ISABELLA','WRIGHT','1354','258-00-1005',32510601,'isabella','Nu5kZpu');/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2007-08-28  6:08:02
