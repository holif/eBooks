package xyz.baal.action.user;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

import xyz.baal.orm.Comment;
import xyz.baal.service.CommentService;

public class CommentAction {
	private int ukey;
	private int bbook;
	private String content;
	public int getUkey() {
		return ukey;
	}
	public void setUkey(int ukey) {
		this.ukey = ukey;
	}
	public int getBbook() {
		return bbook;
	}
	public void setBbook(int bbook) {
		this.bbook = bbook;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content){	
/*		try {
			this.content = new String(content.getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
		}*/
		this.content = content;
	}
	public String execute() throws UnsupportedEncodingException{
		ServletActionContext.getRequest().setCharacterEncoding("utf-8");  
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd H:m:s");
		String time = fm.format(new Date());

		Comment comment = new Comment(ukey, bbook, content, time, 0);
		CommentService.insertCommentinfo(comment);
		return "success";
	}
}