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

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no, emp.first_name, emp.last_name, emp.sex, sa.salary
FROM "Employees" emp 
INNER JOIN "Salary" sa ON
emp.emp_no=sa.emp_no;

-- Show employees hired in 1986
SELECT emp.first_name, emp.last_name, emp.hire_date
FROM "Employees" emp
WHERE emp.hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_no, dep.dept_name
FROM "Employees" emp
LEFT JOIN "Manager" ma
ON emp.emp_no = ma.emp_no
LEFT JOIN "Departments" dep
ON ma.dept_no = dep.dept_no;

-- List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM "Employees" emp 
LEFT JOIN "Dept_Emply" dem
ON emp.emp_no = dem.emp_no
LEFT JOIN "Departments" dep
ON dem.dept_no = dep.dept_no

-- List first name, last name, and sex for employees whose first name 
--is "Hercules" and last names begin with "B."

SELECT emp.first_name, emp.last_name, emp.sex
FROM "Employees" emp
WHERE emp.first_name = 'Hercules' AND emp.last_name like 'B_%'

-- List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM "Employees" emp
LEFT JOIN "Dept_Emply" dem
ON emp.emp_no = dem.emp_no
LEFT JOIN "Departments" dep
ON dem.dept_no = dep.dept_no
WHERE dep.dept_name = 'Sales'


-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM "Employees" emp
LEFT JOIN "Dept_Emply" dem
ON emp.emp_no = dem.emp_no
LEFT JOIN "Departments" dep
ON dem.dept_no = dep.dept_no
WHERE dep.dept_name = 'Sales' OR dep.dept_name = 'Development'

--In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT last_name, 
COUNT(last_name) AS "frequency" 
FROM "Employees" emp
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;


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

