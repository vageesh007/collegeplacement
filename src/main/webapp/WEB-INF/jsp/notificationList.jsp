<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Notification List - College Placement Portal</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body{
    background-image: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%);
    background-size: cover;
    }
    .notification-card {
      margin-bottom: 15px;
    }
    /* Define multiple gradient classes */
    .gradient1 {
      background: linear-gradient(135deg, #f093fb, #f5576c);
      color: #fff;
    }
    .gradient2 {
      background: linear-gradient(135deg, #a18cd1, #fbc2eb);
      color: #fff;
    }
    .gradient3 {
      background: linear-gradient(135deg, #667eea, #764ba2);
      color: #fff;
    }
    .gradient4 {
      background: linear-gradient(135deg, #f6d365, #fda085);
      color: #fff;
    }
    .gradient5 {
      background: linear-gradient(135deg, #89f7fe, #66a6ff);
      color: #fff;
    }
  </style>
</head>
<body>
  <div class="container mt-4">
    <h2>All Notifications</h2>
    <c:if test="${empty notifications}">
      <p>No notifications found.</p>
    </c:if>
    <c:forEach var="note" items="${notifications}">
      <div class="card notification-card">
        <div class="card-header">
          <h5 class="card-title">${note.title}</h5>
        </div>
        <div class="card-body">
          <p class="card-text">${note.message}</p>
          <p class="card-text"><small class="text-muted">Posted on: ${note.createdAt}</small></p>
        </div>
      </div>
    </c:forEach>
    <div class="text-end">
      <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-secondary">Back to Dashboard</a>
    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    // Array of gradient classes
    const gradients = ['gradient1', 'gradient2', 'gradient3', 'gradient4', 'gradient5'];
    // Get all notification cards
    const cards = document.querySelectorAll('.notification-card');
    cards.forEach(card => {
      // Choose a random gradient class
      const randomClass = gradients[Math.floor(Math.random() * gradients.length)];
      card.classList.add(randomClass);
    });
  </script>
</body>
</html>
