<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<style>
		body {
			background-image: url('img/bg1.jpg');
			background-size: cover;
		}
		.login-container {
			max-width: 400px;
			margin: 80px auto;
			background: #fff;
			padding: 30px;
			border-radius: 10px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}
		.card-pass {
			margin-top: 10px;
			font-size: 14px;
			color: #555;
			text-align: right;
		}
	</style>
</head>
<body>

	<div class="container">
		<div class="login-container">
			<h2 class="text-center mb-4">Login</h2>
			<form action="Validate" method="post">
				<div class="mb-3">
					<label for="lname" class="form-label">Login Username</label>
					<input type="text" class="form-control" id="lname" name="lname" required>
				</div>
				<div class="mb-3">
					<label for="lpassword" class="form-label">Password</label>
					<input type="password" class="form-control" id="lpassword" name="lpassword" required>
				</div>
				<button type="submit" class="btn btn-primary  w-100">Login</button>
				<div class="card-pass text-dark fw-bold"><a href="register.jsp">New user?</a></div>
			</form>
		</div>
	</div>

</body>
</html>
