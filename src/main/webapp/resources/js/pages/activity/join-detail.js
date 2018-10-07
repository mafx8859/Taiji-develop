// 吴晓阳
$(document).ready(function() {
	var
		el = {
			J_tip: '.tip', //提示信息
			J_update: '.update', // 修改按钮
			J_repulse: '.repulse', // 取消报名按钮
			J_ajax_submit: '.J-ajax-submit', // ajax提交按钮
			J_submit_all: '.submitAll', // 统一报名
		};

		// 入口函数
		init();

		function init(){

			// ajax审核不通过
			$(el.J_repulse).click(function(ev) {
				
				// 附加上点击此按钮的信息在数据库中的顺序
				var 
					path_url = _ajax.url.activity.join_detail.repulse,
					id = $(this).attr('data-id'), // 会员id
					applicationId = $(this).attr('data-num'); // 当前序列
				// 如果符合条件无法提交
				if (confirm('是否取消报名？')) {
					$.ajax({
						url: path_url,
						type: 'get',
						dataType: 'json',
						data: {
                            applicationId: applicationId
						},
						success: function(data) {
							$('.table tr[data-id='+ id +'] .apply-text').text('未报名');
							// 按钮样式
							$('.table tr[data-id='+ id +'] .repulse').text('未报名');
							$('.table tr[data-id='+ id +'] .repulse').attr('disabled','disabled');
							$('.table tr[data-id='+ id +'] .update').text('报名');
							$('.table tr[data-id='+ id +'] .update').removeAttr('disabled');
						},
						error: function(data,errorMsg) {
							console.log('error');
						}
					})
				}
			});
			// // 点击修改计划时传一个次序给修改弹出框
			$(el.J_update).click(function(ev) {
				// 先清空提示信息
				$(el.J_tip).text('');
				var 
					id = $(this).attr('data-num'), // 会员id
					acitivity_id = $(this).attr('data-activity'), // 活动id
					path_url = _ajax.url.activity.join_detail.update;
					$('#dataId').val(id);// 传值成功
					$('#acitivityId').val(acitivity_id);// 传值成功
			});
			
			// ajax单人报名
			$(el.J_ajax_submit).click(function(ev) {
				// 先清空提示信息
				$(el.J_tip).text('');
				var 
					id = $('#dataId').val(), // 获取顺序
					activity_id = $('#acitivityId').val(), // 活动的id
					path_url = _ajax.url.activity.join_detail.submit,
					result1 = {
						"0": "暂无",
						"1": "有"
					}, // 健康证明 保险 订餐
					result2 = {
						"1": "需要",
						"0": "不需要"
					}, // 餐饮 住宿
					insurance = $('input[name="insurance-one"]:checked').val(), // 保险
					health = $('input[name="health-one"]:checked').val(), // 健康证明
					liability = $('input[name="liability-one"]:checked').val(), // 责任书
					meal = $('input[name="meal-one"]:checked').val(), // 餐饮需要传值
					hotel = $('input[name="hotel-one"]:checked').val(); // 住宿需要传的账号
				// 如果符合条件无法提交
					$.ajax({
						url: path_url,
						type: 'get',
						dataType: 'json',
						data: {
							memberId: id, // 会员id
							activityId: activity_id, // 活动id
							insurance: insurance, // 保险
							health: health, // 健康证明
							liability: liability, // 责任书
							meal: meal, // 餐饮
							hotel: hotel, // 住宿
						},
						success: function(data) {
							// console.log(data.errorMsg[0].msg);
							if (data.code) {
								// 提示信息
								alert('报名成功');
								// 隐藏填写表单
								$('button[data-dismiss="modal"]').click();
								// 修改dom
								// 保险
								$('.table tr[data-id='+ id +'] > td.insurance-text').text(result1[insurance]);
								// 健康证明
								$('.table tr[data-id='+ id +'] > td.health-text').text(result1[health]);
								// 责任书
								$('.table tr[data-id='+ id +'] > td.liability-text').text(result1[liability]);
								// 订餐
								$('.table tr[data-id='+ id +'] > td.catering-text').text(result2[meal]);
								// 住宿
								$('.table tr[data-id='+ id +'] > td.accommodation-text').text(result2[hotel]);
								// 报名状态
								$('.table tr[data-id='+ id +'] > td.apply-text').text('已报名');
								// 按钮样式
								$('.table tr[data-id='+ id +'] .repulse').text('取消报名');
								$('.table tr[data-id='+ id +'] .repulse').removeAttr('disabled');
								$('.table tr[data-id='+ id +'] .repulse').attr('data-num',data.applicationId);
								$('.table tr[data-id='+ id +'] .update').text('已报名');
								$('.table tr[data-id='+ id +'] .update').attr('disabled','disabled');
							}
							else{
								$(el.J_tip).text(data.errorMsg[0].msg);
							}
						},
						error: function(data,errorMsg) {
							console.log('error');
						}
					})
			});
		}
});