package com.taiji.jilin.service.impl;

import com.taiji.jilin.common.entity.Member;
import com.taiji.jilin.common.entity.Organization;
import com.taiji.jilin.mapper.OrganizationMapper;
import com.taiji.jilin.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.List;

/**
 * @author 单继重
 * @since 2017/9/27 16:02
 */
@Service(value = "OrganizationService")
public class OrganizationServiceImpl implements OrganizationService {

    @Autowired
    OrganizationMapper organizationMapper;

    public void newOrganization(Organization organization) throws Exception {
        organizationMapper.newOrganization(organization);
    }

    public void delById(int id) throws Exception {
        organizationMapper.delById(id);
    }

    public void updateById(Organization organization) throws Exception {
        organizationMapper.updateById(organization);
    }

    public Organization queryById(int id) throws Exception {
        return organizationMapper.queryById(id);
    }

    public void audit(int id) throws Exception {
        organizationMapper.audit(id);
    }

    public void unAudit(int id) throws Exception {
        organizationMapper.unAudit(id);
    }

    public List<Organization> queryAll() throws Exception {
        return organizationMapper.queryAll();
    }

    public List<Member> listMembers(int organizationId) throws Exception {
        List<Member> list = organizationMapper.listMember(organizationId);
        for (int i = 0 ; i < list.size() ; i ++){
            Member member = list.get(i);
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

    public List<Organization> queryAllPassed() throws Exception{
        return organizationMapper.queryAllPassed();
    }
}
