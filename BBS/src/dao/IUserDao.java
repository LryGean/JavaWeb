package dao;

import entity.User;

public interface IUserDao {
	public static final int FEMALE = 1;
	public static final int MALE = 2;
	public User findUser(String uName);
	public User findUser(int uId);
	public int addUser(User user);
	public int updateUser(User user);
}
