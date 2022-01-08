package dao;

import java.util.Map;

import entity.Board;

public interface IBoardDao {
	public Map findBoard();
	public Board findBoard(int boardId);
}
