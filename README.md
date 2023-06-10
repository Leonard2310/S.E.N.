<img width="803" alt="Screenshot 2023-06-09 alle 21 33 53" src="https://github.com/Leonard2310/SEN/assets/71086591/b99de6b7-91a1-429b-9094-dcee8c53685c">

The S.E.N. Emergency Service DBMS (Database Management System) project focuses on developing a robust database system to manage the S.E.N. (Servizio di Emergenza Nazionale), a national emergency service comprising Firefighters, Emergency Medical Services, and Law Enforcement departments, which include the State Police, Carabinieri, Financial Guard, and Army. The main objective is to promote efficient cooperation among these departments for swift resolution of emergencies.

### Project Description
The application successfully facilitates the coordination and management of the emergency service departments, fostering collaboration between Firefighters, Emergency Medical Services, and Law Enforcement (State Police, Carabinieri, Financial Guard, and Army). This enables a prompt response to urgent situations. The system establishes a relationship between Users and Incidents through Requests, containing crucial urgency details. The respective department is then notified through Involvement, preparing them to resolve the emergency effectively.

The S.E.N. encompasses entities such as General Information, User Information, Department Information, Incident Information, and Operator Information. It allows for various operations, including inserting, updating, and deleting user records, managing department information, recording incident details, and tracking operator data.

The database system adheres to strict technological and security constraints to ensure its robustness and reliability. It undergoes several design phases, including requirement analysis, conceptual and logical design, and physical implementation.

During the analysis phase, the requirements are carefully reviewed and structured into appropriate entities, such as General Information, User Information, Department Information, Incident Information, and Operator Information. The conceptual design phase involves creating an Entity-Relationship (ER) schema to establish relationships between these entities. The logical design phase focuses on restructuring the conceptual schema to ensure data integrity and normalization. Finally, the physical design phase entails implementing the logical schema within the chosen database management system.

The application layer interacts with the database through the data layer, which handles queries, data retrieval, and record updates. The implementation phase includes effective exception management techniques to handle errors and exceptional scenarios. The project provides the necessary SQL statements in the system.sql and sen.sql files for setting up and creating the S.E.N. Emergency Service Database. Additionally, the PACKSEN package offers a range of procedures and functions to manage different aspects of the emergency service system.

To ensure data integrity and automate specific actions based on defined events, the database incorporates triggers. These triggers include validation triggers for user, title, operator, and department insertion, as well as triggers for date validation, study title validation, operator insertion, involvement insertion, operator update, operator deletion, and archiving historical incidents.

## Requirements
- ORACLE SQL Developer (version 19.4.0 or higher)
- Draw.io

## Results
The successful implementation of the S.E.N. application enables effective coordination and management of emergency service departments, such as Firefighters, Emergency Medical Services, and Law Enforcement (including the State Police, Carabinieri, Financial Guard, and Army). The primary goal is to foster cooperation among departments, allowing for prompt and efficient resolution of urgent situations.

## Contributions
We welcome contributions and improvements to the KinDeNet project. If you would like to contribute, please submit a pull request. Make sure to discuss and plan proposed changes with the development team before starting the work.

## Authors
- [Leonardo Catello](https://github.com/Leonard2310) 
- [Daiana Cipollaro](https://github.com/Dad-cip)
- [Francesco Di Serio](https://github.com/fdiserio)
- [Ciro Gallucci](https://github.com/CiroGallucci)

## License
This project is licensed under the [GNU General Public License v3.0]. Refer to the LICENSE file for more information.
