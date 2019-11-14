package cbuc.blog.service;

import cbuc.blog.bean.ArticleCategory;
import cbuc.blog.mapper.ArticleCategoryMapper;
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

    public List<ArticleCategory> queryList() {
        return articleCategoryMapper.selectByExample(null);
    }

}
