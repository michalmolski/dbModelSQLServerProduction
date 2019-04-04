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
--============/PRODUCTION CONSTRAINTS -> FOREIGN KEYS==========
--planned_production FOREING KEYES--------
ALTER TABLE Planned_production ADD CONSTRAINT FK_Order_detail
FOREIGN KEY (iddetail) REFERENCES Order_detail(iddetail)
