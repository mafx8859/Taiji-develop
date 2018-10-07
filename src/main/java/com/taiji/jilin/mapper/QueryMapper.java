package com.taiji.jilin.mapper;

import com.taiji.jilin.common.dto.QueryDto;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description
 * @Author shanjz
 * @Time 2017/10/22 9:14
 */
@Repository
public interface QueryMapper {
    /**
     * 综合查询
     * @return 查询DTO
     * @throws Exception 异常
     * @param activityId
     * @param organizationId
     * @param sex
     */
    public List<QueryDto> query(@Param("activityId") int activityId, @Param("organizationId") int organizationId, @Param("score") int score, @Param("status") int status, @Param("sex") int sex) throws Exception;
}
