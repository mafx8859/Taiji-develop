package com.taiji.jilin.mapper;

import com.taiji.jilin.common.dto.ActivityExportDto;
import com.taiji.jilin.common.dto.MemberExportDto;
import com.taiji.jilin.common.dto.QueryDto;
import com.taiji.jilin.common.entity.Activity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 单继重
 * @since 2017/11/25 15:57
 */
@Repository
public interface ExportMapper {
    /**
     * 查询活动导出信息
     * @return 导出DTO
     * @throws Exception 异常
     */
    public List<ActivityExportDto> exportActivity() throws Exception;

    public List<MemberExportDto> exportMember(@Param("organization") int organization,@Param("isAdmin") int isAdmin,@Param("status") int status,
                                              @Param("isJudge") int isJudge, @Param("isCoach") int isCoach, @Param("isInstructor") int isInstructor,@Param("grade") int grade) throws Exception;

    public List<QueryDto> exportQuery(@Param("organization") int organization,@Param("score") int score,@Param("activity") int activity,@Param("status") int status);
}
