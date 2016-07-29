package xyz.baal.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import xyz.baal.orm.Book;
import xyz.baal.util.GetSqlSession;

public class BookDao {
	public static boolean insertBook(Book book){
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			sqlSession.
				insert("xyz.baal.mybatis.bookinfoMapper.insertBookinfo", book);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	public static boolean updateBookinfo(Book book){
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			sqlSession.
				update("xyz.baal.mybatis.bookinfoMapper.updateBookinfo", book);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	public static boolean deleteBookinfoByBookid(int bookid){
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			sqlSession.
			delete("xyz.baal.mybatis.bookinfoMapper.deleteBookinfoByBookid", bookid);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}	
	public static List<Book> getAllBooks(){
		List<Book> list=null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			list = sqlSession.
					selectList("xyz.baal.mybatis.bookinfoMapper.getAllBookinfo");
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return list;
	}
	public static List<Book> getAllBooksByPage(int page){
		List<Book> list=null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			list = sqlSession.
			selectList("xyz.baal.mybatis.bookinfoMapper.getAllBookinfo",
					null,new RowBounds(page*7,7));
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return list;
	}	
	public static List<Book> getBookinfoByType(String type){
		List<Book> list=null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			list = sqlSession.
					selectList("xyz.baal.mybatis.bookinfoMapper.getBookinfoByType",type);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return list;
	}	
	public static List<Book> getBookinfoByName(String bookname){
		List<Book> list=null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			list = sqlSession.
					selectList("xyz.baal.mybatis.bookinfoMapper.getBookinfoByName",bookname);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return list;
	}
	public static Book getBookinfoByBookid(int bookid){
		Book book=null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			book = sqlSession.
					selectOne("xyz.baal.mybatis.bookinfoMapper.getBookinfoByBookid",bookid);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return book;
	}
	public static List<Book> getBookinfoByKey(String key){
		List<Book> list=null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			list = sqlSession.
					selectList("xyz.baal.mybatis.bookinfoMapper.getBookinfoByKey",key);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return list;
	}	
}
