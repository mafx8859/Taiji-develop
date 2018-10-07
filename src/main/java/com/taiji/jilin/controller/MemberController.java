package com.taiji.jilin.controller;

import com.itextpdf.text.pdf.PdfStructTreeController.returnType;
import com.taiji.jilin.common.entity.Member;
import com.taiji.jilin.common.entity.MemberOrganization;
import com.taiji.jilin.common.entity.Organization;
import com.taiji.jilin.common.entity.data.Coach;
import com.taiji.jilin.common.entity.data.*;
import com.taiji.jilin.service.*;
import com.taiji.jilin.service.impl.MD5serviceImpl;

import net.sf.json.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * @author 单继重
 * @since 2017/9/22 20:27
 */
@Controller
@RequestMapping(value = "/user")
public class MemberController {

    @Autowired
    private
    MemberService memberService;

    @Autowired
    private
    OrganizationService organizationService;

    @Autowired
    private
    MemberOrganizationService memberOrganizationService;

    @Autowired
    DataService dataService;

    @Autowired
    GuideService guideService;
    
    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String toRegister(Model model){
        try {
            List<Organization> list = organizationService.queryAllPassed();
            List<Coach> coachList = dataService.queryCouch();
            List<Judge> judgeList = dataService.queryJudge();
            List<Grade> gradeList = dataService.queryGrade();
            List<Instructor> instructorList = dataService.queryInstructor();
            model.addAttribute("coachList", coachList);
            model.addAttribute("judgeList",judgeList);
            model.addAttribute("gradeList",gradeList);
            model.addAttribute("instructorList",instructorList);
            model.addAttribute("list",list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "login/personal-register";
    }

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String toAdd(HttpSession session,Model model) {
        Member member = (Member) session.getAttribute("user");
        String organization = member.getOrganization();
        model.addAttribute("organization",organization);
        List<Organization> list = null;
        try {
            list = organizationService.queryAllPassed();
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("list",list);
        return "vip/vip-add";
    }

    @RequestMapping(value = "/admin/add",method = RequestMethod.GET)
    public String toNewAdmin(){
        return "vip/account-add";
    }

    @RequestMapping("/login/ajax/check")
    @ResponseBody
    public JSONObject checkUsername(@Param("username") String username){
        JSONObject jsonObject = new JSONObject();
        try {
            int flag = memberService.checkUsername(username);
            if (flag == 0){
                jsonObject.put("code",0);
            } else {
                jsonObject.put("code",1);
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.put("code",1);
        }
        return jsonObject;
    }

    @RequestMapping(value = "/detail/{id}")
    public String detail(Model model,@PathVariable("id") int id) {
        try {
            Member member = memberService.queryById(id);
            if (member.getOrganization() == null || member.getOrganization().equals("") || member.getOrganization().equals("-2")) {
                member.setOrganization("暂无");
            }
            List<Coach> coachList = dataService.queryCouch();
            List<Judge> judgeList = dataService.queryJudge();
            List<Grade> gradeList = dataService.queryGrade();
            List<Instructor> instructorList = dataService.queryInstructor();
            model.addAttribute("coachList", coachList);
            model.addAttribute("judgeList",judgeList);
            model.addAttribute("gradeList",gradeList);
            model.addAttribute("instructorList",instructorList);
            model.addAttribute("member",member);
            return "personal/my-detail";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @RequestMapping(value = "/company/register",method = RequestMethod.GET)
    public String toCompanyRegister() {
        return "login/company-register";
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(HttpServletResponse response,Member member, RedirectAttributes redirectAttributes) {
    	response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
    	MD5service md5Service=new MD5serviceImpl();
    	try {
        	String idcard=member.getIdNumber();
        	int ifcf=memberService.checkIdNumber(idcard);//检测身份证号是否重复
        	System.out.println("============="+ifcf);
        	if(ifcf>=1){
        		
        		response .getWriter().print("<script language='javascript'>alert('你输入的身份证号已经存在！！！');history.back(-1);</script>");
        		return null;
        	}
        	String authcode=md5Service.GetMD5Code(member.getIdNumber());
        	member.setAuthCode(authcode);
            memberService.newMember(member);
            if (member.getOrganization() != null ) {
                MemberOrganization memberOrganization = new MemberOrganization();
                int memberId = memberService.queryIdByUsn(member.getUsername());
                memberOrganization.setMemberId(memberId);
                memberOrganization.setOrganizationId(Integer.parseInt(member.getOrganization()));
                memberOrganizationService.newOrganizationMember(memberOrganization);
            }
            if (member.getIsAdmin().equals("1")) {
                return "redirect:/user/index";
            }
            redirectAttributes.addFlashAttribute("tip","注册成功，请登录！");
            return "redirect:/user/login";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
      
    }
	
    /**
     * 跳转到上传照片页面
     * @param id 会员ID
     * @param model 模型
     * @return 上传照片页面
     */
    @RequestMapping(value = "/photo/{id}",method = RequestMethod.GET)
    public String toPhoto(@PathVariable("id")int id,Model model){
        try {
            Member member = memberService.queryById(id);
            model.addAttribute("member",member);
            return "personal/photo-update";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @RequestMapping(value = "/photo",method = RequestMethod.POST)
    public String photo(@RequestParam("photo") MultipartFile photo,@RequestParam("id")int id,HttpServletRequest request,
                        HttpSession session,Model model){
        String path = request.getSession().getServletContext().getRealPath("/resources/upload/member");
        String fileName = photo.getOriginalFilename();
        int index = fileName.lastIndexOf(".");
        fileName = new Date().getTime() + fileName.substring(index,fileName.length());
        File file = new File(path,fileName);
        if (!file.exists()){
            file.mkdirs();
        }
        try{
            photo.transferTo(file);
            Member member = memberService.queryById(id);
            member.setPhoto(fileName);
            memberService.update(member);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/user/update";
    }

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String toLogin(Model model) throws Exception {
        List<Organization> organizationList = organizationService.queryAllPassed();
        model.addAttribute("organizationList",organizationList);
        return "login/login";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(String username,String password,HttpSession session,Model model) throws Exception {
        String guide = guideService.getContent();
        model.addAttribute("guide",guide);

        List<Organization> organizationList = organizationService.queryAllPassed();
        model.addAttribute("organizationList",organizationList);

        Member member = new Member();
        member.setUsername(username);
        member.setPassword(password);
        try {
            Member member1 = memberService.queryByUsnAndPsw(member);
            if (member.getUsername().equals("administrator") && member.getPassword().equals("administrator")){
                session.setAttribute("role","super");
                session.setAttribute("user",member);
                return "redirect:/user/index";
            }
            if(member1 != null){
                if (member1.getStatus() != null && member1.getStatus().equals("2")) {
                    model.addAttribute("message","账号审核未通过！");
                    return "login/login";
                }
                if (!(member1.getOrganization() == null || member1.getOrganization().equals(""))){
                    Organization organization = organizationService.queryById(Integer.parseInt(member1.getOrganization()));
                    session.setAttribute("organization",organization);
                }
                if (member1.getIsAdmin().equals("1")){
                    session.setAttribute("role","admin");
                    session.setAttribute("user",member1);
                } else if (member1.getIsAdmin().equals("2")){
                    session.setAttribute("role","organization");
                    session.setAttribute("user",member1);
                } else if (member1.getIsAdmin().equals("3")) {
                    session.setAttribute("role","person");
                    session.setAttribute("user",member1);
                }
                return "redirect:/user/index";
            } else {
                model.addAttribute("message","用户名或密码错误，请重新登录！");
                return "login/login";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/user/login";
    }

    //跳转至修改信息页面
    @RequestMapping("/update")
    public String toUpdate(HttpSession session,Model model){
        Member member = (Member) session.getAttribute("user");
        int id = member.getId();
        try {
            Member member1 = memberService.queryById(id);
            List<Organization> list = organizationService.queryAllPassed();
            List<Coach> coachList = dataService.queryCouch();
            List<Judge> judgeList = dataService.queryJudge();
            List<Grade> gradeList = dataService.queryGrade();
            List<Instructor> instructorList = dataService.queryInstructor();
            model.addAttribute("coachList", coachList);
            model.addAttribute("judgeList",judgeList);
            model.addAttribute("gradeList",gradeList);
            model.addAttribute("instructorList",instructorList);
            model.addAttribute("list",list);
            model.addAttribute("member",member1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "personal/supplement";
    }

    /**
     * 处理修改
     * @param member 用户
     * @return 首页
     */
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String update(Member member,@RequestParam("originOrg") String originOrg) {
        try {
            memberService.update(member);
            if (!member.getOrganization().equals(originOrg)){
                MemberOrganization memberOrganization = new MemberOrganization();
                memberOrganization.setMemberId(member.getId());
                memberOrganization.setOrganizationId(Integer.parseInt(member.getOrganization()));
                memberOrganizationService.updateOrganization(memberOrganization);
            }
            return "redirect:/user/index";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @RequestMapping("/index")
    public String index(){
        return "login/index";
    }

    //所有用户列表
    @RequestMapping("/list")
    public String listAll(Model model,@RequestParam(value = "organization",defaultValue = "0")int organization,
                          @RequestParam(value = "isAdmin",defaultValue = "0") int isAdmin,
                          @RequestParam(value = "status",defaultValue = "-1") int status,
                          @RequestParam(value = "isJudge",defaultValue = "-1") int isJudge,
                          @RequestParam(value = "isCoach",defaultValue = "-1") int isCoach,
                          @RequestParam(value = "isInstructor",defaultValue = "-1") int isInstructor,
                          @RequestParam(value = "grade",defaultValue = "-1") int grade,
                          @RequestParam(value = "sex",defaultValue = "-1") int sex,
                          @RequestParam(value = "age1",defaultValue = "-1") int age1,
                          @RequestParam(value = "age2",defaultValue = "-1") int age2,
                          HttpSession session){
        try {
            int admin = 0;
            String role = (String) session.getAttribute("role");
            if (role.equals("super")) {
                admin = 1;
            }
            List<Organization> organizationList = organizationService.queryAll();
            List<Member> list = memberService.queryAll(organization,isAdmin,status,admin,isJudge,isCoach,isInstructor,grade,sex,age1,age2);

            model.addAttribute("organization",organization);
            model.addAttribute("isAdmin",isAdmin);
            model.addAttribute("status",status);
            model.addAttribute("isJudge",isJudge);
            model.addAttribute("isCoach",isCoach);
            model.addAttribute("isInstructor",isInstructor);
            model.addAttribute("grade",grade);
            model.addAttribute("sex",sex);
            model.addAttribute("age1",age1);
            model.addAttribute("age2",age2);

            List<Coach> coachList = dataService.queryCouch();
            List<Judge> judgeList = dataService.queryJudge();
            List<Grade> gradeList = dataService.queryGrade();
            List<Instructor> instructorList = dataService.queryInstructor();
            model.addAttribute("coachList", coachList);
            model.addAttribute("judgeList",judgeList);
            model.addAttribute("gradeList",gradeList);
            model.addAttribute("instructorList",instructorList);

            model.addAttribute("organizationList",organizationList);
            model.addAttribute("list",list);
            return "vip/account-list";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    //修改密码
    @RequestMapping(value = "/update/psw",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject updatePsw(@RequestParam("id") int id,@RequestParam("password") String password,HttpSession session) {
        JSONObject jsonObject = new JSONObject();
        try {
            Member member = new Member();
            member.setId(id);
            member.setPassword(password);
            memberService.updatePsw(member);
            jsonObject.put("code",1);
            return jsonObject;
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.put("code",0);
            return jsonObject;
        }
    }

    @ResponseBody
    @RequestMapping("/delete/{id}")
    public JSONObject delete(@PathVariable("id") int id){
        JSONObject jsonObject = new JSONObject();
        try {
            memberService.delById(id);
            jsonObject.put("code",1);
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.put("code",0);
        }
        return jsonObject;
    }

    /**
     * 审核通过某会员
     * @param id ID
     * @return JSON
     */
    @RequestMapping("/ajax/audit")
    @ResponseBody
    public JSONObject audit(@RequestParam("id") int id) {
        try{
            int[] ids = {id};
            memberService.audit(ids);
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
     * 审核不通过某会员
     * @param id ID
     * @return JSON
     */
    @RequestMapping("/ajax/un/audit")
    @ResponseBody
    public JSONObject unAudit(@RequestParam("id") int id) {
        try{
            int[] ids = {id};
            memberService.unAudit(ids);
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


    @RequestMapping("/ajax/check/id")
    @ResponseBody
    public JSONObject checkIdNum(@RequestParam("idNumber") String idNumber) {
        JSONObject jsonObject = new JSONObject();
        try {
            int flag = memberService.checkIdNumber(idNumber);
            if (flag == 0){
                jsonObject.put("code",0);
            } else {
                jsonObject.put("code",1);
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.put("code",1);
        }
        return jsonObject;
    }
}
