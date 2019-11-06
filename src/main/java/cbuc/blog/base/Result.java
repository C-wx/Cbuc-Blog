package cbuc.blog.base;

import lombok.Data;

/**
 * @Explain 页面返回的json对象
 * @Author Cbuc
 * @Version 1.0
 * @Date 2019/10/30
 */
@Data
public class Result<T> {
    private Integer code;
    private String msg;
    private T data;

    public static Result error(String s) {
        Result result = new Result();
        result.setCode(501);
        result.setMsg(s);
        return result;
    }
    public static Result error() {
        Result result = new Result();
        result.setCode(501);
        result.setMsg("服务器异常!");
        return result;
    }

    public static <T> Result success(T t) {
        Result result = new Result();
        result.setCode(200);
        result.setMsg("请求成功!");
        result.setData(t);
        return result;
    }

    public static Result success(String s) {
        Result result = new Result();
        result.setCode(200);
        result.setMsg(s);
        return result;
    }

    public static Result success() {
        Result result = new Result();
        result.setCode(200);
        result.setMsg("请求成功!");
        return result;
    }
}
