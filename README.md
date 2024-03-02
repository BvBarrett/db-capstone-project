# Capstone project Little Lemon Database

## About
<p align="center">
    <img src="https://1000logos.net/wp-content/uploads/2021/10/logo-Meta.png" alt="Developer Roadmap" width="120" height="">
  </a>
</p>
  <h2 align="center">Meta Database Engineer Capstone</h2>
</div>

The capstone project serves as a culmination of the specialization [meta-database-engineer](https://www.coursera.org/professional-certificates/meta-database-engineer#courses), by demonstrating the skills that constitutes designing and composing a database solution and the relevant technologies.

## Acknowledgement  
This project utilizes synthetic data generated by OpenAI's ChatGPT. Due to the unavailability of the specific data initially intended for use in this capstone project course, I opted to leverage ChatGPT to create a realistic dataset that aligns with the project's requirements. This approach allowed us to proceed with the database and client system development for the Little Lemon restaurant, ensuring the project's continuity and the demonstration of the skills acquired throughout the project.

## Description 
This  project will design a data solution for the Little Lemon Restaurant. it involves setting upset a database, incorporating `Stored Procedures`, A way to interact with the client and the use of visualization to communicate the data.

tools used:
`MySQL(Workbench)` - For developing and setup of the databsase.
`Python` - Setting up a client and interacting with the database.
`Tableau` - Visualization of the data.

## Week 1 - Setting Up the Project
To get your database ready, follow the steps:

1. **Install MySQL:** If MySQL isn't already on your computer, download and install it.
2. **Get the SQL File:** Download the `LittleLemonDB.sql` file from this repository - in week-1.
3. **Set Up in MySQL Workbench:**
   - Open MySQL Workbench.
   - Go to `Server` > `Data Import`.
   - Select `Import from Self-Contained File` and choose the `LittleLemonDB.sql` file.
   - Hit `Start Import` to bring in and run the SQL commands from the file.

After these steps, your database will be set up with all the necessary tables and stored procedures ready to go.


### Entity-Relationship Diagram
---

Little Lemon wants you to use MySQL Workbench to develop a relational database system and implement it in MySQL server. Save your database capstone project files in a folder on your machine and name it db-capstone-project.

Task 1

In this task, you need to create a normalized ER diagram (that adheres to 1NF, 2NF and 3NF) with relevant relationships to meet the data requirements of Little Lemon. When creating your diagram, include the following tables:

    Bookings: To store information about booked tables in the restaurant including booking id, date and table number.

    Orders: To store information about each order such as order date, quantity and total cost.

    Order delivery status: To store information about the delivery status of each order such as delivery date and status.

    Menu: To store information about cuisines, starters, courses, drinks and desserts.

    Customer details: To store information about the customer names and contact details.

    Staff information: Including role and salary.

Here is some guidance for completing this task:

    Identify entities and related attributes. 

    Identify primary and foreign keys.

    Define data types and constraints. 

![LittleLemonDM](LittleLemonDM.png)

Once you have designed your ER diagram inside your MySQL Workbench Model Editor you then need to save your data model as LittleLemonDM and export it as a PNG file.

Task 2

In this second task, you need to implement the Little Lemon data model inside your MySQL server. Here is some guidance for completing this task:

    Use the forward engineer method in MySQL Workbench to implement the Little Lemon datamodel inside MySQL server. 

    Name your database LittleLemonDB. 

    Export the LittleLemonDB as a single contained SQL file and save it in the db-capstone-project folder.

Task 3

In the third and final task, you need to show the databases in the MySQL server. Write a SQL code inside MySQL Workbench SQL editor to show all your databases in MySQL server. Check if the Little Lemon database is included in the list.
### Refer to the folder for extra screenshots

## Week 2 - Create Optimized Queries to Manage and Aalyze Data

Little Lemon needs to query the data in their database. To do this, they need your help with creating optimized queries using stored procedures and prepared statements.

Prerequisites
In the previous module, you developed a data model for Little Lemon and implemented it in your MySQL server. Your database should now contain several tables including the following:

    Menus, 

    Orders, 

    MenuItems,

    and Customers.
### Refer to the folder for extra screenshots

## Week 3 - Visualization in Tableau
