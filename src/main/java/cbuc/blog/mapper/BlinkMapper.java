package cbuc.blog.mapper;

import cbuc.blog.bean.Blink;
import cbuc.blog.bean.BlinkExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BlinkMapper {
    long countByExample(BlinkExample example);

    int deleteByExample(BlinkExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Blink record);

    int insertSelective(Blink record);

    List<Blink> selectByExample(BlinkExample example);

    Blink selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Blink record, @Param("example") BlinkExample example);

    int updateByExample(@Param("record") Blink record, @Param("example") BlinkExample example);

    int updateByPrimaryKeySelective(Blink record);

    int updateByPrimaryKey(Blink record);
}