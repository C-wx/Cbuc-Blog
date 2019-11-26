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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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
                log.error(e.getMessage() == null ? msg : e.getMessage(), e);
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
            } else {
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
                           @RequestParam(value = "size", defaultValue = "4") Integer size) {
        try {
            PageHelper.startPage(pn, size);
            List<ArticleInfo> articleInfoList = articleInfoService.queryList(null);
            for (ArticleInfo articleInfo : articleInfoList) {
                ArticleContent articleContent = articleContentService.queryDetail(articleInfo.getAcId());
                articleInfo.setArticleContent(articleContent);
                String nowTime = LocalDate.now().toString();
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                String createTime = df.format(articleInfo.getCreateTime());
                if (createTime.split("-")[0].equals(nowTime.split("-")[0])
                        && createTime.split("-")[1].equals(nowTime.split("-")[1])
                        && (Integer.parseInt(createTime.split("-")[2]) + 2) >= Integer.parseInt(nowTime.split("-")[2])) {
                    articleInfo.setIsNew(true);
                }else {
                    articleInfo.setIsNew(false);
                }
            }
            PageInfo pageInfo = new PageInfo(articleInfoList, 5);
            return Result.success(pageInfo);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("查询博文异常");
            return Result.error("查询博文异常");
        }
    }

    @RequestMapping("/gotoArticle/{id}")
    public String gotoArticle(@PathVariable(value = "id") Long id, Model model) {//todo 自定义异常页面, 抛出异常
        ArticleInfo articleInfo = articleInfoService.queryDeteil(id);
        String[] tags = articleInfo.getTag().split(",");
        ArticleContent articleContent = articleContentService.queryDetail(id);
        model.addAttribute("articleInfo",articleInfo);
        model.addAttribute("articleContent",articleContent);
        model.addAttribute("tags",tags);
        return "fore/details";
    }
}
