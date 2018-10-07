package com.taiji.jilin.service;

/**
 * @author 单继重
 * @since 2018/3/16 15:44
 */
public interface GuideService {
    boolean isExist();

    String getContent();

    void update(String content);

    void newContent(String content);
}
