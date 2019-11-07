package cbuc.blog.service;

import cbuc.blog.bean.Log;
import cbuc.blog.exception.MyException;
import cbuc.blog.mapper.LogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Explain:  操作日志处理器
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/6
 */
@Service
public class LogService {

    @Autowired
    private LogMapper logMapper;

    public int addLog(Log log) {
        int result = logMapper.insertSelective(log);
        if (result < 1) {
            throw new MyException("增加操作日志异常");
        }else {
            return result;
        }
    }

    public void clean() {
        int result = logMapper.deleteByExample(null);
        if (result < 1) {
            throw new MyException("清除日志异常");
        }
    }
}
