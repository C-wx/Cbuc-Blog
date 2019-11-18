package cbuc.blog.service;

import cbuc.blog.bean.ArticleCategory;
import cbuc.blog.bean.ArticleCategoryExample;
import cbuc.blog.mapper.ArticleCategoryMapper;
import cbuc.blog.utils.baseenum.StatusEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Explain:
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/13
 */
@Service
public class CategoryService {

    @Autowired
    private ArticleCategoryMapper articleCategoryMapper;

    public List<ArticleCategory> queryTableList() {
        ArticleCategoryExample articleCategoryExample = new ArticleCategoryExample();
        articleCategoryExample.createCriteria().andStatusNotEqualTo(StatusEnum.D.getStatus());
        articleCategoryExample.setOrderByClause("CREATE_TIME DESC");
        return articleCategoryMapper.selectByExample(articleCategoryExample);
    }

    public List<ArticleCategory> queryList() {
        ArticleCategoryExample articleCategoryExample = new ArticleCategoryExample();
        articleCategoryExample.setOrderByClause("CREATE_TIME DESC");
        return articleCategoryMapper.selectByExample(articleCategoryExample);
    }

    public int doAdd(ArticleCategory articleCategory) {
        return articleCategoryMapper.insertSelective(articleCategory);
    }

    public int doMod(ArticleCategory articleCategory) {
        ArticleCategoryExample articleCategoryExample = new ArticleCategoryExample();
        articleCategoryExample.createCriteria().andIdEqualTo(articleCategory.getId());
        return articleCategoryMapper.updateByExampleSelective(articleCategory, articleCategoryExample);
    }

    public ArticleCategory queryDetail(String cgId) {
        return articleCategoryMapper.selectByPrimaryKey(Long.valueOf(cgId));
    }
}
