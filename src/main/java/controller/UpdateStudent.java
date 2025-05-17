package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentDAO;
import dao.StudentDAOImp;
import dto.Student;

@WebServlet("/UpdateStudent")
public class UpdateStudent extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			int sid = Integer.parseInt(request.getParameter("sid"));
			String name = request.getParameter("name");
			String course = request.getParameter("course");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");

			Student student = new Student();
			student.setSid(sid);
			student.setSname(name);
			student.setScourse(course);
			student.setSphone(phone);
			student.setSemail(email);

			StudentDAO dao = new StudentDAOImp();
			boolean result = dao.update(student);

			if (result) {
				response.setStatus(HttpServletResponse.SC_OK);
				response.getWriter().write("Student updated successfully");
			} else {
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				response.getWriter().write("Failed to update student");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			response.getWriter().write("Invalid input or missing parameters");
		}
	}
}
