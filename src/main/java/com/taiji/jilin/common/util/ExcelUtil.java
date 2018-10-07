package com.taiji.jilin.common.util;

import org.apache.poi.hssf.usermodel.*;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Excel导出工具类
 * @author 单继重
 * @since 2017/11/23 16:44
 */
public class ExcelUtil {

    private static Map<String,String> exportFields = new HashMap<String, String>();

    //初始化属性Map
    static {
        //活动导出属性列表
        exportFields.put("activityName","活动名称");
        exportFields.put("content","活动内容");
        exportFields.put("population","活动人数");
        exportFields.put("provideMeal","提供餐饮");
        exportFields.put("provideHotel","提供住宿");
        exportFields.put("activityOrganization","主办单位");
        exportFields.put("tel","电话");
        exportFields.put("activityQq","负责人qq");
        exportFields.put("activityTime","活动时间");
        exportFields.put("budget","活动经费");
        exportFields.put("certificate","活动证书");
        exportFields.put("isFinish","是否结束");


        //用户导出属性列表
        exportFields.put("realName","真实姓名");
        exportFields.put("birth","出生日期");
        exportFields.put("age","年龄");
        exportFields.put("sex","性别");
        exportFields.put("isAdmin","是否为管理员");
        exportFields.put("username","用户名");
        exportFields.put("duty","职务");
        exportFields.put("qualification","学历");
        exportFields.put("political","政治面貌");
        exportFields.put("email","电子邮箱");
        exportFields.put("organization","所属单位");
        exportFields.put("performance","经营范围及主要业绩");
        exportFields.put("dues","会费缴纳记录");
        exportFields.put("area","地区");
        exportFields.put("company","工作单位");
        exportFields.put("jobTitle","职称");
        exportFields.put("idNumber","身份证号");
        exportFields.put("telephone","联系手机");
        exportFields.put("qq","QQ号");
        exportFields.put("grade","段位");
        exportFields.put("item","晋段项目");
        exportFields.put("experience","习练太极拳经历和获奖情况");
        exportFields.put("activity","参加本协会活动情况");

        //综合查询导出
        exportFields.put("memberName","真实姓名");
        exportFields.put("applyTime","报名时间");
        exportFields.put("score","成绩");
    }

    /**
     * 获取Excel实体
     * @param sheetName sheet名字
     * @param list 对象集合
     * @return Excel实体
     * @throws IllegalAccessException 安全权限异常
     */
    public static HSSFWorkbook getHSSFWorkbook(String sheetName, List list) throws IllegalAccessException {

        if (list == null || list.size() ==0) {
            return new HSSFWorkbook();
        }

        //获取对象所有属性
        Field[] fields = list.get(0).getClass().getDeclaredFields();

        //表头数组
        String[] title = new String[fields.length];

        //设置表头
        for (int i = 0 ; i < fields.length ; i ++) {
            //获取属性
            Field field = fields[i];
            //设置该属性可访问
            field.setAccessible(true);
            //在属性Map中找到该属性对应表头
            title[i] = exportFields.get(field.getName());
        }

        // 第一步，创建一个workbook，对应一个Excel文件
        HSSFWorkbook workbook = new HSSFWorkbook();

        // 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = workbook.createSheet(sheetName);

        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
        HSSFRow row = sheet.createRow(0);

        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = workbook.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式

        HSSFCell cell = null;

        //创建标题
        for(int i=0;i < title.length;i++){
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
            cell.setCellStyle(style);
        }

        //创建内容
        for(int i = 0 ; i < list.size() ; i ++) {
            row = sheet.createRow(i + 1);
            for(int j = 0 ; j < fields.length ; j ++) {
                Field field = fields[j];
                field.setAccessible(true);
                String value = String.valueOf(field.get(list.get(i)));
                if (value == null || value.equals("null")) {
                    value = "";
                }
                row.createCell(j).setCellValue(value);
            }
        }
        return workbook;
    }
}
