package dao;
import java.sql.ResultSet;

import dto.Books;
import dto.Student;

public interface StudentDAO {
	
	String save(Student student);
    Student findById(int sid);
    String findPhoneBySid(int sid);
    boolean update(Student student); 
    String deleteById(int sid);
    ResultSet findAll();
    
}