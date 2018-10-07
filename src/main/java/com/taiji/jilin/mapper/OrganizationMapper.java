package com.taiji.jilin.mapper;

import com.taiji.jilin.common.entity.Member;
import com.taiji.jilin.common.entity.Organization;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 单继重
 * @since 2017/9/21 14:46
 */
@Repository
public interface OrganizationMapper {
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

    public void audit(int id) throws Exception;

    public void unAudit(int id) throws Exception;

    /**
     * 查询所有单位
     * @return 单位列表
     * @throws Exception 异常
     */
    public List<Organization> queryAll() throws Exception;

    /**
     * 查询该单位所有成员
     * @param organizationId 单位ID
     * @return 列表
     */
    public List<Member> listMember(int organizationId) throws Exception;

    /**
     * 查询所有审核通过的单位
     * @return 单位列表
     * @throws Exception 异常
     */
    public List<Organization> queryAllPassed() throws Exception;
}
