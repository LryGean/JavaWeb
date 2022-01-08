package dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import dao.IReplyDao;
import entity.Reply;
import entity.Topic;

public class ReplyDaoImpl extends BaseDao implements IReplyDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	@Override
	public Reply findReply(int replyId) {
		
		Reply reply = new Reply();
		
		try {
			conn=this.getConn();
			//创建Statement对象
			String sql="select * from TBL_REPLY where replyId=?";
			pstmt = conn.prepareStatement(sql);
			//补全sql语句
			pstmt.setInt(1, replyId);
			//执行查询
			rs=pstmt.executeQuery();
			if(rs.next()) {
				reply.setReplyId(rs.getInt("replyId"));
				reply.setTitle(rs.getString("title"));
				reply.setContent(rs.getString("content"));
				reply.setPublishTime(rs.getDate("publishTime"));
				reply.setModifyTime(rs.getDate("modifyTime"));
				reply.setUserId(rs.getInt("uId"));
				reply.setTopicId(rs.getInt("topicId"));
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			this.closeAll(conn,pstmt,rs);
		}
		return reply;	
	}

	public int addReply(Reply reply) {
		String sql = "insert into TBL_REPLY(title,content,publishTime,modifyTime,uId,topicId) values(?,?,?,?," + reply.getUserId() + "," + reply.getTopicId() + ")";
		String time = new SimpleDateFormat("yyyy - MM - dd HH:mm:ss").format(new Date());
		String[] parm = {reply.getTitle(),reply.getContent(),time,time};
		return this.executeSQL(sql, parm);
	}

	public int deleteReply(int replyId) {
		String sql = "delete from TBL_REPLY where topicId = " + replyId;
		try {
			conn=this.getConn();
			//创建Statement对象
			pstmt = conn.prepareStatement(sql);
			//执行sql语句
			rs=pstmt.executeQuery();
			if(rs.next()) {
				Reply reply = new Reply();
				reply.setReplyId(rs.getInt("replyId"));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			this.closeAll(conn,pstmt,rs);
		}
		return 1;
	}
	@Override
	public int updateReply(Reply reply) {
		String sql = "update TBL_REPLY set content = ? wherer title = ?";
		String[] parm = {reply.getContent(),reply.getTitle()};
		try{
			conn=this.getConn();
			//创建Statement对象
			pstmt = conn.prepareStatement(sql);
			//执行sql语句
			rs=pstmt.executeQuery();
			if(rs.next()) {
				reply.setContent(rs.getString("content"));
				reply.setTitle(rs.getString("title"));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			this.closeAll(conn,pstmt,rs);
		}
		return this.executeSQL(sql, parm);
	}
	@Override
	public List findListReply(int page, int topicId) {
		
		List list = new ArrayList();
		//开始行数
		int rowBegin = 0;
		if(page>1){
			rowBegin = 20 * (page -1);
		}
		String sql = "select top 20 * from TBL_REPLY where topicId = " + topicId
				+ "and replyId not in (select top " + rowBegin
				+ "replyId from TBL_REPLY where topicId= " + topicId
				+ "order by publishTime desc ) order by publishTime desc";
		
		try{
			conn = this.getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Reply reply = new Reply();
				reply.setReplyId(rs.getInt("replyId"));
				reply.setTitle(rs.getString("title"));
				reply.setPublishTime(rs.getDate("publishTime"));
				reply.setContent(rs.getString("content"));
				reply.setUserId(rs.getInt("uId"));
				list.add(reply);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(conn, pstmt, rs);
		}
		return list;
	}
	@Override
	public int findCountReply(int topicId) {
		String sql = "select * from TBL_REPLY where topicId=?";
		int num = 0;

		/* 处理SQL,执行SQL */
		try {
			conn = this.getConn(); // 得到数据库连接
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, topicId);
			rs = pstmt.executeQuery(); // 执行SQL语句
			while(rs.next()) {
				Reply reply = new Reply();
				reply.setTopicId(rs.getInt("topicId"));
				num=num+1;
				return num;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace(); // 处理ClassNotFoundException异常
		} catch (SQLException e) {
			e.printStackTrace(); // 处理SQLException异常
		} finally {
			this.closeAll(conn, pstmt, null); // 释放资源
		}
		return num;
	}
}
