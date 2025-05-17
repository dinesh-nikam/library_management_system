<%@ page import="dao.BookDAOImp" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="dto.Books" %>
<%
	BookDAOImp dao = new BookDAOImp();
	ResultSet rs = dao.findAll();
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<title>Add Book</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Bootstrap CSS -->
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
					<div class="card-header bg-primary text-white text-center">
						<h4>Add Book</h4>
					</div>
					<div class="card-body">
						<%
							String str1 = (String)session.getAttribute("baddstatus");
							if("success".equals(str1)) {
						%>
							<div class="alert alert-success alert-dismissible fade show" role="alert">
								Record Inserted Successfully!
								<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
						<%
								session.setAttribute("baddstatus", null);
							} else if("failure".equals(str1)) {
						%>
							<div class="alert alert-danger alert-dismissible fade show" role="alert">
								Some Error Occurred!
								<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
						<%
							}
						%>

						<form action="AddBook" method="get">
							<div class="mb-3">
								<label for="bname" class="form-label">Book Name</label>
								<input type="text" class="form-control" id="bname" name="bname" placeholder="Enter book name..." required>
							</div>
							<div class="mb-3">
								<label for="bid" class="form-label">Book ID</label>
								<input type="text" class="form-control" id="bid" name="bid" placeholder="Enter book ID..." required>
							</div>
							<div class="mb-3">
								<label for="bauthor" class="form-label">Book Author</label>
								<input type="text" class="form-control" id="bauthor" name="bauthor" placeholder="Enter book author..." required>
							</div>
							<div class="mb-3">
								<label for="bsubject" class="form-label">Book Subject</label>
								<input type="text" class="form-control" id="bsubject" name="bsubject" placeholder="Enter book subject..." required>
							</div>
							<div class="d-grid">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form>
					</div>
				</div>		
			</div>
		</div>
	</div>
<script>
	const existingBooks = [
		<%
			while(rs != null && rs.next()) {
				String name = rs.getString("bname").toLowerCase().replace("\"", "\\\"");
				String id = String.valueOf(rs.getInt("bid"));
		%>
			{ name: "<%= name %>", id: "<%= id %>" },
		<% } %>
	];

	document.querySelector("form").addEventListener("submit", function(event) {
		const nameInput = document.getElementById("bname").value.trim().toLowerCase();
		const idInput = document.getElementById("bid").value.trim();

		const isNameDuplicate = existingBooks.some(book => book.name === nameInput);
		const isIdDuplicate = existingBooks.some(book => book.id === idInput);

		if (isNameDuplicate) {
			alert("Book name already exists!");
			event.preventDefault();
			return;
		}
		if (isIdDuplicate) {
			alert("Book ID already exists!");
			event.preventDefault();
			return;
		}
	});
</script>
<%
	if (rs != null) try { rs.close(); } catch(Exception e) {}
%>


</body>
</html>
