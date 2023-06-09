# S.E.N. 
This repository contains the project files for the development of a database system to manage the S.E.N. (National Emergency Service). The S.E.N. is composed of three main departments: Firefighters, Emergency Medical Services, and Law Enforcement, which in turn include the State Police, Carabinieri, Financial Guard, and Army. The objective is to enable cooperation among these departments to efficiently and quickly resolve emergencies.

## Table of Contents

1. [Introduction](#introduction)
    - 1.1 Data Specifications
    - 1.2 Operation Specifications
    - 1.3 Technological and Security Constraints
2. [Database Design](#database-design)
    - 2.1 Analysis of Requirements and Restructuring
        - 2.1.1 General Information
        - 2.1.2 User Information
        - 2.1.3 Department Information
        - 2.1.4 Incident Information
        - 2.1.5 Operator Information
    - 2.2 Conceptual Design
        - 2.2.1 Main Entity-Relationship (ER) Schema
        - 2.2.2 Refined Schema: Simplified ER
        - 2.2.3 Refined Schema: Advanced ER
    - 2.3 Logical Design
        - 2.3.1 Restructuring Phase
        - 2.3.2 Translation Phase
        - 2.3.3 Logical Schema
    - 2.4 Physical Design
        - 2.4.1 Physical Database Dimensioning
        - 2.4.2 Connection Creation
        - 2.4.3 User/Role Creation and Privilege Assignment
        - 2.4.4 Database Object Creation and Constraint Definition
        - 2.4.5 Database Population
3. [Overview of Application Design](#application-design-overview)
    - 3.1 Data Layer
4. [Implementation](#implementation)
    - 4.1 Exception Management
    - 4.2 system.sql
    - 4.3 sen.sql
    - 4.4 PACKSEN Package
        - 4.4.1 Specification
        - 4.4.2 Body
    - 4.5 Triggers
        - 4.5.1 triggerSEN for User Insert Validation
        - 4.5.2 triggerSEN for Title Insert Validation
        - 4.5.3 triggerSEN for Operator Insert Validation
        - 4.5.4 triggerSEN for Department Insert Validation
        - 4.5.5 triggerSEN for Date Validation
        - 4.5.6 triggerSEN for Study Title Validation
        - 4.5.7 triggerSEN for Operator Insert
        - 4.5.8 triggerSEN for Involvement Insert
        - 4.5.9 triggerSEN for Operator Update
        - 4.5.10 triggerSEN for Operator Delete
        - 4.5.11 triggerSEN for Historical Incidents

## Introduction
The S.E.N. Emergency Service Database is designed to manage a national emergency service that consists of three main departments: Firefighters, Emergency Medical Services, and Law Enforcement. The Law Enforcement department further includes the State Police, Carabinieri, Financial Guard, and Army. The primary objective is to facilitate cooperation among these departments to efficiently and rapidly resolve emergencies.

### Data Specifications
The database encompasses the following entities:
- General Information
- User Information
- Department Information
- Incident Information
- Operator Information

### Operation Specifications
The operations of the S.E.N. Emergency Service Database include:
- Inserting, updating, and deleting user records
- Managing department information
- Recording incident details
- Tracking operator data

### Technological and Security Constraints
The design of the database system adheres to technological and security constraints to ensure a robust and secure system.

## Database Design
This section covers the design aspects of the database, including the analysis of requirements, conceptual and logical design, and physical implementation.

### Analysis of Requirements and Restructuring
The initial phase involves analyzing the specifications and restructuring the requirements into appropriate entities.

#### General Information
This section captures general information related to the emergency service, including system-wide data.

#### User Information
User information includes details of individuals who interact with the S.E.N. Emergency Service, such as their personal information and contact details.

#### Department Information
Department information encompasses data related to the different departments within the emergency service, including their roles, responsibilities, and contact details.

#### Incident Information
Incident information consists of all the details related to a specific emergency, including the type of emergency, location, severity, and relevant timestamps.

#### Operator Information
Operator information includes data about the individuals working within the emergency service departments. It includes their personal information, roles, and contact details.

### Conceptual Design
The conceptual design involves creating an Entity-Relationship (ER) schema to represent the relationships and dependencies between entities.

#### Main Entity-Relationship (ER) Schema
The main ER schema represents the core entities and relationships of the S.E.N. Emergency Service Database.

#### Refined Schema: Simplified ER
The refined schema simplifies the main ER schema to enhance clarity and improve understanding.

#### Refined Schema: Advanced ER
The advanced refined schema further refines the ER model, incorporating additional details and relationships for a comprehensive representation.

### Logical Design
The logical design phase focuses on restructuring the conceptual schema into a logical schema, ensuring data integrity and normalization.

#### Restructuring Phase
During the restructuring phase, the logical design is refined by eliminating redundancies and improving the structure of the schema.

#### Translation Phase
The translation phase involves converting the refined logical schema into a logical schema that can be implemented in the chosen database management system.

#### Logical Schema
The logical schema represents the final design of the database, including tables, attributes, and relationships.

### Physical Desig
The physical design phase focuses on implementing the logical schema into the chosen database management system.

#### Physical Database Dimensioning
The physical database dimensioning involves determining the appropriate sizing and capacity requirements for the database.

#### Connection Creation
The connection creation phase establishes the necessary connections between the database and the application.

#### User/Role Creation and Privilege Assignment
Users and roles are created in the database, and appropriate privileges are assigned to ensure secure access and data management.

#### Database Object Creation and Constraint Definition
The necessary objects, such as tables, views, indexes, and constraints, are created in the database to facilitate data storage and retrieval.

#### Database Population
The database is populated with initial data to enable the functioning of the S.E.N. Emergency Service Database.

## Application Design Overview
This section provides an overview of the design considerations for the application layer that interacts with the database.

### Data Layer
The data layer handles the interaction with the database, including executing queries, fetching data, and updating records.

## Implementation
The implementation phase involves executing the design by creating the necessary database objects, implementing exception management, and defining triggers.

### Exception Management
Exception management techniques are implemented to handle errors and exceptional situations that may arise during database operations.

### system.sql
The system.sql file contains the SQL statements required for setting up the system and configuring the database.

### sen.sql
The sen.sql file contains the SQL statements required for creating the S.E.N. Emergency Service Database.

### PACK SEN Package
The PACKSEN package provides a set of procedures and functions to manage various aspects of the emergency service system.

#### Specification
The specification file defines the interface and functionality of the PACKSEN package.

#### Body
The body file contains the implementation of the procedures and functions defined in the package specification.

### Triggers
Triggers are implemented to enforce data integrity and automate certain actions based on specified events.

#### triggerSEN for User Insert Validation
This trigger validates the insertion of user records to ensure data consistency and adherence to defined rules.

#### triggerSEN for Title Insert Validation
This trigger validates the insertion of title records to ensure data consistency and adherence to defined rules.

#### triggerSEN for Operator Insert Validation
This trigger validates the insertion of operator records to ensure data consistency and adherence to defined rules.

#### triggerSEN for Department Insert Validation
This trigger validates the insertion of department records to ensure data consistency and adherence to defined rules.

#### triggerSEN for Date Validation
This trigger validates the dates in incident records to ensure data consistency and adherence to defined rules.

#### triggerSEN for Study Title Validation
This trigger validates the study titles in operator records to ensure data consistency and adherence to defined rules.

#### triggerSEN for Operator Insert
This trigger automates certain actions when a new operator record is inserted into the database.

#### triggerSEN for Involvement Insert
This trigger automates certain actions when a new involvement record is inserted into the database.

#### triggerSEN for Operator Update
This trigger automates certain actions when an existing operator record is updated in the database.

#### triggerSEN for Operator Delete
This trigger automates certain actions when an existing operator record is deleted from the database.

#### triggerSEN for Historical Incidents
This trigger handles the archiving of historical incident records to maintain data integrity and optimize performance.

## Requirements
- ORACLE SQL Developer (version 19.4.0 or higher)
- Draw.io

## Results
The S.E.N. application successfully enables the coordination and efficient management of the emergency service departments, including Firefighters, Emergency Medical Services, and Law Enforcement (which includes State Police, Carabinieri, Guardia di Finanza, and Army). The objective is to foster cooperation between departments to swiftly and effectively address urgent situations.

Following the occurrence of an emergency, a relationship between a User and an Incident is established through a Request, which contains all the necessary details of the urgency. At this point, through Involvement, the respective department is informed about the emergency and prepares to resolve it.

## Contributions
- [Leonardo Catello](https://github.com/Leonard2310) 
- [Daiana Cipollaro](https://github.com/Dad-cip)
- [Francesco Di Serio](https://github.com/fdiserio)
- [Ciro Gallucci](https://github.com/CiroGallucci)

## License
This project is licensed under the [GNU General Public License v3.0]. Refer to the LICENSE file for more information.
