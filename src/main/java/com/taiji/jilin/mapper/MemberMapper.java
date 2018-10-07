package com.taiji.jilin.mapper;

import com.taiji.jilin.common.dto.ApplicationMemberDto;
import com.taiji.jilin.common.entity.Member;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 单继重
 * @since 2017/9/14 12:00
 */
@Repository
public interface MemberMapper {
    /**
     * 新添加成员
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
    public int checkUsername(@Param("username") String username) throws Exception;

    /**
     * 根据用户名查ID
     * @param username 用户名
     * @return ID
     * @throws Exception 异常
     */
    public int queryIdByUsn(@Param("username") String username) throws Exception;

    /**
     * 假删除
     * @param id id
     * @throws Exception 异常
     */
    public void delById(int id) throws Exception;

    /**
     * 修改会员信息
     * @param member 会员
     * @throws Exception 异常
     */
    public void update(Member member) throws Exception;

    /**
     * 登陆
     * @param member 会员
     * @return 会员实体类
     * @throws Exception 异常
     */
    public Member queryByUsnAndPsw(Member member) throws Exception;

    /**
     * 根据ID查找
     * @param id id
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
     * 查找全部会员
     * @return 会员表
     * @throws Exception 异常
     * @param organization
     * @param isAdmin
     * @param status
     * @param isJudge
     * @param isCoach
     * @param isInstructor
     * @param grade
     * @param sex
     */
    public List<Member> queryAll(@Param("organization") int organization, @Param("isAdmin") int isAdmin, @Param("status") int status, @Param("admin") int admin,
                                 @Param("isJudge") int isJudge, @Param("isCoach") int isCoach, @Param("isInstructor") int isInstructor, @Param("grade") int grade,
                                 @Param("sex") int sex) throws Exception;

    /**
     * 批量审核
     * @param ids ID集合
     */
    public void audit(@Param("ids") int[] ids) throws Exception;

    /**
     * 批量审核
     * @param ids ID集合
     */
    public void unAudit(@Param("ids") int[] ids) throws Exception;

    /**
     * 添加管理员
     * @param member 会员实体类
     * @throws Exception 异常
     */
    public void newAdmin(Member member) throws Exception;

    //修改密码
    void updatePsw(Member member);

    /**
     * 查询某单位所有成员对于某活动的报名情况
     * @param organizationId 单位ID
     * @param activityId 活动ID
     * @return 会员列表
     * @throws Exception 异常
     */
    List<ApplicationMemberDto> queryByOrganizationId(@Param("organizationId") int organizationId, @Param("activityId") int activityId) throws Exception;

    /**
     * 检查身份证号码是否重复
     * @param idNumber 身份证号
     * @return 是否重复 1是0否
     */
    int checkIdNumber(@Param("idNumber") String idNumber);
    
}
