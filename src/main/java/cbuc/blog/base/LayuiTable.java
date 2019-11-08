package cbuc.blog.base;

import java.io.Serializable;
import java.util.List;
/**
 * @Explain layui2.x版本推出的dataTable插件
 * @Author Cbuc
 * @Version 1.0
 * @Date 2019/11/7
 */
public class LayuiTable<T> implements Serializable {

    /**
     * 状态码，0代表成功，其它失败
     */
    private int code;
    /**
     * 状态信息，一般可为空
     */
    private String msg;
    /**
     * 数据总量
     */
    private long count;
    /**
     * 数据，字段是任意的。如：[{"id":1,"username":"贤心"}, {"id":2,"username":"佟丽娅"}]
     */
    private List<T> data;

    public LayuiTable(int code, String msg, long count, List<T> data) {
        this.code = code;
        this.msg = msg;
        this.count = count;
        this.data = data;
    }

    public LayuiTable(long count, List<T> data) {
        this.code = 0;
        this.msg = "获取数据成功！";
        this.count = count;
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }


}
