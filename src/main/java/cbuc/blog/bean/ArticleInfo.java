package cbuc.blog.bean;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ArticleInfo {
    private Long id;

    private Long acId;

    private String cgId;

    private String title;

    private String summary;

    private String istop;

    private Integer likeCount;

    private Integer accessCount;

    private Integer commentCount;

    private String editor;

    private String tag;

    private Date createTime;

    private Date updateTime;

    private String status;

    private String def1;

    private String def2;

    private String def3;

    /**---------非表字段---------*/
    private ArticleContent articleContent;

    private Boolean isNew;

    private List<Comment> comments;
    /**------------------------*/
}