package cbuc.blog.service;

import cbuc.blog.bean.View;
import cbuc.blog.exception.MyException;
import cbuc.blog.mapper.ViewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Explain:    访问量处理器
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/6
 */
@Service
public class ViewService {

    @Autowired
    private ViewMapper viewMapper;

    public int addView(View view) {
        int result = viewMapper.insertSelective(view);
        if (result < 1) {
            throw new MyException("增加访问量异常");
        }else {
            return result;
        }
    }

}
