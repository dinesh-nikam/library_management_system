<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("lid")==null) {
%>
    <h1>Unauthorized Access</h1>
<%
        return;
    }
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Issue Book</title>
    <style>
      .form-container {
        max-width: 600px;
        margin: 70px auto;
        padding: 20px;
        background-color: #f2f2f2;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
      }

      label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
      }

      input[type="text"], input[type="date"] {
        width: 550px;
        padding: 12px 20px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
      }

      input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin-top: 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
      }

      input[type="submit"]:hover {
        background-color: #45a049;
      }

      .error {
        color: red;
        font-weight: bold;
        margin-top: 10px;
      }

      .success {
        color: green;
        font-weight: bold;
        margin-top: 10px;
      }
    </style>
    <script>
      function validateForm() {
        const bid = document.getElementById("bid").value.trim();
        const sid = document.getElementById("sid").value.trim();
        const issueDate = document.getElementById("issuedate").value;
        const dueDate = document.getElementById("duedate").value;

        const errorBox = document.getElementById("errorMsg");
        errorBox.textContent = "";

        if (!bid || !sid || !issueDate || !dueDate) {
          errorBox.textContent = "All fields are required!";
          return false;
        }

        const issue = new Date(issueDate);
        const due = new Date(dueDate);

        if (due < issue) {
          errorBox.textContent = "Due date cannot be before Issue date!";
          return false;
        }

        return true; 
      }
    </script>
  </head>
  <body>
   
  
    <div class="form-container">
      <form action="IssueBook" onsubmit="return validateForm()">
        <div id="errorMsg" class="error"></div>

        <%
          String status = (String) session.getAttribute("issuestatus");
          if ("success".equals(status)) {
        %>
            <div class="success">Book Issued Successfully!!</div>
        <%
          } else if ("failure".equals(status)) {
        %>
            <div class="error">Some Error Occurred!</div>
        <%
          } else if ("error".equals(status)) {
        %>
            <div class="error">Wrong Book-ID or Student-ID!</div>
        <%
          }
          session.setAttribute("issuestatus", null);
        %>
<button style="padding:10px 20px; margin: 0px 500px; background-color:#CF0F47; color:white; border:none; border-radius:5px; cursor:pointer;" 
        onclick="window.location.href='libMain.jsp'">
    Home
</button>
        <label for="bid">Book ID:</label>
        <input type="text" id="bid" name="bid" placeholder="Enter Book ID">

        <label for="sid">Student ID:</label>
        <input type="text" id="sid" name="sid" placeholder="Enter Student ID">

        <label for="issuedate">Issue Date:</label>
        <input type="date" id="issuedate" name="issuedate">

        <label for="duedate">Due Date:</label>
        <input type="date" id="duedate" name="duedate">

        <input type="submit" value="Submit">
        
       
      </form>
    </div>
  

    
  </body>
</html>
