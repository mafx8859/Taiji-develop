package com.taiji.jilin.controller;

import com.taiji.jilin.service.GuideService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * @author 单继重
 * @since 2018/3/16 15:43
 */
@Controller
@RequestMapping("/guide")
public class GuideController {
    @Autowired
    GuideService guideService;

    @RequestMapping(value = "preview" ,method = RequestMethod.GET)
    public String preview(Model model) throws Exception {
        String guide = guideService.getContent();
        model.addAttribute("guide",guide);
        return "userguide/preview-guide";
    }

    @RequestMapping(value = "/update",method = RequestMethod.GET)
    public String toUpdate(Model model) throws Exception {
        String content;
        if (guideService.isExist()){
            content = guideService.getContent();
        } else {
            content = "";
        }
        model.addAttribute("content",content);
        return "userguide/guide";
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String update(String content, Model model, @RequestParam("guide") MultipartFile guide, HttpServletRequest request) throws Exception {
        String path = request.getSession().getServletContext().getRealPath("/resources/upload/guide");
        String fileName = guide.getOriginalFilename();
        int index = fileName.lastIndexOf(".");
        String suffix = fileName.substring(index,fileName.length());
        UUID uuid = UUID.randomUUID();
        fileName = uuid.toString() + suffix;
        File file = new File(path,fileName);
        if (!file.exists()) {
            file.mkdirs();
        }
        guide.transferTo(file);
        content = fileName;
        if (guideService.isExist()){
            guideService.update(content);
        } else {
            guideService.newContent(content);
        }
        return "redirect:/guide/update";
    }
}
