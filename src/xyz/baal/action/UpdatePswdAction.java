package xyz.baal.action;

import org.apache.struts2.ServletActionContext;

import xyz.baal.orm.User;
import xyz.baal.service.UserService;
import xyz.baal.util.MD5;

public class UpdatePswdAction {
	private String oldpswd;
	private String newpswd;

	public String getOldpswd() {
		return oldpswd;
	}
	public void setOldpswd(String oldpswd) {
		this.oldpswd = oldpswd;
	}
	public String getNewpswd() {
		return newpswd;
	}
	public void setNewpswd(String newpswd) {
		this.newpswd = newpswd;
	}
	public String user(){
		return init()==true ? "usersuccess" : "usererror";
	}
	public String execute(){		
		return init()==true ? "success" : "error";
	}
	private boolean init(){
		int usid = (Integer)ServletActionContext.getRequest()
				.getSession().getAttribute("usid");
		
		User user = new User();
		user.setUsid(usid);
		user.setPassword(MD5.GetMD5Code(newpswd));
		
		String temp = UserService.getUserinfoByUsid(usid).getPassword();
		
		if(temp.equals(MD5.GetMD5Code(oldpswd))){
			UserService.updatePassowordByUsid(user);
		} else {
			return false;
		}
		return true;
	}
}