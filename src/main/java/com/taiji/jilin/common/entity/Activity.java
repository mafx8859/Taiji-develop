package com.taiji.jilin.common.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author 单继重
 * @since 2017/9/21 14:35
 */
@Entity
@Table(name = "t_activity")
public class Activity {
    //ID
    private Integer id;

    //活动名称
    private String name;

    //活动内容
    private String content;

    //活动人数限额
    private int population;

    //是否提供订餐
    @Column(name = "provide_meal")
    private String provideMeal;

    //是否提供住宿
    @Column(name = "provide_hotel")
    private String provideHotel;

    //是否需要身份证复印件
    private String needIdCard;

    //是否需要健康证明
    private String needHealth;

    //是否需要保险
    private String needInsurance;

    //是否需要安全责任书
    private String needSafe;

    //主办单位
    private String sponsor;

    //承办单位
    private String organization;

    //联系电话
    private String tel;

    //联系QQ
    private String qq;

    //时间
    private String time;

    //活动费用
    private String budget;

    //证书
    private String certificate;

    //谁可以看到证书
    private String whoCertificate;

    //入场证
    private String permit;

    //入场证下载权限
    private String whoPermit;

    //审核状态 0未1好2不行
    private String status;

    //年份
    private String year;

    //是否结束 1未开始 0进行中 -1已结束
    private int isFinish;

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getPopulation() {
        return population;
    }

    public void setPopulation(int population) {
        this.population = population;
    }

    public String getProvideMeal() {
        return provideMeal;
    }

    public void setProvideMeal(String provideMeal) {
        this.provideMeal = provideMeal;
    }

    public String getProvideHotel() {
        return provideHotel;
    }

    public void setProvideHotel(String provideHotel) {
        this.provideHotel = provideHotel;
    }

    public String getNeedIdCard() {
        return needIdCard;
    }

    public void setNeedIdCard(String needIdCard) {
        this.needIdCard = needIdCard;
    }

    public String getNeedHealth() {
        return needHealth;
    }

    public void setNeedHealth(String needHealth) {
        this.needHealth = needHealth;
    }

    public String getNeedInsurance() {
        return needInsurance;
    }

    public void setNeedInsurance(String needInsurance) {
        this.needInsurance = needInsurance;
    }

    public String getNeedSafe() {
        return needSafe;
    }

    public void setNeedSafe(String needSafe) {
        this.needSafe = needSafe;
    }

    public String getSponsor() {
        return sponsor;
    }

    public void setSponsor(String sponsor) {
        this.sponsor = sponsor;
    }

    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getBudget() {
        return budget;
    }

    public void setBudget(String budget) {
        this.budget = budget;
    }

    public String getCertificate() {
        return certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }

    public String getWhoCertificate() {
        return whoCertificate;
    }

    public void setWhoCertificate(String whoCertificate) {
        this.whoCertificate = whoCertificate;
    }

    public String getPermit() {
        return permit;
    }

    public void setPermit(String permit) {
        this.permit = permit;
    }

    public String getWhoPermit() {
        return whoPermit;
    }

    public void setWhoPermit(String whoPermit) {
        this.whoPermit = whoPermit;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public int getIsFinish() {
        return isFinish;
    }

    public void setIsFinish(int isFinish) {
        this.isFinish = isFinish;
    }
}
