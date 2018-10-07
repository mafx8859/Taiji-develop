package com.taiji.jilin.controller;

import com.taiji.jilin.common.dto.ActivityExportDto;
import com.taiji.jilin.common.dto.MemberExportDto;
import com.taiji.jilin.common.dto.QueryDto;
import com.taiji.jilin.common.util.ExcelUtil;
import com.taiji.jilin.service.ExportService;
import net.sf.json.JSON;
import net.sf.json.JSONObject;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

/**
 * @author 单继重
 * @since 2017/11/25 10:36
 */
@Controller
@RequestMapping("/export")
public class ExportController {

    @Autowired
    ExportService exportService;

    @RequestMapping("/activity")
    public void exportActivity(HttpServletResponse response) {
        try {
            String fileName = "活动综合.xls";
            List<ActivityExportDto> activityList = exportService.exportActivity();
            HSSFWorkbook workbook = ExcelUtil.getHSSFWorkbook("活动表",activityList);
            response.setHeader("content-disposition", "attachment;filename="
                    + URLEncoder.encode(fileName, "UTF-8"));
            OutputStream outputStream = response.getOutputStream();
            workbook.write(outputStream);
            outputStream.flush();
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/member",method = RequestMethod.POST)
    public void exportMember(HttpServletResponse response, @RequestParam(value = "organization",defaultValue = "0")int organization,
                             @RequestParam(value = "isAdmin",defaultValue = "0") int isAdmin,
                             @RequestParam(value = "status",defaultValue = "-1") int status,
                             @RequestParam(value = "isJudge",defaultValue = "-1") int isJudge,
                             @RequestParam(value = "isCoach",defaultValue = "-1") int isCoach,
                             @RequestParam(value = "isInstructor",defaultValue = "-1") int isInstructor,
                             @RequestParam(value = "grade",defaultValue = "-1") int grade) {
        try {
            String fileName = "用户综合.xls";
            List<MemberExportDto> members = exportService.exportMember(organization,isAdmin,status,isJudge,isCoach,isInstructor,grade);
            HSSFWorkbook workbook = ExcelUtil.getHSSFWorkbook("用户表",members);
            response.setHeader("content-disposition", "attachment;filename="
                    + URLEncoder.encode(fileName, "UTF-8"));
            OutputStream outputStream = response.getOutputStream();
            workbook.write(outputStream);
            outputStream.flush();
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/query")
    public void exportQuery(HttpServletResponse response, @RequestParam(value = "organization",defaultValue = "0")int organization,
                            @RequestParam(value = "activity",defaultValue = "0") int activity,
                            @RequestParam(value = "score",defaultValue = "0") int score,
                            @RequestParam(value = "status",defaultValue = "-1") int status) {
        try {
            String fileName = "综合导出.xls";
            List<QueryDto> queryDtoList = exportService.exportQuery(organization,score,activity,status);
            HSSFWorkbook workbook = ExcelUtil.getHSSFWorkbook("综合表",queryDtoList);
            response.setHeader("content-disposition", "attachment;filename="
                    + URLEncoder.encode(fileName, "UTF-8"));
            OutputStream outputStream = response.getOutputStream();
            workbook.write(outputStream);
            outputStream.flush();
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
