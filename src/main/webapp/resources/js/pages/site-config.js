(function(){

    var site = {
        //这是前端本地需要配置的，用来看自己写的页面
        website:'http://www.taiji.com/Taiji/src/main/webapp/resources/', // 静态站点地址
        // dynamicWebsite:'http://www.jlstjq.com:8080/', //线上
        dynamicWebsite:'http://localhost:80/', // 本地调试版本
    }
    // 页面内容
    _ajax = {
        status: 0, //0-前端调试，1-后端调试, 2-后端部署
        website: site.website,
        dynamicWebsite: site.dynamicWebsite, // jsp动态
        // staticWebsite: site.staticWebsite,
        //统一错误信息入口
        msg:{
            0: '网络加载错误'
        },
        //ajax地址信息
        url: {
            /*---公用接口---*/
            city_linkage: site.dynamicWebsite + 'resources/mock/city.json',  // 省市联动
            username: site.dynamicWebsite + 'user/login/ajax/check', // 用户名重复验证
            check_id: site.dynamicWebsite + 'user/ajax/check/id', // 身份证账号查询
            tableChinese: site.dynamicWebsite + 'resources/mock/tableChinese.json', // 表格中文配置
            /*---私用接口---*/
            // 会员管理
            vip:{
               // 会员列表 超级管理员审核账号
               list: {
                    pass: site.dynamicWebsite + 'user/ajax/audit', // 审核通过
                    repulse: site.dynamicWebsite + 'user/ajax/un/audit', // 审核不通过
                    submit: site.dynamicWebsite + 'user/update/psw', // 提交修改
                    del: site.dynamicWebsite + 'user/delete/', // 删除
                    admin: site.dynamicWebsite + 'user/'
               },
               // 会员列表 单位管理员审核账号
               list2: {
                    pass: site.dynamicWebsite + 'user/ajax/audit', // 审核通过
                    repulse: site.dynamicWebsite + 'user/ajax/un/audit', // 审核不通过
               }
            },
            // 单位管理
            company:{
               // 单位列表
               list: {
                    pass: site.dynamicWebsite + 'organization/ajax/audit', // 审核通过
                    repulse: site.dynamicWebsite + 'organization/ajax/un/audit', // 审核不通过
                    del: site.dynamicWebsite + 'organization/delete/', // 删除
               },
            },
            // 活动管理
            activity:{
               // 单位列表
               list: {
                    pass: site.dynamicWebsite + 'activity/ajax/audit', // 审核通过
                    repulse: site.dynamicWebsite + 'activity/ajax/un/audit', // 审核不通过
                    del: site.dynamicWebsite + 'activity/delete/', // 删除
               },
               // 审核参加报名人员
               check: {
                    pass: site.dynamicWebsite + 'application/ajax/audit', // 审核通过
                    repulse: site.dynamicWebsite + 'application/ajax/un/audit', // 审核通过
                    grade: site.dynamicWebsite + 'application/ajax/grade', // 打分
               },
               // 单位管理员统一报名
               join_detail: {
                    submit: site.dynamicWebsite + 'application/ajax/sign/in', // 个人报名认项
                    repulse: site.dynamicWebsite + 'application/ajax/sign/out', // 审核不通过
               }
            },
            // 我的活动
            personnel:{
              // 已经报名
              my_list: {
                del: site.website + 'mock/test.json', // 取消报名
              }
            },
        },
    }
})();