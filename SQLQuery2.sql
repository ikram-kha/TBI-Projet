USE DataWarehouseNorthwind_DW;
GO


CREATE TABLE Dim_Temps (
    id_temps INT IDENTITY(1,1) PRIMARY KEY,
    annee INT,
    mois_annee VARCHAR(20)
);

CREATE TABLE Dim_Client (
    id_seqClient INT IDENTITY(1,1) PRIMARY KEY,
    id_client_prod NVARCHAR(10),
    source_prod VARCHAR(50),
    CompanyName NVARCHAR(100),
    City NVARCHAR(100),
    Country NVARCHAR(100)
);

CREATE TABLE Dim_Employee (
    id_seqEmployee INT IDENTITY(1,1) PRIMARY KEY,
    id_employee_prod INT,
    source_prod VARCHAR(50),
    Nom NVARCHAR(50),
    Prenom NVARCHAR(50),
    Territory NVARCHAR(50),
    TerritoryDescr NVARCHAR(50),
    Region NVARCHAR(50)
);

CREATE TABLE TF_Commande (
    id_seq_fait INT IDENTITY(1,1) PRIMARY KEY,
    id_temps INT,
    id_seqEmployee INT,
    id_seqClient INT,
    nbr_commandes_livrees INT,
    nbr_commandes_non_livrees INT,
    FOREIGN KEY (id_temps) REFERENCES Dim_Temps(id_temps),
    FOREIGN KEY (id_seqEmployee) REFERENCES Dim_Employee(id_seqEmployee),
    FOREIGN KEY (id_seqClient) REFERENCES Dim_Client(id_seqClient)
);
