package com.taiji.jilin.service;

import com.taiji.jilin.common.dto.ActivityExportDto;
import com.taiji.jilin.common.dto.MemberExportDto;
import com.taiji.jilin.common.dto.QueryDto;

import java.util.List;

/**
 * @author 单继重
 * @since 2017/11/25 16:02
 */
public interface ExportService {
    /**
     * 查询活动导出信息
     * @return 导出DTO
     * @throws Exception 异常
     */
    public List<ActivityExportDto> exportActivity() throws Exception;

    /**
     * 查询用户导出信息
     * @return 导出DTO
     * @param organization
     * @param isAdmin
     * @param status
     */
    public List<MemberExportDto> exportMember(int organization, int isAdmin, int status, int isJudge, int isCoach, int isInstructor, int grade) throws Exception;


    public List<QueryDto> exportQuery(int organization, int score, int activity,int status) throws Exception;
}
