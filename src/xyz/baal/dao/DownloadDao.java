package xyz.baal.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import xyz.baal.orm.Book;
import xyz.baal.orm.Download;
import xyz.baal.util.GetSqlSession;

public class DownloadDao {
	public static boolean insertDownloadinfo(Download download){
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			sqlSession.
				insert("xyz.baal.mybatis.downloadinfoMapper.insertDownloadinfo",
						download);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	public static boolean deleteDownloadinfoByUsid(int usid){
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			sqlSession.
				delete("xyz.baal.mybatis.downloadinfoMapper.deleteDownloadinfoByUsid",
						usid);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}	
	public static List<Download> getAllDownloadinfo(){
		List<Download> list = null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			list = sqlSession.
				selectList("xyz.baal.mybatis.downloadinfoMapper.getAllDownloadinfo");
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static int countDownloadinfoByBookid(int bookid){
		int count = 0;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			count = sqlSession.
				selectOne("xyz.baal.mybatis.downloadinfoMapper.countDownloadinfoByBookid", bookid);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public static List<Download> getDownloadinfoByusid(int usid){
		List<Download> list = null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			list = sqlSession.
				selectList("xyz.baal.mybatis.downloadinfoMapper.getDownloadinfoByusid", usid);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<Book> getBooksByDL(){
		List<Book> list= new ArrayList<Book>();
		List<Download> listdl = null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			listdl = sqlSession.
				selectList("xyz.baal.mybatis.downloadinfoMapper.getDownloadinfoByCount");
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (Download download : listdl) {
			Book book = new Book();
			book = BookDao.getBookinfoByBookid(download.getBookid());
			list.add(book);
		}
		return list;
	}
}