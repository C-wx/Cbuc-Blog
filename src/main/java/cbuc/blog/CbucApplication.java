package cbuc.blog;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement  // 启注解事务管理，等同于xml配置方式的 <tx:annotation-driven />
@SpringBootApplication
public class CbucApplication {

    public static void main(String[] args) {
        SpringApplication.run(CbucApplication.class, args);
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Cbuc博客启动完成<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
    }

}
