package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import dao.BookDAOImp;
import dto.Books;

@WebServlet("/UpdateBook")
public class UpdateBook extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            String name = request.getParameter("bookName");
            String author = request.getParameter("author");
            String subject = request.getParameter("subject");

            
            Books book = new Books();
            book.setBid(bookId);
            book.setBname(name);
            book.setBauthor(author);
            book.setBsubject(subject);

            
            BookDAO dao = new BookDAOImp();
            boolean result = dao.update(book);

            if (result) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("Book updated successfully");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Failed to update book");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Invalid input or missing parameters");
        }
    }
}
