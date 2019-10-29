package cbuc.blog.mapper;

import cbuc.blog.bean.Contact;
import cbuc.blog.bean.ContactExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ContactMapper {
    long countByExample(ContactExample example);

    int deleteByExample(ContactExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Contact record);

    int insertSelective(Contact record);

    List<Contact> selectByExample(ContactExample example);

    Contact selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Contact record, @Param("example") ContactExample example);

    int updateByExample(@Param("record") Contact record, @Param("example") ContactExample example);

    int updateByPrimaryKeySelective(Contact record);

    int updateByPrimaryKey(Contact record);
}