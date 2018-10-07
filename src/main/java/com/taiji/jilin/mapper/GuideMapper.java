package com.taiji.jilin.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * @author 单继重
 * @since 2018/3/16 15:45
 */
@Repository
public interface GuideMapper {
    int isExist();

    String getContent();

    void update(@Param("content") String content,@Param("id") int id);

    void newContent(String content);

    int getId();
}
