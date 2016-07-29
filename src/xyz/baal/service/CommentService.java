package xyz.baal.service;

import java.util.List;

import xyz.baal.dao.CommentDao;
import xyz.baal.orm.Book;
import xyz.baal.orm.Comment;
import xyz.baal.orm.CommentList;
/**
 *  评论服务类
 *
 */
public class CommentService {
	//插入一评论信息 返回布尔类型表示插入成功或失败
	public static boolean insertCommentinfo(Comment comment){
		return CommentDao.insertCommentinfo(comment);
	}
	//根据id删除评论信息 返回布尔类型表示删除成功或失败
	public static boolean deleteCommentById(int id){
		return CommentDao.deleteCommentById(id);
	}
	public static boolean deleteCommentByUsid(int usid){
		return CommentDao.deleteCommentByUsid(usid);
	}
	//获取所有评论信息 返回评论列表
	public static List<Comment> getAllCommentinfo(){
		return CommentDao.getAllCommentinfo();
	}
	//根据页码获取评论信息 返回评论列表
	public static List<Comment> getAllCommentinfoByPage(int page){
		return CommentDao.getAllCommentinfoByPage(page);
	}
	//根据bookid获取该书的评论信息 返回评论列表 
	public static List<Comment> getCommentinfoByBookid(int bookid){
		return CommentDao.getCommentinfoByBookid(bookid);
	}
	//根据用户id获取该用户的评论信息 返回评论列表
	public static List<Comment> getCommentinfoByUsid(int usid){
		return CommentDao.getCommentinfoByUsid(usid);
	}
	//获取评论最多的6本书  返回电子书列表
	public static List<Book> getBooksByCM(){
		return CommentDao.getBooksByCM();
	}
	//根据页码获取用户、电子书、评论的综合信息 返回信息列表
	public static List<CommentList> getComInfoByCM(int page){
		return CommentDao.getComInfoByCM(page);
	}
	//根据用户id获取用户、电子书、评论的综合信息 返回信息列表
	public static List<CommentList> getComInfoByUsid(int usid){
		return CommentDao.getComInfoByUsid(usid);
	}
	//根据电子书id获取用户、电子书、评论的综合信息 返回信息列表
	public static List<CommentList> getComInfoByBookid(int bookid){
		return CommentDao.getComInfoByBookid(bookid);
	}
}