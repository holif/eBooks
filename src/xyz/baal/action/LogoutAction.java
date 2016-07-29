package xyz.baal.action;

import java.io.IOException;

import org.apache.struts2.ServletActionContext;

public class LogoutAction {
	public String user() throws IOException{
		ServletActionContext.getRequest().getSession().invalidate();
		ServletActionContext.getResponse().sendRedirect("index.jsp");
		return null;
	}
	public String execute() throws IOException{
		ServletActionContext.getRequest().getSession().invalidate();
		ServletActionContext.getResponse().sendRedirect("admin/login.jsp");
		return null;
	}	
}
