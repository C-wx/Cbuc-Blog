package cbuc.blog.controller;

import cbuc.blog.base.Result;
import cbuc.blog.bean.ArticleCategory;
import cbuc.blog.bean.ArticleContent;
import cbuc.blog.bean.ArticleInfo;
import cbuc.blog.bean.Contact;
import cbuc.blog.exception.MyException;
import cbuc.blog.service.ArticleContentService;
import cbuc.blog.service.ArticleInfoService;
import cbuc.blog.service.ContactService;
import cbuc.blog.service.ForeService;
import cbuc.blog.utils.IPutil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

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

    @Autowired
    private ArticleInfoService articleInfoService;

    @Autowired
    private ArticleContentService articleContentService;

    @Autowired
    private ForeService foreService;

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

    @ResponseBody
    @RequestMapping("/getCategories")
    public Object getCategories() {
        try {
            List<ArticleCategory> articleCategoryList = foreService.getCategory();
            if (!articleCategoryList.isEmpty()) {
                return Result.success(articleCategoryList);
            }else{
                return Result.error("获取分类信息异常");
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获取分类信息异常");
            return Result.error("获取分类信息异常");
        }
    }

    @ResponseBody
    @RequestMapping("/getBlogs")
    public Object getBlogs(@RequestParam(value = "current", defaultValue = "1") Integer pn,
                           @RequestParam(value = "size", defaultValue = "6") Integer size,
                           @RequestParam(value = "sort", defaultValue = "id") String sort,
                           @RequestParam(value = "order", defaultValue = "desc") String order) {
        try {
            //在查询之前开启，传入页码，以及每页的大小
            PageHelper.startPage(pn, size, sort + " " + order);     //pn:页码  10：页大小
            //startPage后面紧跟的这个查询就是一个分页查询
            List<ArticleInfo> articleInfoList = articleInfoService.queryList(null);
            for (ArticleInfo articleInfo : articleInfoList) {
                ArticleContent articleContent = articleContentService.queryDetail(articleInfo.getAcId());
                articleInfo.setArticleContent(articleContent);
            }
            //使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
            //封装了详细的分页信息，包括有我们查询出来的数据，传入分页插件中要显示的页的数目 1 2 3 4 5
            PageInfo pageInfo = new PageInfo(articleInfoList, 5);
            return Result.success(pageInfo);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("查询博文异常");
            return Result.error("查询博文异常");
        }
    }
}
