package xyz.baal.orm;

public class Download {
	
	private int dlid;
	private int usid;
	private int bookid;

	public Download() {
		super();
	}
	public Download(int usid, int bookid) {
		super();
		this.usid = usid;
		this.bookid = bookid;
	}
	public Download(int dlid, int usid, int bookid) {
		super();
		this.dlid = dlid;
		this.usid = usid;
		this.bookid = bookid;
	}
	public int getDlid() {
		return dlid;
	}
	public void setDlid(int dlid) {
		this.dlid = dlid;
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
