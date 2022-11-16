CREATE DATABASE CrudAjax
USE CrudAjax


CREATE TABLE Estado
(
IdEstado INT PRIMARY KEY IDENTITY (1,1),
Estado VARCHAR(50)
)

CREATE TABLE Empleado
(
IdEmpleado INT PRIMARY KEY IDENTITY(1,1),
NumeroNomina VARCHAR(10),
Nombre VARCHAR(50),
ApellidoPaterno VARCHAR(50),
ApellidoMaterno VARCHAR(50),
IdEstado INT REFERENCES Estado(IdEstado)
)


--------------------------------------------------------------------------------------------

-- STORED PROCEDURE GETALLEMPLEADO
USE [CrudAjax]
GO
CREATE PROCEDURE EmpleadoGetAll
AS
BEGIN
SELECT Empleado.[IdEmpleado]
      ,Empleado.[NumeroNomina]
      ,Empleado.[Nombre]
      ,Empleado.[ApellidoPaterno]
      ,Empleado.[ApellidoMaterno]
      ,Empleado.[IdEstado]
	  ,Estado.Estado
  FROM [dbo].[Empleado] INNER JOIN Estado on Estado.IdEstado = Empleado.IdEstado
END
GO

--------------------------------------------------------------------------------------------------

--STORED PROCEDURE EstadoGetAll

USE [CrudAjax]
GO
CREATE PROCEDURE EstadoGetAll
AS
BEGIN
SELECT [IdEstado]
      ,[Estado]
  FROM [dbo].[Estado]
END

GO
--------------------------------------------------------------------------------------------------
--STORED PROCEDURE EmpleadoGetAll
CREATE PROCEDURE EmpleadoGetById 1
@IdEmpleado INT
AS
BEGIN
SELECT Empleado.[IdEmpleado]
      ,Empleado.[NumeroNomina]
      ,Empleado.[Nombre]
      ,Empleado.[ApellidoPaterno]
      ,Empleado.[ApellidoMaterno]
      ,Empleado.[IdEstado]
	  ,Estado.Estado
  FROM [dbo].[Empleado] INNER JOIN Estado on Estado.IdEstado = Empleado.IdEstado
  WHERE Empleado.IdEmpleado = @IdEmpleado
END







