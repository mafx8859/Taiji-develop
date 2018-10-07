// 吴晓阳
$(document).ready(function() {
	var
		el = {
			J_pass: '.pass', // 审核通过
			J_repulse: '.repulse', // 审核不通过按钮
			J_grade: '.grade', // 选择打分按钮
			J_score: '.score', // 得分情况
			J_sub_grade: '.sub-grade', // 提交分数
			J_tip: '.tip', // 提示信息
		};

		// 入口函数
		init();

		function init(){

			// ajax审核通过
			$(el.J_pass).click(function(ev) {
				// 附加上点击此按钮的信息在数据库中的顺序
				var 
					path_url = _ajax.url.activity.check.pass,
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
					path_url = _ajax.url.activity.check.repulse,
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

			// 打分按钮
			$(el.J_grade).click(function(ev) {
				var id = $(this).attr('data-num'); // 获取打分人的id
				$('#applicationId').val(id); // 赋值到一个输入框内,提交打分时候使用
			});

			// ajax提交分数
			$(el.J_sub_grade).click(function(ev) {
				// 附加上点击此按钮的信息在数据库中的顺序
				var 
					path_url = _ajax.url.activity.check.grade,
                	score = $(el.J_score).find('option:selected').val(), // 所需要的value
                	score_text = $(el.J_score).find('option:selected').text(), // 文本 
					applicationId = $('#applicationId').val(); // 当前提交人序列
					$.ajax({
						url: path_url,
						type: 'post',
						dataType: 'json',
						data: {
							id: applicationId,
							score: score
						},
						success: function(data) {
							if (data.code == 1) {
								console.log(score_text);
								$('.table tr[data-id='+ applicationId +'] > td.score-text').text(score_text);
								alert('打成绩成功');
								// 隐藏填写表单
								$('button[aria-label="Close"]').click();
							}
						},
						error: function(data,errorMsg) {
							console.log('error');
						}
					})
			});

		}
});