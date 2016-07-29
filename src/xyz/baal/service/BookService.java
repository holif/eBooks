package xyz.baal.service;

import java.util.List;

import xyz.baal.dao.BookDao;
import xyz.baal.orm.Book;
/**
 * 电子书服务类
 *
 */
public class BookService {
	//插入一条电子书记录 返回布尔类型表示插入成功或失败
	public static boolean insertBook(Book book){
		return BookDao.insertBook(book);
	}
	//更新电子书信息 返回布尔类型表示更新成功或失败
	public static boolean updateBookinfo(Book book){
		return BookDao.updateBookinfo(book);
	}
	//根据bookid删除电子书信息 返回布尔类型表示删除成功或失败
	public static boolean deleteBookinfoByBookid(int bookid){
		return BookDao.deleteBookinfoByBookid(bookid);
	}
	//获取所有电子书信息  返回电子书列表
	public static List<Book> getAllBooks(){
		return BookDao.getAllBooks();
	}
	//根据页码获取电子书信息  返回电子书列表
	public static List<Book> getAllBooksByPage(int page){
		return BookDao.getAllBooksByPage(page);
	}
	//根据类别获取电子书信息  返回电子书列表
	public static List<Book> getBookinfoByType(String type){
		return BookDao.getBookinfoByType(type);
	}
	//根据书名获取电子书信息  返回电子书列表
	public static List<Book> getBookinfoByName(String bookname){
		return BookDao.getBookinfoByName(bookname);
	}
	//根据bookid获取电子书信息  返回Book对象
	public static Book getBookinfoByBookid(int bookid){
		return BookDao.getBookinfoByBookid(bookid);
	}
	//根据关键字获取电子书信息  返回电子书列表
	public static List<Book> getBookinfoByKey(String key){
		return BookDao.getBookinfoByKey(key);
	}
}
