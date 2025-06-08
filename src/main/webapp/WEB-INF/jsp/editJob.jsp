<%-- <%@ include file="includes/navbar.jsp" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html><html><head><title>Edit Job</title></head><body>
<div class="container mt-5">
  <h2>Edit Job Posting</h2>
  <form action="${pageContext.request.contextPath}/jobs/post/edit" method="post">
    <input type="hidden" name="id" value="${job.id}"/>
    <div class="mb-3">
      <label>Title</label>
      <input class="form-control" name="title" value="${job.title}" required/>
    </div>
    <div class="mb-3">
      <label>Description</label>
      <textarea class="form-control" name="description" rows="4">${job.description}</textarea>
    </div>
    <div class="mb-3">
      <label>Location</label>
      <input class="form-control" name="location" value="${job.location}"/>
    </div>
    <div class="mb-3">
      <label>Salary</label>
      <input class="form-control" name="salary" value="${job.salary}"/>
    </div>
    <div class="mb-3">
      <label>Eligible Course</label>
      <input class="form-control" name="eligibleCourse" value="${job.eligibleCourse}"/>
    </div>
    <div class="mb-3">
      <label>Eligible Semester</label>
      <input type="number" class="form-control" name="eligibleSemester" value="${job.eligibleSemester}"/>
    </div>
    <button class="btn btn-primary">Update Job</button>
  </form>
</div>
<script>
  $(function(){
    const msg = "${flash.toastSuccess}";
    if(msg) toastr.success(msg);
  });
</script>
</body></html>
