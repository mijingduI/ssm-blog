package kybmig.ssm.controller;

import com.mysql.cj.exceptions.StreamingNotifiable;
import kybmig.ssm.Utility;
import kybmig.ssm.model.TodoModel;
import kybmig.ssm.model.TopicCommentModel;
import kybmig.ssm.model.TopicModel;
import kybmig.ssm.model.UserModel;
import kybmig.ssm.service.TodoService;
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
public class TopicController {
    private HashMap<Integer, String> tokenMap;

    private TopicService topicService;
    private UserService userService;
//    private TodoService todoService = new TodoService();

    public TopicController(TopicService topicService, UserService userService) {
        this.topicService = topicService;
        this.userService = userService;
        this.tokenMap = new HashMap<>();
    }

    @PostMapping("/topic/add")
    public ModelAndView add(Integer boardId,String title, String content, HttpServletRequest request) {

        Utility.log("content: %s", content);
        UserModel current = userService.currentUser(request);
        TopicModel topic = topicService.add(boardId,current.getId(), title, content);


        return new ModelAndView("redirect:/topic/detail/" + topic.getId());

    }

    @GetMapping("/topic/detail/{id}")
    // 从 HttpServletRequest 里面取参数
    public ModelAndView detail(@PathVariable Integer id) {
        TopicModel topic = topicService.findByIdWithCommentsAndUser(id);

        TopicModel topicone = topicService.findById(id);
        UserModel user = userService.findById(topicone.getUserId());
        Utility.log("user  is: %s", user);
        Utility.log("username  is: %s", user.getUsername());
        Utility.log("topic: %s", topic);
        Utility.log("topic comments: %s", topic.getCommentList());
        List<TopicCommentModel> comments = topicService.findCommentsById(topic.getId());

        // model 说的是给模板引擎的 model
        // view 说的是模板名字，没有后缀
        // view 可以自动补全，也可以直接跳转
        ModelAndView mv = new ModelAndView("topic/detail");
        mv.addObject("topic", topic);
        mv.addObject("comments", comments);
        mv.addObject("user", user);

        return mv;
    }
//
    @GetMapping("/topic/delete")
    public ModelAndView deleteMapper(int id, HttpServletRequest request) {
        UserModel current = userService.currentUser(request);
        String userToken = tokenMap.getOrDefault(current.getId(), "");
        String token = request.getParameter("token");

        if (userToken.equals(token)) {
            topicService.delete(id);
            return new ModelAndView("redirect:/topic");
        } else {
            return new ModelAndView("redirect:/login");
        }


    }
//
    @GetMapping("/topic/edit")
    public ModelAndView edit(int id) {
        TopicModel topic = topicService.findById(id);
        ModelAndView m = new ModelAndView("topic/topic_edit");
        m.addObject("topic", topic);
        return m;
    }
//
    @PostMapping("/topic/update")
    public ModelAndView updateMapper(int id, String title, String content) {
        topicService.update(id, title, content);
        return new ModelAndView("redirect:/topic");
    }

    @GetMapping("/topic")
    public ModelAndView index(HttpServletRequest request) {
        String token = UUID.randomUUID().toString();
        UserModel current = userService.currentUser(request);
        tokenMap.put(current.getId(), token);

        Long unixTime = System.currentTimeMillis() / 1000L;
        int currentTime = unixTime.intValue();

        Utility.log("userID is %s", current.getId());


        List<TopicModel> topicsByUserId =topicService.findByUserId(current.getId());


        List<TopicModel> topicsAll = topicService.all();

        List<TopicModel> topics = topicService.all2();

        ModelAndView m = new ModelAndView("topic/topic_index");
        m.addObject("topicsAll", topicsAll);
        m.addObject("topics", topics);
        m.addObject("token", token);
        m.addObject("username", current.getUsername());
        m.addObject("currentTime", currentTime);

        m.addObject("topicsByUserId", topicsByUserId);




        Utility.log("topics is %s", topics);
        Utility.log("topicsByUserId is %s", topicsByUserId);




        return m;
    }

    @GetMapping("/user/{username}")
    public ModelAndView user(@PathVariable String username) {

        UserModel user = userService.findByUsername(username);

        Long unixTime = System.currentTimeMillis() / 1000L;
        int currentTime = unixTime.intValue();

        Utility.log("userID is %s", user.getId());
        List<TopicModel> topicsByUserId =topicService.findByUserId(user.getId());




        List<TopicModel> topicsAll = topicService.all();

        List<TopicModel> topics = topicService.all2();

        ModelAndView m = new ModelAndView("user/user_index");
        m.addObject("topicsAll", topicsAll);
        m.addObject("topics", topics);

        m.addObject("currentTime", currentTime);


        m.addObject("username", username);
        m.addObject("currentTime", currentTime);

        m.addObject("topicsByUserId", topicsByUserId);



        Utility.log("topics is %s", topics);
        Utility.log("topicsByUserId is %s", topicsByUserId);





        return m;
    }


    @GetMapping("/topic/create")
    public ModelAndView createView() {
        ModelAndView m = new ModelAndView("topic/create");
        return m;
    }





}
