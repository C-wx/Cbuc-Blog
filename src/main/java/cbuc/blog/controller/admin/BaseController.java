package cbuc.blog.controller.admin;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Explain:   管理后台控制器
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/6
 */
@Slf4j
@Controller
@RequestMapping("/admin")
public class BaseController {

    @GetMapping("/index")
    public String toIndex() {
        return "admin/index";
    }
}
