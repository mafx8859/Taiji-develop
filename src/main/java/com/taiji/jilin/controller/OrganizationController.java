package com.taiji.jilin.controller;

import com.taiji.jilin.common.entity.Activity;
import com.taiji.jilin.common.entity.Member;
import com.taiji.jilin.common.entity.Organization;
import com.taiji.jilin.service.ActivityService;
import com.taiji.jilin.service.MemberService;
import com.taiji.jilin.service.OrganizationService;
import net.sf.json.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author 单继重
 * @since 2017/9/27 16:10
 */
@Controller
@RequestMapping(value = "/organization")
public class OrganizationController {

    @Autowired
    private OrganizationService organizationService;

    @Autowired
    private ActivityService activityService;

    @Autowired
    private MemberService memberService;

    @RequestMapping(value = "/new",method = RequestMethod.GET)
    public String toNew() {
        return "company/add";
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String newOrganization(Organization organization,RedirectAttributes redirectAttributes) {
        try {
            organizationService.newOrganization(organization);
            redirectAttributes.addFlashAttribute("tip","单位会员申请成功，请等待管理员审核！");
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    //到修改页
    @RequestMapping(value = "/update/{id}",method = RequestMethod.GET)
    public String toUpdate(Model model,@PathVariable("id") int id) {
        try {
            Organization organization = organizationService.queryById(id);
            List<Member> list = organizationService.listMembers(id);
            model.addAttribute("organization",organization);
            model.addAttribute("list",list);
            return "company/update";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    //处理修改
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String update(Organization organization) {
        try {
            organizationService.updateById(organization);
            if (!organization.getAdmin().equals("-1")){
                int memberId = Integer.parseInt(organization.getAdmin());
                Member member = memberService.queryDetail(memberId);
                member.setIsAdmin("2");
                memberService.update(member);
            }
            return "redirect:/organization/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    //单位列表
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String listOrganization(Model model) {
        try {
            List<Organization> list = organizationService.queryAll();
            model.addAttribute("list",list);
            return "company/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    //审核单位会员
    @RequestMapping("/check")
    public String listMember(Model model, HttpSession session) {
        List<Member> list = null;
        int organizationId = Integer.parseInt(((Member)session.getAttribute("user")).getOrganization());
        try {
            list = organizationService.listMembers(organizationId);
            model.addAttribute("memberList",list);
            return "/vip/vip-list";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    //跳转到详情页面
    @RequestMapping("/detail/{id}")
    public String detail(Model model, @PathVariable("id") int id){
        try {
            Organization organization = organizationService.queryById(id);
            model.addAttribute("organization",organization);
            return "company/detail";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    /**
     * 审核通过某单位
     * @param id ID
     * @return JSON
     */
    @RequestMapping("/ajax/audit")
    @ResponseBody
    public JSONObject audit(@RequestParam("id") int id) {
        try{
            organizationService.audit(id);
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
            organizationService.unAudit(id);
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

    //删除
    @RequestMapping("/delete/{id}")
    @ResponseBody
    public JSONObject delById(@PathVariable("id") int id) {
        try{
            organizationService.delById(id);
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

    //跳转到单位统一报名活动列表
    @RequestMapping("/activity/list")
    public String listActivity(Model model){
        try {
            List<Activity> activityList = activityService.queryAll();
            model.addAttribute("activityList",activityList);
            return "activity/vip-join";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
}
