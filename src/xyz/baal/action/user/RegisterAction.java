package xyz.baal.action.user;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import xyz.baal.orm.User;
import xyz.baal.service.UserService;
import xyz.baal.util.MD5;
import xyz.baal.util.SendMail;

public class RegisterAction {
	private String username;
	private String password;
	private String email;
	private String message;//发送邮件后返回信息
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void check() throws IOException{
		PrintWriter out = ServletActionContext.getResponse().getWriter();  
		if(UserService.getUserinfoByUsername(username)==null){
			out.print("ok");
		} else {
			out.print("error");
		}
		out.flush();  
		out.close();  
	}
	public String execute(){
		User user = new User(username, password, email,"0");
		User temp = new User(username, MD5.GetMD5Code(password), email,"0");
		UserService.insertUserinfo(temp);
		SendMail sendMail = new SendMail(user);
		sendMail.start();
		message = "恭喜您，注册成功，我们已经发送注册邮件到您的邮箱，请注意查收！<br/>如未收到请查看是否被标记为垃圾邮件。";
		return "success";
	}
}
