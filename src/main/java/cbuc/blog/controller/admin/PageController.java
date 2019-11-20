package cbuc.blog.controller.admin;

import cbuc.blog.bean.ArticleCategory;
import cbuc.blog.bean.ArticleContent;
import cbuc.blog.bean.ArticleInfo;
import cbuc.blog.service.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Explain:
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/15
 */
@Slf4j
@Controller
@RequestMapping("/admin")
public class PageController {
    @Autowired
    private ContactService contactService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ArticleInfoService articleInfoService;

    @Autowired
    private ArticleContentService articleContentService;

    @Autowired
    private DataService dataService;

    @GetMapping("/")
    public String toIndex(Model model) {
        try {
            Long contactNum = contactService.queryCount();
            model.addAttribute("contactNum", contactNum);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("查询跳转异常");
        }
        return "admin/index";
    }

    @GetMapping("dataStatistic")
    public String toDataStatistic(Model model) {
        try {
            Map<String,Object> lastData = dataService.getLastData();
            Map<String,Object> dataMap = dataService.getData();
            model.addAttribute("lastData",lastData);
            model.addAttribute("dataMap",dataMap);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获取数据异常");
        }
        return "admin/dataStatistic";
    }

    @GetMapping("/contact")
    public String toContactList() {
        return "admin/contact";
    }

    @GetMapping("/articleAdd")
    public String toArticleAdd(Model model) {
        try {
            List<ArticleCategory> articleCategories = categoryService.queryTableList();
            model.addAttribute("categories", articleCategories);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获取分类信息异常");
        }
        return "admin/articleAdd";
    }

    @GetMapping("/manaTag")
    public String toManaTag() {
        return "admin/manaTag";
    }

    @GetMapping("/bulletin")
    public String toBulletin() {
        return "admin/bulletin";
    }

    @GetMapping("/manaArticle")
    public String toManaArticle() {
        return "admin/manaArticle";
    }

    @GetMapping("/editArticle")
    public String toArticleEdit(Long id,Model model) {
        try {
            List<ArticleCategory> articleCategories = categoryService.queryTableList();
            ArticleInfo articleInfo = articleInfoService.queryDeteil(id);
            ArticleContent articleContent = articleContentService.queryDetail(articleInfo.getAcId());
            String[] cgIds = articleInfo.getCgId().split(",");
            List<ArticleCategory> categories = new ArrayList<>();
            ArticleCategory articleCategory;
            for (int i = 0; i < cgIds.length; i++) {
                articleCategory = categoryService.queryDetail(cgIds[i]);
                categories.add(articleCategory);
            }
            model.addAttribute("articleInfo",articleInfo);
            model.addAttribute("articleContent",articleContent);
            model.addAttribute("categories", articleCategories);
            model.addAttribute("cates",categories);
            model.addAttribute("tags",articleInfo.getTag());
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获取文章信息异常");
        }
        return "admin/articleEdit";
    }

    @GetMapping("/comment")
    public String toComment() {
        return "admin/comment";
    }
}
