package com.taiji.jilin.service;

import com.taiji.jilin.common.entity.Member;
import com.taiji.jilin.common.entity.Organization;

import java.util.List;

/**
 * @author 单继重
 * @since 2017/9/27 16:01
 */
public interface OrganizationService {
    /**
     * 添加单位
     * @throws Exception 异常
     */
    public void newOrganization(Organization organization) throws Exception;

    /**
     * 通过ID删除
     * @param id ID
     * @throws Exception 异常
     */
    public void delById(int id) throws Exception;

    /**
     * 通过ID修改
     * @param organization 单位实体类
     * @throws Exception 异常
     */
    public void updateById(Organization organization) throws Exception;

    /**
     * 通过ID查询单位
     * @param id ID
     * @return 单位实体类
     * @throws Exception 异常
     */
    public Organization queryById(int id) throws Exception;

    /**
     * 审核通过（可单个）
     * @param id ID
     * @throws Exception 异常
     */
    public void audit(int id) throws Exception;

    /**
     * 审核通过（可单个）
     * @param id ID
     * @throws Exception 异常
     */
    public void unAudit(int id) throws Exception;

    /**
     * 查询所有单位
     * @return 单位列表
     * @throws Exception 异常
     */
    public List<Organization> queryAll() throws Exception;

    /**
     * 获取某单位成员
     * @param organizationId 单位ID
     * @return 成员表
     * @throws Exception 异常
     */
    public List<Member> listMembers(int organizationId) throws Exception;

    /**
     * 查询所有审核通过的单位
     * @return 单位列表
     * @throws Exception 异常
     */
    public List<Organization> queryAllPassed() throws Exception;
}
