package com.taiji.jilin.controller;

import com.taiji.jilin.common.dto.ApplicationMemberDto;
import com.taiji.jilin.common.entity.Activity;
import com.taiji.jilin.service.ActivityService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author 单继重
 * @since 2017/9/25 20:31
 */
@Controller
@RequestMapping(value = "/activity")
public class ActivityController {

    @Autowired
    ActivityService activityService;

    /**
     * 跳转到新增活动页面
     * @return 新增页面
     */
    @RequestMapping(value = "/new",method = RequestMethod.GET)
    public String toNew(Model model) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        String year = sdf.format(date);
        model.addAttribute("year",year);
        return "activity/add";
    }

    /**
     * 处理添加
     * @param activity 实体类
     * @return 添加成功页面
     */
    @RequestMapping(value = "/new",method = RequestMethod.POST)
    public String newActivity(Activity activity) {
        try {
            activityService.newActivity(activity);
            return "redirect:/activity/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    /**
     * 跳转到修改页面
     * @param id ID
     * @return 修改页面
     */
    @RequestMapping(value = "/update/{id}",method = RequestMethod.GET)
    public String toUpdate(@PathVariable("id") int id, Model model) {
        try {
            Activity activity = activityService.queryById(id);
            model.addAttribute("activity",activity);
            return "activity/update";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    /**
     * 处理修改
     * @param activity 活动实体类
     * @return 修改成功页面
     */
    @RequestMapping(value = "/update/{id}",method = RequestMethod.POST)
    public String update(@PathVariable("id")int id, Activity activity, Model model){
        try {
            activity.setId(id);
            activityService.updateById(activity);
            return "redirect:/activity/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    /**
     * 列表
     * @param model 模型
     * @return 列表页
     */
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String listAll(Model model){
        try {
            List<Activity> list = activityService.queryAll();
            model.addAttribute("list",list);
            return "activity/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    /**
     * 详情
     * @param id ID
     * @param model 模型
     * @return 详情页
     */
    @RequestMapping(value = "/detail/{id}")
    public String detail(@PathVariable("id") int id,Model model) {
        try {
            Activity activity = activityService.queryById(id);
            model.addAttribute("activity",activity);
            return "activity/detail";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    /**
     * 某活动所有人员审核
     * @param activityId 活动ID
     * @return 人员列表
     */
    @RequestMapping("/check/{id}")
    public String checkMembers(@PathVariable("id")int activityId,Model model,@RequestParam(value = "meal",defaultValue = "-1") int meal,
                               @RequestParam(value = "hotel",defaultValue = "-1") int hotel) {
        try {
            List<ApplicationMemberDto> memberList = activityService.queryByActivityId(activityId,meal,hotel);
            Activity activity = activityService.queryById(activityId);
            model.addAttribute("list",memberList);
            model.addAttribute("activity",activity);
            return "activity/check";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    /**
     * 审核通过某活动
     * @param id ID
     * @return JSON
     */
    @RequestMapping("/ajax/audit")
    @ResponseBody
    public JSONObject audit(@RequestParam("id") int id) {
        try{
            activityService.audit(id);
            JSONObject json = new JSONObject();
            json.put("code",1);
            return json;
        } catch (Exception e) {
            e.printStackTrace();
            JSONObject json = new JSONObject();
            json.put("code",0);
            return json;
        }
    }

    /**
     * 审核不通过某活动
     * @param id ID
     * @return JSON
     */
    @RequestMapping("/ajax/un/audit")
    @ResponseBody
    public JSONObject unAudit(@RequestParam("id") int id) {
        try{
            activityService.unAudit(id);
            JSONObject json = new JSONObject();
            json.put("code",1);
            return json;
        } catch (Exception e) {
            e.printStackTrace();
            JSONObject json = new JSONObject();
            json.put("code",0);
            return json;
        }
    }

    @ResponseBody
    @RequestMapping("/delete/{id}")
    public JSONObject delete(@PathVariable("id") int id){
        JSONObject jsonObject = new JSONObject();
        try {
            activityService.delById(id);
            jsonObject.put("code",1);
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.put("code",0);
        }
        return jsonObject;
    }

    /**
     * 跳转到上传证书页面
     * @param model 模型
     * @param id 活动ID
     * @return 上传证书页面
     */
    @RequestMapping("/upload/{id}")
    public String toUpload(Model model,@PathVariable("id") int id) {
        try {
            Activity activity = activityService.queryById(id);
            model.addAttribute("activity",activity);
//            if (activity.getCertificate() != null && !activity.getCertificate().equals("")) {
//                return "activity/preview";
//            } else {
                return "activity/upload";
//            }
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    public String upload(@RequestParam("whoCertificate")String whoCertificate, Model model , @RequestParam("permit") MultipartFile certificate, HttpServletRequest request, @RequestParam("id")int id) throws Exception {
        Activity activity = activityService.queryById(id);
        String path = request.getSession().getServletContext().getRealPath("/resources/upload/permit");
        String fileName = certificate.getOriginalFilename();
        int index = fileName.lastIndexOf(".");
        fileName = activity.getName() + fileName.substring(index,fileName.length());
        File file = new File(path,fileName);
        if (!file.exists()){
            file.mkdirs();
        }
        try{
            certificate.transferTo(file);
            activity.setCertificate(fileName);
            activity.setWhoCertificate(whoCertificate);
            activityService.updateCertificate(activity);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return this.toUpload(model,id);
    }

    /**
     * 修改证书下载权限
     * @param activity
     * @param model
     * @return
     */
    @RequestMapping("/authority")
    public String updateAuthority(Activity activity,Model model) {
        try {
            activityService.updateCertificate(activity);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return this.toUpload(model,activity.getId());
    }

    @RequestMapping("/permit")
    public String updatePermit(Activity activity ,Model model) {
        try{
            activityService.updatePermit(activity);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return this.toUpload(model,activity.getId());
    }

    @RequestMapping(value = "/permit/upload",method = RequestMethod.POST)
    public String uploadPermit(@RequestParam("whoPermit")String whoPermit, Model model , @RequestParam("permit") MultipartFile permit, HttpServletRequest request, @RequestParam("id")int id) throws Exception {
        Activity activity = activityService.queryById(id);
        String path = request.getSession().getServletContext().getRealPath("/resources/upload/permit");
        String fileName = permit.getOriginalFilename();
        int index = fileName.lastIndexOf(".");
        fileName = activity.getName() + fileName.substring(index,fileName.length());
        File file = new File(path,fileName);
        if (!file.exists()){
            file.mkdirs();
        }
        try{
            permit.transferTo(file);
            activity.setPermit(fileName);
            activity.setWhoPermit(whoPermit);
            activityService.updatePermit(activity);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return this.toUpload(model,id);
    }
}
