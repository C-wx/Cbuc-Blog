package cbuc.blog.utils.schedule;

import cbuc.blog.exception.MyException;
import cbuc.blog.service.LogService;
import cbuc.blog.utils.CacheUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @Explain:   缓存定时任务
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/6
 */
@Slf4j
@Component
public class ClearSchedule {

    @Autowired
    private CacheUtil cacheUtil;

    private LogService logService;

    /**
     * 每天清理缓存数据
     */
    @Scheduled(cron = "0 0 0 1/1 * ? ")
    public void clearCache() {
        cacheUtil.clean();
    }

    /**
     * 每天清理操作日志
     */
    @Scheduled(cron = "0 0 0 1/1 * ? ")
    public void clearLog() {
        try {
            logService.clean();
        } catch (Exception e) {
            if (e instanceof MyException) {
                log.error(e.getMessage()==null?"清除日志异常":e.getMessage(),e);
            }
        }
    }
}
