package xyz.baal.orm;

public class CommentList {
	private int id;
	private String username;
	private String bookname;
	private String content;
	private String time;
	
	public CommentList() {
		super();
	}
	
	public CommentList(String username, String bookname, String content,
			String time) {
		super();
		this.username = username;
		this.bookname = bookname;
		this.content = content;
		this.time = time;
	}

	public CommentList(int id, String username, String bookname,
			String content, String time) {
		super();
		this.id = id;
		this.username = username;
		this.bookname = bookname;
		this.content = content;
		this.time = time;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}
