<%@page import="dao.StudentDAOImp"%>
<%@page import="dao.StudentDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("lid") == null) {
%>
    <h1>Unauthorized Access</h1>
<%
    return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>All Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        td[contenteditable="true"] {
            background-color: #fff3cd;
        }
    </style>
</head>
<body class="p-3">
    <div class="container">
        <h2 class="mb-4">Student List</h2>
          <button style="padding:10px 20px; margin: 10px 20px; background-color:#CF0F47; color:white; border:none; border-radius:5px; cursor:pointer;" 
        onclick="window.location.href='libMain.jsp'">
    Home
</button>
        <div class="table-responsive">
            <table class="table table-bordered table-hover text-center align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Student Name</th>
                        <th>Student ID</th>
                        <th>Course</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        StudentDAO student = new StudentDAOImp();
                        ResultSet rs = student.findAll();
                        while(rs.next()) {
                            String name = rs.getString(1);
                            String sid = rs.getString(2);
                            String course = rs.getString(3);
                            String phone = rs.getString(4);
                            String email = rs.getString(5);
                    %>
                    <tr data-sid="<%=sid%>">
                        <td contenteditable="true" class="editable"><%= name %></td>
                        <td><%= sid %></td>
                        <td contenteditable="true" class="editable"><%= course %></td>
                        <td contenteditable="true" class="editable"><%= phone %></td>
                        <td contenteditable="true" class="editable"><%= email %></td>
                        <td>
                            <button class="btn btn-warning btn-sm edit-btn">Edit</button>
                            <button class="btn btn-success btn-sm save-btn d-none">Save</button>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <script>
    $(document).ready(function () {
        $(".editable").on("input", function () {
            const row = $(this).closest("tr");
            row.find(".edit-btn").addClass("d-none");
            row.find(".save-btn").removeClass("d-none");
        });

        $(".edit-btn").on("click", function () {
            const row = $(this).closest("tr");
            row.find(".editable").first().focus();
        });

        $(".save-btn").on("click", function () {
            const row = $(this).closest("tr");
            const sid = row.data("sid");
            const name = row.find("td").eq(0).text().trim();
            const course = row.find("td").eq(2).text().trim();
            const phone = row.find("td").eq(3).text().trim();
            const email = row.find("td").eq(4).text().trim();

            $.ajax({
                url: "UpdateStudent",
                method: "POST",
                data: {
                    sid: sid,
                    name: name,
                    course: course,
                    phone: phone,
                    email: email
                },
                success: function () {
                    alert("Student updated successfully.");
                    row.find(".save-btn").addClass("d-none");
                    row.find(".edit-btn").removeClass("d-none");
                },
                error: function () {
                    alert("Failed to update the student.");
                }
            });
        });
    });
    </script>
</body>
</html>
