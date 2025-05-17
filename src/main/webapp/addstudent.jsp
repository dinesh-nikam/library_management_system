<%@ page import="dao.StudentDAOImp" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="dto.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("lid")==null) {
%>
  <h1>Access Denied</h1>
<%
  return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Add Student</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>


<body style="background-color: #f8f9fa;">
  <button style="padding:10px 20px; margin: 10px 20px; background-color:#CF0F47; color:white; border:none; border-radius:5px; cursor:pointer;" 
        onclick="window.location.href='libMain.jsp'">
    Home
</button>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card shadow">
					<div class="card-header bg-success text-white text-center">
						<h4>Add Student</h4>
					</div>
					<div class="card-body">
						<%
							String str1 = (String)session.getAttribute("stdstatus");
							if("success".equals(str1)) {
						%>
							<div class="alert alert-success alert-dismissible fade show" role="alert">
								Record Inserted Successfully!
								<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
						<%
								session.setAttribute("stdstatus", null);
							} else if("failure".equals(str1)) {
						%>
							<div class="alert alert-danger alert-dismissible fade show" role="alert">
								Some Error Occurred!
								<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
						<%
							}
						%>

						<form id="studentForm" action="AddStudent" method="get">
							<div class="mb-3">
								<label for="name" class="form-label">Name</label>
								<input type="text" class="form-control" id="name" name="name" placeholder="Enter student's name" required>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">Email</label>
								<input type="email" class="form-control" id="email" name="email" placeholder="Enter student's email" required>
							</div>
							<div class="mb-3">
								<label for="course" class="form-label">Course</label>
								<input type="text" class="form-control" id="course" name="course" placeholder="Enter course" required>
							</div>
							<div class="mb-3">
								<label for="phoneno" class="form-label">Phone Number</label>
								<input type="text" class="form-control" id="phoneno" name="phoneno" placeholder="Enter phone number" required>
							</div>
							<div class="mb-3">
								<label for="sid" class="form-label">Enrollment No / Student ID</label>
								<input type="text" class="form-control" id="sid" name="sid" placeholder="Enter enrollment number" required>
							</div>
							<div class="d-grid">
								<button type="submit" class="btn btn-success">Add Student</button>
							</div>
						</form>
					</div>
				</div>		
			</div>
		</div>
	</div>

<%
	
	StudentDAOImp dao = new StudentDAOImp();
	ResultSet rs = dao.findAll(); 
%>

<script>
	
	const existingIDs = [
		<% while(rs != null && rs.next()) { %>
			"<%= rs.getString("sid") %>",
		<% } %>
	];

	document.getElementById("studentForm").addEventListener("submit", function(event) {
		const phone = document.getElementById("phoneno").value.trim();
		const email = document.getElementById("email").value.trim();
		const sid = document.getElementById("sid").value.trim();

		
		if (!/^\d{10}$/.test(phone)) {
			alert("Phone number must be exactly 10 digits.");
			event.preventDefault();
			return;
		}

		
		if (!email.endsWith("@itp.com")) {
			alert("Email must end with @itp.com.");
			event.preventDefault();
			return;
		}

		
		if (existingIDs.includes(sid)) {
			alert("Student ID already exists.");
			event.preventDefault();
			return;
		}
	});
</script>

</body>
</html>
