# 🎓 College Placement Web Portal

<p align="center">
  <h3 align="center">Streamlining Campus Recruitment</h3>
  <p align="center">
    A full-stack web application to automate and centralize college placement processes—job postings, eligibility filtering, applications, interview scheduling, notifications, and reporting—built with Java Spring Boot, Hibernate, MySQL, and a modern JSP/Bootstrap frontend.
  </p>
</p>

---

## 🛠️ Tech Stack

<p align="center">
  <img src="https://img.shields.io/badge/Java-17-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white" />
  <img src="https://img.shields.io/badge/Spring_Boot-3-6DB33F?style=for-the-badge&logo=springboot&logoColor=white" />
  <img src="https://img.shields.io/badge/Spring_Security-6-6DB33F?style=for-the-badge&logo=springsecurity&logoColor=white" />
  <img src="https://img.shields.io/badge/Hibernate-6-59666C?style=for-the-badge&logo=hibernate&logoColor=white" />
  <img src="https://img.shields.io/badge/MySQL-8-4479A1?style=for-the-badge&logo=mysql&logoColor=white" />
  <img src="https://img.shields.io/badge/JSP-FF6F00?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Bootstrap-5-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white" />
  <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white" />
  <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white" />
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black" />
  <img src="https://img.shields.io/badge/Maven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white" />
  <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white" />
</p>

---

## 📸 Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/087fe2c1-f27f-4c65-b11a-97c1a58cc009" width="250">
  <img src="https://github.com/user-attachments/assets/85bfb7f2-df58-4754-8681-884fccd91172" width="250">
  <img src="https://github.com/user-attachments/assets/a5404056-5d6c-444e-9615-4ead003ef3c7" width="250">
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/0a1cc3c2-6735-4758-b05f-e3a69e45055b" width="250">
  <img src="https://github.com/user-attachments/assets/77a9c3dd-1993-4d66-8d72-0a8530358e22" width="250">
 
</p>

---
# ✨ Features

## 🔐 Secure Authentication

- Spring Security authentication
- Role-Based Access Control (Admin & Student)
- Secure login and registration
- Session management

---

## 💼 Job Management

- Create, update and delete job postings
- Eligibility filtering by course & semester
- Company information with salary and location
- Job status management

---

## 🎓 Student Portal

- Browse eligible jobs
- Apply with one click
- Resume upload
- Manage personal profile
- View application status

---

## 📊 Admin Dashboard

- View all applications
- Filter by course, semester and job
- Export applications to CSV
- Manage student records
- Export student data
- Live toast notifications

---

## 📣 Notifications

- Create campus notifications
- Dashboard announcement panel
- Recent notifications widget
- Beautiful gradient cards
- Date formatting

---

## 🎨 Modern UI

- Responsive Bootstrap 5 interface
- JSP Views
- DataTables integration
- Animate.css animations
- Toastr notifications
- Consistent navigation
- Dashboard shortcuts

---

## 📂 Repository Structure

```text
college-placement-portal/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── vageesh/
│   │   │           └── springboot/
│   │   │               └── collegeplacement/
│   │   │                   ├── config/
│   │   │                   ├── controller/
│   │   │                   ├── model/
│   │   │                   ├── repository/
│   │   │                   ├── service/
│   │   │                   └── CollegePlacementApplication.java
│   │   ├── resources/
│   │   │   ├── application.properties
│   │   │   └── static/
│   │   │       ├── css/
│   │   │       ├── js/
│   │   │       └── uploads/
│   │   └── webapp/
│   │       └── WEB-INF/
│   │           └── jsp/
│   │               ├── includes/
│   │               │   ├── header.jsp
│   │               │   └── navbar.jsp
│   │               ├── login.jsp
│   │               ├── register.jsp
│   │               ├── dashboard.jsp
│   │               ├── jobs.jsp
│   │               ├── jobDetails.jsp
│   │               ├── postJob.jsp
│   │               ├── editJob.jsp
│   │               ├── profile.jsp
│   │               ├── notifications.jsp
│   │               ├── createNotification.jsp
│   │               ├── adminApplications.jsp
│   │               ├── adminStudents.jsp
│   │               └── error.jsp
├── pom.xml
├── README.md
└── .gitignore
```

# 🚀 Installation

### 1️⃣ Clone Repository

```bash
git clone https://github.com/vageesh007/college-placement-portal.git
cd college-placement-portal
```

### 2️⃣ Create Database

```sql
CREATE DATABASE placement_portal;
```

### 3️⃣ Configure Database

Update:

```
src/main/resources/application.properties
```

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/placement_portal
spring.datasource.username=YOUR_DB_USERNAME
spring.datasource.password=YOUR_DB_PASSWORD
```

### 4️⃣ Build Project

```bash
mvn clean package
```

### 5️⃣ Run Application

```bash
mvn spring-boot:run
```

Application will start at:

```
http://localhost:8080
```

---

# 🔑 Demo Credentials

### 👨‍💼 Admin

```
Email    : admin@example.com
Password : Admin@123
```

### 👨‍🎓 Student

```
Email    : student@example.com
Password : Student@123
```

---

# 📖 Usage

### Admin

- Post Jobs
- Edit Jobs
- Delete Jobs
- Manage Applications
- Export CSV
- Manage Students
- Create Notifications

### Student

- Register/Login
- Browse Jobs
- Apply
- Update Profile
- View Notifications

---

# 🤝 Contributing

1. Fork the repository

2. Create a feature branch

```bash
git checkout -b feature/YourFeature
```

3. Commit changes

```bash
git commit -m "Add YourFeature"
```

4. Push

```bash
git push origin feature/YourFeature
```

5. Open a Pull Request

---

# 📄 License

Licensed under the **MIT License**.

---

# 🙏 Acknowledgements

- Bharath Thippireddy
- in28Minutes
- Spring Boot Community
- Hibernate Community
- Bootstrap Community

---

<h3 align="center">
Made with ❤️ by <b>Vageesh Singh</b>
</h3>

<h3 align="center">
⭐ If you like this project, consider giving it a star!
</h3>
