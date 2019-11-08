package cbuc.blog.controller.admin;

import cbuc.blog.base.Result;
import cbuc.blog.bean.Contact;
import cbuc.blog.service.ContactService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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

    @Autowired
    private ContactService contactService;

    @GetMapping("/")
    public String toIndex(HttpServletRequest request, Model model) {
        try {
            Long contactNum = contactService.queryCount();
            model.addAttribute("contactNum",contactNum);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("查询跳转异常");
        }
        return "admin/index";
    }

    @GetMapping("/contact")
    public String toContactList(Model model) {
        return "admin/contact";
    }

    @RequestMapping("/contact")
    public Object contactPage(@RequestParam(value = "pn", defaultValue = "1") Integer pn)  {
        //在查询之前开启，传入页码，以及每页的大小
        PageHelper.startPage(pn,10);     //pn:页码  10：页大小
        //startPage后面紧跟的这个查询就是一个分页查询
        List<Contact> contacts = contactService.queryList();
        //使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        //封装了详细的分页信息，包括有我们查询出来的数据，传入分页插件中要显示的页的数目 1 2 3 4 5
        PageInfo pageInfo = new PageInfo(contacts,5);
        return Result.success(pageInfo);
    }

}
