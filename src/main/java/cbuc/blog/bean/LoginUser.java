package cbuc.blog.bean;

import lombok.Data;

/**
 * @Explain:
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/5
 */
@Data
public class LoginUser {
    private String username;
    private String password;
    private String verifyCode;
}
