<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Application - Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container mt-4">
    <h2>Edit Application</h2>
    <form action="${pageContext.request.contextPath}/admin/application/edit" method="post">
      <input type="hidden" name="id" value="${application.id}" />
      <div class="mb-3">
        <label class="form-label">Student Name:</label>
        <input type="text" class="form-control" name="student.name" value="${application.student.name}" readonly />
      </div>
      <div class="mb-3">
        <label class="form-label">Job Title:</label>
        <input type="text" class="form-control" name="job.title" value="${application.job.title}" readonly />
      </div>
      <div class="mb-3">
        <label class="form-label">Status:</label>
        <select class="form-select" name="status">
          <option value="PENDING" ${application.status eq 'PENDING' ? 'selected' : ''}>PENDING</option>
          <option value="SHORTLISTED" ${application.status eq 'SHORTLISTED' ? 'selected' : ''}>SHORTLISTED</option>
          <option value="REJECTED" ${application.status eq 'REJECTED' ? 'selected' : ''}>REJECTED</option>
          <option value="SELECTED" ${application.status eq 'SELECTED' ? 'selected' : ''}>SELECTED</option>
        </select>
      </div>
      <button type="submit" class="btn btn-primary">Save Changes</button>
    </form>
    <p class="mt-3"><a href="${pageContext.request.contextPath}/admin/applications" class="btn btn-secondary">Back to Applications</a></p>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
