package com.taiji.jilin.service.impl;

import com.taiji.jilin.common.dto.ApplicationMemberDto;
import com.taiji.jilin.common.entity.Activity;
import com.taiji.jilin.common.entity.Member;
import com.taiji.jilin.mapper.ActivityMapper;
import com.taiji.jilin.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @author 单继重
 * @since 2017/9/25 20:29
 */
@Service("activityService")
public class ActivityServiceImpl implements ActivityService {

    @Autowired
    ActivityMapper activityMapper;

    public void newActivity(Activity activity) throws Exception {
        activityMapper.newActivity(activity);
    }

    public void delById(int id) throws Exception {
        activityMapper.delById(id);
    }

    public void updateById(Activity activity) throws Exception {
        activityMapper.updateById(activity);
    }

    public Activity queryById(int id) throws Exception {
        Activity activity = activityMapper.queryById(id);
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String now = sdf.format(date);
        Date nowDate = sdf.parse(now);
        String startDate = activity.getTime().substring(0,10);
        Date startDateFormat = sdf.parse(startDate);
        String finishDate = activity.getTime().substring(13,activity.getTime().length());
        Date finishDateFormat = sdf.parse(finishDate);
        if (startDateFormat.after(nowDate)) {
            activity.setIsFinish(1);
        } else if (nowDate.after(finishDateFormat)) {
            activity.setIsFinish(-1);
        } else {
            activity.setIsFinish(0);
        }
        return activity;
    }

    public List<Activity> queryAll() throws Exception {
        List<Activity> list =  activityMapper.queryAll();
        for (Activity activity : list) {
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String now = sdf.format(date);
            Date nowDate = sdf.parse(now);
            String startDate = activity.getTime().substring(0,10);
            Date startDateFormat = sdf.parse(startDate);
            String finishDate = activity.getTime().substring(13,activity.getTime().length());
            Date finishDateFormat = sdf.parse(finishDate);
            if (startDateFormat.after(nowDate)) {
                activity.setIsFinish(1);
            } else if (nowDate.after(finishDateFormat)) {
                activity.setIsFinish(-1);
            } else {
                activity.setIsFinish(0);
            }
        }
        return list;
    }

    public void audit(int id) throws Exception {
        activityMapper.audit(id);
    }

    public void unAudit(int id) throws Exception {
        activityMapper.unAudit(id);
    }

    public List<ApplicationMemberDto> queryByActivityId(int activityId,int meal,int hotel) throws Exception {
        List<ApplicationMemberDto> list = activityMapper.queryByActivityId(activityId,meal,hotel);
        for (ApplicationMemberDto applicationMemberDto : list) {
            if (!(applicationMemberDto.getBirth() == null || applicationMemberDto.getBirth().equals(""))){
                int nowYear = Calendar.getInstance().get(Calendar.YEAR);
                int year = Integer.parseInt(applicationMemberDto.getBirth().substring(0,4));
                int age = nowYear - year;
                applicationMemberDto.setAge(String.valueOf(age));
            }
        }
        return list;
    }

    public void updateCertificate(Activity activity) throws Exception {
        activityMapper.updateCertificate(activity);
    }

    public void updatePermit(Activity activity) throws Exception {
        activityMapper.updatePermit(activity);
    }
}
