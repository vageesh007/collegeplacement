<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Create Notification - College Placement Portal</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
     body{
    background-image: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%);
    background-size: cover;
    }
    .form-container {
      max-width: 500px;
      margin: 80px auto;
      background: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    .fixed-back-btn { 
      position: fixed; 
      top: 10px; 
      right: 10px; 
      z-index: 9999; 
    }
  </style>
</head>
<body>
  <!-- Fixed Back-to-Dashboard Button -->
  <div class="fixed-back-btn">
    <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-secondary">Back to Dashboard</a>
  </div>
  
  <div class="container form-container">
    <h2 class="mb-4 text-center">Create New Notification</h2>
    <form action="${pageContext.request.contextPath}/admin/notifications/create" method="post">
      <div class="mb-3">
        <label for="title" class="form-label">Notification Title</label>
        <input type="text" id="title" name="title" class="form-control" placeholder="Enter title" required>
      </div>
      <div class="mb-3">
        <label for="message" class="form-label">Message</label>
        <textarea id="message" name="message" class="form-control" rows="5" placeholder="Enter message" required></textarea>
      </div>
      <button type="submit" class="btn btn-primary w-100">Create Notification</button>
    </form>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
