package xyz.baal.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import xyz.baal.orm.User;
import xyz.baal.util.GetSqlSession;

public class UserDao {
	public static boolean insertUserinfo(User user){
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			sqlSession.
				insert("xyz.baal.mybatis.userinfoMapper.insertUserinfo", user);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	public static boolean deleteUserinfoByUsid(int usid){
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			sqlSession.
			delete("xyz.baal.mybatis.userinfoMapper.deleteUserinfoByUsid", usid);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	public static boolean updatePassowordByUsid(User user){
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			sqlSession.
			update("xyz.baal.mybatis.userinfoMapper.updatePassowordByUsid", user);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}	
	public static List<User> getAllUserinfo(){
		List<User> list = null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			list=sqlSession.
				selectList("xyz.baal.mybatis.userinfoMapper.getAllUserinfo");
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<User> getAllUserinfoByPage(int page){
		List<User> list = null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			list=sqlSession.
				selectList("xyz.baal.mybatis.userinfoMapper.getAllUserinfo",
						null,new RowBounds(page*7,7));
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}	
	public static List<User> getUserinfoByKey(String key){
		List<User> list = null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			list=sqlSession.
				selectList("xyz.baal.mybatis.userinfoMapper.getUserinfoByKey",key);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}	
	public static User getUserinfoByUsername(String username){
		User user = null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			user=sqlSession.
			selectOne("xyz.baal.mybatis.userinfoMapper.getUserinfoByUsername",username);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	public static User getUserinfoByUsid(int usid){
		User user = null;
		try {
			SqlSession sqlSession = GetSqlSession.getSqlSession();
			user=sqlSession.
			selectOne("xyz.baal.mybatis.userinfoMapper.getUserinfoByUsid",usid);
			sqlSession.commit();
			sqlSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}	
}
