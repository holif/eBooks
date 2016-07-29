package xyz.baal.action;

import java.io.IOException;

import xyz.baal.orm.Book;
import xyz.baal.service.BookService;

public class UploadAction {
	private String bookname;
	private String author;	
	private String type;	
	private String press;	 
	private String abstracts;
	private String download; 
	private String img;
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
	public String execute() throws IOException{
		Book book = new Book(bookname, author, type, press, 
				abstracts, download, img);
		BookService.insertBook(book);
		return "success";
	}
}
