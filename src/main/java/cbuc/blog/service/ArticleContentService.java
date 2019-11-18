package cbuc.blog.service;

import cbuc.blog.bean.ArticleContent;
import cbuc.blog.mapper.ArticleContentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Explain:   文章内容处理器
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/14
 */
@Service
public class ArticleContentService {

    @Autowired
    private ArticleContentMapper articleContentMapper;

    public int doAdd(ArticleContent articleContent) {
        return articleContentMapper.insertSelective(articleContent);
    }

    public ArticleContent queryDetail(Long acId) {
        return articleContentMapper.selectByPrimaryKey(acId);
    }

    public int doMod(ArticleContent articleContent) {
        return articleContentMapper.updateByPrimaryKeySelective(articleContent);
    }
}
