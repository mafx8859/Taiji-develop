package com.taiji.jilin.service.impl;

import com.taiji.jilin.common.dto.QueryDto;
import com.taiji.jilin.mapper.QueryMapper;
import com.taiji.jilin.service.QueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.List;

/**
 * @author 单继重
 * @since 2017/10/22 10:41
 */
@Service("queryService")
public class QueryServiceImpl implements QueryService {

    @Autowired
    private
    QueryMapper queryMapper;

    public List<QueryDto> query(int activityId, int organizationId, int score, int status, int sex, int age1, int age2) throws Exception {
        List<QueryDto> list = queryMapper.query(activityId,organizationId,score,status,sex);
        for (int i = 0 ; i < list.size() ; i ++){
            QueryDto queryDto = list.get(i);
            if (!(queryDto.getBirth() == null || queryDto.getBirth().equals(""))){
                int nowYear = Calendar.getInstance().get(Calendar.YEAR);
                int year = Integer.parseInt(queryDto.getBirth().substring(0,4));
                int age = nowYear - year;
                queryDto.setAge(String.valueOf(age));
            }
            list.set(i,queryDto);
        }

        //年龄段筛选（不通过SQL）
        if (age1 != -1 && age2 != -1) {
            for (int i = 0 ; i < list.size() ; i ++){
                QueryDto queryDto = list.get(i);
                if (queryDto.getAge() == null){
                    list.remove(i);
                    i --;
                }else if (Integer.parseInt(queryDto.getAge()) < age1 || Integer.parseInt(queryDto.getAge()) > age2) {
                    list.remove(i);
                    i --;
                }
            }
        }

        return list;
    }
}
