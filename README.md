# 📚 Book Management System (Servlet + JSP)

A full-stack web application built using **Java Servlets, JSP, and JDBC** to manage books in a library system. Users can register, log in, add books, update details, delete entries, and view all records.

## 🚀 Features

- User registration and login
- Add, update, and delete book records
- Display all books in a table
- Feedback and logout functionality
- Responsive frontend with styled JSP pages

## 🛠 Tech Stack

- Java (Servlet & JSP)
- JDBC + MySQL
- Apache Tomcat
- HTML/CSS/JS
- NetBeans (Project Setup)

## 📁 Folder Structure

- `src/`: Java source files for Servlets (Login, Book CRUD, Feedback)
- `web/`: JSP and HTML frontend files
- `WEB-INF/web.xml`: Servlet and route configuration

    book-management-jsp/
    ├── src/
    │   └── com/register/
    │       ├── Login.java
    │       ├── Logout.java
    │       ├── RegisterServlet.java
    │       ├── addbook.java
    │       ├── bookdelete.java
    │       ├── bookupdate.java
    │       └── feedback.java
    ├── web/
    │   ├── assets/
    │   │   ├── favicon.ico
    │   │   ├── css/
    │   │   ├── js/
    │   │   └── images/
    │   │       ├── signin-image.jpg
    │   │       └── signup-image.jpg
    │   ├── WEB-INF/
    │   │   └── web.xml
    │   ├── login.jsp
    │   ├── index.jsp
    │   ├── registration.jsp
    │   ├── addbook.jsp
    │   ├── displayBook.jsp
    │   ├── updatebook.jsp
    │   └── deletebook.jsp
    ├── build.xml
    ├── min_project.sql           # ✅ Database schema & seed data
    ├── README.md
    ├── LICENSE
    └── .gitignore


## 🔧 Setup Instructions

1. Clone the repo
2. Import in NetBeans
3. Set up MySQL DB and configure connection in your code
4. Deploy using Apache Tomcat

## 🗃️ Database Setup

1. Open **phpMyAdmin** or any MySQL client.
2. Create a new database (e.g., `book_management`).
3. Import the `min_project.sql` file located in the root of this project.
4. Make sure your database connection details (username, password, db name) are correctly set in your Java code.

> ⚠️ Note: You may need to update JDBC connection strings in your servlets based on your local MySQL credentials.

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](./LICENSE) file for full details.

