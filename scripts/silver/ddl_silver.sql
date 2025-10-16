/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates the tables for the 'silver' schema. 
    It drops each table if it already exists, ensuring a clean re-creation.

    The 'silver' schema contains cleaned and standardized data 
    derived from the 'bronze' (raw) layer in the Data Warehouse.

Usage:
    Run this script whenever you need to redefine or reset 
    the DDL structure of the 'silver' tables.
===============================================================================
*/


/*==============================================================================
 Table: silver.crm_cust_info
 Purpose:
     Stores customer information such as name, gender, and marital status.
==============================================================================*/
IF OBJECT_ID('silver.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE silver.crm_cust_info;
GO

CREATE TABLE silver.crm_cust_info (
    cst_id             INT,                    -- Unique customer ID
    cst_key            NVARCHAR(50),           -- Business key (from CRM system)
    cst_firstname      NVARCHAR(50),           -- Customer first name
    cst_lastname       NVARCHAR(50),           -- Customer last name
    cst_marital_status NVARCHAR(50),           -- Marital status
    cst_gndr           NVARCHAR(50),           -- Gender
    cst_create_date    DATE,                   -- Original creation date
    dwh_create_date    DATETIME2 DEFAULT GETDATE()  -- Data warehouse load date
);
GO


/*==============================================================================
 Table: silver.crm_prd_info
 Purpose:
     Contains product information, including category, cost, and validity dates.
==============================================================================*/
IF OBJECT_ID('silver.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE silver.crm_prd_info;
GO

CREATE TABLE silver.crm_prd_info (
    prd_id          INT,                       -- Product ID
    cat_id          NVARCHAR(50),              -- Category ID
    prd_key         NVARCHAR(50),              -- Product key (from CRM system)
    prd_nm          NVARCHAR(50),              -- Product name
    prd_cost        INT,                       -- Product cost
    prd_line        NVARCHAR(50),              -- Product line
    prd_start_dt    DATE,                      -- Start date of product validity
    prd_end_dt      DATE,                      -- End date of product validity
    dwh_create_date DATETIME2 DEFAULT GETDATE() -- Data warehouse load date
);
GO


/*==============================================================================
 Table: silver.crm_sales_details
 Purpose:
     Stores sales transactions with details such as order date, quantity, and price.
==============================================================================*/
IF OBJECT_ID('silver.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE silver.crm_sales_details;
GO

CREATE TABLE silver.crm_sales_details (
    sls_ord_num     NVARCHAR(50),              -- Sales order number
    sls_prd_key     NVARCHAR(50),              -- Product key
    sls_cust_id     INT,                       -- Customer ID
    sls_order_dt    DATE,                      -- Order date
    sls_ship_dt     DATE,                      -- Shipping date
    sls_due_dt      DATE,                      -- Due date
    sls_sales       INT,                       -- Total sales amount
    sls_quantity    INT,                       -- Quantity sold
    sls_price       INT,                       -- Unit price
    dwh_create_date DATETIME2 DEFAULT GETDATE() -- Data warehouse load date
);
GO


/*==============================================================================
 Table: silver.erp_loc_a101
 Purpose:
     Contains location information from the ERP system.
==============================================================================*/
IF OBJECT_ID('silver.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE silver.erp_loc_a101;
GO

CREATE TABLE silver.erp_loc_a101 (
    cid             NVARCHAR(50),              -- Customer or location ID
    cntry           NVARCHAR(50),              -- Country
    dwh_create_date DATETIME2 DEFAULT GETDATE() -- Data warehouse load date
);
GO


/*==============================================================================
 Table: silver.erp_cust_az12
 Purpose:
     Stores ERP customer demographic information such as birth date and gender.
==============================================================================*/
IF OBJECT_ID('silver.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE silver.erp_cust_az12;
GO

CREATE TABLE silver.erp_cust_az12 (
    cid             NVARCHAR(50),              -- Customer ID
    bdate           DATE,                      -- Birth date
    gen             NVARCHAR(50),              -- Gender
    dwh_create_date DATETIME2 DEFAULT GETDATE() -- Data warehouse load date
);
GO


/*==============================================================================
 Table: silver.erp_px_cat_g1v2
 Purpose:
     Contains product category and subcategory data from the ERP system.
==============================================================================*/
IF OBJECT_ID('silver.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE silver.erp_px_cat_g1v2;
GO

CREATE TABLE silver.erp_px_cat_g1v2 (
    id              NVARCHAR(50),              -- Record or product ID
    cat             NVARCHAR(50),              -- Category
    subcat          NVARCHAR(50),              -- Subcategory
    maintenance     NVARCHAR(50),              -- Maintenance type or flag
    dwh_create_date DATETIME2 DEFAULT GETDATE() -- Data warehouse load date
);
GO
