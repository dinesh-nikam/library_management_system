package dao;
import java.sql.ResultSet;

import dto.Books;

public interface BookDAO {

	String save(Books book);
    Books findById(int bid);
    public boolean update(Books book);

    String deleteById(int bid);
    ResultSet findAll();

}