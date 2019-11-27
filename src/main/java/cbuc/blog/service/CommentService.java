package cbuc.blog.service;

import cbuc.blog.bean.ArticleInfo;
import cbuc.blog.bean.Comment;
import cbuc.blog.bean.CommentExample;
import cbuc.blog.mapper.CommentMapper;
import cbuc.blog.utils.baseenum.StatusEnum;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Explain:   评论处理器
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/18
 */
@Service
public class CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private ArticleInfoService articleInfoService;

    public List<Comment> queryList(String contentKeyWard, String nameKeyword) {
        CommentExample commentExample = new CommentExample();
        CommentExample.Criteria commmentExampleCriteria = commentExample.createCriteria();
        if (StringUtils.isNotBlank(contentKeyWard)) {
            commmentExampleCriteria.andContentLike("%"+contentKeyWard+"%");
        }
        if (StringUtils.isNotBlank(nameKeyword)) {
            commmentExampleCriteria.andLoginIpLike("%"+nameKeyword+"%");
        }
        commmentExampleCriteria.andStatusNotEqualTo(StatusEnum.D.getStatus());
        return commentMapper.selectByExample(commentExample);
    }

    public Comment queryDetail(Long id) {
        return commentMapper.selectByPrimaryKey(id);
    }

    public int doMod(Comment comment) {
        return commentMapper.updateByPrimaryKeySelective(comment);
    }

    public Comment queryLast() {
        Comment comment = commentMapper.queryLast();
        ArticleInfo articleInfo = articleInfoService.queryDeteil(comment.getParentId());
        comment.setDetail(articleInfo.getTitle());
        return comment;
    }

    public Integer queryNowday() {
        return commentMapper.queryNowday();
    }

    public Integer queryTotal() {
        return commentMapper.queryTotal();
    }

    public List<Comment> queryDetailList(Long id) {
        CommentExample commentExample = new CommentExample();
        commentExample.createCriteria().andParentIdEqualTo(id);
        commentExample.setOrderByClause("create_time desc");
        return commentMapper.selectByExample(commentExample);
    }

    public int doAdd(Comment comment) {
        return commentMapper.insertSelective(comment);
    }

    public int doLike(Integer count, String id) {
        return 0;
    }
}
