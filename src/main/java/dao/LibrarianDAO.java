package dao;

import dto.Librarian;
import dto.ValidateLibrarian;

public interface LibrarianDAO {
	String save(Librarian librarian);
	int librarianValidate(ValidateLibrarian validateLib);
	String deleteById(int lid);
	String findById(int lid);

}