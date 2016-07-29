package xyz.baal.action;

import java.io.IOException;
import java.util.List;

import xyz.baal.orm.CommentList;
import xyz.baal.service.CommentService;
import xyz.baal.service.UserService;

public class SelectCommentAction {
	private List<CommentList> list;
	private int sum;
	private String key;
	private int allpager;
	private int page;
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public List<CommentList> getList() {
		return list;
	}
	public void setList(List<CommentList> list) {
		this.list = list;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
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
	public String byKey() {
		int usid = UserService.getUserinfoByUsername(key).getUsid();
		list = CommentService.getComInfoByUsid(usid);
		sum = list.size();
		return "success";
	}
	public String pager() {
		list = CommentService.getComInfoByCM(page - 1);
		sum = CommentService.getAllCommentinfo().size();
		if (sum % 7 == 0) {
			allpager = sum / 7;
		} else {
			allpager = sum / 7 + 1;
		}
		return "success";
	}	
	public String execute() throws IOException {
		page = 0;
		list = CommentService.getComInfoByCM(page);
		sum = CommentService.getAllCommentinfo().size();
		if (sum % 7 == 0) {
			allpager = sum / 7;
		} else {
			allpager = sum / 7 + 1;
		}
		return "success";
	}
}