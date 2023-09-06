# ETL-mini-project

extract, transform, and load (ETL) process, which consists of extracting data from datasets, transforming the data, and then loading the transformed data into a database

The transformed CSVs, SQL, and ERD files are in MSU_Project2/Resources folder.

There are four CSV files - campaign, category, contacts, and subcategory. These files were extracted from Excel and transformed using the code in the Jupyter Notebook.

The SQL schema file - crowdfunding_db_schema.sql - contains queries written to create and edit tables in the crowdfunding database. Various column sizes had to be altered to accomodate longer strings. These modifications were done after the tables were created and are reflected in their respective queries. Finally, foreign keys were added to the campaign table. To link category table as a foreign key, a unique constraint had to be added to the category column in category table. This is also added as a query in the sql file.
