<%-- <%@ include file="includes/navbar.jsp" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html><html><head><title>Student List</title></head>
<body>
<div class="container mt-4">
  <h2>Registered Students</h2>

  <form class="row g-2 align-items-end mb-3" method="get">
    <div class="col-auto">
      <input name="course" class="form-control" placeholder="Course" value="${filterCourse}" />
    </div>
    <div class="col-auto">
      <input type="number" name="semester" class="form-control" placeholder="Semester" value="${filterSemester}" />
    </div>
    <div class="col-auto">
      <button class="btn btn-primary">Filter</button>
      <a href="${pageContext.request.contextPath}/admin/students" class="btn btn-secondary">Reset</a>
    </div>
    <div class="col-auto">
      <a href="${pageContext.request.contextPath}/admin/students/download?course=${filterCourse}&semester=${filterSemester}" class="btn btn-success">Download CSV</a>
    </div>
  </form>

  <div class="table-responsive notifications-table p-3">
    <table class="table table-striped table-hover">
      <thead class="table-dark">
        <tr><th>#</th><th>Name</th><th>Email</th><th>Course</th><th>Semester</th><th>Joined</th></tr>
      </thead>
      <tbody>
        <c:forEach items="${students}" var="s" varStatus="st">
          <tr>
            <td>${st.index+1}</td>
            <td>${s.name}</td>
            <td>${s.email}</td>
            <td>${s.course}</td>
            <td>${s.semester}</td>
            <td><fmt:formatDate value="${s.createdAt}" pattern="yyyy-MM-dd"/></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</body></html>
