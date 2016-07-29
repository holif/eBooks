package xyz.baal.orm;

public class Applaud {
	
	private int id;
	private int usid;
	private int bookid;
	
	public Applaud() {
		super();
	}
	public Applaud(int usid, int bookid) {
		super();
		this.usid = usid;
		this.bookid = bookid;
	}
	public Applaud(int id, int usid, int bookid) {
		super();
		this.id = id;
		this.usid = usid;
		this.bookid = bookid;
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
}
