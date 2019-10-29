package cbuc.blog.mapper;

import cbuc.blog.bean.View;
import cbuc.blog.bean.ViewExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ViewMapper {
    long countByExample(ViewExample example);

    int deleteByExample(ViewExample example);

    int deleteByPrimaryKey(Long id);

    int insert(View record);

    int insertSelective(View record);

    List<View> selectByExample(ViewExample example);

    View selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") View record, @Param("example") ViewExample example);

    int updateByExample(@Param("record") View record, @Param("example") ViewExample example);

    int updateByPrimaryKeySelective(View record);

    int updateByPrimaryKey(View record);
}