# sql-challenge Assignment

In this assignment, i designed the tables to hold data in the CSVs, import the CSVs into a SQL database, and answer questions about the data. I performed Data Engineering and Data Analysis on the employees data at Pewlett Hackard from the 1980s to 1990s.

# Preperation

1. Before starting to code, I created a new repository for this project called sql-challenge. 

2. Cloned the new repository to your computer.


3. Created a directory for the SQL challenge inside of my local repository. Used a folder name to correspond to the challenge: EmployeeSQL.


4. Add your files to this folder.


5. Push the above changes to GitHub.


# Data Modeling
Inspect the CSVs and sketch out an ERD of the tables through website: http://www.quickdatabasediagrams.com.

# Data Engineering

* Use the information you have to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.

* For the primary keys check to see if the column is unique, otherwise create a composite key. Which takes to primary keys in order to uniquely identify a row.
        * Making sure to create tables in the correct order

* Import each CSV file into the corresponding SQL table. 
        *   Be sure to import the data in the same order that the tables were created and account for the headers when importing to avoid errors. 
        * When importing tables, make sure to pay attention to if a header is included, and select "," for CSVs

        * In the event of making a mistake, delete imported tables in the opposite order
    
    # Data Analysis
    Once I have a complete database, I did the following:


    1. List the following details of each employee: employee number, last name, first name, sex, and salary.


    2. List first name, last name, and hire date for employees who were hired in 1986.


    3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.


    4. List the department of each employee with the following information: employee number, last name, first name, and department name.


    5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."


    6. List all employees in the Sales department, including their employee number, last name, first name, and department name.


    7.  List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


    8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.





