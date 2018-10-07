package com.taiji.jilin.service;

import com.taiji.jilin.common.entity.data.Coach;
import com.taiji.jilin.common.entity.data.*;
import java.util.List;

/**
 * @author 单继重
 * @since 2017/12/15 12:07
 */
public interface DataService {
    public List<Judge> queryJudge() throws Exception;
    public List<Coach> queryCouch() throws Exception;
    public List<Grade> queryGrade() throws Exception;
    public List<Instructor> queryInstructor() throws Exception;
}
