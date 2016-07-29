package xyz.baal.action;

import xyz.baal.service.ApplaudService;
import xyz.baal.service.CommentService;
import xyz.baal.service.DownloadService;
import xyz.baal.service.UserService;

public class DeleteUserAction {
	private int usid;

	public int getUsid() {
		return usid;
	}
	public void setUsid(int usid) {
		this.usid = usid;
	}
	public String execute(){
		ApplaudService.deleteApplaudinfo(usid);
		DownloadService.deleteDownloadinfoByUsid(usid);
		CommentService.deleteCommentByUsid(usid);
		UserService.deleteUserinfoByUsid(usid);
		return "success";
	}
}
