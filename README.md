# 🎓 College Placement Web Portal
Streamlining Campus Recruitment
A full-stack web application to automate and centralize college placement processes—job postings, eligibility filtering, applications, interview scheduling, notifications, and reporting—built with Java Spring Boot, Hibernate, MySQL, and a modern JSP/Bootstrap frontend.

## 🚀 Features
## 🔐 Secure Authentication & RBAC

Student and Admin roles via Spring Security

Form-login and REST API options

## 📋 Job Management

Admin can create, edit, delete job postings

Eligibility filtering by course & semester

Company logos & metadata (salary, location)

# 🧑‍🎓 Student Portal

Browse and apply to eligible jobs

Profile management (name, email, course, semester)

Single-click “Apply” with file upload and confirmation toast

## 📊 Admin Dashboard

View & filter job applications (course, semester, job title)

Download filtered data as CSV

Manage student list with filters & CSV export

Live toastr notifications for updates

## 📣 Notifications Module

Admin can post campus/event notifications

Latest 5 on dashboard; full list in a dedicated view

Gradient cards with random colors and date formatting

## 🔧 Robust Backend

Spring Boot 3, Java 17, Hibernate 6, MySQL 8

RESTful APIs with Swagger/OpenAPI documentation

JUnit & Mockito tests (85%+ coverage)

CI/CD pipeline with Jenkins

## 🎨 Modern UI/UX

Responsive JSP views with Bootstrap 5 & DataTables.js

Smooth animations via Animate.css

Non-blocking toast messages (Toastr.js)

Consistent navbar, “Back to Dashboard” button, and layout

# 📂 Repository Structure
arduino
├── src

│   ├── main

│   │   ├── java/com/vageesh/springboot/collegeplacement

│   │   │   ├── controller

│   │   │   ├── model

│   │   │   ├── repository

│   │   │   ├── service

│   │   │   └── config

│   │   └── resources

│   │       ├── application.properties

│   │       └── static

│   │           ├── css

│   │           ├── js

│   │           └── uploads

│   └── webapp

│       └── WEB-INF

│           └── jsp

│               ├── includes

│               │   ├── header.jsp

│               │   └── navbar.jsp

│               ├── login.jsp

│               ├── register.jsp

│               ├── dashboard.jsp

│               ├── jobs.jsp

│               ├── jobDetails.jsp

│               ├── postJob.jsp

│               ├── editJob.jsp

│               ├── profile.jsp

│               ├── notifications.jsp

│               ├── createNotification.jsp

│               ├── adminApplications.jsp

│               ├── adminStudents.jsp

│               └── error.jsp

└── README.md

# 🔧 Installation & Setup
Clone the repo

bash
git clone https://github.com/yourusername/college-placement-portal.git
cd college-placement-portal
Configure MySQL

Create a database:

sql
CREATE DATABASE placement_portal;
Update src/main/resources/application.properties:

properties
spring.datasource.url=jdbc:mysql://localhost:3306/placement_portal
spring.datasource.username=YOUR_DB_USER
spring.datasource.password=YOUR_DB_PASS
Build & Run

bash
mvn clean package
mvn spring-boot:run
App runs at http://localhost:8080/

Access

Admin: admin@example.com / Admin@123

Student: student@example.com / Student@123

## ⚙️ Usage
Login/Register at /login or /register.

Admin Dashboard:

Post/Edit/Delete Jobs: /jobs/post

View Applications: /admin/applications

View Student List: /admin/students

Create Notifications: /admin/notifications/create

Student Dashboard:

Browse Jobs: /jobs

View & Apply: click “View Details” on a job card

Edit Profile: /profile

## 🤝 Contributing
Fork the repo

Create a feature branch: git checkout -b feature/YourFeature

Commit changes: git commit -m "Add YourFeature"

Push: git push origin feature/YourFeature

Open a Pull Request

Please follow the existing code style, cover new features with tests, and update documentation.

## 📄 License
This project is licensed under the MIT License.

## 🙏 Acknowledgements
IPH Technologies for mentorship & resources

Spring Boot, Hibernate, and Bootstrap communities for stellar documentation
# Made with ❤️ by Vageesh Singh
# ✨ Happy Coding & Best of Luck with Your College Placements! ✨
