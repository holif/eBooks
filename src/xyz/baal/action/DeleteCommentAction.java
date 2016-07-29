package xyz.baal.action;

import xyz.baal.service.CommentService;

public class DeleteCommentAction {
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String execute(){
		CommentService.deleteCommentById(id);
		return "success";
	}
}
