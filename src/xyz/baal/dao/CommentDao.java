package xyz.baal.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import xyz.baal.orm.Book;
import xyz.baal.orm.Comment;
import xyz.baal.orm.CommentList;
import xyz.baal.util.GetSqlSession;

public class CommentDao {
	public static boolean insertCommentinfo(Comment comment){
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			sqlSession.
				insert("xyz.baal.mybatis.commentinfoMapper.insertCommentinfo", comment);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	public static boolean deleteCommentById(int id){
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			sqlSession.
			delete("xyz.baal.mybatis.commentinfoMapper.deleteCommentById", id);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	public static boolean deleteCommentByUsid(int usid){
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			sqlSession.
			delete("xyz.baal.mybatis.commentinfoMapper.deleteCommentByUsid", usid);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}	
	public static List<Comment> getAllCommentinfo(){
		List<Comment> list = null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			list=sqlSession.
				selectList("xyz.baal.mybatis.commentinfoMapper.getAllCommentinfo");
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<Comment> getAllCommentinfoByPage(int page){
		List<Comment> list = null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			list=sqlSession.
				selectList("xyz.baal.mybatis.commentinfoMapper.getAllCommentinfo",
						null,new RowBounds(page*7,7));
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}	
	public static List<Comment> getCommentinfoByBookid(int bookid){
		List<Comment> list = null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			list=sqlSession.
			selectList("xyz.baal.mybatis.commentinfoMapper.getCommentinfoByBookid",bookid);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<Comment> getCommentinfoByUsid(int usid){
		List<Comment> list = null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			list=sqlSession.
			selectList("xyz.baal.mybatis.commentinfoMapper.getCommentinfoByUsid",usid);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<Book> getBooksByCM(){
		List<Book> list= new ArrayList<Book>();
		List<Comment> listcm = null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			listcm = sqlSession.
				selectList("xyz.baal.mybatis.commentinfoMapper.getCommentinfoByCount");
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (Comment comment : listcm) {
			Book book = new Book();
			book = BookDao.getBookinfoByBookid(comment.getBookid());
			list.add(book);
		}
		return list;
	}
	public static List<CommentList> getComInfoByCM(int page){
		List<Comment> listcom = CommentDao.getAllCommentinfoByPage(page);
		List<CommentList> ll = new ArrayList<CommentList>();
		for (Comment comment : listcom) {
			CommentList commentList = new CommentList();
			commentList.setId(comment.getId());
			commentList.setUsername(UserDao
					.getUserinfoByUsid(comment.getUsid()).getUsername());
			commentList.setBookname(BookDao.getBookinfoByBookid(
					comment.getBookid()).getBookname());
			commentList.setContent(comment.getContent());
			commentList.setTime(comment.getTime());
			ll.add(commentList);
		}
		return ll;
	}
	public static List<CommentList> getComInfoByUsid(int usid){
		List<Comment> listcom = CommentDao.getCommentinfoByUsid(usid);
		List<CommentList> ll = new ArrayList<CommentList>();
		for (Comment comment : listcom) {
			CommentList commentList = new CommentList();
			commentList.setId(comment.getId());
			commentList.setUsername(UserDao
					.getUserinfoByUsid(comment.getUsid()).getUsername());
			commentList.setBookname(BookDao.getBookinfoByBookid(
					comment.getBookid()).getBookname());
			commentList.setContent(comment.getContent());
			commentList.setTime(comment.getTime());
			ll.add(commentList);
		}
		return ll;
	}	
	public static List<CommentList> getComInfoByBookid(int bookid){
		List<Comment> listcom = getCommentinfoByBookid(bookid);
		List<CommentList> ll = new ArrayList<CommentList>();
		for (Comment comment : listcom) {
			CommentList commentList = new CommentList();
			commentList.setId(comment.getId());
			commentList.setUsername(UserDao
					.getUserinfoByUsid(comment.getUsid()).getUsername());
			commentList.setBookname(BookDao.getBookinfoByBookid(
					comment.getBookid()).getBookname());
			commentList.setContent(comment.getContent());
			commentList.setTime(comment.getTime());
			ll.add(commentList);
		}
		return ll;
	}	
}
