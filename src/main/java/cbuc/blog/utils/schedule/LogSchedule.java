package cbuc.blog.utils.schedule;

import cbuc.blog.bean.Log;
import cbuc.blog.evt.LogEvt;
import cbuc.blog.service.ArticleInfoService;
import cbuc.blog.service.LogService;
import cbuc.blog.service.ViewService;
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
    private ArticleInfoService articleInfoService;

    @Autowired
    private ViewService viewService;

    @Autowired
    private LogEvt logEvt;

    @Autowired
    private LogService logService;

    @Scheduled(cron = "* */20 * * * ?")
    public void getLog() {
        try {
            List<Log> logger = logService.getLog();
            if (!logEvt.getLogMap().isEmpty()) {
                logEvt.getLogMap().clear();
            }
            logEvt.getLogMap().put("log",logger);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获取日志异常");
        }
    }

    @Scheduled(cron = "* */20 * * * ?")
    public void getCount() {
        try {
            Integer accessCount = viewService.queryTotal();
            long blogCount = articleInfoService.queryTotal();
            if (!logEvt.getCoutMap().isEmpty()) {
                logEvt.getCoutMap().clear();
            }
            logEvt.getCoutMap().put("accessCount",accessCount);
            logEvt.getCoutMap().put("blogCount",blogCount);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获取主页数据异常");
        }
    }

}
