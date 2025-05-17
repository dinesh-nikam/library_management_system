<%@page import="dao.LibrarianDAOImp"%>
<%@page import="dao.LibrarianDAO"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0);

    if (session.getAttribute("lid") == null) {
        response.sendRedirect("unauthorised.jsp");
        return;
    }

    int id = (Integer) session.getAttribute("lid");
    LibrarianDAO find = new LibrarianDAOImp();
    String name = find.findById(id);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Library Manage</title>
  
  <!-- Bootstrap CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  
  <style>
    .slider-container img {
      width: 100%;
      height:250px;
      display: none;
    }
    .slider-container img.active {
      display: block;
    }
    .slider-container .prev,
    .slider-container .next {
      cursor: pointer;
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      padding: 10px;
      font-size: 24px;
      background: rgba(0,0,0,0.5);
      color: white;
      border-radius: 5px;
    }
    .prev { left: 10px; }
    .next { right: 10px; }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">E-Library</a>

    <ul class="navbar-nav ms-auto align-items-center">
      <li class="nav-item me-3 text-white" id="clock"></li>
      <li class="nav-item">
        <a class="nav-link text-white" href="logout.jsp">Logout</a>
      </li>
    </ul>
  </div>
</nav>

<header class="bg-primary text-white text-center py-4">
  <div class="container">
    <h5 class="mb-2">Welcome, <%= name %>!</h5>
    <h1 class="display-5 fw-bold">Welcome to E-Library</h1>
  </div>
</header>


<main class="container my-4">

  <!-- Slider -->
  <div class="position-relative slider-container mb-5">
    <img src="img/img2.jpg" class="active img-fluid rounded">
    <img src="img/img3.jpg" class="img-fluid rounded">
    <img src="img/img4.jpg" class="img-fluid rounded">
    <img src="img/img5.jpg" class="img-fluid rounded">
    <div class="prev">&#10094;</div>
    <div class="next">&#10095;</div>
  </div>

  <!-- Buttons Grid -->
  <div class="row mb-4">
    <div class="col-md-3 mb-3">
      <a href="addstudent.jsp" class="btn btn-outline-primary w-100">Add Student</a>
    </div>
    <div class="col-md-3 mb-3">
      <a href="addBook.jsp" class="btn btn-outline-primary w-100">Add Book</a>
    </div>
    <div class="col-md-3 mb-3">
      <a href="issuebook.jsp" class="btn btn-outline-primary w-100">Issue Book</a>
    </div>
    <div class="col-md-3 mb-3">
      <a href="checkdue.jsp" class="btn btn-outline-primary w-100">Check Due</a>
    </div>
  </div>

  <div class="row">
    <div class="col-md-3 mb-3">
      <a href="delstudent.jsp" class="btn btn-outline-danger w-100">Delete Student</a>
    </div>
    <div class="col-md-3 mb-3">
      <a href="delbook.jsp" class="btn btn-outline-danger w-100">Delete Book</a>
    </div>
    <div class="col-md-3 mb-3">
      <a href="allbook.jsp" class="btn btn-outline-success w-100">All Books</a>
    </div>
    <div class="col-md-3 mb-3">
      <a href="allstudent.jsp" class="btn btn-outline-success w-100">All Students</a>
    </div>
  </div>
</main>

<script>
  var slideIndex = 0;
  showSlides();

  function showSlides() {
    var i;
    var slides = document.querySelectorAll(".slider-container img");
    for (i = 0; i < slides.length; i++) {
      slides[i].classList.remove("active");
    }
    slideIndex++;
    if (slideIndex > slides.length) { slideIndex = 1; }
    slides[slideIndex - 1].classList.add("active");
    setTimeout(showSlides, 5000);
  }

  document.querySelector(".prev").addEventListener("click", function () {
    slideIndex--;
    if (slideIndex < 1) { slideIndex = document.querySelectorAll(".slider-container img").length; }
    showSlides();
  });

  document.querySelector(".next").addEventListener("click", function () {
    slideIndex++;
    if (slideIndex > document.querySelectorAll(".slider-container img").length) { slideIndex = 1; }
    showSlides();
  });

  // Live clock
  function updateClock() {
    document.getElementById("clock").innerText = new Date().toLocaleTimeString();
  }
  setInterval(updateClock, 1000);
  updateClock();
</script>

</body>
</html>
