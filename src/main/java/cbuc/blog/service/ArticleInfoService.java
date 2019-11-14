package cbuc.blog.service;

import cbuc.blog.bean.ArticleInfo;
import cbuc.blog.bean.ArticleInfoExample;
import cbuc.blog.mapper.ArticleInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Explain:   文章信息处理器
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/14
 */
@Service
public class ArticleInfoService {

    @Autowired
    private ArticleInfoMapper articleInfoMapper;

    public int doAdd(ArticleInfo articleInfo) {
        return articleInfoMapper.insertSelective(articleInfo);
    }

    public int doUpdate(ArticleInfo articleInfo) {
        ArticleInfoExample articleInfoExample = new ArticleInfoExample();
        articleInfoExample.createCriteria().andIdEqualTo(articleInfo.getId());
        return articleInfoMapper.updateByExampleSelective(articleInfo, articleInfoExample);
    }
}
