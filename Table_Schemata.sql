--DATA ENGINEERING

--Import CSV files to create the tables

--QUERY * FROM SPECIFIC TABLES
--SELECT * FROM departments;
--SELECT * FROM dept_emp;
--SELECT * FROM dept_manager;
--SELECT * FROM employees;	
--SELECT * FROM salaries;
--SELECT * FROM titles;


--DROP TABLE IF EXISTS departments
--This code creates a table named departments
CREATE TABLE departments(dept_no VARCHAR (5), NOT NULL,
						 dept_name VARCHAR(30), NOT NULL,
						 PRIMARY KEY (dept_no));
						 


--This code creates a table named dept_emp
--DROP TABLE IF EXISTS dept_emp
CREATE TABLE dept_emp(emp_no INT, NOT NULL, 
					  dept_no VARCHAR, NOT NULL);
					  PRIMARY KEY (emp_no, dept_no));


--This code creates a table named dept_manager
--DROP TABLE IF EXISTS dept_manager
CREATE TABLE dept_manager(dept_no VARCHAR, NOT NULL,
						  emp_no INT, NOT NULL,
						  PRIMARY KEY (dept_no, emp_no));


--This code creates a table named employees
--DROP TABLE IF EXISTS employees
CREATE TABLE employees(emp_no INT, NOT NULL,
					   emp_title VARCHAR, NOT NULL,
					   birth_date VARCHAR, NOT NULL,
					   first_name VARCHAR, NOT NULL,
					   last_name VARCHAR, NOT NULL,
					   sex VARCHAR, NOT NULL,
					   hire_date VARCHAR, NOT NULL,
					   PRIMARY KEY (emp_no));


--This code creates a table named salaries
--DROP TABLE IF EXISTS salaries
CREATE TABLE salaries(emp_no INT, NOT NULL, 
					  salary INT, NOT NULL,
					  PRIMARY KEY (emp_no));


--This code creates a table named titles
--DROP TABLE IF EXISTS titles
CREATE TABLE titles(title_id VARCHAR, NOT NULL, 
					title VARCHAR(30), NOT NULL,
					PRIMARY KEY (title_id, title));


--DATA MODELING

--TABLE RELATIONSHIPS
--THESE CODES WERE CREATED ON AND IMPORTED QUICK DB DIAGRAMS TOGETHER WITH THE ERD 


CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title" VARCHAR   NOT NULL,
    "birth_date" VARCHAR   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "departments" ADD CONSTRAINT "fk_departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_emp" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_emp" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_manager" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_emp" ("emp_no");


