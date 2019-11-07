package cbuc.blog.controller;

import cbuc.blog.base.Result;
import cbuc.blog.bean.Contact;
import cbuc.blog.exception.MyException;
import cbuc.blog.service.ContactService;
import cbuc.blog.utils.IPutil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
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
@Slf4j
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
        try {
            contactService.doAdd(contact);
        } catch (Exception e) {
            String msg = "新增留言异常";
            if (e instanceof MyException) {
                log.error(e.getMessage() == null?msg:e.getMessage(),e);
            }
            return Result.error();
        }
        return Result.success();
    }

}
