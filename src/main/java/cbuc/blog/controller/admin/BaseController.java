package cbuc.blog.controller.admin;

import cbuc.blog.base.LayuiTable;
import cbuc.blog.base.Result;
import cbuc.blog.bean.*;
import cbuc.blog.evt.ArticleEvt;
import cbuc.blog.evt.LogEvt;
import cbuc.blog.service.*;
import cbuc.blog.utils.baseenum.StatusEnum;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ArticleContentService articleContentService;

    @Autowired
    private ArticleInfoService articleInfoService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private LogEvt logEvt;

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
                               @RequestParam(value = "size", defaultValue = "10") Integer size,
                               @RequestParam(value = "sort", defaultValue = "id") String sort,
                               @RequestParam(value = "order", defaultValue = "desc") String order) {
        try {
            PageHelper.startPage(pn, size, sort + " " + order);     //pn:页码  10：页大小
            List<Bulletin> bulletins = bulletinService.queryTableList();
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
    public Object addBulletin(String content, String beginTime, String endTime) {
        try {
            Bulletin bulletin = new Bulletin();
            bulletin.setContent(content);
            bulletin.setBeginTime(DateUtils.parseDate(beginTime, new String[]{"yyyy-MM-dd HH:mm:ss"}));
            bulletin.setEndTime(DateUtils.parseDate(endTime, new String[]{"yyyy-MM-dd HH:mm:ss"}));
            bulletin.setCreateTime(new Date());
            int result = bulletinService.doAdd(bulletin);
            if (result > 0) {
                return Result.success(bulletin);
            } else {
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
            if (result > 0) {
                return Result.success();
            } else {
                return Result.error("删除公告异常!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("删除公告异常");
            return Result.error("删除公告异常");
        }
    }

    @RequestMapping("/addArticle")
    @ResponseBody
    public Object addArticle(ArticleEvt articleEvt,
                             @RequestParam(value = "isTop", defaultValue = "0") String isTop) {
        try {
            ArticleContent articleContent = new ArticleContent();
            ArticleInfo articleInfo = new ArticleInfo();
            articleInfo.setAcId(articleContent.getId());
            articleInfo.setTitle(articleEvt.getTitle());
            articleInfo.setSummary(articleEvt.getSummary());
            articleInfo.setEditor(articleEvt.getEditor());
            articleInfo.setTag(articleEvt.getTagNames());
            articleInfo.setCgId(articleEvt.getCateId());
            articleInfo.setIstop(isTop);
            int i = articleInfoService.doAdd(articleInfo);

            articleContent.setAiId(articleInfo.getId());
            if ("markdown".equals(articleEvt.getEditor())) {
                articleContent.setContent(articleEvt.getMdContent());
            } else if ("html".equals(articleEvt.getEditor())) {
                articleContent.setContent(articleEvt.getContent());
            }
            articleContent.setImage(articleEvt.getCover());
            int i1 = articleContentService.doAdd(articleContent);

            articleInfo.setAcId(articleContent.getId());
            int i2 = articleInfoService.doUpdate(articleInfo);

            if (i > 0 && i1 > 0 && i2 > 0) {
                return Result.success();
            } else {
                return Result.error("发布文章异常");
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("发布文章异常");
            return Result.error("发布文章异常");
        }
    }

    @RequestMapping("/tagPage")
    @ResponseBody
    public Object tagPage(@RequestParam(value = "current", defaultValue = "1") Integer pn,
                          @RequestParam(value = "size", defaultValue = "10") Integer size) {
        try {
            PageHelper.startPage(pn, size);     //pn:页码  10：页大小
            List<ArticleCategory> categories = categoryService.queryTableList();
            PageInfo pageInfo = new PageInfo(categories, 5);
            return new LayuiTable<>(pageInfo.getTotal(), pageInfo.getList());
        } catch (Exception e) {
            e.printStackTrace();
            log.error("查询标签结果异常");
            return Result.error("查询标签结果异常");
        }
    }

    @RequestMapping("/getHisTag")
    @ResponseBody
    public Object getHisTag() {
        try {
            List<ArticleCategory> categories = categoryService.queryList();
            return Result.success(categories);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获取历史标签异常");
            return Result.error("获取历史标签异常");
        }
    }

    @RequestMapping("/addTag")
    @ResponseBody
    public Object addTag(String name) {
        try {
            ArticleCategory articleCategory = new ArticleCategory();
            articleCategory.setName(name);
            articleCategory.setCreateTime(new Date());
            int result = categoryService.doAdd(articleCategory);
            if (result > 0) {
                return Result.success(articleCategory);
            } else {
                return Result.error("添加公告异常！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("添加公告异常！");
            return Result.error("添加公告异常！");
        }
    }

    @ResponseBody
    @RequestMapping("/deleteTag")
    public Object deleteTag(Long id) {
        try {
            ArticleCategory articleCategory = new ArticleCategory();
            articleCategory.setId(id);
            articleCategory.setStatus(StatusEnum.D.getStatus());
            int result = categoryService.doMod(articleCategory);
            if (result > 0) {
                return Result.success();
            } else {
                return Result.error("删除标签异常!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("删除标签异常!");
            return Result.error("删除标签异常!");
        }
    }

    @ResponseBody
    @RequestMapping("/modTag")
    public Object modTag(Long id, String name) {
        try {
            ArticleCategory articleCategory = new ArticleCategory();
            articleCategory.setId(id);
            articleCategory.setName(name);
            int result = categoryService.doMod(articleCategory);
            if (result > 0) {
                return Result.success();
            } else {
                return Result.error("修改标签异常!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("修改标签异常!");
            return Result.error("修改标签异常!");
        }
    }

    @RequestMapping("/articlePage")
    @ResponseBody
    public Object articlePage(@RequestParam(value = "current", defaultValue = "1") Integer pn,
                              @RequestParam(value = "size", defaultValue = "10") Integer size,
                              @RequestParam(value = "sort", defaultValue = "id") String sort,
                              @RequestParam(value = "order", defaultValue = "desc") String order,
                              String title) {
        try {
            PageHelper.startPage(pn, size, sort + " " + order);     //pn:页码  10：页大小
            List<ArticleInfo> articleInfos = articleInfoService.queryList(title);
            PageInfo pageInfo = new PageInfo(articleInfos, 5);
            return new LayuiTable<>(pageInfo.getTotal(), pageInfo.getList());
        } catch (Exception e) {
            e.printStackTrace();
            log.error("查询公告结果异常");
            return Result.error("查询公告结果异常");
        }
    }

    @ResponseBody
    @PostMapping("/modArticle")
    public Object modArticle(@RequestParam(value = "status", required = false) String status,
                             @RequestParam(value = "isTop", required = false) String isTop,
                             Long id) {
        try {
            ArticleInfo articleInfo = new ArticleInfo();
            articleInfo.setId(id);
            if (StringUtils.isNotBlank(status)) {
                articleInfo.setStatus(status);
            }
            if (StringUtils.isNotBlank(isTop)) {
                articleInfo.setIstop(isTop);
            }
            int count = articleInfoService.doUpdate(articleInfo);
            if (count > 0) {
                return Result.success();
            } else {
                return Result.error();
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("修改文章信息异常");
            return Result.error("修改文章信息异常");
        }
    }

    @RequestMapping("/editArticle")
    @ResponseBody
    public Object modArticle(ArticleEvt articleEvt,
                             @RequestParam(value = "isTop", defaultValue = "0") String isTop) {
        try {
            ArticleContent articleContent = new ArticleContent();
            ArticleInfo articleInfo = new ArticleInfo();
            articleInfo.setId(articleEvt.getAiId());
            articleInfo.setTitle(articleEvt.getTitle());
            articleInfo.setSummary(articleEvt.getSummary());
            articleInfo.setEditor(articleEvt.getEditor());
            articleInfo.setTag(articleEvt.getTagNames());
            articleInfo.setCgId(articleEvt.getCateId());
            articleInfo.setIstop(isTop);
            int i = articleInfoService.doMod(articleInfo);

            articleContent.setId(articleEvt.getAcId());
            articleContent.setAiId(articleInfo.getId());
            if ("markdown".equals(articleEvt.getEditor())) {
                articleContent.setContent(articleEvt.getMdContent());
            } else if ("html".equals(articleEvt.getEditor())) {
                articleContent.setContent(articleEvt.getContent());
            }
            articleContent.setImage(articleEvt.getCover());
            int i1 = articleContentService.doMod(articleContent);

            if (i > 0 && i1 > 0) {
                return Result.success();
            } else {
                return Result.error("更新文章异常");
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("更新文章异常");
            return Result.error("更新文章异常");
        }
    }

    @GetMapping("/commentPage")
    @ResponseBody
    public Object commentPage(@RequestParam(value = "current", defaultValue = "1") Integer pn,
                              @RequestParam(value = "size", defaultValue = "10") Integer size,
                              @RequestParam(value = "sort", defaultValue = "id") String sort,
                              @RequestParam(value = "order", defaultValue = "desc") String order,
                              String contentKeyWard, String nameKeyword) {
        try {
            PageHelper.startPage(pn, size, sort + " " + order);     //pn:页码  10：页大小
            List<Comment> comments = commentService.queryList(contentKeyWard, nameKeyword);
            Iterator<Comment> iterator = comments.iterator();
            Comment comment;
            while (iterator.hasNext()) {
                comment = iterator.next();
                if ("2".equals(comment.getType())) {
                    Comment comment1 = commentService.queryDetail(comment.getParentId());
                    comment.setDetail(comment1.getContent());
                } else if ("1".equals(comment.getType())) {
                    ArticleInfo articleInfo = articleInfoService.queryDeteil(comment.getParentId());
                    comment.setDetail(articleInfo.getTitle());
                }
            }
            PageInfo pageInfo = new PageInfo(comments, 5);
            return new LayuiTable<>(pageInfo.getTotal(), pageInfo.getList());
        } catch (Exception e) {
            e.printStackTrace();
            log.error("查询评论结果异常");
            return Result.error("查询评论结果异常");
        }
    }

    @ResponseBody
    @RequestMapping("/modComment")
    public Object modComment(Long id) {
        try {
            Comment comment = new Comment();
            comment.setId(id);
            comment.setStatus(StatusEnum.D.getStatus());
            int result = commentService.doMod(comment);
            if (result > 0) {
                return Result.success();
            } else {
                return Result.error("修改评论异常!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("修改评论异常!");
            return Result.error("修改评论异常!");
        }
    }

    @ResponseBody
    @RequestMapping("/getBlogData")
    public Object getBlogData(String beginTime) {
        List<Map<String,Object>> data =  articleInfoService.queryBlogData(beginTime);
        return Result.success(data);
    }

    @RequestMapping("/getLog")
    @ResponseBody
    public Object getLog() {
        try {
            Map<String,Object> map = logEvt.getLogMap();
            return Result.success(map);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获取操作日志异常");
            return Result.error("获取操作日志异常");
        }
    }
}
