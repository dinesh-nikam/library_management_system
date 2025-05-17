package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.Student;
import util.MySqlConnection;

public class StudentDAOImp implements StudentDAO {

    public String save(Student student) {
        String status = "failure";
        String query = "INSERT INTO student(sname, sid, scourse, sphone, semail) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, student.getSname());
            ps.setInt(2, student.getSid());
            ps.setString(3, student.getScourse());
            ps.setString(4, student.getSphone());
            ps.setString(5, student.getSemail());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected == 1) {
                status = "success";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public Student findById(int sid) {
        Student std = null;
        String query = "SELECT sname, scourse, sphone, semail FROM student WHERE sid=?";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, sid);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    std = new Student();
                    std.setSid(sid);
                    std.setSname(rs.getString("sname"));
                    std.setScourse(rs.getString("scourse"));
                    std.setSphone(rs.getString("sphone"));
                    std.setSemail(rs.getString("semail"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return std;
    }
    
    
    @Override
    public String findPhoneBySid(int sid) {
        String phone = null;
        String query = "SELECT sphone FROM student WHERE sid = ?";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, sid);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    phone = rs.getString("sphone");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return phone;
    }


    @Override
    public boolean update(Student student) {
        boolean status = false;
        String query = "UPDATE student SET sname=?, scourse=?, sphone=?, semail=? WHERE sid=?";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, student.getSname());
            ps.setString(2, student.getScourse());
            ps.setString(3, student.getSphone());
            ps.setString(4, student.getSemail());
            ps.setInt(5, student.getSid());

            int rowsUpdated = ps.executeUpdate();
            status = rowsUpdated == 1;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public String deleteById(int sid) {
        String delStatus = "failure";
        String query = "DELETE FROM student WHERE sid=?";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, sid);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected == 1) {
                delStatus = "success";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return delStatus;
    }

    public ResultSet findAll() {
        ResultSet rs = null;
        String query = "SELECT * FROM student";

        try {
            Connection con = MySqlConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }
}
