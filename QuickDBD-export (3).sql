-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Create a new tables

SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [departments] (
    [dept_no] VARCHAR  NOT NULL ,
    [dept_name] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [dept_emp] (
    [emp_no] INT  NOT NULL ,
    [dept_no] VARCHAR  NOT NULL 
)

CREATE TABLE [dept_manager] (
    [dept_no] VARCHAR  NOT NULL ,
    [emp_no] INT  NOT NULL 
)

CREATE TABLE [employees] (
    [emp_no] INT  NOT NULL ,
    [emp_title_id] VARCHAR  NOT NULL ,
    [birth_date] DATE  NOT NULL ,
    [first_name] VARCHAR  NOT NULL ,
    [last_name] VARCHAR  NOT NULL ,
    [sex] VARCHAR  NOT NULL ,
    [hire_date] DATE  NOT NULL ,
    CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [salaries] (
    [emp_no] INT  NOT NULL ,
    [salary] INT  NOT NULL 
)

CREATE TABLE [titles] (
    [title_id] VARCHAR  NOT NULL ,
    [title] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_titles] PRIMARY KEY CLUSTERED (
        [title_id] ASC
    )
)

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_emp_no]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_dept_no] FOREIGN KEY([dept_no])
REFERENCES [departments] ([dept_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_dept_no]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_emp_no]

ALTER TABLE [employees] WITH CHECK ADD CONSTRAINT [FK_employees_emp_title_id] FOREIGN KEY([emp_title_id])
REFERENCES [titles] ([title_id])

ALTER TABLE [employees] CHECK CONSTRAINT [FK_employees_emp_title_id]

ALTER TABLE [salaries] WITH CHECK ADD CONSTRAINT [FK_salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [salaries] CHECK CONSTRAINT [FK_salaries_emp_no]

COMMIT TRANSACTION QUICKDBD