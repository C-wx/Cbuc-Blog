package cbuc.blog;

import cbuc.blog.service.LogService;
import cbuc.blog.service.ViewService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CbucApplicationTests {
    public CbucApplicationTests() {
    }

    @Autowired
    LogService logService;

    @Autowired
    ViewService viewService;
    /**
     * @Explain 清除日志/访问记录
     */
    @Test
    public void clearLog() {
        logService.clean();
        viewService.clean();
    }
}
