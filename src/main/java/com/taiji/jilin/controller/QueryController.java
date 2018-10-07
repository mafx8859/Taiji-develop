package com.taiji.jilin.controller;

import com.taiji.jilin.common.dto.QueryDto;
import com.taiji.jilin.common.entity.Activity;
import com.taiji.jilin.common.entity.Organization;
import com.taiji.jilin.service.ActivityService;
import com.taiji.jilin.service.OrganizationService;
import com.taiji.jilin.service.QueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author 单继重
 * @since 2017/10/22 10:42
 */
@Controller
@RequestMapping(value = "/query")
public class QueryController {

    @Autowired
    QueryService queryService;

    @Autowired
    OrganizationService organizationService;

    @Autowired
    ActivityService activityService;

    @RequestMapping("/")
    public String query(Model model, @RequestParam(value = "activityId",defaultValue = "0")int activityId,
                        @RequestParam(value = "organizationId",defaultValue = "0")int organizationId,
                        @RequestParam(value = "score",defaultValue = "0")int score,
                        @RequestParam(value = "status",defaultValue = "-1") int status,
                        @RequestParam(value = "sex",defaultValue = "-1") int sex,
                        @RequestParam(value = "age1",defaultValue = "-1") int age1,
                        @RequestParam(value = "age2",defaultValue = "-1") int age2) {
        try {
            List<QueryDto> list = queryService.query(activityId,organizationId,score,status,sex,age1,age2);
            List<Activity> activityList =  activityService.queryAll();
            List<Organization> organizationList = organizationService.queryAll();
            model.addAttribute("activityId",activityId);
            model.addAttribute("organizationId",organizationId);
            model.addAttribute("score",score);
            model.addAttribute("status",status);
            model.addAttribute("sex",sex);
            model.addAttribute("age1",age1);
            model.addAttribute("age2",age2);
            model.addAttribute("list",list);
            model.addAttribute("activityList",activityList);
            model.addAttribute("organizationList",organizationList);
            return "query/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
}
