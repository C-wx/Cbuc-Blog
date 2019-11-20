package cbuc.blog.service;

import cbuc.blog.bean.Comment;
import cbuc.blog.bean.Contact;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * @Explain:    数据处理器
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/19
 */
@Service
public class DataService {

    @Autowired
    private CommentService commentService;

    @Autowired
    private ContactService contactService;

    @Autowired
    private ViewService viewService;

    public Map<String, Object> getLastData() {
        Map<String,Object> lastData = new HashMap<>();
        Comment comment = commentService.queryLast();
        Contact contact = contactService.queryLast();
        lastData.put("comment",comment);
        lastData.put("contact",contact);
        return lastData;
    }

    public Map<String,Object> getData(){
        Map<String,Object> dataMap = new HashMap<>();
        dataMap.put("commentNowday",commentService.queryNowday());
        dataMap.put("commentTotal",commentService.queryTotal());
        dataMap.put("contactNowday",contactService.queryNowday());
        dataMap.put("contactTotal",contactService.queryTotal());
        dataMap.put("viewNowday",viewService.queryNowday());
        dataMap.put("viewTotal",viewService.queryTotal());
        return dataMap;
    }

}
