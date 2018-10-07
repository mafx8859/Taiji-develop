package com.taiji.jilin.controller;

import com.taiji.jilin.common.dto.ApplicationMemberDto;
import com.taiji.jilin.common.dto.OrganizationApplyDto;
import com.taiji.jilin.common.entity.Activity;
import com.taiji.jilin.common.entity.Application;
import com.taiji.jilin.common.entity.Member;
import com.taiji.jilin.service.ActivityService;
import com.taiji.jilin.service.ApplicationService;
import com.taiji.jilin.service.MemberService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Description
 * @Author shanjz
 * @Time 2017/10/16 13:34
 */
@Controller
@RequestMapping(value = "/application")
public class ApplicationController {

    @Autowired
    private ApplicationService applicationService;

    @Autowired
    private ActivityService activityService;

    @Autowired
    private MemberService memberService;

    /**
     * 跳转至活动报名页面
     * @param id 活动ID
     * @param model 模型
     * @return 活动报名页面
     */
    @RequestMapping("/detail/{id}")
    public String detail(@PathVariable("id")int id, Model model) {
        try {
            Activity activity = activityService.queryById(id);
            model.addAttribute("activity",activity);
            return "personal/activity-join";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    /**
     * 报名某活动
     * @param application 报名情况
     * @return 成功页
     */
    @RequestMapping(value = "/sign/in",method = RequestMethod.POST)
    public String signIn(Application application){
        try {
            applicationService.newApplication(application);
            return "redirect:/personal/list2";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    /**
     * 取消报名某活动
     * @param id 报名情况ID
     * @return 未报名活动列表
     */
    @RequestMapping("/sign/out/{id}")
    public String signOut(@PathVariable("id") int id){
        try {
            applicationService.delById(id);
            return "redirect:/personal/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    /**
     * 跳转至单位统一报名页面
     * @param model 模型
     * @param session session
     * @param activityId 活动ID
     * @return 统一报名页面
     */
    @RequestMapping("/organization/{activityId}")
    public String listOrganization(Model model, HttpSession session,@PathVariable("activityId") int activityId){
        Member member = (Member) session.getAttribute("user");
        int organizationId = Integer.parseInt(member.getOrganization());
        try {
            List<ApplicationMemberDto> memberList = memberService.queryByOrganizationId(organizationId,activityId);
            Activity activity = activityService.queryById(activityId);
            model.addAttribute("activity",activity);
            model.addAttribute("memberList",memberList);
            return "activity/join-detail";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    //单位报名（单人）
    @RequestMapping("/ajax/sign/in")
    @ResponseBody
    public JSONObject singleApplication(Application application) {
        try {
            applicationService.newApplication(application);
            Application application1 = applicationService.queryByMemberAndActivity(application);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("code",1);
            jsonObject.put("applicationId",application1.getId());
            return jsonObject;
        } catch (Exception e) {
            e.printStackTrace();
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("code",0);
            return jsonObject;
        }
    }

    //单位报名（单人取消报名）
    @RequestMapping("/ajax/sign/out")
    @ResponseBody
    public JSONObject singleCancel(int applicationId) {
        try {
            applicationService.delById(applicationId);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("code",1);
            return jsonObject;
        } catch (Exception e) {
            e.printStackTrace();
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("code",0);
            return jsonObject;
        }
    }

    /**
     * 单位全体统一报名
     * @param organizationApplyDto 单位统一报名信息
     */
    @RequestMapping("/sign/all")
    public String organizationSignIn(OrganizationApplyDto organizationApplyDto){
        try {
            applicationService.organizationSignIn(organizationApplyDto);
            return "redirect:/application/organization/" + organizationApplyDto.getActivityId();
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    /**
     * 审核通过某报名
     * @param id ID
     * @return JSON
     */
    @RequestMapping("/ajax/audit")
    @ResponseBody
    public JSONObject audit(@RequestParam("id") int id) {
        try{
            applicationService.audit(id);
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
     * 审核不通过某报名
     * @param id ID
     * @return JSON
     */
    @RequestMapping("/ajax/un/audit")
    @ResponseBody
    public JSONObject unAudit(@RequestParam("id") int id) {
        try{
            applicationService.unAudit(id);
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
     * 打分
     * @param application 实体类
     * @return JSON
     */
    @RequestMapping(value = "/ajax/grade",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject grade(Application application) {
        JSONObject jsonObject = new JSONObject();
        try{
            applicationService.grade(application);
            jsonObject.put("code",1);
            return jsonObject;
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.put("code",0);
            return jsonObject;
        }
    }


    /**
     * 管理员直通报名
     * @param member 会员
     * @param activityId 活动ID
     * @return 报名成功
     */
    @RequestMapping("/admin")
    public String straightSignIn(Member member,Application application,@RequestParam("activityId") int activityId) {
        try {
            memberService.newMember(member);
            int memberId = memberService.queryIdByUsn(member.getUsername());
            application.setMemberId(memberId);
            application.setActivityId(activityId);
            applicationService.newApplication(application);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/activity/check/" + activityId;
    }
}
