package cbuc.blog.exception;

/**
 * @Explain:  自定义缓存
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/6
 */
public class MyException extends RuntimeException {
    public MyException() {
    }

    public MyException(String message) {
        super(message);
    }

    public MyException(String message, Throwable cause) {
        super(message, cause);
    }

    public MyException(Throwable cause) {
        super(cause);
    }
}
