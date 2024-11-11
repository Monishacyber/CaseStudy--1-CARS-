--Create database

CREATE DATABASE CARS

-- CREATE TABLE INCIDENTS 

CREATE TABLE Incidents (
  IncidentID INT IDENTITY (1,1) PRIMARY KEY,
  IncidentType VARCHAR(255) NOT NULL,
  IncidentDate DATE NOT NULL,
  Location GEOGRAPHY,/* Location represented as GEOGRAPHY data type for saptial analysis(latitude & longitude)*/
  Description VARCHAR(255) NOT NULL,
  Status VARCHAR(255) NOT NULL,
  VictimID INT NOT NULL,
  SuspectID INT NOT NULL,
  FOREIGN KEY (VictimID) REFERENCES Victims(VictimID),
  FOREIGN KEY (SuspectID) REFERENCES Suspects(SuspectID)
);

-- CREATE TABLE VICTIMS

CREATE TABLE Victims (
  VictimID INT IDENTITY(1,1) PRIMARY KEY,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  DateOfBirth DATE NOT NULL,
  Gender VARCHAR(255) NOT NULL,
  ContactInformation VARCHAR(255) NOT NULL
); 

--CREATE TABLE SUSPECTS

CREATE TABLE Suspects (
  SuspectID INT IDENTITY (1,1)PRIMARY KEY,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  DateOfBirth DATE NOT NULL,
  Gender VARCHAR(255) NOT NULL,
  ContactInformation VARCHAR(255) NOT NULL
);


--CREATE TABLE LAWENFORCEMENTAGENCIES

CREATE TABLE LawEnforcementAgencies (
  AgencyID INT IDENTITY(1,1) PRIMARY KEY,
  AgencyName VARCHAR(255) NOT NULL,
  Jurisdiction VARCHAR(255) NOT NULL,
  ContactInformation VARCHAR(255) NOT NULL
);

--CREATE A VIEW OR QUERY TO LINK OFFICERS TO THEIR AGENCIES



--CREATE TABLE OFFICERS

CREATE TABLE Officers (
  OfficerID INT IDENTITY(1,1) PRIMARY KEY,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255)NOT NULL,
  BadgeNumber VARCHAR(255) NOT NULL,
  Rank VARCHAR(255) ,
  ContactInformation VARCHAR(255) NOT NULL,
  AgencyID INT,
  FOREIGN KEY (AgencyID) REFERENCES LawEnforcementAgencies(AgencyID)
);

--CREATE TABLE EVIDENCE

CREATE TABLE Evidence (
  EvidenceID INT IDENTITY(1,1) PRIMARY KEY,
  Description VARCHAR(255)NOT NULL,
  LocationFound GEOGRAPHY,
  IncidentID INT NOT NULL,
  FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID)
);

--CREATE TABLE REPORTS

CREATE TABLE Reports (
  ReportID INT IDENTITY (1,1)PRIMARY KEY,
  IncidentID INT NOT NULL,
  ReportingOfficer INT NOT NULL,
  ReportDate DATE NOT NULL,
  ReportDetails VARCHAR(255)NOT NULL,
  Status VARCHAR(255) NOT NULL,
  FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID),
  FOREIGN KEY (ReportingOfficer) REFERENCES Officers(OfficerID)
);

-- Insert sample data

-- Victims

INSERT INTO Victims 
VALUES
('John', 'Doe', '1990-01-01', 'Male', '123 Main St-1234567890'),
('Jane', 'Smith', '1995-06-01', 'Female', '456 Elm St-0987654321'),
('Bob', 'Johnson', '1980-03-01', 'Male', '789 Oak St-1234509876');

SELECT * FROM Victims

-- Suspects

INSERT INTO Suspects 
VALUES
('Mike', 'Brown', '1992-04-01', 'Male', '901 Maple St'),
('Emily', 'Davis', '1998-07-01', 'Female', '234 Pine St'),
('David', 'Lee', '1985-09-01', 'Male', '567 Cedar St');

SELECT * FROM Suspects

-- Incidents

INSERT INTO Incidents
VALUES
('Robbery', '2022-01-01', 'POINT(-74.0059 40.7128)', 'Sample description', 'Open', 1, 1),
('Homicide', '2022-02-01', 'POINT(-75.1234 39.4567)', 'Sample description', 'Under Investigation', 2, 2),
('Theft', '2022-03-01', 'POINT(-76.7890 38.1234)', 'Sample description', 'Closed', 3, 3);

SELECT * FROM  Incidents

-- Law Enforcement Agencies

INSERT INTO LawEnforcementAgencies 
VALUES
( 'NYPD', 'New York City', '555-555-5555'),
('LAPD', 'Los Angeles', '666-666-6666'),
('FBI', 'Federal', '777-777-7777');

SELECT * FROM LawEnforcementAgencies

-- Officers

INSERT INTO Officers 
VALUES
('Bob', 'Smith', '1234', 'Detective', '555-555-5555', 1),
('Jane', 'Johnson', '5678', 'Officer', '666-666-6666', 2),
('Mike', 'Brown', '9012', 'Agent', '777-777-7777', 3);

SELECT * FROM Officers


Evidence:

INSERT INTO Evidence 
VALUES

('Security camera footage', 'POINT(-74.0059 40.7128)', 1),
('Fingerprint evidence', 'POINT(-75.1234 39.4567)', 2),
('Stolen goods recovered', 'POINT(-76.7890 38.1234)', 3);

SELECT * FROM Evidence


Reports:

INSERT INTO Reports

VALUES

(1, 2, '2022-01-01', 'Robbery occurred at 123 Main St. Victim reported stolen cash and jewelry.', 'Finalized'),
(2, 3, '2022-02-01', 'Homicide investigation ongoing. Victim found deceased at 456 Elm St.', 'Draft'),
(3, 4, '2022-03-01', 'Theft reported at 789 Oak St. Stolen goods recovered and suspect apprehended.', 'Finalized');

SELECT * FROM Reports 


/* Note: The IncidentID in the Evidence and Reports tables refers to the corresponding IncidentID in the Incidents table.
Similarly, the ReportingOfficer in the Reports table refers to the OfficerID in the Officers table.
