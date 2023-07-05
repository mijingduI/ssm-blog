package kybmig.ssm.controller;

import kybmig.ssm.Utility;
import kybmig.ssm.model.TopicModel;
import kybmig.ssm.model.UserModel;
import kybmig.ssm.service.TopicService;
import kybmig.ssm.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class PublicController {
    private UserService userService;
    private TopicService topicService;

    public PublicController(UserService userService, TopicService topicService) {
        this.userService = userService;
        this.topicService = topicService;
    }

    @GetMapping("/")
    public ModelAndView index(HttpServletRequest request) {

        // model 说的是给模板引擎的 model
        // view 说的是模板名字，没有后缀
        // view 可以自动补全，也可以直接跳转

        UserModel current = userService.currentUser(request);

        List<TopicModel> topicsAll = topicService.all();
        List<TopicModel> topics = topicService.all2();


        ModelAndView mv = new ModelAndView("index");
        mv.addObject("username", current.getUsername());
        mv.addObject("topicsAll", topicsAll);
        mv.addObject("topics", topics);

        Utility.log("topics is %s", topics);
        return mv;
    }

    @GetMapping("/good")
    public ModelAndView goodView(HttpServletRequest request) {
        UserModel current = userService.currentUser(request);
        int id = 1;

        List<TopicModel> topicsAll = topicService.allByBoard(id);


        ModelAndView mv = new ModelAndView("/user/good");
        mv.addObject("username", current.getUsername());
        mv.addObject("topicsAll", topicsAll);

        Utility.log("topics is %s", topicsAll);
        return mv;

    }

    @GetMapping("/share")
    public ModelAndView shareView(HttpServletRequest request) {
        UserModel current = userService.currentUser(request);
        int id = 2;

        List<TopicModel> topicsAll = topicService.allByBoard(id);


        ModelAndView mv = new ModelAndView("/user/share");
        mv.addObject("username", current.getUsername());
        mv.addObject("topicsAll", topicsAll);

        Utility.log("topics is %s", topicsAll);
        return mv;

    }

    @GetMapping("/ask")
    public ModelAndView askView(HttpServletRequest request) {
        UserModel current = userService.currentUser(request);
        int id = 3;

        List<TopicModel> topicsAll = topicService.allByBoard(id);


        ModelAndView mv = new ModelAndView("/user/ask");
        mv.addObject("username", current.getUsername());
        mv.addObject("topicsAll", topicsAll);

        Utility.log("topics is %s", topicsAll);
        return mv;

    }

}
