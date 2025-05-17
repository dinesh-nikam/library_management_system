<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register Librarian</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card-pass {
            margin-top: 10px;
            font-size: 14px;
            text-align: right;
        }
        
        body{
        background-image:url("img/bg-3.jpg");
        background-size: cover;
        }
    </style>
</head>
<body style="background-color: #f8f9fa;">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-header bg-success text-white text-center">
                    <h4>Register Librarian</h4>
                </div>
                <div class="card-body">

                    <% 
                        String status = (String) session.getAttribute("lregstatus");
                        if ("success".equals(status)) { 
                    %>
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            Librarian registered successfully!
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    <% 
                        session.setAttribute("lregstatus", null);
                        } else if ("failure".equals(status)) { 
                    %>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            Failed to register librarian.
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    <% } %>

                    <form id="librarianForm" action="RegisterLibrarian" method="post" novalidate>
                        <div class="mb-3">
                            <label for="lid" class="form-label">Librarian ID</label>
                            <input type="number" class="form-control" id="lid" name="lid" required>
                            <div class="invalid-feedback">Please enter librarian ID.</div>
                        </div>

                        <div class="mb-3">
                            <label for="lname" class="form-label">Name</label>
                            <input type="text" class="form-control" id="lname" name="lname" required>
                            <div class="invalid-feedback">Please enter name.</div>
                        </div>

                        <div class="mb-3">
                            <label for="lage" class="form-label">Age</label>
                            <input type="number" class="form-control" id="lage" name="lage" required>
                            <div class="invalid-feedback">Please enter age.</div>
                        </div>

                        <div class="mb-3">
                            <label for="lemail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="lemail" name="lemail" required>
                            <div class="invalid-feedback">Please enter a valid email address.</div>
                        </div>

                        <div class="mb-3">
                            <label for="lpassword" class="form-label">Password</label>
                            <input type="password" class="form-control" id="lpassword" name="lpassword" required minlength="4">
                            <div class="invalid-feedback">Password must be at least 4 characters.</div>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-success">Register</button>
                        </div>

                        <div class="card-pass fw-bold"><a href="login.jsp">Already have an account?</a></div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


<script>
    (function () {
        'use strict';
        const form = document.getElementById('librarianForm');
        form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        });
    })();
</script>

</body>
</html>
