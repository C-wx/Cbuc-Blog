package cbuc.blog.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

/**
 * @ProjectName: Cbuc-Blog
 * @Package: cbuc.blog.config
 * @ClassName: DruidConfig
 * @ClassDesp: Druid数据源配置
 * @Author: Cbuc
 * @Date: 2019/10/24
 */
@Configuration
public class DruidConfig {

    @ConfigurationProperties(prefix = "spring.datasource")	// 用来扫描配置文件中前缀为spring.datasource的配置信息
    @Bean            //用来注册到配置容器中
    public DataSource druid() {
        return new DruidDataSource();
    }

    //配置Druid的监控
    //配置一个管理后台的Servlet
    @Bean
    public ServletRegistrationBean statViewServlet() {
        ServletRegistrationBean servletRegistrationBean = new ServletRegistrationBean(new StatViewServlet(), "/druid/*");

        Map<String,String> initParam = new HashMap<>();
        initParam.put("loginUsername","admin");
        initParam.put("loginPassword","123456");
        initParam.put("allow","");  //默认就是允许所有访问
        initParam.put("deny","");		//默认访问

        servletRegistrationBean.setInitParameters(initParam);
        return  servletRegistrationBean;
    }

    //注册一个filters
    @Bean
    public FilterRegistrationBean druidStatFilter(){
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean(new WebStatFilter());
        //添加过滤规则.
        filterRegistrationBean.addUrlPatterns("/*");
        //添加不需要忽略的格式信息.
        filterRegistrationBean.addInitParameter("exclusions","*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*");
        return filterRegistrationBean;
    }
}
