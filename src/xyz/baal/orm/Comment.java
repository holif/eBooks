package xyz.baal.orm;

public class Comment {
	
	private int id;
	private int usid;
	private int bookid;
	private String content;
	private String time;
	private int answerusid;
	
	public Comment() {
		super();
	}
	public Comment(int usid, int bookid, String content, String time,
			int answerusid) {
		super();
		this.usid = usid;
		this.bookid = bookid;
		this.content = content;
		this.time = time;
		this.answerusid = answerusid;
	}
	public Comment(int id, int usid, int bookid, String content, String time,
			int answerusid) {
		super();
		this.id = id;
		this.usid = usid;
		this.bookid = bookid;
		this.content = content;
		this.time = time;
		this.answerusid = answerusid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUsid() {
		return usid;
	}
	public void setUsid(int usid) {
		this.usid = usid;
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
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
	public int getAnswerusid() {
		return answerusid;
	}
	public void setAnswerusid(int answerusid) {
		this.answerusid = answerusid;
	}
}
