package xyz.baal.action.user;

import xyz.baal.orm.Applaud;
import xyz.baal.service.ApplaudService;

public class ApplaudAction {
	private int ukey;
	private int bbook;
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
	public String execute(){
		Applaud applaud = new Applaud(ukey, bbook);
		ApplaudService.insertApplaudinfo(applaud);
		return "success";
	}	
}
