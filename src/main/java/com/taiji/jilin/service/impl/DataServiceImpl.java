package com.taiji.jilin.service.impl;

import com.taiji.jilin.common.entity.data.Coach;
import com.taiji.jilin.common.entity.data.*;
import com.taiji.jilin.mapper.DataMapper;
import com.taiji.jilin.service.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 单继重
 * @since 2017/12/15 12:08
 */
@Service("dataService")
public class DataServiceImpl implements DataService {

    @Autowired
    DataMapper dataMapper;

    public List<Judge> queryJudge() throws Exception {
        return dataMapper.queryJudge();
    }

    public List<Coach> queryCouch() throws Exception {
        return dataMapper.queryCouch();
    }

    public List<Grade> queryGrade() throws Exception {
        return dataMapper.queryGrade();
    }

    public List<Instructor> queryInstructor() throws Exception {
        return dataMapper.queryInstructor();
    }
}
