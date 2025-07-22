--  bronze layer

-----------------

create table bronze.crm_cust_info(
 cst_id int,
 cst_key varchar(50),
 cst_fiestname varchar(100),
 cst_lastname varchar(100),
 cst_material_status varchar(100),
 cst_gndr varchar(100),
 cse_create_date Date
 )

 -----------------

 create table bronze.crm_prd_info(
 prd_id int,
 prd_key varchar(50),
 prd_nm varchar(100),
 prd_cost int,
 prd_line varchar(100),
 prd_start_dt DATE,
 prd_end_date Date
 )

 -------------------

  create table bronze.crm_sales_details(
 sls_ord_num varchar(100),
 sls_prd_key varchar(50),
 sls_cust_id int,
 sls_order_dt int,
 sls_ship_dt DATE,
 sls_due_dt DATE,
 sls_sales int,
 sls_quantity int,
 sls_price int
 )

 DROP TABLE bronze.crm_sales_details

 -----------------

 create table bronze.erp_loc_a101(
	cid varchar(50),
	cntry varchar(50)
)

------------------

create table bronze.erp_cust_az12(
	cid varchar(50),
	bdate DATE,
	gen varchar(50)
)

------------------

create table bronze.erp_pz_cat_g1v2(
	id varchar(50),
	cat varchar(50),
	subcat varchar(50),
	maintenance varchar (50)
)


------------------------------------------------------------------------------------------------------------------------------------------------------



CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
DECLARE @START_TIME DATETIME, @END_TIME DATETIME;

	BEGIN TRY
			SET @START_TIME = GETDATE();

			PRINT '============================================';
			PRINT 'LOADING BRONZE LAYER';
			PRINT '============================================';

			PRINT '--------------------------------------------';
			PRINT 'LOADING CRM TABLES';
			PRINT '--------------------------------------------';


			PRINT '>>TRUNCATING DATA FROM TABLE -: bronze.crm_cust_info ';
				TRUNCATE TABLE bronze.crm_cust_info;

			PRINT 'INSERTING DATA INTO : bronze.crm_cust_info'
				BULK INSERT bronze.crm_cust_info
				FROM 'D:\sql soft\MSSQL16.SQLEXPRESS\MSSQL\Backup\cust_info.csv'
				with (firstrow = 2,
					FIELDTERMINATOR = ',',
					TABLOCK
				)
				------------------------------------------------------------------
			PRINT '>>TRUNCATING DATA FROM TABLE -: bronze.crm_cust_info ';
				TRUNCATE TABLE bronze.crm_prd_info;

			PRINT 'INSERTING DATA INTO; bronze.crm_prd_info'
				bulk insert bronze.crm_prd_info
				from 'D:\sql soft\MSSQL16.SQLEXPRESS\MSSQL\Backup\prd_info.csv'
				with (firstrow = 2,
					FIELDTERMINATOR = ',',
					TABLOCK
					)

				------------------------------------------------------------------
			PRINT '>>TRUNCATING DATA FROM TABLE -:  bronze.crm_sales_details ';
				TRUNCATE TABLE bronze.crm_sales_details;

			PRINT 'INSERTING DATA INTO; bronze.crm_sales_detail'
				bulk insert bronze.crm_sales_details
				from 'D:\sql soft\MSSQL16.SQLEXPRESS\MSSQL\Backup\sales_details.csv'
				with (
					firstrow = 2,
					FIELDTERMINATOR = ',',
					TABLOCK
					);

				------------------------------------------------------------------

			PRINT '--------------------------------------------';
			PRINT 'LOADING CRP TABLES';
			PRINT '--------------------------------------------';

			PRINT '>>TRUNCATING DATA FROM TABLE -:  bronze.erp_cust_az12';
				TRUNCATE TABLE bronze.erp_cust_az12;

			PRINT 'INSERTING DATA INTO: bronze.erp_cust_az12'
				bulk insert bronze.erp_cust_az12
				from 'D:\sql soft\MSSQL16.SQLEXPRESS\MSSQL\Backup\cust_az12.csv'
				with (
					firstrow = 2,
					FIELDTERMINATOR = ',',
					TABLOCK
					);

				-----------------------------------------------------------------
			PRINT '>>TRUNCATING DATA FROM TABLE -:  bronze.erp_loc_a101';
				TRUNCATE TABLE bronze.erp_loc_a101;

			PRINT 'INSERTING DATA INTO: bronze.erp_loc_a101'
				bulk insert bronze.erp_loc_a101
				from 'D:\sql soft\MSSQL16.SQLEXPRESS\MSSQL\Backup\loc_a101.csv'
				with (
					firstrow = 2,
					FIELDTERMINATOR = ',',
					TABLOCK
					);

				-----------------------------------------------------------------
			PRINT '>>TRUNCATING DATA FROM TABLE -:  bronze.erp_pz_cat_g1v2';
				TRUNCATE TABLE bronze.erp_pz_cat_g1v2;

			PRINT 'INSERTING DATA INTO: bronze.erp_pz_cat_g1v2'
				bulk insert bronze.erp_pz_cat_g1v2
				from 'D:\sql soft\MSSQL16.SQLEXPRESS\MSSQL\Backup\PX_CAT_G1V2.csv'
				with (
					firstrow = 2,
					FIELDTERMINATOR = ',',
					TABLOCK
					);

				-- (changed the file name px to pz)	
			SET @END_TIME = GETDATE();

		PRINT '>> LOADING TIME:' + CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS VARCHAR(100))+ ' SECONDS'
	END TRY
BEGIN CATCH
	PRINT '========================================='
	PRINT 'ERROR IN BRONZE LAYER'
	PRINT '========================================='

	PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
	PRINT '-------------------------------------------'
	PRINT 'ERROR NUMBER' + CAST(ERROR_NUMBER() AS VARCHAR(100));
END CATCH
END
	-----------------------------------------------------------------
