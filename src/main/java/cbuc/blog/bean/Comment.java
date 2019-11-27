package cbuc.blog.bean;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
    private Long id;

    private Long parentId;

    private String type;

    private String loginIp;

    private String content;

    private Integer likeCount;

    private Integer commentCount;

    private Date createTime;

    private String status;

    private String def1;

    private String def2;

    private String def3;

    /**--------非表字段------------*/
    private String detail;
    /**---------------------------*/
}