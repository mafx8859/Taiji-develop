package com.taiji.jilin.service;

import com.taiji.jilin.common.dto.ApplicationMemberDto;
import com.taiji.jilin.common.entity.Member;

import java.util.List;

/**
 * @author 单继重
 * @since 2017/9/15 19:22
 */
public interface MemberService {

    /**
     * 添加一个会员信息
     * @param member 会员实体类
     * @throws Exception 异常
     */
    public void newMember(Member member) throws Exception;

    /**
     * 检查用户名是否已经被使用
     * @param username 用户名
     * @return 个数
     * @throws Exception 异常
     */
    public int checkUsername(String username) throws Exception;

    /**
     * 根据用户名查ID
     * @param username 用户名
     * @return ID
     * @throws Exception 异常
     */
    public int queryIdByUsn(String username) throws Exception;

    /**
     * 根据ID查找会员信息
     * @param id ID
     * @return 会员实体类
     * @throws Exception 异常
     */
    public Member queryById(int id) throws Exception;

    /**
     * 查找详细信息
     * @param id id
     * @return 会员实体类
     * @throws Exception 异常
     */
    public Member queryDetail(int id) throws Exception;

    /**
     * 获取账号列表（筛选）
     * @param organization 单位ID
     * @param isAdmin 账户类型
     * @param status 审核状态
     * @param isJudge
     * @param isCoach
     * @param isInstructor
     * @param grade @return 列表
     * @param sex
     * @param age1
     * @param age2
     * @throws Exception 异常
     */
    public List<Member> queryAll(int organization, int isAdmin, int status, int admin, int isJudge, int isCoach, int isInstructor, int grade, int sex, int age1, int age2) throws Exception;

    /**
     * 根据ID删除会员信息
     * @param id ID
     * @throws Exception 异常
     */
    public void delById(int id) throws Exception;

    /**
     * 修改用户信息
     * @param member 会员信息
     * @throws Exception 异常
     */
    public void update(Member member) throws Exception;

    /**
     * 通过用户名和密码查找用户
     * @param member 会员信息
     * @return 会员完整信息
     * @throws Exception 异常
     */
    public Member queryByUsnAndPsw(Member member) throws Exception;

    /**
     * 批量审核通过（可单个）
     * @param ids ID集合
     * @throws Exception 异常
     */
    public void audit(int[] ids) throws Exception;

    /**
     * 批量审核通过（可单个）
     * @param ids ID集合
     * @throws Exception 异常
     */
    public void unAudit(int[] ids) throws Exception;

    //修改密码
    public void updatePsw(Member member) throws Exception;

    /**
     * 列出某单位所有成员
     * @param organizationId 单位ID
     * @param activityId
     * @return 会员列表
     */
    List<ApplicationMemberDto> queryByOrganizationId(int organizationId, int activityId) throws Exception;

    /**
     * 检查身份证号是否重复
     * @param idNumber 身份证号
     * @return 是否重复
     */
    public int checkIdNumber(String idNumber);
}
