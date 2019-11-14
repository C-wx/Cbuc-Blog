package cbuc.blog.controller;

import cbuc.blog.evt.Upload;
import cbuc.blog.utils.BaseUtil;
import cbuc.blog.utils.UploadUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Objects;

/**
 * @Explain:    上传工具控制器
 * @Author: Cbuc
 * @Version: 1.0
 * @Date: 2019/11/13
 */
@Slf4j
@RestController
public class UploadController {
    private final HttpServletRequest request;

    private final String EDITOR_MD_FILE_NAME = "editormd-image-file";
    private final String LAY_UPLOADER_FILE_NAME = "file";

    public UploadController(HttpServletRequest request) {
        this.request = request;
    }


    @PostMapping("/upload")
    public Object upload(@RequestParam(value = LAY_UPLOADER_FILE_NAME, required = false) MultipartFile file, @RequestParam("reqType") String reqType) {
        try {
            String base64 = request.getParameter("base64");
            String GRAFFITI = "1";
            if (StrUtil.isNotEmpty(base64) && GRAFFITI.equals(base64)) {
                String base64Str = request.getParameter("img_base64_data");
                file = BaseUtil.base64ToMultipartFile(base64Str);
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("上传异常");
        }
        return Objects.requireNonNull(UploadUtil.upload(file,reqType));
    }


    @PostMapping("/upload/editorMD")
    public Object uploadEditorMd(@RequestParam(value = EDITOR_MD_FILE_NAME) MultipartFile file) {
        try {
            Upload upload = Objects.requireNonNull(UploadUtil.uploadIt(file));
            String visitUrl = upload.getVirtualPath();
            return MapUtil.of(new Object[][]{
                    {"success", 1}, {"message", "上传成功！"}, {"url", visitUrl}
            });
        } catch (IOException e) {
            log.error("editormd编辑器上传图片失败，错误信息：{}", e.getMessage());
            return MapUtil.of("success", 0);
        }
    }

}
