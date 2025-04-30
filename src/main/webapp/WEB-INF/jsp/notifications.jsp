<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>All Notifications - College Placement Portal</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: #f4f7f9;
       background-image: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%);
    background-size: cover;
      font-family: 'Segoe UI', sans-serif;
    }
    .table-container {
      margin-top: 80px;
    }
    .fixed-back-btn {
      position: fixed;
      top: 10px;
      right: 10px;
      z-index: 9999;
    }
    .notifications-table {
      background: #fff;
      border-radius: 8px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      overflow: hidden;
    }
    .notifications-table th, .notifications-table td {
      vertical-align: middle;
    }
    .table thead th {
      background-color: #007bff;
      color: #fff;
    }
    .table-hover tbody tr:hover {
      background-color: #f1f1f1;
    }
  </style>
</head>
<body>
  <!-- Fixed Back-to-Dashboard Button -->
  <div class="fixed-back-btn">
    <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-secondary">Back to Dashboard</a>
  </div>
  
  <div class="container table-container">
    <h2 class="mb-4">All Notifications</h2>
    <div class="notifications-table p-3">
      <table class="table table-striped table-hover">
        <thead>
          <tr>
            <th>#</th>
            <th>Title</th>
            <th>Message</th>
            <th>Posted On</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${notifications}" var="note" varStatus="status">
            <tr>
              <td>${status.index + 1}</td>
              <td>${note.title}</td>
              <td>${note.message}</td>
              <td>${note.createdDate}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
