-- Table: category
CREATE TABLE "category" (
    "category_id" VARCHAR(8) NOT NULL, -- Primary Key
    "category" VARCHAR(20) NOT NULL, -- Name of the category
    PRIMARY KEY ("category")
);

-- Table: subcategory
CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR(8) NOT NULL, -- Primary Key
    "subcategory" VARCHAR(20) NOT NULL, -- Name of the subcategory
    PRIMARY KEY ("subcategory")
);

-- Table: contacts
CREATE TABLE "contacts" (
    "contact_id" INT NOT NULL, -- Primary Key
    "first_name" VARCHAR(50) NOT NULL, -- First name of the contact
    "last_name" VARCHAR(50) NOT NULL, -- Last name of the contact
    "email" VARCHAR(100) NOT NULL, -- Email of the contact
    PRIMARY KEY ("contact_id")
);

-- Table: campaign
CREATE TABLE "campaign" (
    "cf_id" INT NOT NULL, -- Primary Key
    "contact_id" INT NOT NULL, -- Foreign Key referencing contacts table
    "company_name" VARCHAR(50) NOT NULL, -- Name of the company
    "description" TEXT, -- Description of the campaign
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

-- Table: crowdfunding
CREATE TABLE "crowdfunding" (
    "cf_id" INT NOT NULL, -- Primary Key
	"contact_id" INT NOT NULL,
    "company_name" VARCHAR(50) NOT NULL, -- Company name
    "blurb" TEXT, -- Brief description of the campaign
    "goal" NUMERIC(10, 2) NOT NULL, -- Funding goal
    "pledged" NUMERIC(10, 2), -- Amount pledged
    "outcome" VARCHAR(50), -- Outcome of the campaign
    "backers_count" INT, -- Number of backers
    "country" VARCHAR(50), -- Country of the campaign
    "currency" VARCHAR(10), -- Currency used
    "launched_at" INT, -- Launch date and time
    "deadline" INT, -- Deadline date and time
	"staff_pick" BOOLEAN NOT NULL,
	"spotlight" BOOLEAN NOT NULL,
    "category" VARCHAR(100), -- Category (not normalized)
    "subcategory" VARCHAR(100), -- Subcategory (not normalized)
    FOREIGN KEY ("category") REFERENCES "category"("category"),
    FOREIGN KEY ("subcategory") REFERENCES "subcategory"("subcategory"),
    PRIMARY KEY ("cf_id")
);

SELECT * FROM category

SELECT * FROM subcategory 

SELECT * FROM contacts

SELECT * FROM campaign

SELECT * FROM crowdfunding