package cbuc.blog.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ProjectName: Cbuc-Blog
 * @Package: cbuc.blog.controller
 * @ClassName: IndexController
 * @ClassDesp: 主控制器
 * @Author: Cbuc
 * @Date: 2019/10/25
 */
@Api(value = "主控制器", description = "主页操作的相关功能")
@Controller
public class IndexController {

    @ApiOperation("跳转到主页")
    @RequestMapping("/")
    public String home() {
        return "index";
    }

    @ApiOperation("跳转到博客页")
    @RequestMapping("/blog")
    public String blog() {
        return "blog";
    }

    @ApiOperation("跳转到留言页")
    @RequestMapping("/contact")
    public String contact() {
        return "contact";
    }
}
