-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `.`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `Admin_ID` varchar(10) NOT NULL,
  `F_Name` varchar(25) NOT NULL,
  `L_Name` varchar(25) NOT NULL,
  `DoB` date NOT NULL,
  `Gender` enum('F','M') NOT NULL,
  `Nationality` varchar(20) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `City` varchar(15) NOT NULL,
  `StreetName` varchar(25) NOT NULL,
  `House` int NOT NULL,
  `Apartment` int DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(8) NOT NULL,
  PRIMARY KEY (`Admin_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`Admin_ID`, `F_Name`, `L_Name`, `DoB`, `Gender`, `Nationality`, `Phone`, `Email`, `City`, `StreetName`, `House`, `Apartment`, `UserName`, `Password`) VALUES ('AD111','Norah','Khalid','1990-12-09','F','saudi','0507998341','noorahKhalid@gmail.com','Dammam','st.10',3012,NULL,'Norah_Khalid','No89H1r8');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `Appointment_ID` int NOT NULL AUTO_INCREMENT,
  `Appointment_Date` varchar(50) NOT NULL,
  `Appointment_TIME` varchar(50) NOT NULL,
  `Symptoms` varchar(100) DEFAULT NULL,
  `DoctorID` int NOT NULL,
  `Patient_ID` int NOT NULL,
  `ServicesName` varchar(100) NOT NULL,
  `CID` varchar(10) NOT NULL,
  PRIMARY KEY (`Appointment_ID`),
  KEY `SeviceName` (`ServicesName`),
  KEY `CID_idx` (`CID`),
  KEY `DoctorID` (`DoctorID`),
  KEY `Patient_ID` (`Patient_ID`),
  CONSTRAINT `CID` FOREIGN KEY (`CID`) REFERENCES `services` (`clinicid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DoctorID` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`Doctor_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Patient_ID` FOREIGN KEY (`Patient_ID`) REFERENCES `patients` (`Patient_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SeviceName` FOREIGN KEY (`ServicesName`) REFERENCES `services` (`Services_Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` (`Appointment_Date`, `Appointment_TIME`, `Symptoms`, `DoctorID`, `Patient_ID`, `ServicesName`, `CID`) VALUES ('2023-01-11','08:30:00','High Heart Rhythm',22224,51288,'Heart rhythm monitoring','CARIAC11'),('2023-01-30','11:00:04',NULL,22225,51289,'Ear Cleaning and Ear Washing','ENT101'),('2023-02-16','12:00:00',NULL,22226,51290,'Hair Transplant','DERM01'),('2023-02-16','12:00:00',NULL,22224,51288,'Hair Transplant','DERM01'),('2022-06-23','08:20:00',NULL,22225,51289,'Laser Procedures','DERM01'),('2022-03-22','11:00:00',NULL,22226,51289,'Hair Transplant','ENT101'),('2023-01-11','08:30:00',NULL,22224,51290,'Heart rhythm monitoring','CARIAC11'),('455','1117',NULL,22225,51288,'Ear Cleaning and Ear Washing','ENT101'),('455','1117','hfgfgf',22226,51289,'Ear Cleaning and Ear Washing','CARIAC11');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic`
--

DROP TABLE IF EXISTS `clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic` (
  `Clinic_ID` varchar(10) NOT NULL,
  `Clinic_Name` varchar(25) NOT NULL,
  PRIMARY KEY (`Clinic_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic`
--

LOCK TABLES `clinic` WRITE;
/*!40000 ALTER TABLE `clinic` DISABLE KEYS */;
INSERT INTO `clinic` VALUES ('CARIAC11','Cardiology'),('DENT01','Dental'),('DERM01','Derma'),('ENT101','ENT');
/*!40000 ALTER TABLE `clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `Doctor_ID` int NOT NULL AUTO_INCREMENT,
  `F_Name` varchar(25) NOT NULL,
  `L_Name` varchar(25) NOT NULL,
  `DoB` varchar(50) NOT NULL,
   `Age` int(10) NOT NULL,
  `Gender` enum('F','M') NOT NULL,
  `Nationality` varchar(20) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `City` varchar(15) NOT NULL,
  `StreetName` varchar(25) NOT NULL,
  `House` int NOT NULL,
  `Apartment` int DEFAULT NULL,
  `Specialzation` varchar(25) NOT NULL,
  `ClinicID` varchar(10) NOT NULL,
  `AdminID` varchar(10) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(8) NOT NULL,
  PRIMARY KEY (`Doctor_ID`),
  KEY `ClinicID` (`ClinicID`),
  KEY `AdminId_idx` (`AdminID`),
  CONSTRAINT `AdminId` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`Admin_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ClinicID` FOREIGN KEY (`ClinicID`) REFERENCES `clinic` (`Clinic_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` (`F_Name`, `L_Name`, `DoB`,`Age`, `Gender`, `Nationality`, `Phone`, `Email`, `City`, `StreetName`, `House`, `Apartment`, `Specialzation`, `ClinicID`, `AdminID`, `UserName`,`Password`) VALUES('Mariam','Mohammed','1989-04-15',34,'F','egyptian','0504722107','MariamMoh@gmail.com','Dammam','st.11',4015,NULL,'Dental','DENT01','AD111','doctor1','M098M124'),('Ahmed','Ibrahim','1988-04-15',34,'M','saudi','0504522109','AhmedIbrahim@gmail.com','Khobar','st.12',1032,NULL,'Dental','DENT01','AD111','doctor2','Ahmed890'),('Ibrahim','Alkhamees','1985-11-15',34,'M','saudi','0559992985','Ibrahimkh@gmail.com','Khobar','st.18',2087,NULL,'Ear&Nose&Throat','ENT101','AD111','doctor3','IB750932'),('Mohammed','Adel','1980-01-07',34,'M','saudi','0562468954','MohammedAdel@gmail.com','Dammam','st.22',3220,NULL,'Ear&Nose&Throat','ENT101','AD111','doctor4','AdelMo89'),('Mustafa','Ramadhan','1972-12-02',34,'M','egyptian','0559872783','MustafaRamdhan@gmail.com','Dammam','st.11',1334,NULL,'Ear&Nose&Throat','ENT101','AD111','doctor5','RamM4378'),('Eman','Alharbi','1977-04-09',34,'F','saudi','0576474732','EmanAlharbi@gmail.com','Dammam','st.34',1123,NULL,'Cardiology','CARIAC11','AD111','doctor6','12EE8906'),('Thomas','Brain','1968-01-08',34,'M','british','0598574336','ThomasBrsin@gmail.com','Khobar','st.11',4058,NULL,'Cardiology','CARIAC11','AD111','doctor7','Tb994326'),('Othman','Omar','1968-11-17',34,'M','egyptian','0560542389','OthmanOmar@gmail.com','Dammam','st.14',2703,NULL,'Cardiology','CARIAC11','AD111','doctor8','Oth75208'),('Mohammed','Alhaddad','1980-11-15',34,'M','saudi','0535474261','Mohammedhaddad@gmail.com','Khobar','st.17',2043,NULL,'Derma','DERM01','AD111','doctor9','Moh12785'),('Noura','Ahmed','1988-01-08',34,'F','saudi','0508074337','NouraAhmed@gmail.com','Dammam','st.05',1103,NULL,'Derma','DERM01','AD111','doctor10','12789NnA'),('Reem','Dawoud','1989-07-08',34,'F','saudi','0507622917','ReemDawoud@gmail.com','Qatif','st.07',2301,NULL,'Derma','DERM01','AD111','doctor11','Ree89m14'),('omar','abaady','74122558',34,'F','maroco','874125','badr.jjg','rbat','st74',547,NULL,'cardiologie','DENT01','AD111','doctor12','badroxy'),('wassim','bouzaidi','1996',34,'M','egyptien','65897412','badr.abdu98','taounate','st.25',54,NULL,'cadiology','CARIAC11','AD111','doctor13','wassimox'),('badrix','hdhdhd','25478544',34,'M','jddudud','145587744','badrpx.abdou@gmail','rabat','st.21',145,NULL,'Cardiology','CARIAC11','AD111','doctor14','badrox');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patient_doctor_information`
--

DROP TABLE IF EXISTS `patient_doctor_information`;
/*!50001 DROP VIEW IF EXISTS `patient_doctor_information`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patient_doctor_information` AS SELECT 
 1 AS `patientID`,
 1 AS `DocID`,
 1 AS `Patient_ID`,
 1 AS `F_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
/*GENERATED ALWAYS AS (concat_ws(_utf8mb4'',`F_Name`,_utf8mb4'_',`L_Name`)) VIRTUAL*/
CREATE TABLE `patients` (
  `Patient_ID` int NOT NULL AUTO_INCREMENT,
  `F_Name` varchar(25) NOT NULL,
  `L_Name` varchar(25) NOT NULL,
  `DoB` varchar(50) NOT NULL,
  `Age` int(10) NOT NULL,
  `Gender` char(1) NOT NULL,
  `Nationality` varchar(20) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `City` varchar(15) NOT NULL,
  `StreetName` varchar(25) NOT NULL,
  `House` int NOT NULL,
  `BloodType` varchar(5) NOT NULL,
  `AdminID` varchar(10) NOT NULL,
  `File_Number` int NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(8) NOT NULL,
  PRIMARY KEY (`Patient_ID`),
  KEY `AdminID_idx` (`AdminID`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`Admin_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patients_chk_1` CHECK ((`BloodType` in (_utf8mb4'O+',_utf8mb4'O-',_utf8mb4'B+',_utf8mb4'B-',_utf8mb4'A+',_utf8mb4'A-',_utf8mb4'AB+',_utf8mb4'AB-'))),
  CONSTRAINT `patients_chk_2` CHECK ((`Gender` in (_utf8mb4'M',_utf8mb4'F')))
) ENGINE=InnoDB AUTO_INCREMENT=51288 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` (`F_Name`, `L_Name`, `DoB`,`Age`, `Gender`, `Nationality`, `Phone`, `Email`, `City`, `StreetName`, `House`,`BloodType`, `AdminID`, `File_Number`, `UserName`,`Password`) VALUES ('mohamed','kjfhfh','15-02-1996',26,'M','indian','062514785','badr.abdou@gmail.com','rabat','st.21',51,'AB+','AD111',65,'user1','pass1'),('Nawaf','Salem','1999-12-09',23,'M','Saudi','503289651','NawafSalem@gmail.com','Dammam','st.33',3478,'B-','AD111',10,'user2','pass2'),('Omar','Reda','1978-12-15',45,'M','egyptian','529930917','OmarReda@gmail.com','Khobar','st.06',1108,'A+','AD111',2,'user3','pass3');

/*
('Omar','Reda','1978-12-15','M','egyptian','529930917','OmarReda@gmail.com','Khobar','st.06',1108,NULL,'A+','AD111',2,'Om22ar34'),
('Mashael','Majed','1996-07-22','F','saudi','599635918','MashaelM@gmail.com','Dammam','st.16',1008,NULL,'AB-','AD111',3,'MM009211'),
('Faisal','Khalid','1988-11-03','M','saudi','509811092','FaislK@gmail.com','Dmmam','st.22',4058,NULL,'O-','AD111',4,'99F0h674'),
('Jood','Fahad','1991-02-19','F','saudi','599635910','JoodFahad@gmail.com','Khobar','st.31',3301,NULL,'B+','AD111',5,'J56F1092'),
('Noor','Karam','1997-09-19','F','Saudi','599635934','NoorKaram@gmail.com','Dammam','st.32',3301,NULL,'O+','AD111',6,'984NK120'),
('Sara','Khalid','2001-02-12','F','Saudi','503768821','SaraKhalid@gmail.com','Khobar','st.10',3766,NULL,'O-','AD111',7,'Sara1290'),
('Hamad','Abdullah','2004-06-23','M','Kuwaiti','503826901','HamadAbdullah@gmail.com','Khobar','st.11',3232,NULL,'AB+','AD111',8,'890Ham99'),
('Jori','Naser','2009-09-09','F','Saudi','550938721','JoriNasser@gmail.com','Jubail','st.09',9921,NULL,'A-','AD111',9,'Jori9076'),
*/
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentNum` int NOT NULL AUTO_INCREMENT,
  `PatID` int NOT NULL,
  `PayMethod` enum('Mada Credit Card','Cash','Visa Credit Card','Insurance') NOT NULL,
  `appID` int NOT NULL,
  `TotalPrice` Double NOT NULL,
  PRIMARY KEY (`PaymentNum`,`PatID`),
  KEY `PatID` (`PatID`),
  KEY `appID` (`appID`),
  CONSTRAINT `appID` FOREIGN KEY (`appID`) REFERENCES `appointment` (`Appointment_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PatID` FOREIGN KEY (`PatID`) REFERENCES `patients` (`Patient_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` (`PatID`,`PayMethod`,`appID`,`TotalPrice`) VALUES (51288,'Mada Credit Card',100,3000.0),(51289,'Visa Credit Card',104,3000.0),(51290,'Cash',103,3000.0),(51288,'Mada Credit Card',105,3000.0),(51289,'Visa Credit Card',109,3000.0),(51288,'Cash',107,3000.0),(51290,'Mada Credit Card',106,3000.0),(51289,'Visa Credit Card',108,3000.0);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provide`
--

DROP TABLE IF EXISTS `provide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provide` (
  `ServiceName` varchar(100) NOT NULL,
  `Clinicid` varchar(10) NOT NULL,
  PRIMARY KEY (`ServiceName`,`Clinicid`),
  KEY `Clinicid_idx` (`Clinicid`),
  KEY `c_ID_idx` (`Clinicid`),
  CONSTRAINT `c_ID` FOREIGN KEY (`Clinicid`) REFERENCES `clinic` (`Clinic_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ServiceName` FOREIGN KEY (`ServiceName`) REFERENCES `services` (`Services_Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provide`
--

LOCK TABLES `provide` WRITE;
/*!40000 ALTER TABLE `provide` DISABLE KEYS */;
INSERT INTO `provide` VALUES ('Cardiac rehabilitation consultation ','CARIAC11'),('Follow up consultations','CARIAC11'),('General Cardiology Consultation','CARIAC11'),('Heart rhythm monitoring','CARIAC11'),('Stress evaluation','CARIAC11'),('Surgical consultations','CARIAC11'),('Dental hygiene ','DENT01'),('Endodontics services','DENT01'),('Pediatric dentistry','DENT01'),('Periodontics services','DENT01'),('Dermatology Consultation','DERM01'),('Hair Transplant','DERM01'),('Laser Procedures','DERM01'),('Plastic Surgery Consultation','DERM01'),('Skin Care Service','DERM01'),('Complete ENT (Ear, Nose & Throat) Examination','ENT101'),('Difficulty Swallowing Consultation','ENT101'),('Ear Cleaning and Ear Washing','ENT101'),('Respiratory System Allergies Consultation','ENT101'),('Snoring Consultation','ENT101');
/*!40000 ALTER TABLE `provide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `Services_Name` varchar(100) NOT NULL,
  `clinicid` varchar(10) NOT NULL,
  `Price` float NOT NULL,
  PRIMARY KEY (`Services_Name`,`clinicid`),
  KEY `clinicid` (`clinicid`),
  CONSTRAINT `Fcid` FOREIGN KEY (`clinicid`) REFERENCES `clinic` (`Clinic_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES ('Cardiac rehabilitation consultation ','CARIAC11',100),('Complete ENT (Ear, Nose & Throat) Examination','ENT101',300),('Dental hygiene ','DENT01',2000),('Dermatology Consultation','DERM01',150),('Difficulty Swallowing Consultation','ENT101',100),('Ear Cleaning and Ear Washing','ENT101',399),('Endodontics services','DENT01',2500),('Follow up consultations','CARIAC11',100),('General Cardiology Consultation','CARIAC11',100),('Hair Transplant','DERM01',3300),('Heart rhythm monitoring','CARIAC11',400),('Laser Procedures','DERM01',400),('Pediatric dentistry','DENT01',900),('Periodontics services','DENT01',1000),('Plastic Surgery Consultation','DERM01',5000),('Respiratory System Allergies Consultation','ENT101',100),('Skin Care Service','DERM01',1000),('Snoring Consultation','ENT101',150),('Stress evaluation','CARIAC11',270),('Surgical consultations','CARIAC11',100);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatedby`
--

DROP TABLE IF EXISTS `treatedby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatedby` (
  `patientID` int NOT NULL,
  `DocID` int NOT NULL,
  PRIMARY KEY (`patientID`,`DocID`),
  KEY `DocId_idx` (`DocID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatedby`
--

LOCK TABLES `treatedby` WRITE;
/*!40000 ALTER TABLE `treatedby` DISABLE KEYS */;
INSERT INTO `treatedby` VALUES (1111,2221),(1114,2223),(1115,2224),(1117,2225),(1118,2226),(1112,2228),(1120,2228),(1119,2230),(1113,2232),(1116,2232);
/*!40000 ALTER TABLE `treatedby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `patient_doctor_information`
--

/*!50001 DROP VIEW IF EXISTS `patient_doctor_information`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_doctor_information` AS select `pd`.`patientID` AS `patientID`,`pd`.`DocID` AS `DocID`,`p`.`Patient_ID` AS `Patient_ID`,`p`.`F_Name` AS `F_Name` from (`treatedby` `pd` join `patients` `p`) where (`pd`.`patientID` = `p`.`Patient_ID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-08  2:48:45
