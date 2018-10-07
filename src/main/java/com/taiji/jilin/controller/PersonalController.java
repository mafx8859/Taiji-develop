package com.taiji.jilin.controller;

import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.*;
import com.taiji.jilin.common.dto.ApplicationMemberDto;
import com.taiji.jilin.common.entity.Activity;
import com.taiji.jilin.common.entity.Application;
import com.taiji.jilin.common.entity.Member;
import com.taiji.jilin.service.ActivityService;
import com.taiji.jilin.service.ApplicationService;
import com.taiji.jilin.service.MemberService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Description
 * @Author shanjz
 * @Time 2017/10/11 20:28
 */
@Controller
@RequestMapping(value = "/personal")
public class PersonalController {

    @Autowired
    private
    ApplicationService applicationService;

    @Autowired
    private
    ActivityService activityService;

    @Autowired
    private MemberService memberService;

    /**
     * 未报名活动列表
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String list(HttpSession session,Model model) {
        try {
            Member member = (Member) session.getAttribute("user");
            int memberId = member.getId();
            List<ApplicationMemberDto> list = applicationService.listNotSignIn(memberId);
            for (int i = 0 ; i < list.size() ; i ++) {
                ApplicationMemberDto applicationMemberDto = list.get(i);
                Activity activity = activityService.queryById(applicationMemberDto.getActivityId());
                applicationMemberDto.setIsFinish(activity.getIsFinish());
                list.set(i,applicationMemberDto);
            }
            model.addAttribute("list",list);
            return "personal/activity-list";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    /**
     * 个人已报名活动列表
     * @param session session
     * @param model 模型
     * @return 页面
     */
    @RequestMapping("/list2")
    public String list2(HttpSession session,Model model) {
        try {
            Member member = (Member) session.getAttribute("user");
            int memberId = member.getId();
            List<ApplicationMemberDto> list = applicationService.listSignIn(memberId);
            for (int i = 0 ; i < list.size() ; i ++) {
                ApplicationMemberDto applicationMemberDto = list.get(i);
                Activity activity = activityService.queryById(applicationMemberDto.getActivityId());
                applicationMemberDto.setIsFinish(activity.getIsFinish());
                applicationMemberDto.setCertificate(activity.getCertificate());
                applicationMemberDto.setWhoCertificate(activity.getWhoCertificate());
                applicationMemberDto.setWhoPermit(activity.getWhoPermit());
                list.set(i,applicationMemberDto);
            }
            model.addAttribute("list",list);
            return "personal/activity-list2";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @RequestMapping("/certificate/{applicationId}")
    public String certificate(@PathVariable("applicationId")int applicationId,
                              HttpServletRequest request, Model model, HttpServletResponse response) {
        try {
            Application application = applicationService.queryById(applicationId);
            Member member = memberService.queryById(application.getMemberId());
            Activity activity = activityService.queryById(application.getActivityId());

            //照片
            String imgPath = request.getSession().getServletContext().getRealPath("/resources/");
            imgPath += (member.getPhoto() == null || member.getPhoto().equals("")) ? "img/default.png" : "upload/member/" + member.getPhoto();
            Image image = Image.getInstance(imgPath);
            image.scaleAbsolute(100,125);
            image.setAbsolutePosition(620,340);

            //证书编号
            String certificateNum = "";
            certificateNum += "2017";
            String activityNum = String.format("%03d",activity.getId());
            String memberNum = String.format("%04d",member.getId());
            certificateNum = certificateNum + "-" + activityNum + "-" + memberNum;

            //时间
//            Date date = new Date();
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//            String time = sdf.format(date);
            String time = activity.getTime().substring(13,23);

            //成绩
            String score = application.getScore();

            //项目名称
            String activityName = activity.getName();

            //证书名称 若无上传证书则采用默认证书
            String path = request.getSession().getServletContext().getRealPath("/resources/upload/certificate");
            String certificate = (activity.getCertificate() == null || activity.getCertificate().equals("")) ? "certificate.pdf" : activity.getCertificate();

            PdfReader reader = new PdfReader(path + "/" + certificate);
            File file = new File(path + "/" + activity.getName() + "/");
            file.mkdirs();
            PdfStamper stamper = new PdfStamper(reader, new FileOutputStream(path + "/" + activity.getName() + "/" + member.getName() + ".pdf"));
            BaseFont bf = BaseFont.createFont("STSong-Light","UniGB-UCS2-H", BaseFont.NOT_EMBEDDED); // set font
            //baseFont不支持字体样式设定.但是font字体要求操作系统支持此字体会带来移植问题.
            Font font = new Font(bf, 22);
            font.setStyle(Font.BOLD);
            font.getBaseFont();
            font.getBaseFont();
            for (int i = 1; i <= reader.getNumberOfPages(); i++) {
                //获得pdfstamper在当前页的上层打印内容.也就是说 这些内容会覆盖在原先的pdf内容之上.
                PdfContentByte over = stamper.getOverContent(i);
                //用pdfreader获得当前页字典对象.包含了该页的一些数据.比如该页的坐标轴信息.
                PdfDictionary p = reader.getPageN(i);
                //拿到mediaBox 里面放着该页pdf的大小信息.
                PdfObject po = p.get(new PdfName("MediaBox"));
//                System.out.println(po.isArray());
                //po是一个数组对象.里面包含了该页pdf的坐标轴范围.
                PdfArray pa = (PdfArray) po;
//                System.out.println(pa.size());
                //看看y轴的最大值.
//                System.out.println(pa.getAsNumber(pa.size() - 1));
                //开始写入文本

                over.addImage(image);

                over.beginText();
                //设置字体和大小
                over.setFontAndSize(font.getBaseFont(), 22);
                //设置字体的输出位置
                over.setTextMatrix(250, 280);
                //要输出的text
                over.showText(member.getName());
                //设置字体和大小
//                over.setFontAndSize(font.getBaseFont(), 10);
                //证书编号位置
                over.setTextMatrix(530, 280);
                over.showText(certificateNum);

                //打印成绩
                over.setTextMatrix(250,235);
                over.showText(score);

                //打印项目名称
                over.setTextMatrix(250,190);
                over.showText(activityName);

                //打印时间
                over.setTextMatrix(530,235);
                over.showText(time);
                over.endText();
            }
            stamper.close();
            model.addAttribute("activity",activity);
            model.addAttribute("member",member);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/personal/preview";
    }

    @RequestMapping("/permit/{applicationId}")
    public String permit(@PathVariable("applicationId")int applicationId,
                         HttpServletRequest request, Model model) {
        try {
            Application application = applicationService.queryById(applicationId);
            Member member = memberService.queryById(application.getMemberId());
            Activity activity = activityService.queryById(application.getActivityId());
            String name = member.getName();

            //活动时间
            String activityTime = activity.getTime();

            //照片
            String imgPath = request.getSession().getServletContext().getRealPath("/resources/");
            imgPath += (member.getPhoto() == null || member.getPhoto().equals("")) ? "img/default.png" : "upload/member/" + member.getPhoto();
            Image image = Image.getInstance(imgPath);
            image.scaleAbsolute(90,120);
            image.setAbsolutePosition(360,330);

            //证书编号
            String permitNum = "";
            permitNum += "2017";
            String activityNum = String.format("%03d",activity.getId());
            String memberNum = String.format("%04d",member.getId());
            permitNum = permitNum + "-" + activityNum + "-" + memberNum;

            String path = request.getSession().getServletContext().getRealPath("/resources/upload/permit");
//            String permit = "permit.pdf";
            String permit = (activity.getPermit() == null || activity.getPermit().equals("")) ? "permit.pdf" : activity.getPermit();

            PdfReader reader = new PdfReader(path + "/" + permit);
            File file = new File(path + "/" + activity.getName() + "/");
            file.mkdirs();
            PdfStamper stamper = new PdfStamper(reader, new FileOutputStream(path + "/" + activity.getName() + "/" + member.getName() + ".pdf"));
            BaseFont bf = BaseFont.createFont("STSong-Light","UniGB-UCS2-H", BaseFont.NOT_EMBEDDED); // set font
            //baseFont不支持字体样式设定.但是font字体要求操作系统支持此字体会带来移植问题.
            Font font = new Font(bf, 28);
            font.setStyle(Font.BOLD);
            font.getBaseFont();
            font.getBaseFont();
            for (int i = 1; i <= reader.getNumberOfPages(); i++) {
                PdfContentByte over = stamper.getOverContent(i);
                PdfDictionary p = reader.getPageN(i);
                PdfObject po = p.get(new PdfName("MediaBox"));
                PdfArray pa = (PdfArray) po;

                over.addImage(image);

                over.beginText();
                over.setFontAndSize(font.getBaseFont(), 20);

                //设置字体的输出位置
                over.setTextMatrix(380, 295);
                //要输出的text
                over.showText(name);

                //编号
                over.setFontAndSize(font.getBaseFont(), 18);
                over.setTextMatrix(380,260);
                over.showText(permitNum);

                //活动时间
                over.setFontAndSize(font.getBaseFont(), 12);
                over.setTextMatrix(103,345);
                over.showText(activityTime);

                over.endText();
            }
            stamper.close();
            model.addAttribute("member",member);
            model.addAttribute("activity",activity);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/personal/permit";
    }
}
