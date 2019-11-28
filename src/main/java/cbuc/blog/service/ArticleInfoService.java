package cbuc.blog.service;

import cbuc.blog.bean.ArticleInfo;
import cbuc.blog.bean.ArticleInfoExample;
import cbuc.blog.mapper.ArticleInfoMapper;
import cbuc.blog.utils.baseenum.StatusEnum;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Explain: 文章信息处理器
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

    public List<ArticleInfo> queryList(String title,String cgid,String keyword) {
        ArticleInfoExample example = new ArticleInfoExample();
        ArticleInfoExample.Criteria criteria = example.createCriteria().andStatusNotEqualTo(StatusEnum.D.getStatus());
        if (StringUtils.isNotBlank(title)) {
            criteria.andTitleLike("%" + title + "%");
        }
        if (StringUtils.isNotBlank(cgid)) {
            criteria.andCgIdLike("%"+cgid+"%");
        }
        if (StringUtils.isNotBlank(keyword)&&!keyword.equals("undefined")) {
            criteria.andTitleLike("%" + keyword + "%");
            example.or().andTagLike("%" + keyword + "%");
        }
        example.setOrderByClause("isTop desc, id desc");
        return articleInfoMapper.selectByExample(example);
    }

    public ArticleInfo queryDeteil(Long id) {
        return articleInfoMapper.selectByPrimaryKey(id);
    }

    public int doMod(ArticleInfo articleInfo) {
        return articleInfoMapper.updateByPrimaryKeySelective(articleInfo);
    }

    public List<Map<String, Object>> queryBlogData(String Time) {
        String year = Time.split("-")[0];
        String month = Time.split("-")[1];
        Calendar a = Calendar.getInstance();
        a.set(Calendar.YEAR, Integer.parseInt(year));
        a.set(Calendar.MONTH, Integer.parseInt(month) - 1);
        a.set(Calendar.DATE, 1);
        a.roll(Calendar.DATE, -1);
        int maxDate = a.get(Calendar.DATE);
        String beginTime = Time + "-01";
        String endTime = Time + "-" + maxDate;
        List<Map<String, Object>> datas = articleInfoMapper.queryBlogData(beginTime, endTime);
        int index = 0;
        if (datas.isEmpty()) {
            for (int i = 1; i <= maxDate; i++) {
                String date = month + "-" + (i < 10 ? "0" + i : i);
                Map<String, Object> data = new HashMap<>();
                data.put("name", date);
                data.put("value", 0);
                datas.add(data);
            }
        }
        for (int i = 1; i <= maxDate; i++) {
            String date = month + (i < 10 ? "-0" + i : "-" + i);
            for (Map<String, Object> map : datas) {
                if (i < Integer.parseInt(map.get("name").toString().split("-")[1])) {
                    Map<String, Object> data = new HashMap<>();
                    data.put("name", date);
                    data.put("value", 0);
                    datas.add(index, data);
                    index++;
                    break;
                } else if (i == Integer.parseInt(map.get("name").toString().split("-")[1])) {
                    index++;
                    break;
                }
            }
        }
        int max = Integer.parseInt(datas.get(datas.size() - 1).get("name").toString().split("-")[1]);
        for (int i = max + 1; i <= maxDate; i++) {
            String date = month + "-" + (i < 10 ? "0" + i : i);
            Map<String, Object> data = new HashMap<>();
            data.put("name", date);
            data.put("value", 0);
            datas.add(data);
        }
        return datas;
    }

    public long queryTotal() {
        ArticleInfoExample articleInfoExample = new ArticleInfoExample();
        articleInfoExample.createCriteria().andStatusNotEqualTo(StatusEnum.D.getStatus());
        return articleInfoMapper.countByExample(articleInfoExample);
    }

    public Integer queryArticleNum(Long id) {
        String key = "%" + id + "%";
        return articleInfoMapper.queryArticleNum(key);
    }

    public int doLike(Integer count, String aiId) {
        return articleInfoMapper.doLike(count,aiId);
    }

    public int addAccessCount(Long id) {
        return articleInfoMapper.addAccessCount(id);
    }

    public List<ArticleInfo> getHotBlogs() {
        return articleInfoMapper.getHotBlogs();
    }

}
