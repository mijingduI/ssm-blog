package kybmig.ssm.controller;

import kybmig.ssm.Utility;
import kybmig.ssm.model.WeiboModel;
import kybmig.ssm.service.WeiboService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class WeiboController {
    private WeiboService weiboService;

    public WeiboController(WeiboService weiboService) {
        this.weiboService = weiboService;
    }

    @PostMapping("/weibo/add")
    public ModelAndView add(String content) {
        WeiboModel weibo = weiboService.add(content);
        Utility.log("weibo add id %s", weibo.getId());
        return new ModelAndView("redirect:/weibo");
    }

    @GetMapping("/weibo")
    public ModelAndView index() {

        List<WeiboModel> weibos = weiboService.all();
        ModelAndView m = new ModelAndView("weibo/weibo_index");
        m.addObject("weibos", weibos);
        return m;
    }
}
