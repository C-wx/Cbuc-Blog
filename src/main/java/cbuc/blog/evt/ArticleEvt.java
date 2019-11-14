package cbuc.blog.evt;

import lombok.Data;

/**
 * @Explain:    新建文章实体
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/14
 */
@Data
public class ArticleEvt {
    private String title;
    private String cover;
    private String editor;
    private String summary;
    private String mdContent;
    private String content;
    private String cateId;
    private String tagNames;
}
