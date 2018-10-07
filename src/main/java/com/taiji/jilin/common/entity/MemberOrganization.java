package com.taiji.jilin.common.entity;

import javax.persistence.Column;
import javax.persistence.Id;

/**
 * @author 单继重
 * @since 2017/9/21 14:43
 */
public class MemberOrganization {
    @Id
    private Integer id;

    //单位ID
    @Column(name = "organization_id")
    private int organizationId;

    //会员ID
    @Column(name = "member_id")
    private int memberId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(int organizationId) {
        this.organizationId = organizationId;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }
}
