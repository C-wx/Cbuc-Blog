package cbuc.blog.service;

import cbuc.blog.bean.Blinks;
import cbuc.blog.mapper.BlinksMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Explain:
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/12/26
 */
@Service
public class BlinkService {

    @Autowired
    private BlinksMapper blinksMapper;


    public int doAdd(Blinks blinks) {
        return blinksMapper.insertSelective(blinks);
    }
}
