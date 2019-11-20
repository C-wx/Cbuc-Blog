package cbuc.blog.utils.schedule;

import cbuc.blog.bean.Log;
import cbuc.blog.evt.LogEvt;
import cbuc.blog.service.LogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Explain: 操作日志定时器
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/19
 */
@Slf4j
@Component
public class LogSchedule {

    @Autowired
    private LogEvt logEvt;

    @Autowired
    private LogService logService;

    @Scheduled(cron = "*/10 * * * * ?")
    public void getLog() {
        List<Log> logger = logService.getLog();
        if (!logEvt.getLogMap().isEmpty()) {
            logEvt.getLogMap().clear();
        }
        logEvt.getLogMap().put("log",logger);
        log.info("{}",logEvt.getLogMap());
    }

}
