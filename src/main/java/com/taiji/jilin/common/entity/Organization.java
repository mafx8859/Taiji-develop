package com.taiji.jilin.common.entity;

import javax.persistence.Column;
import javax.persistence.Id;

/**
 * @author 单继重
 * @since 2017/9/21 14:39
 */
public class Organization {
    //ID
    @Id
    private Integer id;

    //单位名称
    private String name;

    //单位地址
    private String address;

    //主管部门
    private String department;

    //单位QQ群
    @Column(name = "qq_group")
    private String qqGroup;

    //负责人1
    private String principal1;

    //负责人1 职务
    private String job1;

    //负责人1 职称
    private String title1;

    //负责人1 联系方式
    private String tel1;

    //负责人2
    private String principal2;

    //负责人2 职务
    private String job2;

    //负责人2 职称
    private String title2;

    //负责人2 联系方式
    private String tel2;

    //经营范围及主要业绩
    private String performance;

    //会费缴纳记录
    private String dues;

    //管理员
    private String admin;

    //审核状态
    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getQqGroup() {
        return qqGroup;
    }

    public void setQqGroup(String qqGroup) {
        this.qqGroup = qqGroup;
    }

    public String getPrincipal1() {
        return principal1;
    }

    public void setPrincipal1(String principal1) {
        this.principal1 = principal1;
    }

    public String getJob1() {
        return job1;
    }

    public void setJob1(String job1) {
        this.job1 = job1;
    }

    public String getTitle1() {
        return title1;
    }

    public void setTitle1(String title1) {
        this.title1 = title1;
    }

    public String getTel1() {
        return tel1;
    }

    public void setTel1(String tel1) {
        this.tel1 = tel1;
    }

    public String getJob2() {
        return job2;
    }

    public void setJob2(String job2) {
        this.job2 = job2;
    }

    public String getTitle2() {
        return title2;
    }

    public void setTitle2(String title2) {
        this.title2 = title2;
    }

    public String getTel2() {
        return tel2;
    }

    public void setTel2(String tel2) {
        this.tel2 = tel2;
    }

    public String getPrincipal2() {
        return principal2;
    }

    public void setPrincipal2(String principal2) {
        this.principal2 = principal2;
    }

    public String getPerformance() {
        return performance;
    }

    public void setPerformance(String performance) {
        this.performance = performance;
    }

    public String getDues() {
        return dues;
    }

    public void setDues(String dues) {
        this.dues = dues;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
