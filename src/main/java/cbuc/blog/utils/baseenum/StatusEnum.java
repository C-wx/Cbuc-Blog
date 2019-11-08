package cbuc.blog.utils.baseenum;

/**
 * @Explain:
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/7
 */
public enum StatusEnum {
    D("D"),E("E");

    StatusEnum(String status) {
        this.status = status;
    }

    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
