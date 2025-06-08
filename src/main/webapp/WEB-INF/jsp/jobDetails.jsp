<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Job Details - College Placement Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- In your <head> -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    
    <style>
      body{
    background-image: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%);
    background-size: cover;
    }
      .job-details-card {
        margin: 50px auto;
        max-width: 800px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
      }
      .card-header {
        background: linear-gradient(135deg, #007bff, #00aaff);
        color: white;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
      .company-logo {
        max-height: 60px;
        border-radius: 5px;
      }
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
    
    <div class="container">
      <div class="card job-details-card">
        <div class="card-header">
          <h3 class="mb-0">${job.title}</h3>
          <c:if test="${not empty job.companyPhoto}">
            <img src="${pageContext.request.contextPath}/uploads/${job.companyPhoto}" alt="Company Logo" class="company-logo"/>
          </c:if>
        </div>
        <div class="card-body">
          <p><strong>Description:</strong> ${job.description}</p>
          <p><strong>Location:</strong> ${job.location}</p>
          <p><strong>Salary:</strong> ${job.salary}</p>
          <p><strong>Eligibility:</strong> ${job.eligibleCourse} - Semester ${job.eligibleSemester}</p>
          <p><strong>Company Name:</strong> ${job.companyName}</p>
          <hr/>
          <c:if test="${sessionScope.userRole eq 'STUDENT'}">
            <c:choose>
              <c:when test="${applied}">
                <div class="alert alert-success" role="alert">
                  You have successfully applied for this job.
                </div>
                <button type="button" class="btn btn-success" disabled>Apply Now</button>
              </c:when>
              <c:otherwise>
                <form action="${pageContext.request.contextPath}/applications/apply" method="post" onsubmit="this.querySelector('button[type=submit]').disabled=true;">
                  <input type="hidden" name="jobId" value="${job.id}" />
                  <input type="hidden" name="studentId" value="${sessionScope.userId}" />
                  <div class="mb-3">
                    <label for="resume" class="form-label">Resume URL:</label>
                    <input type="text" id="resume" name="resume" class="form-control" placeholder="Enter your resume URL" required>
                  </div>
                  <button type="submit" class="btn btn-success">Apply Now</button>
                </form>
              </c:otherwise>
            </c:choose>
          </c:if>
        </div>
      </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
  </body>
</html>

