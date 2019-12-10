package cbuc.blog.service;

import cbuc.blog.bean.User;
import cbuc.blog.bean.UserExample;
import cbuc.blog.mapper.UserMapper;
import cbuc.blog.utils.baseenum.StatusEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Explain:
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/12/7
 */
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public int doAdd(User user) {
        return userMapper.insertSelective(user);
    }

    public User getDetail(User user) {
        UserExample userExample = new UserExample();
        userExample.createCriteria()
                .andUserNameEqualTo(user.getUserName())
                .andPasswordEqualTo(user.getPassword())
                .andStatusEqualTo(StatusEnum.E.getStatus());
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andPhoneEqualTo(user.getUserName())
                .andPasswordEqualTo(user.getPassword())
                .andStatusEqualTo(StatusEnum.E.getStatus());
        userExample.or(criteria);
        return userMapper.selectByExample(userExample).get(0);
    }

    public int getOneByName(String userName) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUserNameEqualTo(userName);
        return userMapper.selectByExample(userExample).size();
    }

    public int isRight(User user) {
        UserExample userExample = new UserExample();
        userExample.createCriteria()
                .andUserNameEqualTo(user.getUserName())
                .andQuestionEqualTo(user.getQuestion())
                .andAnswerEqualTo(user.getAnswer());
        return userMapper.selectByExample(userExample).size();
    }

    public int updatePwd(User user) {
        UserExample example = new UserExample();
        example.createCriteria().andUserNameEqualTo(user.getUserName());
        return userMapper.updateByExampleSelective(user, example);
    }
}
