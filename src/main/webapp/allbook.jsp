<%@page import="java.sql.ResultSet"%>
<%@page import="dao.BookDAOImp"%>
<%@page import="dao.BookDAO"%>
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
<html>
<head>
    <title>All Books</title>
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
        <h2 class="mb-4">Book List</h2>   
          <button style="padding:10px 20px; margin: 10px 20px; background-color:#CF0F47; color:white; border:none; border-radius:5px; cursor:pointer;" 
        onclick="window.location.href='libMain.jsp'">
    Home
</button>
        <div class="table-responsive">
            <table class="table table-bordered table-hover text-center align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Book Name</th>
                        <th>Book ID</th>
                        <th>Author</th>
                        <th>Subject</th>
                        <th>Action</th>
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
            const bookId = row.data("bookid");
            const bookName = row.find("td").eq(0).text().trim();
            const author = row.find("td").eq(2).text().trim();
            const subject = row.find("td").eq(3).text().trim();

            $.ajax({
                url: "UpdateBook",
                method: "POST",
                data: {
                    bookId: bookId,
                    bookName: bookName,
                    author: author,
                    subject: subject
                },
                success: function () {
                    alert("Book updated successfully.");
                    row.find(".save-btn").addClass("d-none");
                    row.find(".edit-btn").removeClass("d-none");
                },
                error: function () {
                    alert("Failed to update the book.");
                }
            });
        });
    });
</script>

</body>
</html>
