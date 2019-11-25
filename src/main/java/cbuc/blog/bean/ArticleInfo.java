package cbuc.blog.bean;

import lombok.Data;

import java.util.Date;

@Data
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
    /**------------------------*/
}