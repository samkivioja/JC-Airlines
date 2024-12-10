# JC Airlines - Flight Booking System

Welcome to **JC Airlines**, a flight booking web application that allows users to search for flights, view details, and proceed with booking in a structured and intuitive manner.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Setup Instructions](#setup-instructions)
- [File Structure](#file-structure)
- [License](#license)

---

## Project Overview

The **JC Airlines** project provides a functional flight booking experience. It supports features like searching for flights based on destinations, dynamically swapping locations, highlighting the current step of the booking process and sending ordered tickets via email. It integrates front-end interactivity and back-end support with a database to manage flight and passenger details.

---

## Features

- **Flight Search**: Users can search for available flights by providing the departure city,  destination city and the departure date.  
- **Dynamic Location Swapping**: Easily swap the selected departure and destination cities with a button click.  
- **Step Highlighting**: The application highlights the current booking step to improve user experience. 
- **Emailing**: Ordered tickets are sent to passengers via email.
- **Responsive Design**: The UI adjusts smoothly to different screen sizes (desktop, tablet, and mobile).  
- **Real-Time Data Fetching**: Fetch flight information from a back-end database dynamically.  
- **Error Handling**: Provides informative messages for invalid inputs or unavailable flights.  

---

## Technologies Used

### Front-End:
- **HTML5**: Markup structure for the web pages.  
- **CSS3**: Styling and responsive design.  
- **JavaScript**: Client-side interactivity (dynamic form behavior and highlighting steps).  

### Back-End:
- **PHP**: Server-side scripting to process data and interact with the database.  
- **MySQL**: Database management for storing flight and passenger information.  

---

## Setup Instructions

### Follow these steps to set up the project locally:

- Set up the MySQL database using the sql schema.  
- Update `db_connection.php` with your database credentials:

```php
$servername = "your_server";
$username = "your_username";
$password = "your_password";
$dbname = "your_database";
```

## License
This project is licensed under the **MIT License**. Feel free to use and modify it as per your needs.

