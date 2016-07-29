package xyz.baal.service;

import java.util.List;

import xyz.baal.dao.UserDao;
import xyz.baal.orm.User;
/**
 * 用户服务类
 *
 */
public class UserService {
	//插入用户信息 返回布尔类型表示插入成功或失败
	public static boolean insertUserinfo(User user){
		return UserDao.insertUserinfo(user);
	}
	//根据用户id删除用户信息 返回布尔类型表示删除成功或失败
	public static boolean deleteUserinfoByUsid(int usid){
		return UserDao.deleteUserinfoByUsid(usid);
	}
	//更新用户信息 返回布尔类型表示更新成功或失败
	public static boolean updatePassowordByUsid(User user){
		return UserDao.updatePassowordByUsid(user);
	}
	//获取全部用户信息 返回用户列表
	public static List<User> getAllUserinfo(){
		return UserDao.getAllUserinfo();
	}
	//根据页码获取用户信息 返回用户列表
	public static List<User> getAllUserinfoByPage(int page){
		return UserDao.getAllUserinfoByPage(page);
	}
	//根据关键字搜索用户信息 返回用户列表
	public static List<User> getUserinfoByKey(String key){
		return UserDao.getUserinfoByKey(key);
	}
	//根据用户名获取用户信息 返回用户对象
	public static User getUserinfoByUsername(String username){
		return UserDao.getUserinfoByUsername(username);
	}
	//根据用户id获取用户信息 返回用户对象
	public static User getUserinfoByUsid(int usid){
		return UserDao.getUserinfoByUsid(usid);
	}
}
