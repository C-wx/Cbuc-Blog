package cbuc.blog.service;

import cbuc.blog.bean.ArticleCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Explain:    前端处理器
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/21
 */
@Service
public class ForeService {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ArticleInfoService articleInfoService;

    public List<ArticleCategory> getCategory() {
        List<ArticleCategory> articleCategoryList = categoryService.queryTableList();
        for (ArticleCategory articleCategory : articleCategoryList) {
            Integer articleNum = articleInfoService.queryArticleNum(articleCategory.getId());
            articleCategory.setArticleNum(articleNum);
        }
        return articleCategoryList;
    }

}
