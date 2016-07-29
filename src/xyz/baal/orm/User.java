package xyz.baal.orm;

public class User {
	
	private int usid;
	private String username;
	private String password;
	private String email;
	private String authority;
	
	public User() {
		super();
	}
	public User(String username, String password, String email, String authority) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.authority = authority;
	}
	public User(int usid, String username, String password, String email,
			String authority) {
		super();
		this.usid = usid;
		this.username = username;
		this.password = password;
		this.email = email;
		this.authority = authority;
	}
	public int getUsid() {
		return usid;
	}
	public void setUsid(int usid) {
		this.usid = usid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
}
