-- Borrar campo
ALTER TABLE TBL_Persona DROP COLUMN PK_PSN_Persona;
-- Hacer la tabla con auto incremento
ALTER TABLE TBL_Persona ADD PK_PSN_Persona INT IDENTITY(1,1);
-- Hacer llave primaria en persona
ALTER TABLE TBL_Persona ADD PRIMARY KEY(PK_PSN_Persona);
-- ----------------------------------------------------------
-- Borrar campo
ALTER TABLE TBL_Rol DROP COLUMN PK_ROL_Rol;
-- Hacer la tabla con auto incremento
ALTER TABLE TBL_Rol ADD PK_ROL_Rol INT IDENTITY(1,1);
-- Hacer llave primaria en rol
ALTER TABLE TBL_Rol ADD PRIMARY KEY(PK_ROL_Rol);
-- ----------------------------------------------------------
-- Crear tabla intermedia
CREATE TABLE TBL_Persona_has_Rol (
FK_PSN_Persona INT NOT NULL,
FK_ROL_Rol INT NOT NULL,
)
-- Crear las llaves foraneas
ALTER TABLE TBL_Persona_has_Rol ADD FOREIGN KEY(FK_PSN_Persona) REFERENCES TBL_Persona(PK_PSN_Persona);
ALTER TABLE TBL_Persona_has_Rol ADD FOREIGN KEY(FK_ROL_Rol) REFERENCES TBL_Rol(PK_ROL_Rol);
-- ----------------------------------------------------------
-- Modificar campos de la tabla pqrs
-- Hacer el campo con auto incremento
ALTER TABLE TBL_Pqrs ADD PK_pqr_Pqrs INT IDENTITY(1,1);
-- Hacer llave primaria en rol
ALTER TABLE TBL_Pqrs ADD PRIMARY KEY(PK_pqr_Pqrs);
-- Crear las llaves foraneas
ALTER TABLE TBL_Pqrs ADD FOREIGN KEY(FK_PSN_Persona_crea) REFERENCES TBL_Persona(PK_PSN_Persona);
ALTER TABLE TBL_Pqrs ADD FOREIGN KEY(FK_PSN_Persona_asigna) REFERENCES TBL_Persona(PK_PSN_Persona);
ALTER TABLE TBL_Pqrs ADD FOREIGN KEY(FK_PSN_Persona_responde) REFERENCES TBL_Persona(PK_PSN_Persona);
