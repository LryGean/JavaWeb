package dao;


import java.util.List;
import entity.Topic;

public interface ITopicDao {
	public Topic findTopic(int topicId);
	public List findListTopic(int page,int boardId);
	public int addTopic(Topic topic);
	public int deleteTopic(int topicId);
	public int updateTopic(Topic topic);
	public int findCountTopic(int boardId);
	
}
