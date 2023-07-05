package kybmig.ssm.service;


import kybmig.ssm.Utility;
import kybmig.ssm.mapper.TopicCommentMapper;
import kybmig.ssm.mapper.TopicMapper;
import kybmig.ssm.model.TopicCommentModel;
import kybmig.ssm.model.TopicModel;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TopicService {
    private TopicMapper mapper;
    private TopicCommentMapper commentMapper;
    
    public TopicService(TopicMapper topicMapper, TopicCommentMapper commentMapper) {
        this.mapper = topicMapper;
        this.commentMapper = commentMapper;
    }
    
    public TopicModel add(Integer boardId,Integer userId ,String title, String content) {
        Long unixTime = System.currentTimeMillis() / 1000L;
        int createdTime = unixTime.intValue();
        TopicModel m = new TopicModel();
        m.setBoardId(boardId);
        m.setTitle(title);
        m.setContent(content);
        m.setUserId(userId);
        m.setCreatedTime(createdTime);
        m.setUpdatedTime(createdTime);
        mapper.insert(m);
        return m;
    }
    
    public  void update(Integer id, String title, String content) {
        Long unixTime = System.currentTimeMillis() / 1000L;
        int updatedTime = unixTime.intValue();
        TopicModel m = new TopicModel();
        m.setId(id);
        m.setContent(content);
        m.setTitle(title);
        m.setUpdatedTime(updatedTime);
        mapper.update(m);
    }
    
    public void delete(Integer id) {
        mapper.delete(id);
    }

    public  TopicModel findById(Integer id) {
        return mapper.selectOne(id);
    }

    public  List<TopicModel> findByUserId(Integer id) {
        return  mapper.selectOneWithCommentsAndUserByUserId(id);
    }

    public  TopicModel findByIdWithComments(Integer id) {
        return mapper.selectOneWithComments(id);
    }

    public  TopicModel findByIdWithCommentsAndUser(Integer id) {
        return mapper.selectOneWithCommentsAndUser(id);
    }


    public  List<TopicModel> all() {
        return mapper.selectAll();
    }

    public  List<TopicModel> all2() {
        return mapper.selectAll2();
    }

    public  List<TopicModel> allByBoard(Integer id) {
        return mapper.selectAllByBoard(id);
    }

    public List<TopicCommentModel> findCommentsById(Integer id) {
        return this.commentMapper.selectAllByTopicId(id);
    }
}
