package cbuc.blog.controller.admin;

import cbuc.blog.bean.ArticleCategory;
import cbuc.blog.service.CategoryService;
import cbuc.blog.service.ContactService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

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
    public String toDataStatistic() {
        return "admin/dataStatistic";
    }

    @GetMapping("/contact")
    public String toContactList() {
        return "admin/contact";
    }

    @GetMapping("/articleAdd")
    public String toArticleAdd(Model model) {
        List<ArticleCategory> articleCategories = categoryService.queryTableList();
        model.addAttribute("categories", articleCategories);
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

}
