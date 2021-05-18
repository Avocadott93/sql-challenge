-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

DROP TABLE "Dept_Emply"
DROP TABLE "Manager"
DROP TABLE "Departments"
DROP TABLE "Salary"
DROP TABLE "Employees"


CREATE TABLE "Title" (
    "title_id" varchar(10)   NOT NULL,
    "title" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Title" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Employees" (
    "emp_no" varchar(20)   NOT NULL,
    "emp_title_id" varchar(10)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "sex" varchar(10)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salary" (
    "emp_no" varchar(20)   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "Departments" (
    "dept_no" varchar(20)   NOT NULL,
    "dept_name" varchar(40)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Manager" (
    "dept_no" varchar(20)   NOT NULL,
    "emp_no" varchar(30)   NOT NULL
);


CREATE TABLE "Dept_Emply" (
    "emp_no" varchar(20)   NOT NULL,
    "dept_no" varchar(20)   NOT NULL
);

-- View Tables
SELECT *
FROM "Title";

SELECT *
FROM "Employees";

SELECT *
FROM "Salary";

SELECT *
FROM "Departments";

SELECT *
FROM "Manager";

SELECT *
FROM "Dept_Emply";