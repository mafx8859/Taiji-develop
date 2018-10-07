package com.taiji.jilin.service;

import com.taiji.jilin.common.entity.MemberOrganization;

/**
 * @author 单继重
 * @since 2017/10/21 18:46
 */
public interface MemberOrganizationService {
    /**
     * 新单位成员
     * @param memberOrganization 单位成员关系实体
     * @throws Exception 异常
     */
    public void newOrganizationMember(MemberOrganization memberOrganization) throws Exception;

    /**
     * 将会员划分至某单位
     * @param memberOrganization 单位成员关系实体
     * @throws Exception 异常
     */
    public void divideMember(MemberOrganization memberOrganization) throws Exception;

    /**
     * 更新会员单位信息
     * @param memberOrganization 单位成员关系实体
     * @throws Exception 异常
     */
    public void updateOrganization(MemberOrganization memberOrganization) throws Exception;
}
