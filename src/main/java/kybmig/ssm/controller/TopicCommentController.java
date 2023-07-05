package kybmig.ssm.controller;

import kybmig.ssm.Utility;
import kybmig.ssm.model.TopicCommentModel;
import kybmig.ssm.model.TopicModel;
import kybmig.ssm.model.UserModel;
import kybmig.ssm.service.TopicCommentService;
import kybmig.ssm.service.TopicService;
import kybmig.ssm.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Controller
public class TopicCommentController {
    private HashMap<Integer, String> tokenMap;

    private TopicService topicService;
    private UserService userService;
    private TopicCommentService topicCommentService;
//    private TodoService todoService = new TodoService();

    public TopicCommentController(TopicService topicService, UserService userService, TopicCommentService topicCommentService) {
        this.topicService = topicService;
        this.userService = userService;
        this.topicCommentService = topicCommentService;
        this.tokenMap = new HashMap<>();
    }

    @PostMapping("/detail/{id}/add")
    public ModelAndView add(@PathVariable Integer id, String content, HttpServletRequest request) {
//        title = title.replace(">", "&gt");
//        title = title.replace("<", "&lt");
        Utility.log("content: %s", content);
        Integer topicId = id;
        UserModel current = userService.currentUser(request);
        TopicCommentModel topicComment = topicCommentService.add(content, current.getId(), topicId);
        Utility.log("topicId add id %s", topicId);
        return new ModelAndView("redirect:/topic/detail/{id}");
    }




    @GetMapping("/detail/edit")
    public ModelAndView edit(int id) {
        TopicCommentModel topicComment = topicCommentService.findById(id);
        ModelAndView m = new ModelAndView("topic/comment_edit");
        m.addObject("topicComment", topicComment);
        return m;
    }
    //
    @PostMapping("/detail/update")
    public ModelAndView updateMapper(int id, String content) {
        topicCommentService.update(id, content);
        return new ModelAndView("redirect:/topic");
    }

    @GetMapping("/detail/delete")
    public ModelAndView deleteMapper(int id) {
            topicCommentService.delete(id);
        Utility.log("被删除的评论 id： %s", id);
            return new ModelAndView("redirect:/topic");

    }




}
