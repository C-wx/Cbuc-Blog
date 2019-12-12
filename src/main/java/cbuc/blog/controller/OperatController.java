package cbuc.blog.controller;

import cbuc.blog.base.Result;
import cbuc.blog.bean.*;
import cbuc.blog.exception.MyException;
import cbuc.blog.service.*;
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
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Objects;

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

    @Autowired
    private CommentService commentService;

    @Autowired
    private BulletinService bulletinService;

    @Autowired
    private UserService userService;

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
                           @RequestParam(value = "size", defaultValue = "4") Integer size,
                           @RequestParam(value = "cgid", required = false) String id,
                           @RequestParam(value = "keyword", required = false) String keyword) {
        try {
            PageHelper.startPage(pn, size);
            List<ArticleInfo> articleInfoList = articleInfoService.queryList(null, id, keyword);
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
                } else {
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
    public String gotoArticle(@PathVariable(value = "id") Long id, HttpSession session) {//todo 自定义异常页面, 抛出异常
        int res = articleInfoService.addAccessCount(id);
        return "redirect:/details?id=" + id;
    }

    @RequestMapping("/details")
    public String toDetail(HttpSession session, Model model, Long id) {
        ArticleInfo articleInfo = articleInfoService.queryDeteil(id);
        String[] tags = articleInfo.getTag().split(",");
        ArticleContent articleContent = articleContentService.queryDetail(id);
        List<Comment> comments = commentService.queryDetailList(articleInfo.getId());
        commentService.fillSecondComments(comments);
        articleInfo.setComments(comments);
        model.addAttribute("articleInfo", articleInfo);
        model.addAttribute("articleContent", articleContent);
        model.addAttribute("tags", tags);
        model.addAttribute("commentNum", comments.size());
        return "fore/details";
    }

    @ResponseBody
    @RequestMapping("/doLike")
    public Object doLike(String type, Integer count, String id) {
        try {
            int res = 0;
            if ("1".equals(type)) {
                res = articleInfoService.doLike(count, id);
            } else if ("2".equals(type)) {
                res = commentService.doLike(count, id);
            }
            if (res > 0) {
                return Result.success();
            } else {
                return Result.error("点赞功能异常");
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("点赞功能异常");
            return Result.error("点赞功能异常");
        }
    }

    @ResponseBody
    @RequestMapping("/addComment")
    public Object addComment(Long pid, String content, String type, HttpServletRequest request) {
        try {
            String loginIp = IPutil.getIpAddress(request);
            Comment comment = Comment.builder().loginIp(loginIp).parentId(pid).content(content).type(type).createTime(new Date()).build();
            int res = commentService.doAdd(comment);
            int rest = type.equals("1")?articleInfoService.addCommentCount(pid):commentService.addCommentCount(pid) ;
            if (res > 0 && rest > 0) {
                return Result.success(comment);
            } else {
                return Result.error("发布评论异常");
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("发布评论异常");
            return Result.error("发布评论异常");
        }
    }

    @ResponseBody
    @RequestMapping("/getHotBlogs")
    public Object getHotBlogs() {
        try {
            List<ArticleInfo> articleinfos = articleInfoService.getHotBlogs();
            return Result.success(articleinfos);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("查询热文异常");
            return Result.error("查询热文异常");
        }
    }

    @ResponseBody
    @RequestMapping("/getBulletin")
    public Object getBulletin() {
        try {
            List<Bulletin> bulletins =bulletinService.queryTableList();
            return Result.success(bulletins);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获取公告异常");
            return Result.error("获取公告异常");
        }
    }

    @ResponseBody
    @RequestMapping("/registerUser")
    public Object registerUser(User user) {
        try {
            int res = userService.doAdd(user);
            if (res>0) {
                return Result.success();
            }else {
                return Result.error("注册用户异常");
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("注册用户异常");
            return Result.error("注册用户异常");
        }
    }

    @ResponseBody
    @RequestMapping("/doLogin")
    public Object doLogin(User user,HttpSession session) {
        try {
            User loginUser = userService.getDetail(user);
            if (!Objects.isNull(loginUser)) {
                session.setAttribute("loginUser",loginUser);
                return Result.success();
            }else {
                return Result.error("用户名或密码错误");
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("用户名或密码错误");
            return Result.error("用户名或密码错误");
        }
    }

    @ResponseBody
    @RequestMapping("/savePwd")
    public Object savePwd(User user) {
        try {
            int isExist = userService.getOneByName(user.getUserName());
            if (isExist<1) {
                return Result.error("该用户不存在,请检查用户名是否正确");
            }
            int isRight = userService.isRight(user);
            if (isRight < 1) {
                return Result.error("密码问题回答错误,请重新输入");
            }
            int isSuccess = userService.updatePwd(user);
            if (isSuccess > 0) {
                return Result.success();
            }else {
                return Result.error("修改密码异常");
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("修改密码异常");
            return Result.error("修改密码异常");
        }
    }

    @ResponseBody
    @RequestMapping("/checkLogin")
    public Object checkLogin(HttpSession session) {
        try {
            User user = (User) session.getAttribute("loginUser");
            if (Objects.isNull(user)) {
                return Result.error("用户未登录,请先登录");
            }else{
                return Result.success(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("查询用户异常");
            return Result.error("查询用户异常");
        }
    }
}