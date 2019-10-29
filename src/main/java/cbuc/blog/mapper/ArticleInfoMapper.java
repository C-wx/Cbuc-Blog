package cbuc.blog.mapper;

import cbuc.blog.bean.ArticleInfo;
import cbuc.blog.bean.ArticleInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ArticleInfoMapper {
    long countByExample(ArticleInfoExample example);

    int deleteByExample(ArticleInfoExample example);

    int deleteByPrimaryKey(Long id);

    int insert(ArticleInfo record);

    int insertSelective(ArticleInfo record);

    List<ArticleInfo> selectByExample(ArticleInfoExample example);

    ArticleInfo selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") ArticleInfo record, @Param("example") ArticleInfoExample example);

    int updateByExample(@Param("record") ArticleInfo record, @Param("example") ArticleInfoExample example);

    int updateByPrimaryKeySelective(ArticleInfo record);

    int updateByPrimaryKey(ArticleInfo record);
}