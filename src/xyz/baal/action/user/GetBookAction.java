package xyz.baal.action.user;

import java.io.IOException;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import xyz.baal.orm.Book;
import xyz.baal.orm.CommentList;
import xyz.baal.service.ApplaudService;
import xyz.baal.service.BookService;
import xyz.baal.service.CommentService;
import xyz.baal.service.DownloadService;

public class GetBookAction {
	private int bookid;
	private Book book;
	private List<CommentList> bookcmlist;
	private int dl;//下载量
	private int ap;//赞数
	private int cm;//评论数
	public int getDl() {
		return dl;
	}
	public void setDl(int dl) {
		this.dl = dl;
	}
	public int getAp() {
		return ap;
	}
	public void setAp(int ap) {
		this.ap = ap;
	}
	public int getCm() {
		return cm;
	}
	public void setCm(int cm) {
		this.cm = cm;
	}
	public List<CommentList> getBookcmlist() {
		return bookcmlist;
	}
	public void setBookcmlist(List<CommentList> bookcmlist) {
		this.bookcmlist = bookcmlist;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String execute() throws IOException{
		book = BookService.getBookinfoByBookid(bookid);
		if(book==null){
			ServletActionContext.getResponse().sendRedirect("index.jsp");
			return null;
		}
		bookcmlist = CommentService.getComInfoByBookid(bookid);
		dl = DownloadService.countDownloadinfoByBookid(bookid);
		cm = CommentService.getComInfoByBookid(bookid).size();
		ap = ApplaudService.countApplaudinfoByBookid(bookid);
		return "success";
	}
}
