package xyz.baal.orm;

public class Book {
	private int bookid;
	private String bookname; 
	private String author;	 
	private String type;	 
	private String press;	 
	private String abstracts;
	private String download; 
	private String img;		
	
	public Book() {
		super();
	}

	public Book(int bookid, String bookname, String author, String type,
			String press, String abstracts, String download, String img) {
		super();
		this.bookid = bookid;
		this.bookname = bookname;
		this.author = author;
		this.type = type;
		this.press = press;
		this.abstracts = abstracts;
		this.download = download;
		this.img = img;
	}
	public Book(String bookname, String author, String type,
			String press, String abstracts, String download, String img) {
		super();
		this.bookname = bookname;
		this.author = author;
		this.type = type;
		this.press = press;
		this.abstracts = abstracts;
		this.download = download;
		this.img = img;
	}
	
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public String getAbstracts() {
		return abstracts;
	}
	public void setAbstracts(String abstracts) {
		this.abstracts = abstracts;
	}
	public String getDownload() {
		return download;
	}
	public void setDownload(String download) {
		this.download = download;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "Book [bookid=" + bookid + ", bookname=" + bookname + ", author="
				+ author + ", type=" + type + ", press=" + press
				+ ", abstracts=" + abstracts + ", download=" + download
				+ ", img=" + img + "]";
	}
}
