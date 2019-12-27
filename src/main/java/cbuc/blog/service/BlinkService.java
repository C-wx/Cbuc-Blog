package cbuc.blog.service;

import cbuc.blog.bean.Blink;
import cbuc.blog.bean.BlinkExample;
import cbuc.blog.mapper.BlinkMapper;
import cbuc.blog.utils.baseenum.StatusEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @Explain:
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/12/26
 */
@Service
public class BlinkService {

    @Autowired
    private BlinkMapper blinksMapper;


    public int doAdd(Blink blink) {
        return blinksMapper.insertSelective(blink);
    }

    public List<Blink> queryList() {
        BlinkExample blinksExample = new BlinkExample();
        blinksExample.createCriteria().andStatusNotEqualTo(StatusEnum.D.getStatus());
        blinksExample.setOrderByClause("CREATE_TIME DESC");
        return blinksMapper.selectByExample(blinksExample);
    }

    public int doLike(Integer count, String id) {
        Blink blink = new Blink();
        blink.setLikeCount(count);
        blink.setId(Long.valueOf(id));
        return blinksMapper.updateByPrimaryKeySelective(blink);
    }
}
