CREATE TABLE departments (
    dept_no CHAR(25) PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE titles (
    title_id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp (
    emp_no INT,
    dept_no CHAR(25),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no CHAR(25),
    emp_no INT,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);