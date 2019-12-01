package cbuc.blog.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @ProjectName: Cbuc-Blog
 * @Package: cbuc.blog.controller
 * @ClassName: IndexController
 * @ClassDesp: 主控制器
 * @Author: Cbuc
 * @Date: 2019/10/25
 */
@Api(value = "页面跳转控制器", description = "页面跳转")
@Controller
public class IndexController {

    @ApiOperation("跳转到主页")
    @GetMapping("/")
    public String home() {
        return "fore/index";
    }

    @ApiOperation("跳转到博客页")
    @GetMapping("/blog")
    public String blog() {
        return "fore/blog";
    }

    @ApiOperation("跳转到留言页")
    @GetMapping("/contact")
    public String contact() {
        return "fore/contact";
    }

    @GetMapping("/index")
    public String index() {
        return "index";
    }

    @GetMapping("/toblog")
    public String toBlog() {
        return "blog";
    }

    @GetMapping("/bulletin")
    public String toBulletin() {
        return "fore/bulletin";
    }
}
