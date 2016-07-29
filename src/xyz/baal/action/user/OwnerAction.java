package xyz.baal.action.user;

import java.util.ArrayList;
import java.util.List;

import xyz.baal.orm.Applaud;
import xyz.baal.orm.Book;
import xyz.baal.orm.CommentList;
import xyz.baal.orm.Download;
import xyz.baal.service.ApplaudService;
import xyz.baal.service.BookService;
import xyz.baal.service.CommentService;
import xyz.baal.service.DownloadService;

public class OwnerAction {
	private int usid;
	private List<Book> dlBooks;
	private List<Book> apBooks;
	private List<CommentList> commentLists;
	
	private List<Book> dlbooklist;	//下载排行榜
	private List<Book> apbooklist;	//赞
	private List<Book> cmbooklist;	//评论
	
	public List<Book> getDlbooklist() {
		return dlbooklist;
	}
	public void setDlbooklist(List<Book> dlbooklist) {
		this.dlbooklist = dlbooklist;
	}
	public List<Book> getApbooklist() {
		return apbooklist;
	}
	public void setApbooklist(List<Book> apbooklist) {
		this.apbooklist = apbooklist;
	}
	public List<Book> getCmbooklist() {
		return cmbooklist;
	}
	public void setCmbooklist(List<Book> cmbooklist) {
		this.cmbooklist = cmbooklist;
	}
	public List<Book> getDlBooks() {
		return dlBooks;
	}
	public void setDlBooks(List<Book> dlBooks) {
		this.dlBooks = dlBooks;
	}
	public List<Book> getApBooks() {
		return apBooks;
	}
	public void setApBooks(List<Book> apBooks) {
		this.apBooks = apBooks;
	}
	public List<CommentList> getCommentLists() {
		return commentLists;
	}
	public void setCommentLists(List<CommentList> commentLists) {
		this.commentLists = commentLists;
	}
	public int getUsid() {
		return usid;
	}
	public void setUsid(int usid) {
		this.usid = usid;
	}
	public String execute(){
		init();
		return "success";
	}
	private void init(){
		List<Download> dllList= DownloadService.getDownloadinfoByusid(usid);
		List<Book> dltempBooks = new ArrayList<Book>();
		for (Download download : dllList) {
			Book book = new Book();
			book = BookService.getBookinfoByBookid(download.getBookid());
			dltempBooks.add(book);
		}
		dlBooks = dltempBooks;
		
		List<Applaud> appList = ApplaudService.getApplaudinfoByUsid(usid);
		List<Book> aptempBooks = new ArrayList<Book>();
		for (Applaud applaud : appList) {
			Book book = new Book();
			book = BookService.getBookinfoByBookid(applaud.getBookid());
			aptempBooks.add(book);
		}
		apBooks = aptempBooks;
		commentLists = CommentService.getComInfoByUsid(usid);
		
		dlbooklist = DownloadService.getBooksByDL();		
		apbooklist = ApplaudService.getBooksByAP();		
		cmbooklist = CommentService.getBooksByCM();
	}
}
