--============/PRODUCTION TABLES/==============================

-- planned production table--
	CREATE TABLE Planned_production
	(idplan INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	iddetail INT NOT NULL,
	idmachine INT NOT NULL,
	plannedstartd DATE,
	plannedendd DATE,
	inproduction BIT
	);
	
-- planned_prod_empl_det table--
	CREATE TABLE Planned_production_employee_details
	(iddetail INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	idproces INT NOT NULL,
	idemployee INT NOT NULL,
	startdate DATE,
	enddate DATE,
	);

-- technology table--
	CREATE TABLE Technology
	(idtechnology INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	technologyname nvarchar(50) NOT NULL,
	timepermeter INT NOT NULL,
	speedfactor INT NOT NULL,
	);
	
-- failures table---
	CREATE TABLE Failures
	(
	idfailures INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	idproces INT NOT NULL,
	specification nvarchar(50) NOT NULL, --changed name from description (slq syntax word) to specification
	failuredate DATE NOT NULL
	);
--production process table--

--============/PRODUCTION CONSTRAINTS -> FOREIGN KEYS==========
--planned_production FOREING KEYS--------
ALTER TABLE Planned_production ADD CONSTRAINT FK_Order_detail
FOREIGN KEY (iddetail) REFERENCES Order_detail(iddetail)

-- planned_prod_empl_det FOREING KEYS--------
ALTER TABLE Planned_production_employee_details ADD CONSTRAINT FK_Planned_production_employee_details_Allocation
FOREIGN KEY (idemployee) REFERENCES Allocation(idemployee)

ALTER TABLE Planned_production_employee_details ADD CONSTRAINT FK_Planned_production_employee_details_Planned_production
FOREIGN KEY (idproces) REFERENCES Planned_production(idplan)

-- Failures FOREIGN KEYS ------
ALTER TABLE Failures ADD CONSTRAINT FK_Production_proces
FOREIGN KEY (idproces) REFERENCES Production_proces(idproces)

ALTER TABLE Failures ADD CONSTRAINT FK_Failures_maintenance
FOREIGN KEY (idfailure) REFERENCES Failure_maintenance(idfailure)

--Production_proces FOREING KEYS--------
ALTER TABLE Production_proces ADD CONSTRAINT FK_Production_proces_Planned_production
FOREIGN KEY (idplan) REFERENCES Planned_production(idplan)