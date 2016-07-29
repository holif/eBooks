package xyz.baal.action;

import xyz.baal.orm.Book;
import xyz.baal.service.BookService;

public class UpdateBookAction {
	private int bookid;
	private String bookname;
	private String author;	
	private String type;	
	private String press;	 
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
	public String dele(){
		BookService.deleteBookinfoByBookid(bookid);
		return null;
	}
	public String execute(){
		Book book = BookService.getBookinfoByBookid(bookid);
		book.setBookname(bookname);
		book.setAuthor(author);
		book.setType(type);
		book.setPress(press);
		BookService.updateBookinfo(book);
		return "success";
	}
}
