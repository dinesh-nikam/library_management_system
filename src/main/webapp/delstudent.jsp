<%@page import="dao.StudentDAOImp"%>
<%@page import="dao.StudentDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("lid") == null) {
%>
  <h1>Unauthorized Access</h1>
<%
  return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Delete Student</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   
<style>
    .form-container {
        max-width: 500px;
        margin: 100px auto;
    }

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
        background-color: #fff;
        padding: 30px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    }

    h2 {
        text-align: center;
        margin-bottom: 30px;
    }

    label {
        font-size: 16px;
        font-weight: 700;
        margin-bottom: 10px;
    }

    input[type="text"] {
        width: 100%;
        padding: 12px 15px;
        border-radius: 4px;
        border: 1px solid #ccc;
        font-size: 16px;
        margin-bottom: 20px;
    }

    input[type="submit"] {
        background-color: #4caf50;
        color: #fff;
        border: none;
        border-radius: 4px;
        padding: 12px 15px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #3e8e41;
    }
</style>
<script>
    function confirmDelete() {
        return confirm("Are you sure you want to delete this student?");
    }
</script>
</head>
<body>

<button style="padding:10px 20px; margin: 10px 20px; background-color:#CF0F47; color:white; border:none; border-radius:5px; cursor:pointer;" 
        onclick="window.location.href='libMain.jsp'">
    Home
</button>
<div class="form-container">
    <h2>Delete Student by ID</h2>
    <form action="DelStudent" onsubmit="return confirmDelete();">
    <%
        String status = (String)session.getAttribute("delstatus");
        if ("success".equals(status)) {
    %>
        <h3 style="color:green">Record Deleted Successfully!</h3>
    <%
            session.setAttribute("delstatus", null);
        } else if ("failure".equals(status)) {
    %>
        <h3 style="color:red">Some Error Occurred!</h3>
    <%
        } else if (status != null) {
    %>
        <h3 style="color:red">Data Not Found!</h3>
    <%
        }
    %>
    
    
        <label for="student-id">Student ID:</label>
        <input type="text" id="student-id" name="student-id" required>
        <input type="submit" value="Delete">
    </form>
</div>
 <div class="container">
        <h2 class="mb-4">Student List</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-hover text-center align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Student Name</th>
                        <th>Student ID</th>
                        <th>Course</th>
                        <th>Phone</th>
                        <th>Email</th>
                       
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
                        <td  ><%= name %></td>
                        <td><%= sid %></td>
                        <td  ><%= course %></td>
                        <td  ><%= phone %></td>
                        <td  ><%= email %></td>
                        
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
