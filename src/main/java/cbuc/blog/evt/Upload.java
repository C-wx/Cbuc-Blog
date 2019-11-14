package cbuc.blog.evt;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @Explain   上传实体
 * @Author Cbuc
 * @Version 1.0
 * @Date 2019/11/13
 */
@Data
@Builder
public class Upload implements Serializable {

    private Long id;
    private String diskPath;
    private String virtualPath;
    private Date upload;
    private String type;
    private Long userId;
    private String articleId;
}
