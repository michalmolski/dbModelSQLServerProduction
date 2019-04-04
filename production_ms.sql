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
	
--============/PRODUCTION CONSTRAINTS -> FOREIGN KEYS==========
--planned_production FOREING KEYES--------
ALTER TABLE Planned_production ADD CONSTRAINT FK_Order_detail
FOREIGN KEY (iddetail) REFERENCES Order_detail(iddetail)

-- planned_prod_empl_det FOREING KEYES--------
ALTER TABLE Planned_production_employee_details ADD CONSTRAINT FK_Planned_production_employee_details_Allocation
FOREIGN KEY (idemployee) REFERENCES Allocation(idemployee)

ALTER TABLE Planned_production_employee_details ADD CONSTRAINT FK_Planned_production_employee_details_Planned_production
FOREIGN KEY (idproces) REFERENCES Planned_production(idplan)