package com.taiji.jilin.common.dto;

import com.taiji.jilin.common.entity.Application;

import java.util.List;

/**
 * @author 单继重
 * @since 2017/10/17 17:25
 */
public class OrganizationApplyDto extends Application {
    private List<Integer> memberIds;

    public List<Integer> getMemberIds() {
        return memberIds;
    }

    public void setMemberIds(List<Integer> memberIds) {
        this.memberIds = memberIds;
    }
}
