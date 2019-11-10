package cbuc.blog.mapper;

import cbuc.blog.bean.Bulletin;
import cbuc.blog.bean.BulletinExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BulletinMapper {
    long countByExample(BulletinExample example);

    int deleteByExample(BulletinExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Bulletin record);

    int insertSelective(Bulletin record);

    List<Bulletin> selectByExampleWithBLOBs(BulletinExample example);

    List<Bulletin> selectByExample(BulletinExample example);

    Bulletin selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Bulletin record, @Param("example") BulletinExample example);

    int updateByExampleWithBLOBs(@Param("record") Bulletin record, @Param("example") BulletinExample example);

    int updateByExample(@Param("record") Bulletin record, @Param("example") BulletinExample example);

    int updateByPrimaryKeySelective(Bulletin record);

    int updateByPrimaryKeyWithBLOBs(Bulletin record);

    int updateByPrimaryKey(Bulletin record);
}