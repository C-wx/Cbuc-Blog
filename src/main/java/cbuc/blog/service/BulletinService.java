package cbuc.blog.service;

import cbuc.blog.bean.Bulletin;
import cbuc.blog.bean.BulletinExample;
import cbuc.blog.mapper.BulletinMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Explain:
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/10
 */
@Service
public class BulletinService {

    @Autowired
    private BulletinMapper bulletinMapper;

    public List<Bulletin> queryList() {
        BulletinExample bulletinExample = new BulletinExample();
        bulletinExample.setOrderByClause("CREATE_TIME desc");
        return bulletinMapper.selectByExampleWithBLOBs(bulletinExample);
    }
}
