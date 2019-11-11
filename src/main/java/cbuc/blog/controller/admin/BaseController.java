package cbuc.blog.controller.admin;

import cbuc.blog.base.LayuiTable;
import cbuc.blog.base.Result;
import cbuc.blog.bean.Bulletin;
import cbuc.blog.bean.Contact;
import cbuc.blog.service.BulletinService;
import cbuc.blog.service.ContactService;
import cbuc.blog.utils.baseenum.StatusEnum;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * @Explain: 管理后台控制器
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

    @Autowired
    private BulletinService bulletinService;

    @GetMapping("/")
    public String toIndex(HttpServletRequest request, Model model) {
        try {
            Long contactNum = contactService.queryCount();
            model.addAttribute("contactNum", contactNum);
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

    @GetMapping("/contactPage")
    @ResponseBody
    public Object contactPage(@RequestParam(value = "current", defaultValue = "1") Integer pn,
                              @RequestParam(value = "size", defaultValue = "10") Integer size,
                              @RequestParam(value = "sort", defaultValue = "id") String sort,
                              @RequestParam(value = "order", defaultValue = "desc") String order,
                              String commentKeyWard, String nameKeyword) {
        try {
            //在查询之前开启，传入页码，以及每页的大小
            PageHelper.startPage(pn, size, sort + " " + order);     //pn:页码  10：页大小
            //startPage后面紧跟的这个查询就是一个分页查询
            List<Contact> contacts = contactService.queryList(commentKeyWard, nameKeyword);
            //使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
            //封装了详细的分页信息，包括有我们查询出来的数据，传入分页插件中要显示的页的数目 1 2 3 4 5
            PageInfo pageInfo = new PageInfo(contacts, 5);
            return new LayuiTable<>(pageInfo.getTotal(), pageInfo.getList());
        } catch (Exception e) {
            e.printStackTrace();
            log.error("查询留言结果异常");
            return Result.error("查询留言结果异常");
        }
    }

    @PostMapping("/modContact")
    @ResponseBody
    public Object modContact(Long id, Boolean status) {
        try {
            if (status) {
                int result = contactService.modStatus(id, StatusEnum.D.getStatus());
                Long contactNum = contactService.queryCount();
                return result > 0 ? Result.success(contactNum) : Result.error("修改留言状态异常");
            } else {
                int result = contactService.modStatus(id, StatusEnum.E.getStatus());
                Long contactNum = contactService.queryCount();
                return result > 0 ? Result.success(contactNum) : Result.error("修改留言状态异常");
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("修改留言状态异常");
            return Result.error("修改留言状态异常");
        }
    }

    @GetMapping("/bulletin")
    public String toBulletin(Model model) {
        return "admin/bulletin";
    }

    @RequestMapping("/getHisBulletin")
    @ResponseBody
    public Object getHisBulletin() {
        try {
            List<Bulletin> bulletins = bulletinService.queryList();
            return Result.success(bulletins);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获取历史公告异常");
            return Result.error("获取历史公告异常");
        }
    }

    @RequestMapping("/bulletinPage")
    @ResponseBody
    public Object bulletinPage(@RequestParam(value = "current", defaultValue = "1") Integer pn,
                               @RequestParam(value = "size", defaultValue = "10") Integer size) {
        try {
            PageHelper.startPage(pn, size);     //pn:页码  10：页大小
            List<Bulletin> bulletins = bulletinService.queryList();
            PageInfo pageInfo = new PageInfo(bulletins, 5);
            return new LayuiTable<>(pageInfo.getTotal(), pageInfo.getList());
        } catch (Exception e) {
            e.printStackTrace();
            log.error("查询公告结果异常");
            return Result.error("查询公告结果异常");
        }
    }

    @RequestMapping("/addBulletin")
    @ResponseBody
    public Object addBulletin(String content,String beginTime,String endTime) {
        try {
            Bulletin bulletin = new Bulletin();
            bulletin.setContent(content);
            bulletin.setBeginTime(DateUtils.parseDate(beginTime,new String[]{"yyyy-MM-dd HH:mm:ss"}));
            bulletin.setEndTime(DateUtils.parseDate(endTime,new String[]{"yyyy-MM-dd HH:mm:ss"}));
            bulletin.setCreateTime(new Date());
            int result = bulletinService.doAdd(bulletin);
            if (result > 0) {
                return Result.success(bulletin);
            }else {
                return Result.error("添加公告异常！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("添加公告异常！");
            return Result.error("添加公告异常！");
        }
    }

    @RequestMapping("/deleteBulletin")
    @ResponseBody
    public Object deleteBulletin(Long id) {
        try {
            Bulletin bulletin = new Bulletin();
            bulletin.setId(id);
            bulletin.setStatus(StatusEnum.D.getStatus());
            int result = bulletinService.doDel(bulletin);
            if (result>0) {
                return Result.success();
            }else {
                return Result.error("删除公告异常!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("删除公告异常");
            return Result.error("删除公告异常");
        }
    }

}
