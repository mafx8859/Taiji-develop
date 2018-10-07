// 吴晓阳
$(document).ready(function() {
	var
		el = {
			J_pass: '.pass', // 审核通过
			J_repulse: '.repulse', // 审核不通过按钮
			J_update: '.update', // 点击修改按钮
			J_ajax_submit: '.J-ajax-submit', // ajax提交按钮
			J_delete: '.delete', // ajax删除
			J_set_admin: '.set-admin', // 设置单位管理员
			J_psw1: '.password1', //  新密码
			J_psw2: '.password2', // 重复密码
			J_tip: '.tip', // 提示信息
			J_organization: '.organization', // 所属单位
			J_status: '.filter-status', // 审核状态
			J_isAdmin: '.isAdmin', // 是否是管理员
			J_isJudge: '.isJudge', // 是否是裁判员
			J_isCoach: '.isCoach', // 是否是教练员
			J_isInstructor: '.isInstructor', // 是否是社会体育指导员
			J_grade: '.grade', // 段位
			/*导出所需要的值*/
			J_export_organization: '.export-organization', // 所属单位
			J_export_status: '.export-status', // 审核状态
			J_export_isAdmin: '.export-isAdmin', // 是否是管理员
			J_export_isJudge: '.export-isJudge', // 是否是裁判员
			J_export_isCoach: '.export-isCoach', // 是否是教练员
			J_export_isInstructor: '.export-isInstructor', // 是否是社会体育指导员
			J_export_grade: '.export-grade', // 段位
		};

		// 入口函数
		init();

		function init(){
			/*传值*/
			function sendValue(beforeValue,targetValue) {
				var value = $(beforeValue).find('option:selected').val();
				$(targetValue).val(value);
			}
			$(el.J_organization).change(function() {
				sendValue(el.J_organization,el.J_export_organization);
			});
			$(el.J_status).change(function() {
				sendValue(el.J_status,el.J_export_status);
			});
			$(el.J_isAdmin).change(function() {
				sendValue(el.J_isAdmin,el.J_export_isAdmin);
			});
			$(el.J_isJudge).change(function() {
				sendValue(el.J_isJudge,el.J_export_isJudge);
			});
			$(el.J_isCoach).change(function() {
				sendValue(el.J_isCoach,el.J_export_isCoach);
			});
			$(el.J_isInstructor).change(function() {
				sendValue(el.J_isInstructor,el.J_export_isInstructor);
			});
			$(el.J_grade).change(function() {
				sendValue(el.J_grade,el.J_export_grade);
			});

			// ajax设置管理员
			$(el.J_set_admin).click(function(ev) {
					// 附加上点击此按钮的信息在数据库中的顺序
				var 
					path_url = _ajax.url.personnel.my_list.del,
					type = {
						"0": "个人会员",
						"1": "单位会员",
						"2": "单位管理员",
					}
					id = $(this).attr('data-num'); // 当前序列
					// 如果符合条件无法提交
					$.ajax({
						url: path_url,
						type: 'get',
						dataType: 'json',
						data: {
							id: id
						},
						success: function(data) {
							if (data.code == 1){
	                            $('.table tr[data-id='+ id +'] > td.type-text').text(type[2]);
							}
						},
						error: function(data,errorMsg) {
							console.log('error');
						}
					})
			});

			// ajax审核通过
			$(el.J_pass).click(function(ev) {
				// 附加上点击此按钮的信息在数据库中的顺序
				var 
					path_url = _ajax.url.vip.list.pass,
					id = $(this).attr('data-num'); // 当前序列
				// 如果符合条件无法提交
					$.ajax({
						url: path_url,
						type: 'get',
						dataType: 'json',
						data: {
							id: id
						},
						success: function(data) {
							if (data.code == 1){
                                $('.table tr[data-id='+ id +'] > td.status-text').text('审核通过');
							}
						},
						error: function(data,errorMsg) {
							console.log('error');
						}
					})
			});

			// ajax审核不通过
			$(el.J_repulse).click(function(ev) {
				
				// 附加上点击此按钮的信息在数据库中的顺序
				var 
					path_url = _ajax.url.vip.list.repulse,
					id = $(this).attr('data-num'); // 当前序列
				// 如果符合条件无法提交
					$.ajax({
						url: path_url,
						type: 'get',
						dataType: 'json',
						data: {
							id: id
						},
						success: function(data) {
							if (data.code == 1) {
								$('.table tr[data-id='+ id +'] > td.status-text').text('审核不通过');
							}
						},
						error: function(data,errorMsg) {
							console.log('error');
						}
					})
			});

			// ajax点击修改
			$(el.J_update).click(function(ev) {
				// 附加上点击此按钮的信息在数据库中的顺序
				var 
					id = $(this).attr('data-num');
					$('#dataId').val(id);// 传值成功
			});

			// ajax修改提交
			$(el.J_ajax_submit).click(function(ev) {
				// 先清空提示信息
				$(el.J_tip).text('');
				// 附加上点击此按钮的信息在数据库中的顺序
				var 
					id = $('#dataId').val(),
					path_url = _ajax.url.vip.list.submit, // 后台方法地址
					psw1 = $(el.J_psw1).val(), // 新密码的值
					psw2 = $(el.J_psw2).val(); // 重复密码的值
				// 如果符合条件无法提交
				if (!(ajax_flag1 || ajax_flag2 || ajax_flag3) && psw1 == psw2) {
					$.ajax({
						url: path_url,
						type: 'post',
						dataType: 'json',
						data: {
							id: id,
							password: psw1,
						},
						success: function(data) {
							// console.log(data.errorMsg[0].msg);
							if (data.code == 1) {
								// 提示信息
								alert('修改成功');
								// 隐藏填写表单
								$('button[data-dismiss="modal"]').click();
							}
							else{
								$(el.J_tip).text(data.errorMsg[0].msg);
							}
						},
						error: function(data,errorMsg) {
							console.log('error');
						}
					})
				}
				else{
					$("body").animate({scrollTop:0}, 500);
					$(el.J_tip).text('信息为空或两次密码不一致,无法提交');
				}
			});

			// ajax删除
			$(el.J_delete).click(function(ev) {
				// 获取序列
				var 
					id = $(this).attr('data-num'),
					path_url = _ajax.url.vip.list.del;
				// 删除确认
				if (confirm("确认要删除？")) {
					$.ajax({
						url: path_url + id,
						type: 'get',
						dataType: 'json',
						data: {
							id: id
						},
						success: function(data) {
							if (data.code == 1) {
								$('button[data-num='+ id +']').parents('tr').remove();
								// 暂定
							}
						},
						error: function(data,errorMsg) {
							console.log('error');
						}
					})
				}
			});
		}
});