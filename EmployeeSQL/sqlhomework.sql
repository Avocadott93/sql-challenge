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


--Data Analysis

-- View employees information
SELECT Employees.emp_no, Employees.first_name, Employees.last_name, Employees.sex, Salary.salary
FROM "Employees", 
INNER JOIN "Salary" ON
Employees.emp_no=Salary.emp_no;

-- Employees hired in 1986
SELECT Employees.first_name, Employees.last_name, Employees.hire_date
FROM "Employees"
WHERE Employees.hire_date = 1986;

-- List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.

SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_no, Departments.dept_name
FROM "Employees"
LEFT JOIN "Manager"
ON Employees.emp_no = Manager.emp_no
LEFT JOIN "Departments"
ON Manager.dept_no = Departments.dept_no;

-- List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.

SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Dept_Emply.dept_name
FROM "Employees"
JOIN "Dept_Emply"
ON Employees.emp_no = Dept_Emply.emp_no

-- List first name, last name, and sex for employees whose first name 
--is "Hercules" and last names begin with "B."

SELECT Employees.first_name, Employees.last_name, Employees.sex
FROM "Employees"
WHERE Employees.last_name like 'B_%'

-- List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM "Employees"
JOIN "Departments"
WHERE Departments.dept_name = "Sales"


-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM "Employees"
JOIN "Departments"
WHERE Departments.dept_name = "Sales" 
OR Departments.dept_name = "Development"

--In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT "Employees.last_name" as name,
COUNT(name)
FROM "Employees",
GROUP BY name
ORDER BY 
COUNT(name) DESC



-- -- Order by descending values
SELECT rental_rate, ROUND(AVG(length),2) AS "avg length"
FROM film
GROUP BY rental_rate
ORDER BY "avg length" DESC;


----
--SELECT players.first_name, players.last_name, players.hand, matches.loser_rank
--FROM matches
--INNER JOIN players ON
--players.player_id=matches.loser_id;

----
ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Title" ("title_id");

ALTER TABLE "Salary" ADD CONSTRAINT "fk_Salary_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Manager" ADD CONSTRAINT "fk_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Emply" ADD CONSTRAINT "fk_Dept_Emply_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emply" ADD CONSTRAINT "fk_Dept_Emply_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

