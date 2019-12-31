package cbuc.blog.mapper;

import cbuc.blog.bean.Image;
import cbuc.blog.bean.ImageExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ImageMapper {
    long countByExample(ImageExample example);

    int deleteByExample(ImageExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Image record);

    int insertSelective(Image record);

    List<Image> selectByExample(ImageExample example);

    Image selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Image record, @Param("example") ImageExample example);

    int updateByExample(@Param("record") Image record, @Param("example") ImageExample example);

    int updateByPrimaryKeySelective(Image record);

    int updateByPrimaryKey(Image record);
}