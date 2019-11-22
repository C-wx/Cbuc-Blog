package cbuc.blog.interceptor;

import cbuc.blog.bean.Log;
import cbuc.blog.bean.View;
import cbuc.blog.evt.LogEvt;
import cbuc.blog.service.LogService;
import cbuc.blog.service.ViewService;
import cbuc.blog.utils.BrowserUtil;
import cbuc.blog.utils.IPutil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;

/**
 * @Explain: 操作日志拦截器
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/6
 */
@Service
public class LogInterceptor implements HandlerInterceptor {

    @Autowired
    private ViewService viewService;

    @Autowired
    private LogService logService;

    @Autowired
    private LogEvt logEvt;

    private Log log = new Log();
    private View view = new View();

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        /** 存放博文量/访问量 数据 */
        HttpSession session = request.getSession();
        session.setAttribute("accessCount",logEvt.getCoutMap().get("accessCount"));
        session.setAttribute("blogCount",logEvt.getCoutMap().get("blogCount"));

        //访问者IP
        String ipAddr = IPutil.getIpAddress(request);
        //访问者使用的浏览器
        String browser = BrowserUtil.getOsAndBrowserInfo(request);
        //访问地址
        String url = request.getRequestURL().toString();


        log.setAccessUrl(StringUtils.isBlank(url) ? "URL获取失败" : url);
        log.setLoginBrowser(StringUtils.isBlank(browser) ? "获取浏览器失败" : browser);
        log.setLoginIp(StringUtils.isBlank(ipAddr) ? "获取访问IP地址失败" : request.getRemoteAddr());
        view.setLoginIp(log.getLoginIp());
        viewService.addView(view);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            Method method = handlerMethod.getMethod();
            String url = request.getRequestURL().toString();
            // 保存日志信息
            log.setRemark(method.getName());
            logService.addLog(log);
        } else {
            String uri = request.getRequestURI();
            log.setRemark(uri);
            logService.addLog(log);
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
