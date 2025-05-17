package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LibrarianDAO;
import dao.LibrarianDAOImp;
import dto.ValidateLibrarian;

@WebServlet("/Validate")
public class Validate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LibrarianDAO libdao = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lname = request.getParameter("lname");
		String lpassword = request.getParameter("lpassword");

		if (lname != null) lname = lname.trim();
		if (lpassword != null) lpassword = lpassword.trim();

		ValidateLibrarian vl = new ValidateLibrarian();
		vl.setLname(lname);
		vl.setLpassword(lpassword);

		libdao = new LibrarianDAOImp();
		int id = libdao.librarianValidate(vl);

		HttpSession session = request.getSession();
		session.setAttribute("lid", id);

		if (id == -1) {
			
			request.setAttribute("error", "Invalid username or password.");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} else {
			
			RequestDispatcher rd = request.getRequestDispatcher("libMain.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
