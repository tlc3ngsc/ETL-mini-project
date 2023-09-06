--This schema creates and alters various tables in the crowdfunding database 
--to get the db ready to import data from csv files

--create table for contacts csv file
CREATE TABLE contacts (
 contact_id INTEGER NOT NULL,
 last_name VARCHAR(30) NOT NULL,
 first_name VARCHAR(30) NOT NULL,
 email VARCHAR(45) NOT NULL,
	PRIMARY KEY (contact_id)
);
--change email column size to accomodate longer email addresses
ALTER TABLE contacts ALTER COLUMN email TYPE VARCHAR(45)

--create a table for category csv file
--employees can belong to multiple departments, create a composite key
CREATE TABLE category ( 
	category_id VARCHAR(10) NOT NULL,
	category VARCHAR(20) NOT NULL,
	PRIMARY KEY (category_id, category)
);

--create a table for subcategory csv file
--employees can belong to multiple departments, create a composite key
CREATE TABLE subcategory ( 
	subcategory_id VARCHAR(10) NOT NULL,
	subcategory VARCHAR(20) NOT NULL,
	PRIMARY KEY (subcategory_id)
);


--create a table for campaign csv file
CREATE TABLE campaign ( 
	cf_id INTEGER NOT NULL,
	contact_id INTEGER NOT NULL,
	company_name VARCHAR(30) NOT NULL,
	description VARCHAR(45) NOT NULL,
	goal DECIMAL NOT NULL,
	pledged DECIMAL NOT NULL,
	outcome VARCHAR(11),
	backers_count INTEGER NOT NULL,
	country VARCHAR(2) NOT NULL,
	currency VARCHAR(3) NOT NULL,
	launch_date DATE NOT NULL,
	end_date DATE NOT NULL,
	staff_pick VARCHAR(5),
	spotlight VARCHAR(5),
	"category_&_sub-category" VARCHAR(20),
	category VARCHAR(15),
	subcategory VARCHAR(15),
	subcategory_id VARCHAR(8),
	PRIMARY KEY (cf_id)
);
--change description column size to accomodate longer string
ALTER TABLE campaign ALTER COLUMN description TYPE VARCHAR(60)
--change company_name column size to accomodate longer string
ALTER TABLE campaign ALTER COLUMN company_name TYPE VARCHAR(45)
--change ccategory/subcatetory column size to accomodate longer string
ALTER TABLE campaign ALTER COLUMN "category_&_sub-category" TYPE VARCHAR(30)
--change subcateogry column size to accomodate longer string
ALTER TABLE campaign ALTER COLUMN subcategory TYPE VARCHAR(25)

-- --add contact_id as foreign key to campaign table 
ALTER TABLE campaign ADD CONSTRAINT contact_id FOREIGN KEY (contact_id) REFERENCES contacts(contact_id);

-- --add subcategory_id as foreign key to campaign table 
ALTER TABLE campaign ADD CONSTRAINT subcategory_id FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id);

-- --add category as unique 
ALTER TABLE category ADD CONSTRAINT uniquecategory UNIQUE(category);

-- --add subcategory_id as foreign key to campaign table 
ALTER TABLE campaign ADD CONSTRAINT category FOREIGN KEY (category) REFERENCES category(category);
