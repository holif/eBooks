package xyz.baal.action;

import java.io.IOException;
import java.util.List;

import xyz.baal.orm.User;
import xyz.baal.service.UserService;

public class SelectUserAction {
	private List<User> list;
	private int sum;
	private String key;
	private int allpager;
	private int page;
	
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
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public List<User> getList() {
		return list;
	}
	public void setList(List<User> list) {
		this.list = list;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public String byKey(){
		list = UserService.getUserinfoByKey(key);
		sum = list.size();
		return "success";
	}
	public String pager() {
		list = UserService.getAllUserinfoByPage(page - 1);
		sum = UserService.getAllUserinfo().size();
		if (sum % 7 == 0) {
			allpager = sum / 7;
		} else {
			allpager = sum / 7 + 1;
		}
		return "success";
	}	
	public String execute() throws IOException{
		list = UserService.getAllUserinfoByPage(0);
		sum = UserService.getAllUserinfo().size();
		if (sum % 7 == 0) {
			allpager = sum / 7;
		} else {
			allpager = sum / 7 + 1;
		}
		return "success";
	}
}
