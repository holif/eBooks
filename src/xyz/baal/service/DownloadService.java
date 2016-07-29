package xyz.baal.service;

import java.util.List;

import xyz.baal.dao.DownloadDao;
import xyz.baal.orm.Book;
import xyz.baal.orm.Download;
/**
 *  下载服务类
 *
 */
public class DownloadService {
	//插入下载信息 返回布尔类型表示插入成功或失败
	public static boolean insertDownloadinfo(Download download){
		return DownloadDao.insertDownloadinfo(download);
	}
	public static boolean deleteDownloadinfoByUsid(int usid){
		return DownloadDao.deleteDownloadinfoByUsid(usid);
	}
	//获取全部下载信息 返回下载列表
	public static List<Download> getAllDownloadinfo(){
		return DownloadDao.getAllDownloadinfo();
	}
	//根据电子书id统计该书的下载量 返回下载数
	public static int countDownloadinfoByBookid(int bookid){
		return DownloadDao.countDownloadinfoByBookid(bookid);
	}
	//根据用户id获取该用户的下载信息 返回下载列表
	public static List<Download> getDownloadinfoByusid(int usid){
		return DownloadDao.getDownloadinfoByusid(usid);
	}
	//获取下载量最高的6本书 返回电子书列表
	public static List<Book> getBooksByDL(){
		return DownloadDao.getBooksByDL();
	}
}
