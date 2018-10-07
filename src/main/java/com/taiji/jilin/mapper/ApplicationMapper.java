package com.taiji.jilin.mapper;

import com.taiji.jilin.common.dto.ApplicationMemberDto;
import com.taiji.jilin.common.entity.Activity;
import com.taiji.jilin.common.entity.Application;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 单继重
 * @since 2017/9/21 14:45
 */
@Repository
public interface ApplicationMapper {

    /**
     * 添加一个活动报名情况
     * @param application 活动报名实体类
     * @throws Exception 异常
     */
    public void newApplication(Application application) throws Exception;

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
     * 查询某会员所有报名情况
     * @param memberId 会员ID
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
     * 查询个人未报名活动
     * @param memberId 会员ID
     * @return 表
     */
    public List<ApplicationMemberDto> listNotSignIn(int memberId) throws Exception;

    /**
     * 查询已报名活动
     * @param memberId 会员ID
     * @return 表
     * @throws Exception 异常
     */
    List<ApplicationMemberDto> listSignIn(int memberId) throws Exception;

    /**
     * 根据会员 活动查询报名
     * @param application 报名情况
     * @return 报名情况
     * @throws Exception 异常
     */
    public Application queryByMemberAndActivity(Application application) throws Exception;

    public Application queryById(@Param("applicationId") int applicationId);
}
