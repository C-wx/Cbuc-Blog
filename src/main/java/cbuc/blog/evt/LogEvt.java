package cbuc.blog.evt;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * @Explain:   操作日志缓存容器
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/19
 */
@Component
@Data
public class LogEvt {
    volatile Map<String,Object> logMap = new HashMap<>();
    volatile Map<String,Object> coutMap = new HashMap<>();
}
