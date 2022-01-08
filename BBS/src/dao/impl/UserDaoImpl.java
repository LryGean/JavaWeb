package dao.impl;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import dao.IUserDao;
import entity.User;

import java.util.Date;

public class UserDaoImpl extends BaseDao implements IUserDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public User findUser(String uName) {
		
		try{
			conn=this.getConn();
			//创建Statement对象
			String sql="select * from TBL_USER where uName=?";
			pstmt = conn.prepareStatement(sql);
			//补全sql语句
			pstmt.setString(1, uName);
			//执行查询
			rs=pstmt.executeQuery();
			if(rs.next()){
				User user = new User();
				user.setUserId(rs.getInt("uId"));
				user.setUserName(rs.getString("uName"));
				user.setUserPass(rs.getString("uPass"));
				user.setMailbox(rs.getString("mailbox"));
				user.setTel(rs.getString("tel"));
				user.setGender(rs.getInt("gender"));
				user.setHobby(rs.getString("hobby"));
				user.setHead(rs.getString("head"));
				user.setRegTime(rs.getDate("regTime"));
				user.setCity(rs.getString("city"));
				user.setSelfI(rs.getString("selfI"));
				return user;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace(); // 处理ClassNotFoundException异常
		} catch (SQLException e) {
			e.printStackTrace(); // 处理SQLException异常
		} finally{
			this.closeAll(conn,pstmt,rs);
		}
		return null;
	}

	public User findUser(int uId) {
		
		try{
			conn=this.getConn();
			//创建Statement对象
			String sql="select * from TBL_USER where uId=?";
			pstmt = conn.prepareStatement(sql);
			//补全sql语句
			pstmt.setInt(1,uId);
			//执行查询
			rs=pstmt.executeQuery();
			if(rs.next()){
				User user = new User();
				user.setUserId(rs.getInt("uId"));
				user.setUserName(rs.getString("uName"));
				user.setUserPass(rs.getString("uPass"));
				user.setMailbox(rs.getString("mailbox"));
				user.setTel(rs.getString("tel"));
				user.setGender(rs.getInt("gender"));
				user.setHobby(rs.getString("hobby"));
				user.setHead(rs.getString("head"));
				user.setRegTime(rs.getDate("regTime"));
				user.setCity(rs.getString("city"));
				user.setSelfI(rs.getString("selfI"));
				return user;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace(); // 处理ClassNotFoundException异常
		} catch (SQLException e) {
			e.printStackTrace(); // 处理SQLException异常
		} finally{
			this.closeAll(conn,pstmt,rs);
		}
		return null;	
	}


	public int addUser(User user) {
		String sql = "insert into TBL_USER(uName,uPass,mailbox,tel,gender,hobby,city,selfI,regTime,head) values(?,?,?,?," + user.getGender() + ",?,?,?,?,?)";
		String time = new SimpleDateFormat("yyyy - MM - dd HH:mm:ss").format(new Date());
		String[] parm = {user.getUserName(),user.getUserPass(),user.getMailbox(),user.getTel(),String.valueOf(user.getHobby()),String.valueOf(user.getCity()),String.valueOf(user.getSelfI()),time,String.valueOf(user.getHead())};
		return this.executeSQL(sql, parm);
	}

	public int updateUser(User user) {
		String sql = "update TBL_USER set uPass = ? where uName = ?";
		String[] parm = {user.getUserPass(),user.getUserName()};
		return this.executeSQL(sql, parm);
	}
	
}
