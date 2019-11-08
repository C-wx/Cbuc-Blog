package cbuc.blog.service;

import cbuc.blog.bean.Contact;
import cbuc.blog.bean.ContactExample;
import cbuc.blog.exception.MyException;
import cbuc.blog.mapper.ContactMapper;
import cbuc.blog.utils.baseenum.StatusEnum;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: Cbuc-Blog
 * @Package: cbuc.blog.service
 * @ClassName: ContactService
 * @ClassDesp: ${...}
 * @Author: Cbuc
 * @Date: 2019/10/31
 */
@Service
public class ContactService {

    @Autowired
    private ContactMapper contactMapper;

    public void doAdd(Contact contact) {
        int result = contactMapper.insertSelective(contact);
        if (result < 1) {
            throw new MyException("新增留言异常");
        }
    }

    public List<Contact> queryList(String commentKeyWard, String nameKeyword) {
        ContactExample contactExample = new ContactExample();
        ContactExample.Criteria contactExampleCriteria = contactExample.createCriteria();
        if (StringUtils.isNotBlank(commentKeyWard)) {
            contactExampleCriteria.andMessageLike("%"+commentKeyWard+"%");
        }
        if (StringUtils.isNotBlank(nameKeyword)) {
            contactExampleCriteria.andNameLike("%"+nameKeyword+"%");
        }
        return contactMapper.selectByExample(contactExample);
    }

    public Long queryCount() {
        ContactExample contactExample = new ContactExample();
        contactExample.createCriteria().andStatusNotEqualTo(StatusEnum.D.getStatus());
        return contactMapper.countByExample(contactExample);
    }

    public int modStatus(Long id, String status) {
        Contact contact = new Contact();
        contact.setStatus(status);
        contact.setId(id);
        return contactMapper.updateByPrimaryKeySelective(contact);
    }
}
