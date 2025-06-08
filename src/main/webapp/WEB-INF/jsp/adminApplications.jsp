<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Student Applications - Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.datatables.net/2.2.2/css/dataTables.bootstrap5.min.css" rel="stylesheet">
  <!-- In your <head> -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
  
  <style>
    body{
    background-image: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%);
    background-size: cover;
    }
    .filter-container { margin: 20px 0; }
  </style>
</head>
<body>
  <div class="container">
    <h2 class="mt-4">Student Applications</h2>
    
    <!-- Filter Form -->
    <div class="filter-container">
     <form action="${pageContext.request.contextPath}/admin/applications" method="get" class="row g-3">
  <div class="col-md-4">
    <label for="course" class="form-label">Course:</label>
    <input type="text" class="form-control" id="course" name="course" placeholder="Enter course" value="${param.course}">
  </div>
  <div class="col-md-4">
    <label for="semester" class="form-label">Semester:</label>
    <input type="number" class="form-control" id="semester" name="semester" placeholder="Enter semester" value="${param.semester}">
  </div>
  <div class="col-md-4">
    <label for="jobTitle" class="form-label">Job Title:</label>
    <input type="text" class="form-control" id="jobTitle" name="jobTitle" placeholder="Enter job title" value="${param.jobTitle}">
  </div>
  <div class="col-md-12">
    <button type="submit" class="btn btn-primary">Apply Filter</button>
    <a href="${pageContext.request.contextPath}/admin/applications" class="btn btn-secondary">Reset Filter</a>
  </div>
</form>

    </div>
    
    <!-- Download and Back Buttons (aligned to right, placed above the table) -->
   <div class="d-flex justify-content-end mb-3">
  <a href="${pageContext.request.contextPath}/admin/download?course=${param.course}&semester=${param.semester}&jobTitle=${param.jobTitle}" class="btn btn-success me-2">Download CSV</a>
  <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-secondary">Back to Dashboard</a>
</div>

    
    <!-- Applications Table -->
    <table class="table table-bordered" id="DataTable">
      <thead class="table-light">
        <tr>
          <th>ID</th>
          <th>Student Name</th>
          <th>Email</th>
          <th>Job Title</th>
          <th>Course</th>
          <th>Semester</th>
          <th>Resume</th>
          <th>Applied At</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="app" items="${applications}">
          <tr>
            <td>${app.id}</td>
            <td>${app.student.name}</td>
            <td>${app.student.email}</td>
            <td>${app.job.title}</td>
            <td>${app.student.course}</td>
            <td>${app.student.semester}</td>
            <td>${app.resume}</td>
            <td>${app.appliedAt}</td>
            <td>
              <form action="${pageContext.request.contextPath}/admin/application/delete" method="post" style="display:inline;">
                <input type="hidden" name="id" value="${app.id}" />
                <input type="submit" value="Delete" class="btn btn-danger btn-sm" />
              </form>
              <a href="${pageContext.request.contextPath}/admin/application/edit?id=${app.id}" class="btn btn-warning btn-sm">Edit</a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.min.js"></script>
<script>
    $(document).ready(function() {
        $('#DataTable').DataTable({
            "dom": '<"dt-buttons"Bf><"clear">lirtp',
            "paging": true,
            "autoWidth": true,
            "buttons": [
                'colvis',
                'copyHtml5',
                'csvHtml5',
                'excelHtml5',
                'pdfHtml5',
                'print'
            ]
        });
    });
</script>
</body>
</html>
