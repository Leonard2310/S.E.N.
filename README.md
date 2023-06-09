<img width="803" alt="Screenshot 2023-06-09 alle 21 33 53" src="https://github.com/Leonard2310/SEN/assets/71086591/b99de6b7-91a1-429b-9094-dcee8c53685c">

This repository contains the project files for the development of a database system to manage the S.E.N. (Servizio di Emergenza Nazionale). The S.E.N. is composed of three main departments: Firefighters, Emergency Medical Services, and Law Enforcement, which in turn include the State Police, Carabinieri, Financial Guard, and Army. The objective is to enable cooperation among these departments to efficiently and quickly resolve emergencies.

## Introduction
The S.E.N. application successfully enables the coordination and efficient management of the emergency service departments. It fosters cooperation between Firefighters, Emergency Medical Services, and Law Enforcement (State Police, Carabinieri, Financial Guard, and Army) to swiftly and effectively address urgent situations. A relationship between a User and an Incident is established through a Request, which contains all the necessary details of the urgency. The respective department is then informed about the emergency through Involvement and prepares to resolve it.

### Project Description
The S.E.N. Emergency Service Database is designed to facilitate the coordination and management of the emergency service departments. It includes entities such as General Information, User Information, Department Information, Incident Information, and Operator Information. The operations of the database involve inserting, updating, and deleting user records, managing department information, recording incident details, and tracking operator data.

The design of the database system adheres to technological and security constraints to ensure a robust and secure system. It goes through various design phases, including analysis of requirements, conceptual and logical design, and physical implementation.

The analysis phase involves restructuring the requirements into appropriate entities, such as General Information, User Information, Department Information, Incident Information, and Operator Information. The conceptual design phase includes creating an Entity-Relationship (ER) schema to represent the relationships between entities. The logical design phase focuses on restructuring the conceptual schema into a logical schema to ensure data integrity and normalization. Finally, the physical design phase involves implementing the logical schema into the chosen database management system.

The application layer interacts with the database through the data layer, which handles queries, data fetching, and record updates. The implementation phase includes exception management techniques to handle errors and exceptional situations. The system.sql and sen.sql files contain the necessary SQL statements for setting up and creating the S.E.N. Emergency Service Database. Additionally, the PACKSEN package provides procedures and functions to manage various aspects of the emergency service system.

Triggers are implemented in the database to enforce data integrity and automate certain actions based on specified events. These triggers include user insert validation, title insert validation, operator insert validation, department insert validation, date validation, study title validation, operator insert, involvement insert, operator update, operator delete, and historical incidents.

## Requirements
- ORACLE SQL Developer (version 19.4.0 or higher)
- Draw.io

## Results
The S.E.N. application successfully enables the coordination and efficient management of the emergency service departments, including Firefighters, Emergency Medical Services, and Law Enforcement (which includes State Police, Carabinieri, Guardia di Finanza, and Army). The objective is to foster cooperation between departments to swiftly and effectively address urgent situations.

Following the occurrence of an emergency, a relationship between a User and an Incident is established through a Request, which contains all the necessary details of the urgency. At this point, through Involvement, the respective department is informed about the emergency and prepares to resolve it.

## Contributions
We welcome contributions and improvements to the KinDeNet project. If you would like to contribute, please submit a pull request. Make sure to discuss and plan proposed changes with the development team before starting the work.

## Authors
- [Leonardo Catello](https://github.com/Leonard2310) 
- [Daiana Cipollaro](https://github.com/Dad-cip)
- [Francesco Di Serio](https://github.com/fdiserio)
- [Ciro Gallucci](https://github.com/CiroGallucci)

## License
This project is licensed under the [GNU General Public License v3.0]. Refer to the LICENSE file for more information.
