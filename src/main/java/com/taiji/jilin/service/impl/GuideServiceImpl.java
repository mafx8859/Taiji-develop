package com.taiji.jilin.service.impl;

import com.taiji.jilin.mapper.GuideMapper;
import com.taiji.jilin.service.GuideService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 单继重
 * @since 2018/3/16 15:44
 */
@Service("guideService")
public class GuideServiceImpl implements GuideService {

    @Autowired
    GuideMapper guideMapper;

    @Override
    public boolean isExist() {
        return guideMapper.isExist() != 0;
    }

    @Override
    public String getContent() {
        return guideMapper.getContent();
    }

    @Override
    public void update(String content) {
        int id = guideMapper.getId();
        guideMapper.update(content,id);
    }

    @Override
    public void newContent(String content) {
        guideMapper.newContent(content);
    }
}
