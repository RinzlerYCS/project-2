--Creating Table: category
CREATE TABLE "category" (
    "category_id" VARCHAR(8) NOT NULL, 
    "category" VARCHAR(20) NOT NULL, 
    PRIMARY KEY ("category")
);

--Creating Table: subcategory
CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR(8) NOT NULL, 
    "subcategory" VARCHAR(20) NOT NULL, 
    PRIMARY KEY ("subcategory")
);

--Creating Table: contacts
CREATE TABLE "contacts" (
    "contact_id" INT NOT NULL, 
    "first_name" VARCHAR(50) NOT NULL, 
    "last_name" VARCHAR(50) NOT NULL, 
    "email" VARCHAR(100) NOT NULL, 
    PRIMARY KEY ("contact_id")
);

--Creating Table: campaign
CREATE TABLE "campaign" (
    "cf_id" INT NOT NULL, -- Crowdfunding ID
    "contact_id" INT NOT NULL, 
    "company_name" VARCHAR(50) NOT NULL, 
    "description" TEXT, 
    "goal" NUMERIC(10, 2) NOT NULL, -- Funding goal
    "pledged" NUMERIC(10, 2), -- Amount pledged
    "outcome" VARCHAR(50), -- Outcome of the campaign
    "backers_count" INT, -- Number of backers
    "country" VARCHAR(50), -- Country of the campaign
    "currency" VARCHAR(10), -- Currency used
    "launch_date" DATE, -- Launch date
    "end_date" DATE, -- End date
    FOREIGN KEY ("contact_id") REFERENCES "contacts"("contact_id"),
    PRIMARY KEY ("cf_id")
);

--Creating Table: crowdfunding
CREATE TABLE "crowdfunding" (
    "cf_id" INT NOT NULL, 
	"contact_id" INT NOT NULL,
    "company_name" VARCHAR(50) NOT NULL, 
    "blurb" TEXT, -- Brief description of the campaign
    "goal" NUMERIC(10, 2) NOT NULL, 
    "pledged" NUMERIC(10, 2), 
    "outcome" VARCHAR(50), 
    "backers_count" INT, 
    "country" VARCHAR(50), 
    "currency" VARCHAR(10), 
    "launched_at" INT, 
    "deadline" INT, 
	"staff_pick" BOOLEAN NOT NULL,
	"spotlight" BOOLEAN NOT NULL,
    "category" VARCHAR(100), 
    "subcategory" VARCHAR(100), 
    FOREIGN KEY ("category") REFERENCES "category"("category"),
    FOREIGN KEY ("subcategory") REFERENCES "subcategory"("subcategory"),
    PRIMARY KEY ("cf_id")
);

--Selecting to check if all tables info are uploaded correctly to the database.

SELECT * FROM category

SELECT * FROM subcategory 

SELECT * FROM contacts

SELECT * FROM campaign

SELECT * FROM crowdfunding