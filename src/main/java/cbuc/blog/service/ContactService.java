package cbuc.blog.service;

import cbuc.blog.bean.Contact;
import cbuc.blog.mapper.ContactMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    public int doAdd(Contact contact) {
        return contactMapper.insertSelective(contact);
    }
}
