package controller;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LibrarianDAOImp;
import dto.Librarian;



@WebServlet("/RegisterLibrarian")
public class RegisterLibrarian extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int lid = Integer.parseInt(request.getParameter("lid"));
        String lname = request.getParameter("lname");
        int lage = Integer.parseInt(request.getParameter("lage"));
        String lemail = request.getParameter("lemail");
        String lpassword = request.getParameter("lpassword");
        Librarian librarian = new Librarian(lid, lname, lage, lemail , lpassword);

        LibrarianDAOImp dao = new LibrarianDAOImp();
        String result = dao.save(librarian);

        if ("success".equals(result)) {
            response.getWriter().print("<h3>Registration successful!</h3>");
        } else {
            response.getWriter().print("<h3>Registration failed. Please try again.</h3>");
        }
    }
}
