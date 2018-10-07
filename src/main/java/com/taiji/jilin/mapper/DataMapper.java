package com.taiji.jilin.mapper;

import com.taiji.jilin.common.entity.data.Coach;
import com.taiji.jilin.common.entity.data.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 单继重
 * @since 2017/12/15 12:06
 */
@Repository
public interface DataMapper {
    public List<Judge> queryJudge() throws Exception;
    public List<Coach> queryCouch() throws Exception;
    public List<Grade> queryGrade() throws Exception;
    public List<Instructor> queryInstructor() throws Exception;
}
