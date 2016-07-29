package xyz.baal.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import xyz.baal.orm.Applaud;
import xyz.baal.orm.Book;
import xyz.baal.util.GetSqlSession;
/**
 * 点赞
 *
 */
public class ApplaudDao {
	public static boolean insertApplaudinfo(Applaud applaud){
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			sqlSession.
				insert("xyz.baal.mybatis.applaudinfoMapper.insertApplaudinfo",
						applaud);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	public static boolean deleteApplaudinfo(int usid){
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			sqlSession.
				delete("xyz.baal.mybatis.applaudinfoMapper.deleteApplaudinfoByUsid",
						usid);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}	
	public static List<Applaud> getAllApplaudinfo(){
		List<Applaud> list = null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			list = sqlSession.
				selectList("xyz.baal.mybatis.applaudinfoMapper.getAllApplaudinfo");
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static int countApplaudinfoByBookid(int bookid){
		int count = 0;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			count = sqlSession.
				selectOne("xyz.baal.mybatis.applaudinfoMapper.countApplaudinfoByBookid", bookid);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public static List<Applaud> getApplaudinfoByUsid(int usid){
		List<Applaud> list = null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			list = sqlSession.
				selectList("xyz.baal.mybatis.applaudinfoMapper.getApplaudinfoByUsid", usid);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * 获取赞数最高的6本书
	 * @return
	 */
	public static List<Book> getBooksByAP(){
		List<Book> list= new ArrayList<Book>();
		List<Applaud> listap = null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			listap = sqlSession.
				selectList("xyz.baal.mybatis.applaudinfoMapper.getApplaudinfoByCount");
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (Applaud applaud : listap) {
			Book book = new Book();
			book = BookDao.getBookinfoByBookid(applaud.getBookid());
			list.add(book);
		}
		return list;
	}	
}
