<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Register - College Placement Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
      body {
        background-image: linear-gradient(to right top, #051937, #004d7a, #008793, #00bf72, #a8eb12);
        background-size: cover; }
      .register-container {
        margin-top: 50px;
      }
      .register-card {
        border: none;
        border-radius: 10px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        background-color: #85FFBD;
background-image: linear-gradient(45deg, #85FFBD 0%, #FFFB7D 100%);
     
 --       background: linear-gradient(135deg, #ee9ca7, #ffdde1);
  --     background: linear-gradient(135deg, #89f7fe, #66a6ff);
        color: #000;
      }
      .register-card .card-body { padding: 2rem; }
      .register-card h2 { margin-bottom: 1.5rem; }
    </style>
  </head>
  <body>
    <div class="container register-container">
      <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
          <div class="card register-card">
            <div class="card-body">
              <h2 class="text-center">Student Registration</h2>
              <form action="${pageContext.request.contextPath}/register" method="post">
                <div class="mb-3">
                  <label for="name" class="form-label">Full Name</label>
                  <input type="text" class="form-control" name="name" placeholder="Enter full name" required>
                </div>
                <div class="mb-3">
                  <label for="email" class="form-label">Email Address</label>
                  <input type="email" class="form-control" name="email" placeholder="Enter email" required>
                </div>
                <div class="mb-3">
                  <label for="password" class="form-label">Password</label>
                  <input type="password" class="form-control" name="password" placeholder="Enter password" required>
                </div>
                <div class="mb-3">
                  <label for="course" class="form-label">Course</label>
                  <input type="text" class="form-control" name="course" placeholder="Enter course" required>
                </div>
                <div class="mb-3">
                  <label for="semester" class="form-label">Semester</label>
                  <input type="number" class="form-control" name="semester" placeholder="Enter semester" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Register</button>
              </form>
              <p class="mt-3 text-center">
                <a href="${pageContext.request.contextPath}/login">Already have an account? Login</a>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
