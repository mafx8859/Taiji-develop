package com.taiji.jilin.common.entity;

import javax.persistence.Column;
import javax.persistence.Id;

/**
 * @author 单继重
 * @since 2017/9/21 14:37
 */
public class Application {
    //ID
    @Id
    private Integer id;

    //会员表ID
    @Column(name = "member_id")
    private int memberId;

    //活动表ID
    @Column(name = "activity_id")
    private int activityId;

    //保险
    private String insurance;

    //健康证明
    private String health;

    //责任书
    private String liability;

    //住宿
    private String hotel;

    //餐饮
    private String meal;

    //成绩
    private String score;

    //审核状态
    private String status;

    private String createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
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

    public String getMeal() {
        return meal;
    }

    public void setMeal(String meal) {
        this.meal = meal;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
