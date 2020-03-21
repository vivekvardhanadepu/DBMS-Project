package com.cms;

public class User {
	private String username;
	private String password;
	private String phone_no;
	private String firstName;
	private String lastName;
	private String emailId;
	private String courseName;
	private boolean valid = false;
	
	public void setUsername(String uname) {
		username = uname;
	}
	
	public void setPassword(String pass) {
		password = pass;
	}
	
	public void setPhone_no(String num) {
		phone_no = num;
	}
	
	public void setFirstName(String fName) {
		firstName = fName;
	}
	
	public void setLastName(String lName) {
		lastName = lName;
	}
	
	public void setEmailId(String id) {
		emailId = id;
	}
	
	public void setCourseName(String cname) {
		courseName = cname;
	}
	
	public void setValid(boolean bool) {
		valid = bool;
	}
	
	public String getUsername() {
		return username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public String getPhone_no() {
		return phone_no;
	}
	
	public String getFirstName() {
		return firstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public String getEmailId() {
		return emailId;
	}
	
	public String getCourseName() {
		return courseName;
	}
	
	public boolean isValid() {
		return valid;
	}
	
	
}
