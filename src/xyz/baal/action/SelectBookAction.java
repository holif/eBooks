package xyz.baal.action;

import java.io.IOException;
import java.util.List;

import xyz.baal.orm.Book;
import xyz.baal.service.BookService;

public class SelectBookAction {
	private List<Book> list;
	private int sum;
	private int allpager;
	private int page;
	private String key;
	private String type;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public int getAllpager() {
		return allpager;
	}
	public void setAllpager(int allpager) {
		this.allpager = allpager;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public List<Book> getList() {
		return list;
	}
	public void setList(List<Book> list) {
		this.list = list;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	
	public String byType() {
		list = BookService.getBookinfoByType(type);
		sum = list.size();
		if (sum % 7 == 0) {
			allpager = sum / 7;
		} else {
			allpager = sum / 7 + 1;
		}
		page = 1;
		return "success";
	}
	public String byKey() {
		page = 1;
		list = BookService.getBookinfoByKey(key);
		sum = list.size();
		if (sum % 7 == 0) {
			allpager = sum / 7;
		} else {
			allpager = sum / 7 + 1;
		}
		return "success";
	}
	public String pager() {
		list = BookService.getAllBooksByPage(page - 1);
		sum = BookService.getAllBooks().size();
		if (sum % 7 == 0) {
			allpager = sum / 7;
		} else {
			allpager = sum / 7 + 1;
		}
		return "success";
	}
	public String execute() throws IOException {
		page = 0;
		list = BookService.getAllBooksByPage(page);
		sum = BookService.getAllBooks().size();
		if (sum % 7 == 0) {
			allpager = sum / 7;
		} else {
			allpager = sum / 7 + 1;
		}
		return "success";
	}
}