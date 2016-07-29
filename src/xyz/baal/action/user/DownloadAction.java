package xyz.baal.action.user;

import xyz.baal.orm.Download;
import xyz.baal.service.DownloadService;

public class DownloadAction {
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
		Download download = new Download(ukey, bbook);
		DownloadService.insertDownloadinfo(download);
		return "success";
	}
}
