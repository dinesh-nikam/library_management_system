package dto;

public class Librarian {
	private int lid;
	private String lname;
	private int lage;
	private String lemail;
	private String lpassword;
	
	public String getLpassword() {
		return lpassword;
	}
	public void setLpassword(String lpassword) {
		this.lpassword = lpassword;
	}
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public int getLage() {
		return lage;
	}
	public void setLage(int lage) {
		this.lage = lage;
	}
	public String getLemail() {
		return lemail;
	}
	public void setLemail(String lemail) {
		this.lemail = lemail;
	}
	@Override
	public String toString() {
		return "Librarian [lid=" + lid + ", lname=" + lname + ", lage=" + lage + ", lemail=" + lemail + ", lpassword="
				+ lpassword + "]";
	}
	public Librarian(int lid, String lname, int lage, String lemail, String lpassword) {
		super();
		this.lid = lid;
		this.lname = lname;
		this.lage = lage;
		this.lemail = lemail;
		this.lpassword = lpassword;
	}
	

}