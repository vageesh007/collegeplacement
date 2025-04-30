<html>
<head>
  <meta charset="UTF-8">
  <title>Post a Job - College Placement Portal</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body{
    background-image: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%);
    background-size: cover;
    }
    .form-container {
      max-width: 600px;
      margin: 50px auto;
      background: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    }
  </style>
</head>
<body>
  <div class="container form-container">
    <h2 class="mb-4 text-center">Post a New Job</h2>
    <form action="${pageContext.request.contextPath}/jobs/post" method="post" enctype="multipart/form-data">
      <div class="mb-3">
        <label for="title" class="form-label">Job Title</label>
        <input type="text" name="title" id="title" class="form-control" required />
      </div>
      <div class="mb-3">
        <label for="description" class="form-label">Description</label>
        <textarea name="description" id="description" class="form-control" rows="4" required></textarea>
      </div>
      <div class="mb-3">
        <label for="location" class="form-label">Location</label>
        <input type="text" name="location" id="location" class="form-control" required />
      </div>
      <div class="mb-3">
        <label for="salary" class="form-label">Salary</label>
        <input type="text" name="salary" id="salary" class="form-control" required />
      </div>
      <div class="mb-3">
        <label for="eligibleCourse" class="form-label">Eligible Course</label>
        <input type="text" name="eligibleCourse" id="eligibleCourse" class="form-control" required />
      </div>
      <div class="mb-3">
        <label for="eligibleSemester" class="form-label">Eligible Semester</label>
        <input type="number" name="eligibleSemester" id="eligibleSemester" class="form-control" required />
      </div>
      <div class="mb-3">
        <label for="companyName" class="form-label">Company Name</label>
        <input type="text" name="companyName" id="companyName" class="form-control" required />
      </div>
      <div class="mb-3">
        <label for="companyPhoto" class="form-label">Company Photo</label>
        <input type="file" name="companyPhoto" id="companyPhoto" class="form-control" accept="image/*" required />
      </div>
      <button type="submit" class="btn btn-primary w-100">Post Job</button>
    </form>
    <p class="mt-3 text-center">
      <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-secondary">Back to Dashboard</a>
    </p>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
