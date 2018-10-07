package com.taiji.jilin.common.dto;

import javax.persistence.Column;

/**
 * @author 单继重
 * @since 2017/10/16 15:30
 */
public class ApplicationMemberDto {
    //报名信息ID
    private int applicationId;

    //会员ID
    private int memberId;

    //会员姓名
    private String memberName;

    //会员出生年月日
    private String birth;

    //会员性别
    private String sex;

    //会员年龄
    private String age;

    //会员电话
    private String telephone;

    //会员所属单位
    private String memberOrganization;

    //活动ID
    private int activityId;

    //保险
    private String insurance;

    //健康证明
    private String health;

    //是否需要餐饮
    private String meal;

    //安全责任书
    private String liability;

    //是否需要住宿
    private String hotel;

    //报名审核状态
    private String applicationStatus;

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

    //成绩
    private String score;

    private int isFinish;

    //报名时间
    private String applyTime;

    //活动证书
    private String certificate;

    private String whoCertificate;

    private String whoPermit;

    public int getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(int applicationId) {
        this.applicationId = applicationId;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getMemberOrganization() {
        return memberOrganization;
    }

    public void setMemberOrganization(String memberOrganization) {
        this.memberOrganization = memberOrganization;
    }

    public int getActivityId() {
        return activityId;
    }

    public void setActivityId(int activityId) {
        this.activityId = activityId;
    }

    public String getInsurance() {
        return insurance;
    }

    public void setInsurance(String insurance) {
        this.insurance = insurance;
    }

    public String getHealth() {
        return health;
    }

    public void setHealth(String health) {
        this.health = health;
    }

    public String getMeal() {
        return meal;
    }

    public void setMeal(String meal) {
        this.meal = meal;
    }

    public String getLiability() {
        return liability;
    }

    public void setLiability(String liability) {
        this.liability = liability;
    }

    public String getHotel() {
        return hotel;
    }

    public void setHotel(String hotel) {
        this.hotel = hotel;
    }

    public String getApplicationStatus() {
        return applicationStatus;
    }

    public void setApplicationStatus(String applicationStatus) {
        this.applicationStatus = applicationStatus;
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

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public int getIsFinish() {
        return isFinish;
    }

    public void setIsFinish(int isFinish) {
        this.isFinish = isFinish;
    }

    public String getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(String applyTime) {
        this.applyTime = applyTime;
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

    public String getWhoPermit() {
        return whoPermit;
    }

    public void setWhoPermit(String whoPermit) {
        this.whoPermit = whoPermit;
    }
}
