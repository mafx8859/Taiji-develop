package com.taiji.jilin.service.impl;

import com.taiji.jilin.common.dto.ActivityExportDto;
import com.taiji.jilin.common.dto.MemberExportDto;
import com.taiji.jilin.common.dto.QueryDto;
import com.taiji.jilin.mapper.ExportMapper;
import com.taiji.jilin.service.ExportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @author 单继重
 * @since 2017/11/25 16:02
 */
@Service("exportService")
public class ExportServiceImpl implements ExportService {

    @Autowired
    ExportMapper exportMapper;

    public List<ActivityExportDto> exportActivity() throws Exception {
        List<ActivityExportDto> list = exportMapper.exportActivity();
        for (ActivityExportDto exportDto : list) {
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String now = sdf.format(date);
            Date nowDate = sdf.parse(now);
            String startDate = exportDto.getActivityTime().substring(0,10);
            Date startDateFormat = sdf.parse(startDate);
            String finishDate = exportDto.getActivityTime().substring(13,exportDto.getActivityTime().length());
            Date finishDateFormat = sdf.parse(finishDate);
            if (startDateFormat.after(nowDate)) {
                exportDto.setIsFinish("未开始");
            } else if (nowDate.after(finishDateFormat)) {
                exportDto.setIsFinish("已结束");
            } else {
                exportDto.setIsFinish("进行中");
            }
        }
        return list;
    }

    public List<MemberExportDto> exportMember(int organization, int isAdmin, int status, int isJudge, int isCoach, int isInstructor, int grade) throws Exception {
        List<MemberExportDto> list = exportMapper.exportMember(organization,isAdmin,status,isJudge,isCoach,isInstructor,grade);
        for (int i = 0 ; i < list.size() ; i ++){
            MemberExportDto member = list.get(i);
            if (!(member.getBirth() == null || member.getBirth().equals(""))){
                int nowYear = Calendar.getInstance().get(Calendar.YEAR);
                int year = Integer.parseInt(member.getBirth().substring(0,4));
                int age = nowYear - year;
                member.setAge(String.valueOf(age));
            }
            list.set(i,member);
        }
        return list;
    }

    public List<QueryDto> exportQuery(int organization, int score, int activity,int status) throws Exception {
        List<QueryDto> list = exportMapper.exportQuery(organization,score,activity,status);
        for (QueryDto queryDto : list) {
            switch (queryDto.getScore()) {
                case "1":
                    queryDto.setScore("金牌");
                    break;
                case "2":
                    queryDto.setScore("银牌");
                    break;
                case "3":
                    queryDto.setScore("铜牌");
                    break;
                case "4":
                    queryDto.setScore("合格");
                    break;
                case "5":
                    queryDto.setScore("不合格");
                    break;
                default:
                    queryDto.setScore("无成绩");
            }
            if (!(queryDto.getBirth() == null || queryDto.getBirth().equals(""))){
                int nowYear = Calendar.getInstance().get(Calendar.YEAR);
                int year = Integer.parseInt(queryDto.getBirth().substring(0,4));
                int age = nowYear - year;
                queryDto.setAge(String.valueOf(age));
            }
        }
        return list;
    }
}
