package cbuc.blog.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ProjectName: Cbuc-Blog
 * @Package: cbuc.blog.controller
 * @ClassName: LoginController
 * @ClassDesp: 登录控制器
 * @Author: Cbuc
 * @Date: 2019/10/24
 */
@Api(value = "登录控制器", description = "登录相关的操作")
@Controller
public class LoginController {

    @ApiOperation("跳转到登录页面")
    @RequestMapping("/toLogin")
    public String loginPage() {
        return "login";
    }
}
