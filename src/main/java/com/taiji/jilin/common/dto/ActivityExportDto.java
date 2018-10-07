package com.taiji.jilin.common.dto;

import javax.persistence.Column;
 
/**
 * @author 单继重
 * @since 2017/11/25 16:21
 */
public class ActivityExportDto {
    //活动名称
    private String activityName;

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

    //承办单位
    private String activityOrganization;

    //联系电话
    private String tel;

    //联系QQ
    private String activityQq;

    //时间
    private String activityTime;

    //活动费用
    private String budget;

    //证书
    private String certificate;

    //是否结束 1未开始 0进行中 -1已结束
    private String isFinish;

    public String getActivityName() {
        return activityName;
    }

    public void setActivityName(String activityName) {
        this.activityName = activityName;
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

    public String getActivityOrganization() {
        return activityOrganization;
    }

    public void setActivityOrganization(String activityOrganization) {
        this.activityOrganization = activityOrganization;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getActivityQq() {
        return activityQq;
    }

    public void setActivityQq(String activityQq) {
        this.activityQq = activityQq;
    }

    public String getActivityTime() {
        return activityTime;
    }

    public void setActivityTime(String activityTime) {
        this.activityTime = activityTime;
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

    public String getIsFinish() {
        return isFinish;
    }

    public void setIsFinish(String isFinish) {
        this.isFinish = isFinish;
    }
}
