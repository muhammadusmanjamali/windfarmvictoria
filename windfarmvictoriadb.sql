SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

SET NAMES utf8mb4;

CREATE DATABASE IF NOT EXISTS `windfarmvictoriadb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `windfarmvictoriadb`;

DROP TABLE IF EXISTS `community_feedback`;
CREATE TABLE `community_feedback` (
  `Feedback_ID` int(11) NOT NULL,
  `Farm_ID` int(11) DEFAULT NULL,
  `Resident_Name` varchar(100) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  `Feedback_Date` date DEFAULT NULL,
  `Concern` text DEFAULT NULL,
  `Response_Status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `community_feedback` (`Feedback_ID`, `Farm_ID`, `Resident_Name`, `Email`, `Phone`, `Feedback_Date`, `Concern`, `Response_Status`) VALUES
(1, 1, 'Hasnain Ali', 'hasnain.resident@gmail.com', '+61 491 570 006', '2025-01-15', 'Concern about noise from wind turbines.', 'Responded'),
(2, 2, 'Usman Jamali', 'usman.resident@gmai.com', '+61 491 570 156', '2025-02-12', 'Request for local employment opportunities.', 'Under Review'),
(3, 3, 'Noor Ul Fatyma', 'Noor.resident@gmai.com', '+61 491 570 157', '2025-03-08', 'Questions about bird protection.', 'Pending');

