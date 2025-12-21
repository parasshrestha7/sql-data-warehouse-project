/*
=============================================================
Create Database and Schemas
=============================================================
Script Description:
    This script creates the DataWarehouse database in a controlled way that avoids 
    modifying or removing anything that already exists. It checks whether the database 
    is already present on the server, and if it is, the script prints an error message 
    and stops execution. If the database does not exist, it is created along with the 
    bronze, silver, and gold schemas.
Script Purpose:
    The purpose of this script is to provide a consistent and predictable method for 
    setting up a new data‑warehouse environment, particularly in automated deployment 
    scenarios. It will not overwrite or recreate an existing database, and this behavior 
    is intentional to prevent unintended changes. Ensure the executing user has the 
    required permissions to create databases and schemas.
*/

USE master;
GO

-- Check if 'DataWarehouse' already exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    PRINT 'ERROR: The database ''DataWarehouse'' already exists.';
    RETURN;  -- Stop execution safely
END
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'bronze')
    EXEC('CREATE SCHEMA bronze');
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'silver')
    EXEC('CREATE SCHEMA silver');
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'gold')
    EXEC('CREATE SCHEMA gold');
GO
