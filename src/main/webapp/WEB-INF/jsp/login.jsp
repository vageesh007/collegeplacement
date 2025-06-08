<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Login - College Placement Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- In your <head> -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    
    <style>
      body { 
      background: #ad5389;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #3c1053, #ad5389);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #3c1053, #ad5389); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
;
      background-size: cover; }
      .login-container {
        margin-top: 100px;
      }
      .login-card {
        border: none;
        border-radius: 10px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        background: linear-gradient(135deg, #a18cd1, #fbc2eb);
        color: #000;
      }
      .login-card .card-body { padding: 2rem; }
      .login-card h2 { margin-bottom: 1.5rem; }
    </style>
  </head>
  <body>
    <!-- Error Modal (if loginError exists in session) -->
    <c:if test="${not empty sessionScope.loginError}">
      <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header bg-danger text-white">
              <h5 class="modal-title" id="errorModalLabel">Login Error</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              ${sessionScope.loginError}
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
      <c:set var="loginError" value="" scope="session"/>
      <script>
        window.addEventListener('DOMContentLoaded', function() {
          var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
          errorModal.show();
        });
      </script>
    </c:if>
    
    <div class="container login-container">
      <div class="row justify-content-center">
        <div class="col-md-6 col-lg-4">
          <div class="card login-card">
            <div class="card-body">
              <h2 class="text-center">Login</h2>
              <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="mb-3">
                  <label for="email" class="form-label">Email address</label>
                  <input type="email" class="form-control" id="email" name="username" placeholder="Enter email" required>
                </div>
                <div class="mb-3">
                  <label for="password" class="form-label">Password</label>
                  <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
                </div>
                <div class="mb-3">
                  <label for="roleSelector" class="form-label">Login As</label>
                  <select class="form-select" id="roleSelector" name="role" required>
                    <option value="STUDENT">Student</option>
                    <option value="ADMIN">Admin</option>
                  </select>
                </div>
                <button type="submit" class="btn btn-primary w-100">Login</button>
              </form>
              <p class="mt-3 text-center">
                <a href="${pageContext.request.contextPath}/register">Don't have an account? Register</a>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
  </body>
</html>
