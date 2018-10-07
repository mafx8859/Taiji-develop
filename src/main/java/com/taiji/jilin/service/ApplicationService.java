package com.taiji.jilin.service;

import com.taiji.jilin.common.dto.ApplicationMemberDto;
import com.taiji.jilin.common.dto.OrganizationApplyDto;
import com.taiji.jilin.common.entity.Activity;
import com.taiji.jilin.common.entity.Application;
import com.taiji.jilin.common.entity.Member;

import java.util.List;

/**
 * @Description
 * @Author shanjz
 * @Time 2017/10/15 9:46
 */
public interface ApplicationService {
    /**
     * 添加一个活动报名情况
     * @param application 活动报名实体类
     * @throws Exception 异常
     */
    public void newApplication(Application application) throws Exception;

    /**
     * 根据会员和活动查询报名信息
     * @param application 报名实体类
     * @return Application
     * @throws Exception 异常
     */
    public Application queryByMemberAndActivity(Application application) throws Exception;

    /**
     * 审核一条报名信息
     * @param id ID
     * @throws Exception 异常
     */
    public void audit(int id) throws Exception;

    /**
     * 审核不通过一条报名信息
     * @param id ID
     * @throws Exception 异常
     */
    public void unAudit(int id) throws Exception;

    /**
     * 查询某活动所有报名情况
     * @param activityId 活动ID
     * @return 表
     * @throws Exception 异常
     */
    public List<Application> queryByActivityId(int activityId) throws Exception;

    /**
     * 查询某活动所有报名情况
     * @param memberId 活动ID
     * @return 表
     * @throws Exception 异常
     */
    public List<Application> queryByMemberId(int memberId) throws Exception;

    /**
     * 删除一条报名信息
     * @param id ID
     * @throws Exception 异常
     */
    public void delById(int id) throws Exception;

    /**
     * 更新一条报名情况
     * @param application 报名信息
     * @throws Exception 异常
     */
    public void update(Application application) throws Exception;

    /**
     * 打分
     * @param application 报名实体类
     * @throws Exception 异常
     */
    public void grade(Application application) throws Exception;

    /**
     * 查询个人所有未报名活动
     * @param memberId 会员ID
     * @return 表
     * @throws Exception 异常
     */
    public List<ApplicationMemberDto> listNotSignIn(int memberId) throws Exception;

    /**
     * 查询所有已报名
     * @param memberId 会员ID
     * @return 表
     */
    List<ApplicationMemberDto> listSignIn(int memberId) throws Exception;

    /**
     * 单位统一报名
     * @param organizationApplyDto 单位统一报名信息
     * @throws Exception 异常
     */
    public void organizationSignIn(OrganizationApplyDto organizationApplyDto) throws Exception;

    public Application queryById(int applicationId) throws Exception;
}
