package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.IBoardDao;
import entity.Board;
import entity.Topic;

public class BoardDaoImpl extends BaseDao implements IBoardDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private HashMap map = new HashMap();
	private int parentId = 0;
	private List sonList = null;
	
	
	@Override
	public Map findBoard() {
		
		String sql = "select  * from TBL_BOARD order by parentId,boardId";
		try {
			conn = this.getConn();
			pstmt = conn.prepareStatement(sql);
			rs =pstmt.executeQuery();
			sonList = new ArrayList();
			
			while(rs.next()) {
				if (parentId != rs.getInt("parentId")) {
					map.put(new Integer(parentId),sonList);
					
					sonList = new ArrayList();
					
					parentId = rs.getInt("parentId");
				}
				Board board = new Board();
				board.setBoardId(rs.getInt("boardId"));
				board.setBoardName(rs.getString("boardName"));
				sonList.add(board);
			}
			map.put(new Integer(parentId),sonList);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeAll(conn,pstmt,rs);
		}
		return map;
	}
	
	//���ݰ��id���Ұ��
	public Board findBoard(int boardId) {
		try {
			conn=this.getConn();
			//����Statement����
			String sql="select * from TBL_BOARD where boardId=?";
			pstmt = conn.prepareStatement(sql);
			//��ȫsql���
			pstmt.setInt(1, boardId);
			//ִ�в�ѯ
			rs=pstmt.executeQuery();
			if(rs.next()) {
				Board board = new Board();
				board.setBoardId(rs.getInt("boardId"));
				board.setBoardName(rs.getString("boardName"));
				board.setParentId(rs.getInt("parentId"));
				return board;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace(); // ����ClassNotFoundException�쳣
		} catch (SQLException e) {
			e.printStackTrace(); // ����SQLException�쳣
		} finally{
			this.closeAll(conn,pstmt,rs);
		}
		return null;	
	}
}
