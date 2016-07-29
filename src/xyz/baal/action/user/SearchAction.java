package xyz.baal.action.user;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import xyz.baal.orm.Book;
import xyz.baal.service.BookService;

public class SearchAction {
	private String query;
	private List<Book> listBookInfo;

	public List<Book> getListBookInfo() {
		return listBookInfo;
	}
	public void setListBookInfo(List<Book> listBookInfo) {
		this.listBookInfo = listBookInfo;
	}
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	public String execute(){
		List<Book> list = BookService.getBookinfoByKey(query);
		ServletActionContext.getRequest().setAttribute("listBookInfo", list);
		setListBookInfo(list);
		return "success";
	}
}
