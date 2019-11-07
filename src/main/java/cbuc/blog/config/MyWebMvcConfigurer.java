package cbuc.blog.config;

import cbuc.blog.interceptor.AdminInterceptor;
import cbuc.blog.interceptor.LogInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.nio.charset.Charset;

/**
 * @Explain:  web配置类
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/6
 */
@Configuration
public class MyWebMvcConfigurer implements WebMvcConfigurer{

    @Autowired
    private LogInterceptor logInterceptor;

    @Autowired
    private AdminInterceptor adminInterceptor;

    @Bean
    public HttpMessageConverter<String> responseBodyConverter() {
        StringHttpMessageConverter converter = new StringHttpMessageConverter(Charset.forName("UTF-8"));
        return converter;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(logInterceptor).addPathPatterns("/**").excludePathPatterns("/js/**", "/css/**", "/img/**","/plugins/**","/vendor/**","/error/**");
        registry.addInterceptor(adminInterceptor).addPathPatterns("/admin/**").excludePathPatterns("/toLogin", "/admin/login");
    }
}
