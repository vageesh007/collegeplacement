<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Dashboard - College Placement Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    body{
    background-image: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%);
    background-size: cover;
    }
      .navbar-custom {
        background: linear-gradient(135deg, #0062E6, #33AEFF);
        box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        font-size: 1.1rem;
        position: relative;
        z-index: 1000;
      }
      .navbar-custom .navbar-brand { font-size: 1.4rem; font-weight: bold; color: #fff !important; }
      .navbar-custom .nav-link { color: #fff !important; margin-right: 1rem; transition: color 0.2s; }
      .navbar-custom .nav-link:hover { color: #ffe066 !important; }
      
      .notifications-table {
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        overflow: hidden;
      }
      .view-more-btn { font-size: 1.1rem; font-weight: 600; }
      .fixed-back-btn {
        position: fixed;
        top: 10px;
        right: 10px;
        z-index: 1000;
      }
      .table-container { margin-top: 80px; }
    </style>
  </head>
  <body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-custom">
      <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/dashboard">College Placement Portal</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jobs">Job Listings</a></li>
            <c:if test="${sessionScope.userRole eq 'ADMIN'}">
              <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jobs/post">Post a Job</a></li>
              <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/applications">Candidate Applications</a></li>
              <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/notifications/create">Create Notification</a></li>
            </c:if>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/profile">Profile</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logout">Logout</a></li>
          </ul>
        </div>
      </div>
    </nav>
    
    <!-- Fixed Back Button (if needed, but here navbar is the top navigation) -->
    <!-- Notifications Section -->
    <div class="container mt-4">
      <h2>Dashboard</h2>
      <p>Welcome, ${userName}!</p>
      
      <div class="mb-4">
        <h4>Latest Notifications</h4>
        <div class="notifications-table p-3">
          <table class="table table-hover mb-0">
            <thead class="table-light">
              <tr>
                <th>#</th>
                <th>Title</th>
                <th>Message</th>
                <th>Posted On</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="note" items="${notifications}" varStatus="status">
                <c:if test="${status.index < 5}">
                  <tr>
                    <td>${status.index + 1}</td>
                    <td>${note.title}</td>
                    <td>${note.message}</td>
                    <td>${note.createdDate}</td>
                  </tr>
                </c:if>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <div class="d-flex justify-content-end mt-2">
          <a href="${pageContext.request.contextPath}/notifications" class="btn btn-outline-primary view-more-btn">View More Notifications</a>
        </div>
      </div>
      
      <c:choose>
        <c:when test="${sessionScope.userRole eq 'STUDENT'}">
          <!-- Student Details Card -->
          <div class="card mb-4">
            <div class="card-body">
              <h5 class="card-title">Your Details</h5>
              <p class="card-text"><strong>Name:</strong> ${user.name}</p>
              <p class="card-text"><strong>Email:</strong> ${user.email}</p>
              <p class="card-text"><strong>Course:</strong> ${user.course}</p>
              <p class="card-text"><strong>Semester:</strong> ${user.semester}</p>
            </div>
          </div>
          <!-- Recent Job Posts Table -->
          <h4>Recent Job Posts</h4>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Job Title</th>
                  <th>Description</th>
                  <th>Location</th>
                  <th>Salary</th>
                  <th>Eligibility</th>
                  <th>Company</th>
                  <th>Posted On</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="job" items="${recentJobs}">
                  <tr>
                    <td>${job.title}</td>
                    <td>${job.description}</td>
                    <td>${job.location}</td>
                    <td>${job.salary}</td>
                    <td>${job.eligibleCourse} - Semester ${job.eligibleSemester}</td>
                    <td>${job.companyName}</td>
                    <td>${job.postedAt}</td>
                    <td>
                      <a href="${pageContext.request.contextPath}/jobs/details?id=${job.id}" class="btn btn-success btn-sm">View & Apply</a>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </c:when>
        <c:otherwise>
          <!-- Admin Details Card -->
          <div class="card mb-4">
            <div class="card-body">
              <h5 class="card-title">Admin Details</h5>
              <p class="card-text"><strong>Name:</strong> ${userName}</p>
              <p class="card-text"><strong>Email:</strong> ${user.email}</p>
            </div>
          </div>
          <p>You have admin privileges. Use the navigation bar to post jobs, manage candidate applications, and create notifications.</p>
        </c:otherwise>
      </c:choose>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
