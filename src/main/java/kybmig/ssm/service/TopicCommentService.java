package kybmig.ssm.service;


import kybmig.ssm.mapper.TopicCommentMapper;
import kybmig.ssm.mapper.TopicMapper;
import kybmig.ssm.model.TopicCommentModel;
import kybmig.ssm.model.TopicModel;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TopicCommentService {
    private TopicMapper mapper;
    private TopicCommentMapper commentMapper;

    public TopicCommentService(TopicMapper topicMapper, TopicCommentMapper commentMapper) {
        this.mapper = topicMapper;
        this.commentMapper = commentMapper;
    }
    
    public TopicCommentModel add(String content, Integer userId, Integer topicId) {
        Long unixTime = System.currentTimeMillis() / 1000L;
        int createdTime = unixTime.intValue();
        TopicCommentModel m = new TopicCommentModel();
        m.setContent(content);
        m.setUserId(userId);
        m.setTopicId(topicId);
        m.setCreatedTime(createdTime);
        m.setUpdatedTime(createdTime);
        commentMapper.insert(m);
        return m;
    }
    
    public  void update(Integer id, String content) {
        Long unixTime = System.currentTimeMillis() / 1000L;
        int updatedTime = unixTime.intValue();
        TopicCommentModel m = new TopicCommentModel();
        m.setId(id);
        m.setContent(content);
        m.setUpdatedTime(updatedTime);
        commentMapper.update(m);
    }
    
    public void delete(Integer id) {
        commentMapper.delete(id);
    }

    public  TopicCommentModel findById(Integer id) {
        return commentMapper.selectOne(id);
    }


    public  List<TopicCommentModel> all() {
        return commentMapper.selectAll();
    }

    public List<TopicCommentModel> findCommentsById(Integer id) {
        return this.commentMapper.selectAllByTopicId(id);
    }
}