DROP TABLE IF EXISTS `contractors`;
CREATE TABLE `contractors` (
  `Contractor_ID` int(11) NOT NULL,
  `Contractor_Name` varchar(100) DEFAULT NULL,
  `Company_Name` varchar(150) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  `Specialization` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `contractors` (`Contractor_ID`, `Contractor_Name`, `Company_Name`, `Email`, `Phone`, `Specialization`) VALUES
(1, 'Hussain Ali', 'Ali Wind Solutions', 'hussainali.contractor@gmail.com', '+61 491 570 158', 'Turbine Maintenance'),
(2, 'Humza Siraj ', 'Siraj Energy Services', 'humzasiraj.contractor@gmail.com', '+61 491 570 159', 'Electrical Engineering'),
(3, 'Haseeb Rehman', 'Rehman Renewable Systems', 'haseebrehman.contractor@gmail.com', '+61 491 570 110', 'Wind Farm Installation');

DROP TABLE IF EXISTS `electricity_generation`;
CREATE TABLE `electricity_generation` (
  `Generation_ID` int(11) NOT NULL,
  `Turbine_ID` int(11) DEFAULT NULL,
  `Generation_Date` date DEFAULT NULL,
  `Energy_MWh` decimal(10,2) DEFAULT NULL,
  `Downtime_Hours` decimal(10,2) DEFAULT NULL,
  `Wind_Speed_mps` decimal(5,2) DEFAULT NULL,
  `Energy_Supplied_Grid_MWh` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `electricity_generation` (`Generation_ID`, `Turbine_ID`, `Generation_Date`, `Energy_MWh`, `Downtime_Hours`, `Wind_Speed_mps`, `Energy_Supplied_Grid_MWh`) VALUES
(1, 1, '2025-01-01', 45.50, 1.50, 7.80, 44.10),
(2, 2, '2025-01-02', 62.75, 0.75, 9.20, 61.20),
(3, 3, '2025-01-03', 78.25, 2.00, 10.50, 76.50);

DROP TABLE IF EXISTS `environmental_assessments`;
CREATE TABLE `environmental_assessments` (
  `Assessment_ID` int(11) NOT NULL,
  `Farm_ID` int(11) DEFAULT NULL,
  `Assessment_Date` date DEFAULT NULL,
  `Noise_Level_dB` decimal(10,2) DEFAULT NULL,
  `Wildlife_Impact` text DEFAULT NULL,
  `Vegetation_Impact` text DEFAULT NULL,
  `Compliance_Status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `environmental_assessments` (`Assessment_ID`, `Farm_ID`, `Assessment_Date`, `Noise_Level_dB`, `Wildlife_Impact`, `Vegetation_Impact`, `Compliance_Status`) VALUES
(1, 1, '2025-01-10', 41.50, 'Bird monitoring recommended.', 'Minor vegetation disturbance.', 'Compliant'),
(2, 2, '2025-02-15', 44.25, 'Wildlife survey in progress.', 'Restoration plan required.', 'Under Review'),
(3, 3, '2025-03-20', 39.75, 'Pre-construction wildlife survey required.', 'Vegetation survey pending.', 'Pending');

DROP TABLE IF EXISTS `landowners`;
CREATE TABLE `landowners` (
  `Landowner_ID` int(11) NOT NULL,
  `Landowner_Name` varchar(100) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  `Location_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `landowners` (`Landowner_ID`, `Landowner_Name`, `Email`, `Phone`, `Location_ID`) VALUES
(1, 'Muhammad Saqib', 'saqib.landowner@gmail.com', '+61 491 570 313', 1),
(2, 'Manahil Yar', 'manahil.landowner@gmail.com', '+61 491 570 737', 2),
(3, 'Sundas Ali', 'sundasali.landowner@gmail.com', '+61 491 570 665', 3);

DROP TABLE IF EXISTS `maintenance_activities`;
CREATE TABLE `maintenance_activities` (
  `Maintenance_ID` int(11) NOT NULL,
  `Turbine_ID` int(11) DEFAULT NULL,
  `Contractor_ID` int(11) DEFAULT NULL,
  `Maintenance_Date` date DEFAULT NULL,
  `Activity_Type` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Cost_AUD` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `maintenance_activities` (`Maintenance_ID`, `Turbine_ID`, `Contractor_ID`, `Maintenance_Date`, `Activity_Type`, `Description`, `Cost_AUD`) VALUES
(1, 1, 1, '2025-01-12', 'Routine Inspection', 'Inspection of blades and gearbox.', 1800.00),
(2, 2, 2, '2025-02-18', 'Electrical Repair', 'Checking electrical wiring and controls.', 2200.00),
(3, 3, 3, '2025-03-22', 'Preventive Maintenance', 'Scheduled turbine component inspection.', 2750.00);

DROP TABLE IF EXISTS `project_funding`;
CREATE TABLE `project_funding` (
  `Funding_ID` int(11) NOT NULL,
  `Farm_ID` int(11) DEFAULT NULL,
  `Funding_Source` varchar(150) DEFAULT NULL,
  `Budget_AUD` decimal(15,2) DEFAULT NULL,
  `Amount_Spent_AUD` decimal(15,2) DEFAULT NULL,
  `Supplier_Name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `project_funding` (`Funding_ID`, `Farm_ID`, `Funding_Source`, `Budget_AUD`, `Amount_Spent_AUD`, `Supplier_Name`) VALUES
(1, 1, 'Renewable Energy Fund', 4500000.00, 1200000.00, 'Victorian Wind Equipment'),
(2, 2, 'Private Investment', 6000000.00, 1750000.00, 'Green Power Supplies'),
(3, 3, 'Clean Energy Grant', 5500000.00, 650000.00, 'Australian Turbine Solutions');

DROP TABLE IF EXISTS `project_locations`;
CREATE TABLE `project_locations` (
  `Location_ID` int(11) NOT NULL,
  `State` varchar(100) DEFAULT NULL,
  `Region` varchar(100) DEFAULT NULL,
  `Latitude` decimal(10,6) DEFAULT NULL,
  `Longitude` decimal(10,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `project_locations` (`Location_ID`, `State`, `Region`, `Latitude`, `Longitude`) VALUES
(1, 'Victoria', 'Waubra', -37.366700, 143.633300),
(2, 'Victoria', 'Ararat', -37.283700, 142.929800),
(3, 'Victoria', 'Portland', -38.345600, 141.604000);

DROP TABLE IF EXISTS `turbines`;
CREATE TABLE `turbines` (
  `Turbine_ID` int(11) NOT NULL,
  `Farm_ID` int(11) DEFAULT NULL,
  `Turbine_Model` varchar(100) DEFAULT NULL,
  `Capacity_MW` decimal(10,2) DEFAULT NULL,
  `Installation_Date` date DEFAULT NULL,
  `Turbine_Status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `turbines` (`Turbine_ID`, `Farm_ID`, `Turbine_Model`, `Capacity_MW`, `Installation_Date`, `Turbine_Status`) VALUES
(1, 1, 'Vestas V90', 2.00, '2023-09-10', 'Operational'),
(2, 2, 'Goldwind GW155', 3.00, '2024-06-15', 'Under Installation'),
(3, 3, 'Siemens Gamesa SG 4.5', 4.50, '2025-01-12', 'Planned');

DROP TABLE IF EXISTS `wind_farms`;
CREATE TABLE `wind_farms` (
  `Farm_ID` int(11) NOT NULL,
  `Farm_Name` varchar(150) DEFAULT NULL,
  `Location_ID` int(11) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `Project_Status` varchar(100) DEFAULT NULL,
  `Construction_Progress_Percent` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `wind_farms` (`Farm_ID`, `Farm_Name`, `Location_ID`, `Start_Date`, `Project_Status`, `Construction_Progress_Percent`) VALUES
(1, 'Ali Green Wind Farm', 1, '2023-04-15', 'Operational', 100.00),
(2, 'Fatima Renewable Energy Farm', 2, '2024-02-10', 'Under Construction', 55.00),
(3, 'Hamza Power Wind Farm', 3, '2024-08-20', 'Planning', 0.00);

ALTER TABLE `community_feedback`
  ADD PRIMARY KEY (`Feedback_ID`),
  ADD KEY `Farm_ID` (`Farm_ID`);

ALTER TABLE `contractors`
  ADD PRIMARY KEY (`Contractor_ID`);

ALTER TABLE `electricity_generation`
  ADD PRIMARY KEY (`Generation_ID`),
  ADD KEY `Turbine_ID` (`Turbine_ID`);

ALTER TABLE `environmental_assessments`
  ADD PRIMARY KEY (`Assessment_ID`),
  ADD KEY `Farm_ID` (`Farm_ID`);

ALTER TABLE `landowners`
  ADD PRIMARY KEY (`Landowner_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

ALTER TABLE `maintenance_activities`
  ADD PRIMARY KEY (`Maintenance_ID`),
  ADD KEY `Turbine_ID` (`Turbine_ID`),
  ADD KEY `Contractor_ID` (`Contractor_ID`);

ALTER TABLE `project_funding`
  ADD PRIMARY KEY (`Funding_ID`),
  ADD KEY `Farm_ID` (`Farm_ID`);

ALTER TABLE `project_locations`
  ADD PRIMARY KEY (`Location_ID`);

ALTER TABLE `turbines`
  ADD PRIMARY KEY (`Turbine_ID`),
  ADD KEY `Farm_ID` (`Farm_ID`);

ALTER TABLE `wind_farms`
  ADD PRIMARY KEY (`Farm_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

ALTER TABLE `community_feedback`
  MODIFY `Feedback_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `contractors`
  MODIFY `Contractor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `electricity_generation`
  MODIFY `Generation_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `environmental_assessments`
  MODIFY `Assessment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `landowners`
  MODIFY `Landowner_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `maintenance_activities`
  MODIFY `Maintenance_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `project_funding`
  MODIFY `Funding_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `project_locations`
  MODIFY `Location_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `turbines`
  MODIFY `Turbine_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `wind_farms`
  MODIFY `Farm_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `community_feedback`
  ADD CONSTRAINT `community_feedback_ibfk_1` FOREIGN KEY (`Farm_ID`) REFERENCES `wind_farms` (`Farm_ID`);

ALTER TABLE `electricity_generation`
  ADD CONSTRAINT `electricity_generation_ibfk_1` FOREIGN KEY (`Turbine_ID`) REFERENCES `turbines` (`Turbine_ID`);

ALTER TABLE `environmental_assessments`
  ADD CONSTRAINT `environmental_assessments_ibfk_1` FOREIGN KEY (`Farm_ID`) REFERENCES `wind_farms` (`Farm_ID`);

ALTER TABLE `landowners`
  ADD CONSTRAINT `landowners_ibfk_1` FOREIGN KEY (`Location_ID`) REFERENCES `project_locations` (`Location_ID`);

ALTER TABLE `maintenance_activities`
  ADD CONSTRAINT `maintenance_activities_ibfk_1` FOREIGN KEY (`Turbine_ID`) REFERENCES `turbines` (`Turbine_ID`),
  ADD CONSTRAINT `maintenance_activities_ibfk_2` FOREIGN KEY (`Contractor_ID`) REFERENCES `contractors` (`Contractor_ID`);

ALTER TABLE `project_funding`
  ADD CONSTRAINT `project_funding_ibfk_1` FOREIGN KEY (`Farm_ID`) REFERENCES `wind_farms` (`Farm_ID`);

ALTER TABLE `turbines`
  ADD CONSTRAINT `turbines_ibfk_1` FOREIGN KEY (`Farm_ID`) REFERENCES `wind_farms` (`Farm_ID`);

ALTER TABLE `wind_farms`
  ADD CONSTRAINT `wind_farms_ibfk_1` FOREIGN KEY (`Location_ID`) REFERENCES `project_locations` (`Location_ID`);
COMMIT;
