package com.taiji.jilin.service;

import com.taiji.jilin.common.dto.ApplicationMemberDto;
import com.taiji.jilin.common.entity.Activity;
import com.taiji.jilin.common.entity.Member;

import java.util.List;

/**
 * @author 单继重
 * @since 2017/9/25 20:26
 */
public interface ActivityService {
    /**
     * 新增活动
     * @throws Exception 异常
     */
    public void newActivity(Activity activity) throws Exception;

    /**
     * 删除
     * @param id ID
     * @throws Exception 异常
     */
    public void delById(int id) throws Exception;

    /**
     * 根据ID修改
     * @param activity 活动
     * @throws Exception 异常
     */
    public void updateById(Activity activity) throws Exception;

    /**
     * 查询单个
     * @param id ID
     * @return 实体类
     * @throws Exception 异常
     */
    public Activity queryById(int id) throws Exception;

    /**
     * 查询所有
     * @return 列表
     * @throws Exception 异常
     */
    public List<Activity> queryAll() throws Exception;

    /**
     * 审核通过活动
     * @param id ID
     * @throws Exception 异常
     */
    public void audit(int id) throws Exception;

    /**
     * 审核不通过活动
     * @param id ID
     * @throws Exception 异常
     */
    public void unAudit(int id) throws Exception;

    /**
     * 查询某活动的报名人员
     * @param activityId 活动ID
     * @return 人员列表
     */
    public List<ApplicationMemberDto> queryByActivityId(int activityId,int meal,int hotel) throws Exception;

    /**
     * 更新某活动证书
     * @param activity 活动实体
     * @throws Exception 异常
     */
    public void updateCertificate(Activity activity) throws Exception;

    /**
     * 更新活动入场证（权限）
     * @param activity 活动实体
     * @throws Exception 异常
     */
    public void updatePermit(Activity activity) throws Exception;
}
