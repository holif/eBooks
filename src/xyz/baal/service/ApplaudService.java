package xyz.baal.service;

import java.util.List;

import xyz.baal.dao.ApplaudDao;
import xyz.baal.orm.Applaud;
import xyz.baal.orm.Book;
/**
 * 	点赞服务类
 */
public class ApplaudService {
	//插入一条点赞信息 返回布尔类型表示插入成功或失败
	public static boolean insertApplaudinfo(Applaud applaud){
		return ApplaudDao.insertApplaudinfo(applaud);
	}
	//获取所有点赞信息 返回点赞列表
	public static List<Applaud> getAllApplaudinfo(){
		return ApplaudDao.getAllApplaudinfo();
	}
	//根据图书id统计此书的点赞数量 返回点赞数
	public static int countApplaudinfoByBookid(int bookid){
		return ApplaudDao.countApplaudinfoByBookid(bookid);
	}
	//根据用户id获取点赞信息 返回点赞列表
	public static List<Applaud> getApplaudinfoByUsid(int usid){
		return ApplaudDao.getApplaudinfoByUsid(usid);
	}
	//获取点赞数最高的6本书 返回电子书列表
	public static List<Book> getBooksByAP(){
		return ApplaudDao.getBooksByAP();
	}
	public static boolean deleteApplaudinfo(int usid){
		return ApplaudDao.deleteApplaudinfo(usid);
	}
}
