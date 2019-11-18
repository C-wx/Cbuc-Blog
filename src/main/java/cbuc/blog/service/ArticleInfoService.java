package cbuc.blog.service;

import cbuc.blog.bean.ArticleInfo;
import cbuc.blog.bean.ArticleInfoExample;
import cbuc.blog.mapper.ArticleInfoMapper;
import cbuc.blog.utils.baseenum.StatusEnum;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public List<ArticleInfo> queryList(String title) {
        ArticleInfoExample example = new ArticleInfoExample();
        ArticleInfoExample.Criteria criteria = example.createCriteria().andStatusNotEqualTo(StatusEnum.D.getStatus());
        if (StringUtils.isNotBlank(title)) {
            criteria.andTitleLike("%"+title+"%");
        }
        return articleInfoMapper.selectByExample(example);
    }

    public ArticleInfo queryDeteil(Long id) {
        return articleInfoMapper.selectByPrimaryKey(id);
    }

    public int doMod(ArticleInfo articleInfo) {
        return articleInfoMapper.updateByPrimaryKeySelective(articleInfo);
    }
}
