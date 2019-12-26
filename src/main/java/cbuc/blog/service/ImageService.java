package cbuc.blog.service;

import cbuc.blog.bean.Image;
import cbuc.blog.mapper.ImageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Explain:
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/12/26
 */
@Service
public class ImageService {

    @Autowired
    private ImageMapper imageMapper;


    public int doAdd(Image image) {
        return imageMapper.insertSelective(image);
    }
}
