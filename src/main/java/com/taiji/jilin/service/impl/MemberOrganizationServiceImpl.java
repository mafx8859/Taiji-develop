package com.taiji.jilin.service.impl;

import com.taiji.jilin.common.entity.MemberOrganization;
import com.taiji.jilin.mapper.MemberOrganizationMapper;
import com.taiji.jilin.service.MemberOrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 单继重
 * @since 2017/10/21 18:46
 */
@Service("memberOrganizationService")
public class MemberOrganizationServiceImpl implements MemberOrganizationService {

    @Autowired
    private MemberOrganizationMapper memberOrganizationMapper;

    public void newOrganizationMember(MemberOrganization memberOrganization) throws Exception {
        memberOrganizationMapper.newOrganizationMember(memberOrganization);
    }

    public void divideMember(MemberOrganization memberOrganization) throws Exception {
        memberOrganizationMapper.divideMember(memberOrganization);
    }

    @Override
    public void updateOrganization(MemberOrganization memberOrganization) throws Exception {
        memberOrganizationMapper.updateOrganization(memberOrganization);
    }
}
