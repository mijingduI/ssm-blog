package kybmig.ssm.model;

import java.util.ArrayList;

public class TopicModel extends BaseModel {
    private Integer id;
    private String title;
    private String content;
    private Integer userId;



    private Integer createdTime;
    private Integer updatedTime;

    private ArrayList<TopicCommentModel> commentList;

    private Integer boardId;


    public Integer getBoardId() { return boardId; }

    public void setBoardId(Integer boardId) { this.boardId = boardId; }


    public Integer getCreatedTime() { return createdTime; }

    public void setCreatedTime(Integer createdTime) { this.createdTime = createdTime; }

    public Integer getUpdatedTime() { return updatedTime; }

    public void setUpdatedTime(Integer updatedTime) { this.updatedTime = updatedTime; }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public ArrayList<TopicCommentModel> getCommentList() {
        return commentList;
    }

    public void setCommentList(ArrayList<TopicCommentModel> commentList) {
        this.commentList = commentList;
    }
}
