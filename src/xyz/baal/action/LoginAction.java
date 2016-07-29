package xyz.baal.action;

import java.io.IOException;

import org.apache.struts2.ServletActionContext;

import xyz.baal.orm.User;
import xyz.baal.service.UserService;
import xyz.baal.util.MD5;

public class LoginAction {
	private String username;
	private String password;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String user() throws IOException{
		password = MD5.GetMD5Code(password);
		User user = UserService.getUserinfoByUsername(username);
		if(user!=null){
			if(user.getPassword().equals(password)){	
				ServletActionContext.getRequest().getSession()
				.setAttribute("usid", user.getUsid());
				return "userlogin";
			} else {
				ServletActionContext.getResponse().sendRedirect("index.jsp");
				return null;
			}
		}else {
			ServletActionContext.getResponse().sendRedirect("index.jsp");
			return null;
		}		
	}
	public String execute() throws IOException{
		password = MD5.GetMD5Code(password);
		User user = UserService.getUserinfoByUsername(username);
		if(user!=null){
			if(user.getPassword().equals(password)){
				if(!user.getAuthority().equals("1")){
					ServletActionContext.getResponse().sendRedirect("index.jsp");
					return null;
				}
				ServletActionContext.getRequest().getSession()
						.setAttribute("usid", user.getUsid());
				return "success";
			} else {
				return "error";
			}
		} else {
			ServletActionContext.getResponse().sendRedirect("index.jsp");
			return null;
		}
	}
}
