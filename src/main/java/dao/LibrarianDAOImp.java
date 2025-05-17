package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.Librarian;
import dto.ValidateLibrarian;
import util.MySqlConnection;

public class LibrarianDAOImp implements LibrarianDAO {
	Connection connection = null;

	@Override
	public String save(Librarian librarian) {
	    String query = "INSERT INTO librarian (lid, lname, lage, lemail, lpassword) VALUES (?, ?, ?, ?,?)";
	    PreparedStatement pstmt = null;
	    try {
	        connection = MySqlConnection.getConnection();
	        if (connection != null) {
	            pstmt = connection.prepareStatement(query);
	            pstmt.setInt(1, librarian.getLid());
	            pstmt.setString(2, librarian.getLname());
	            pstmt.setInt(3, librarian.getLage());
	            pstmt.setString(4, librarian.getLemail());
	            pstmt.setString(5, librarian.getLpassword());

	            int rows = pstmt.executeUpdate();
	            if (rows > 0) {
	                return "success";
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "failure";
	}


	public String deleteById(int lid) {
		// TODO Auto-generated method stub
		return null;
	}

	public String findById(int lid) {
		String query = "select lname from librarian where lid=?";
		PreparedStatement pstmt =null;
		try {
			connection = MySqlConnection.getConnection(); 
			if(connection!=null)
		    {
				pstmt = connection.prepareStatement(query);
				if (pstmt != null) {
					pstmt.setInt(1, lid);
				}
				if (pstmt != null) {
				  ResultSet rs = pstmt.executeQuery();
				  System.out.println(pstmt);
				  rs.next();
					if(rs!=null)
					{
					   return rs.getString("lname");
					}
					
				}
		    }
		}catch(Exception e) {}
				
		return null;
	}

	@Override
	public int librarianValidate(ValidateLibrarian validateLib) {
	    String sql = "SELECT lid FROM librarian WHERE lname = ? AND lpassword = ?";
	    try (Connection connection = MySqlConnection.getConnection();
	         PreparedStatement pstmt = connection.prepareStatement(sql)) {
	        
	        pstmt.setString(1, validateLib.getLname());
	        pstmt.setString(2, validateLib.getLpassword());

	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	                return rs.getInt("lid");
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return -1; 
	}
}