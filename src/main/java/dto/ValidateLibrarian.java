package dto;


public class ValidateLibrarian {
	
	private String lname;
	private String lpassword;
	
	
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getLpassword() {
		return lpassword;
	}
	public void setLpassword(String lpassword) {
		this.lpassword = lpassword;
	}
	public String toString() {
		return "ValidateLibraian [ lname=" + lname + ", lpassword=" + lpassword + "]";
	}
	

}