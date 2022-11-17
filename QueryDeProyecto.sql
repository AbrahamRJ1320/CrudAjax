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
--STORED PROCEDURE EmpleadoGetById
CREATE PROCEDURE EmpleadoGetById 
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

---------------------------------------------------------------------------------------------------

--STORED PROCEDURE DELETE
USE [CrudAjax]
GO
CREATE PROCEDURE EmpleadoDelete
@IdEmpleado INT
AS
BEGIN

DELETE FROM [dbo].[Empleado]
      WHERE IdEmpleado = @IdEmpleado

END
GO
---------------------------------------------------------------------------------------

--STORED PROCEDURE EMPLEADO UPDATE 
USE [CrudAjax]
GO
CREATE PROCEDURE EmpleadoUpdate
@IdEmpleado INT,
@NumeroNomina VARCHAR(10),
@Nombre VARCHAR(50),
@ApellidoPaterno VARCHAR(50),
@ApellidoMaterno VARCHAR(50),
@IdEstado INT
AS
BEGIN
UPDATE [dbo].[Empleado]
   SET [NumeroNomina] = @NumeroNomina
      ,[Nombre] = @Nombre
      ,[ApellidoPaterno] = @ApellidoPaterno
      ,[ApellidoMaterno] = @ApellidoMaterno
      ,[IdEstado] = @IdEstado
 WHERE IdEmpleado = @IdEmpleado
END

GO

-----------------------------------------------------------------------------------------------
--STORED PROCEDURE EMPLEADOADD
USE [CrudAjax]
GO
CREATE PROCEDURE EmpleadoAdd
@NumeroNomina VARCHAR(10),
@Nombre VARCHAR(50),
@ApellidoPaterno VARCHAR(50),
@ApellidoMaterno VARCHAR(50),
@IdEstado INT
AS
BEGIN

INSERT INTO [dbo].[Empleado]
           ([NumeroNomina]
           ,[Nombre]
           ,[ApellidoPaterno]
           ,[ApellidoMaterno]
           ,[IdEstado])
     VALUES
           (@NumeroNomina
           ,@Nombre
           ,@ApellidoPaterno
           ,@ApellidoMaterno
           ,@IdEstado)
END

GO
--------------------------------------------------------------------------------------------------








