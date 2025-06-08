<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Profile - College Placement Portal</title>
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
    .profile-container {
      max-width: 600px;
      margin: 50px auto;
      background: #fff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    }
  </style>
</head>
<body>
  <div class="container profile-container">
    <h2>Your Profile</h2>
    <form action="${pageContext.request.contextPath}/profile" method="post">
      <div class="mb-3">
        <label class="form-label">Name:</label>
        <input type="text" name="name" value="${user.name}" class="form-control" required />
      </div>
      <div class="mb-3">
        <label class="form-label">Email:</label>
        <input type="email" name="email" value="${user.email}" class="form-control" required />
      </div>
      <div class="mb-3">
        <label class="form-label">Course:</label>
        <input type="text" name="course" value="${user.course}" class="form-control" required />
      </div>
      <div class="mb-3">
        <label class="form-label">Semester:</label>
        <input type="number" name="semester" value="${user.semester}" class="form-control" required />
      </div>
      <input type="hidden" name="userId" value="${user.id}" />
      <button type="submit" class="btn btn-primary">Save Profile</button>
    </form>
    <p class="mt-3">
      <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-secondary">Back to Dashboard</a>
    </p>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
