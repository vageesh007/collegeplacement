<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Job Listings - College Placement Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
      body{
    background-image: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%);
    background-size: cover;
    }
      .table-container { margin-top: 80px; }
      .logo-thumb { max-height: 50px; }
      .fixed-back-btn {
        position: fixed;
        top: 10px;
        right: 10px;
        z-index: 1000;
      }
    </style>
  </head>
  <body>
    <!-- Fixed Back-to-Dashboard Button -->
    <div class="fixed-back-btn">
      <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-secondary">Back to Dashboard</a>
    </div>
    
    <div class="container table-container">
      <h2>Job Listings</h2>
      <c:if test="${empty jobs}">
        <p>No jobs available at the moment.</p>
      </c:if>
      <table class="table table-bordered">
        <thead class="table-light">
          <tr>
            <th>Job Title</th>
            <th>Description</th>
            <th>Location</th>
            <th>Salary</th>
            <th>Eligibility</th>
            <th>Company</th>
            <th>Logo</th>
            <th>Posted On</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="job" items="${jobs}">
            <tr>
              <td>${job.title}</td>
              <td>${job.description}</td>
              <td>${job.location}</td>
              <td>${job.salary}</td>
              <td>${job.eligibleCourse} - Semester ${job.eligibleSemester}</td>
              <td>${job.companyName}</td>
              <td>
                <c:if test="${not empty job.companyPhoto}">
                  <img src="${pageContext.request.contextPath}/uploads/${job.companyPhoto}" alt="Logo" class="logo-thumb"/>
                </c:if>
              </td>
              <td>${job.postedAt}</td>
              <td>
                <c:if test="${sessionScope.userRole eq 'STUDENT'}">
                  <a href="${pageContext.request.contextPath}/jobs/details?id=${job.id}" class="btn btn-success btn-sm">View & Apply</a>
                </c:if>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
