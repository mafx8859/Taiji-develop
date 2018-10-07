package com.taiji.jilin.service.impl;

import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.taiji.jilin.common.dto.ApplicationMemberDto;
import com.taiji.jilin.common.dto.OrganizationApplyDto;
import com.taiji.jilin.common.entity.Activity;
import com.taiji.jilin.common.entity.Application;
import com.taiji.jilin.common.entity.Member;
import com.taiji.jilin.mapper.ApplicationMapper;
import com.taiji.jilin.service.ApplicationService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

/**
 * @Description
 * @Author shanjz
 * @Time 2017/10/15 9:46
 */
@Service("applicationService")
public class ApplicationServiceImpl implements ApplicationService {

    @Autowired
    ApplicationMapper applicationMapper;

    public void newApplication(Application application) throws Exception {
        applicationMapper.newApplication(application);
    }

    public Application queryByMemberAndActivity(Application application) throws Exception {
        return applicationMapper.queryByMemberAndActivity(application);
    }

    public void audit(int id) throws Exception {
        applicationMapper.audit(id);
    }

    public void unAudit(int id) throws Exception {
        applicationMapper.unAudit(id);
    }

    public List<Application> queryByActivityId(int activityId) throws Exception {
        return applicationMapper.queryByActivityId(activityId);
    }

    public List<Application> queryByMemberId(int memberId) throws Exception {
        return applicationMapper.queryByMemberId(memberId);
    }

    public void delById(int id) throws Exception {
        applicationMapper.delById(id);
    }

    public void update(Application application) throws Exception {
        applicationMapper.update(application);
    }

    public void grade(Application application) throws Exception {
        applicationMapper.grade(application);
    }

    public List<ApplicationMemberDto> listNotSignIn(int memberId) throws Exception {
        return applicationMapper.listNotSignIn(memberId);
    }

    public List<ApplicationMemberDto> listSignIn(int memberId) throws Exception {
        return applicationMapper.listSignIn(memberId);
    }

    public void organizationSignIn(OrganizationApplyDto organizationApplyDto) throws Exception {
        List<Integer> memberIds = organizationApplyDto.getMemberIds();
        if (memberIds == null){
            return;
        }
        for (int i = 0 ; ; i ++) {
            if (i < memberIds.size() && memberIds.get(i) != null){
                Application application = new Application();
                application = organizationApplyDto;
                application.setMemberId(memberIds.get(i));
                applicationMapper.newApplication(application);
            } else if (i == memberIds.size()) {
                break;
            }
        }
    }

    public Application queryById(int applicationId) throws Exception {
        return applicationMapper.queryById(applicationId);
    }
}
