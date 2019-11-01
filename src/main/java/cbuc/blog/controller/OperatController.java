package cbuc.blog.controller;

import cbuc.blog.bean.Contact;
import cbuc.blog.evt.Result;
import cbuc.blog.service.ContactService;
import cbuc.blog.utils.IPutil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @Explain 操作控制器
 * @Author Cbuc
 * @Version 1.0
 * @Date 2019/10/30
 */
@Api(value = "操作控制器", description = "主页操作")
@Controller
public class OperatController {

    @Autowired
    private ContactService contactService;

    @ApiOperation("留言")
    @ResponseBody
    @PostMapping("/contact")
    public Object contact(Contact contact, HttpServletRequest request) {
        contact.setCreateTime(new Date());
        String ip = IPutil.getIpAddress(request);
        contact.setLoginIp(ip);
        contact.setStatus("E");
//        int result = contactService.doAdd(contact);
//        if (result>0) {
            return Result.success();
//        }else {
//            return Result.error();
//        }
    }

}
