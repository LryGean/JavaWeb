package dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import dao.ITopicDao;
import entity.Topic;

public class TopicDaoImpl extends BaseDao implements ITopicDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public Topic findTopic(int topicId) {
		String sql="select * from TBL_TOPIC where topicId=?";
		Topic topic = new Topic();
		try {
			conn=this.getConn();
			//����Statement����
			
			pstmt = conn.prepareStatement(sql);
			//��ȫsql���
			pstmt.setInt(1, topicId);
			//ִ�в�ѯ
			rs=pstmt.executeQuery();
			if(rs.next()) {
				topic.setTopicId(rs.getInt("topicId"));
				topic.setTitle(rs.getString("title"));
				topic.setContent(rs.getString("content"));
				topic.setPublishTime(rs.getDate("publishTime"));
				topic.setModifyTime(rs.getDate("modifyTime"));
				topic.setUserId(rs.getInt("uId"));
				topic.setBoardId(rs.getInt("boardId"));
				return topic;
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			this.closeAll(conn,pstmt,rs);
		}
		return null;	
	}
	@Override
	public List findListTopic(int page, int boardId) {
		
		List list = new ArrayList();
		int rowBegin = 1;
		if(page>1){
			rowBegin = 20 * (page -1);
		}
		String sql = "select top 20 * from TBL_TOPIC where boardId = " + boardId
					+ "and topicId not in (select top 0 topicId from TBL_TOPIC where boardId= " + boardId
					+ "order by publishTime desc ) order by publishTime desc";
		try{
			conn = this.getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Topic topic = new Topic();
				topic.setTopicId(rs.getInt("topicId"));
				topic.setTitle(rs.getString("title"));
				topic.setPublishTime(rs.getDate("publishTime"));
				topic.setUserId(rs.getInt("uId"));
				list.add(topic);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(conn, pstmt, rs);
		}
		return list;
	}
	
	public int addTopic(Topic topic) {
		String sql ="insert into TBL_TOPIC(title,content,publishTime,modifyTime,uId,boardId) values(?,?,?,?," + topic.getUserId()+ "," + topic.getBoardId() + ")";
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
		String[] parm = {topic.getTitle(),topic.getContent(),time,time};
		return this.executeSQL(sql,parm);
	}
	
	@Override
	public int deleteTopic(int topicId) {
		String sql = "delete from TBL_TOPIC where topicId=?";
		try{
			conn=this.getConn();
			//����Statement����
			pstmt = conn.prepareStatement(sql);
			//��ȫsql���
			pstmt.setInt(1, topicId);
			//ִ��sql���
			rs=pstmt.executeQuery();
			if(rs.next()) {
				Topic topic = new Topic();
				topic.setTopicId(rs.getInt("topicId"));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			this.closeAll(conn,pstmt,rs);
		}
		return 1;
	}
	@Override
	public int updateTopic(Topic topic) {
		String sql = "update TBL_TOPIC set content = ? wherer title = ?";
		String[] parm = {topic.getContent(),topic.getTitle()};
		try{
			conn=this.getConn();
			//����Statement����
			pstmt = conn.prepareStatement(sql);
			//ִ��sql���
			rs=pstmt.executeQuery();
			if(rs.next()) {
				topic.setContent(rs.getString("content"));
				topic.setTitle(rs.getString("title"));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			this.closeAll(conn,pstmt,rs);
		}
		return this.executeSQL(sql, parm);
	}
	@Override
	public int findCountTopic(int boardId) {
		String sql = "select * from TBL_TOPIC where boardId=?";
		int num = 0;

		/* ����SQL,ִ��SQL */
		try {
			conn = this.getConn(); // �õ����ݿ�����
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardId);
			rs = pstmt.executeQuery(); // ִ��SQL���
			while(rs.next()) {
				Topic topic = new Topic();
				topic.setTopicId(rs.getInt("topicId"));
				num=num+1;
				return num;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace(); // ����ClassNotFoundException�쳣
		} catch (SQLException e) {
			e.printStackTrace(); // ����SQLException�쳣
		} finally {
			this.closeAll(conn, pstmt, null); // �ͷ���Դ
		}
		return 0;
	}
}
