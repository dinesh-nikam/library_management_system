<%@page import="java.sql.ResultSet"%>
<%@page import="dao.BookDAOImp"%>
<%@page import="dao.BookDAO"%>

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
<html lang="en">
<head>
<title>Delete Book</title>
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
        return confirm("Are you sure you want to delete this book?");
    }
</script>
</head>
<body>
  <button style="padding:10px 20px; margin: 10px 20px; background-color:#CF0F47; color:white; border:none; border-radius:5px; cursor:pointer;" 
        onclick="window.location.href='libMain.jsp'">
    Home
</button>
    <div class="form-container">
        <h2>Delete Book by BID</h2>
        <form action="DelBook" onsubmit="return confirmDelete();">
        <%
        String status = (String)session.getAttribute("delBstatus");
        if ("success".equals(status)) {
        %>
            <h3 style="color:green">Record Deleted Successfully !!</h3>
        <% 
            session.setAttribute("delBstatus", null);
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
      
        
        <label for="book-id">Book ID:</label>
        <input type="text" id="book-id" name="book-id" required>
        <input type="submit" value="Delete">
        </form>
    </div>
   
   <div class="container">
    <div class="table-responsive">
            <table class="table table-bordered table-hover text-center align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Book Name</th>
                        <th>Book ID</th>
                        <th>Author</th>
                        <th>Subject</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                        BookDAO book = new BookDAOImp();
                        ResultSet rs = book.findAll();
                        while(rs.next()) {
                            String bookName = rs.getString(1);
                            String bookId = rs.getString(2);
                            String author = rs.getString(3);
                            String subject = rs.getString(4);
                    %>
                    <tr data-bookid="<%=bookId%>">
                        <td contenteditable="true" class="editable"><%= bookName %></td>
                        <td><%= bookId %></td>
                        <td contenteditable="true" class="editable"><%= author %></td>
                        <td contenteditable="true" class="editable"><%= subject %></td>
                        
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        </div>
</body>
</html>
