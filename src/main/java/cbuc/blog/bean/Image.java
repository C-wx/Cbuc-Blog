package cbuc.blog.bean;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Image {
    private Long id;

    private Long parentId;

    private String url;

    private Date createTime;

    private Date updateTime;

    private String def1;

    private String def2;

    private String def3;
}