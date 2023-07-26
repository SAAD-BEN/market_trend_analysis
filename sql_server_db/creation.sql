SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE Job_posts (
    Id INT NOT NULL,
    Company_id int NOT NULL,
    Job_Title VARCHAR(1000) NOT NULL,
    Location_id int NOT NULL,
    Job_Type VARCHAR(50) NOT NULL CHECK (Job_Type IN ('Full_Time', 'Internship', 'Part_Time')),
    Experience_level VARCHAR(50) NOT NULL CHECK (Experience_level IN ('Entry-level', 'Senior-level', 'Mid-level', 'Not-Specified', 'Executive-level')),
    Salary_in_1000_USD FLOAT NOT NULL,
    Negotiable BIT NOT NULL,
    Asterisk BIT NOT NULL,
    Job_category VARCHAR(50) NOT NULL CHECK (Job_category IN ('Data_Science', 'Artificial_Intelligence', 'Big_Data', 'Other')),
    CONSTRAINT PK_Job_posts PRIMARY KEY CLUSTERED (Id ASC)
);

CREATE TABLE Company (
    Id int  NOT NULL ,
    Name VARCHAR(1000)  NOT NULL ,
    CONSTRAINT PK_Company PRIMARY KEY CLUSTERED (
        Id ASC
    )
)

CREATE TABLE Location (
    Id int  NOT NULL ,
    Full_location VARCHAR(1000)  NOT NULL ,
    Country_code VARCHAR(10)  NOT NULL ,
    CONSTRAINT PK_Location PRIMARY KEY CLUSTERED (
        Id ASC
    )
)

CREATE TABLE Country (
    Country_code VARCHAR(10)  NOT NULL ,
    Country_name VARCHAR(1000)  NOT NULL ,
    CONSTRAINT PK_Country PRIMARY KEY CLUSTERED (
        Country_code ASC
    )
)

CREATE TABLE Requirments (
    Id int  NOT NULL ,
    Name VARCHAR(1000)  NOT NULL ,
    CONSTRAINT PK_Requirments PRIMARY KEY CLUSTERED (
        Id ASC
    )
)

CREATE TABLE Facilities (
    Id int  NOT NULL ,
    Name VARCHAR(1000)  NOT NULL ,
    CONSTRAINT PK_Facilities PRIMARY KEY CLUSTERED (
        Id ASC
    )
)

CREATE TABLE Requirment_of_the_job (
    Job_id int  NOT NULL ,
    Requirment_of_the_company_id int  NOT NULL 
)

CREATE TABLE Facilities_of_the_job (
    Job_id int  NOT NULL ,
    Facilitie_id int  NOT NULL 
)

ALTER TABLE Job_posts WITH CHECK ADD CONSTRAINT FK_Job_posts_Company_id FOREIGN KEY(Company_id)
REFERENCES Company (Id)

ALTER TABLE Job_posts CHECK CONSTRAINT FK_Job_posts_Company_id

ALTER TABLE Job_posts WITH CHECK ADD CONSTRAINT FK_Job_posts_Location_id FOREIGN KEY(Location_id)
REFERENCES Location (Id)

ALTER TABLE Job_posts CHECK CONSTRAINT FK_Job_posts_Location_id

ALTER TABLE Location WITH CHECK ADD CONSTRAINT FK_Location_Country_code FOREIGN KEY(Country_code)
REFERENCES Country (Country_code)

ALTER TABLE Location CHECK CONSTRAINT FK_Location_Country_code


ALTER TABLE Requirment_of_the_job WITH CHECK ADD CONSTRAINT FK_Requirment_of_the_job_Requirment_Id FOREIGN KEY(Requirment_of_the_company_id)
REFERENCES Requirments (Id)

ALTER TABLE Requirment_of_the_job CHECK CONSTRAINT FK_Requirment_of_the_job_Requirment_Id

ALTER TABLE Requirment_of_the_job WITH CHECK ADD CONSTRAINT FK_Requirment_of_the_job_Job_id FOREIGN KEY(Job_id)
REFERENCES Job_posts (Id)

ALTER TABLE Requirment_of_the_job CHECK CONSTRAINT FK_Requirment_of_the_job_Job_id

ALTER TABLE Facilities_of_the_job WITH CHECK ADD CONSTRAINT FK_Facilities_of_the_job_Job_id FOREIGN KEY(Job_id)
REFERENCES Job_posts (Id)

ALTER TABLE Facilities_of_the_job CHECK CONSTRAINT FK_Facilities_of_the_job_Job_id

ALTER TABLE Facilities_of_the_job WITH CHECK ADD CONSTRAINT FK_Facilities_of_the_job_Facilitie_id FOREIGN KEY(Facilitie_id)
REFERENCES Facilities (Id)

ALTER TABLE Facilities_of_the_job CHECK CONSTRAINT FK_Facilities_of_the_job_Facilitie_id

COMMIT TRANSACTION QUICKDBD