package cbuc.blog.controller.admin;

import cbuc.blog.base.Result;
import cbuc.blog.bean.LoginUser;
import cbuc.blog.utils.CacheUtil;
import com.google.code.kaptcha.Constants;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @Explain:  后台登录控制器
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/5
 */
@Slf4j
@Api("后台登录控制器")
@Controller
@RequestMapping("/admin")
public class LoginController {

    @Autowired
    private CacheUtil cacheUtil;

    private static final String NAME = "cbuc";
    private static final String PASSWORD = "123456";

    @ApiOperation("跳转到登录页面")
    @GetMapping("/toLogin")
    public String toLogin() {
        return "admin/login";
    }

    @ApiOperation("登录操作")
    @PostMapping("/login")
    @ResponseBody
    public Result login(LoginUser user, HttpServletRequest request) {
        String verifyCode = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
        //获取登录失败次数
        Integer error_count = cacheUtil.get("login_error_count");

        if (StringUtils.isBlank(verifyCode)) {
            return Result.error("验证码已过期,请重新输入验证码!");
        }
        if (StringUtils.isBlank(user.getVerifyCode())) {
            return Result.error("请输入验证码!");
        } else if (!user.getVerifyCode().equalsIgnoreCase(verifyCode)) {
            return Result.error("验证码错误!");
        }
        if (error_count !=null && error_count > 3) {
            return Result.error("您输入密码已经错误超过3次，请1分钟后尝试!");
        }
        if (!NAME.equalsIgnoreCase(user.getUsername()) || !PASSWORD.equalsIgnoreCase(user.getPassword())) {
            error_count = null == error_count ? 1 : error_count + 1;
            cacheUtil.set("login_error_count", error_count, 60);
            log.error("用户名或密码错误,请重新输入");
            return Result.error("用户名或密码错误,请重新输入");
        }
        request.getSession().removeAttribute(Constants.KAPTCHA_SESSION_KEY);
        request.getSession().setAttribute("LOGIN_USER",user);
        request.getSession().setMaxInactiveInterval(30 * 60);
        return Result.success();
    }
}
