// 吴晓阳
$(document).ready(function() {
	var
		el = {
			J_pass: '.pass', // 审核通过
			J_repulse: '.repulse', // 审核不通过按钮
			J_delete: '.delete', // ajax删除
		};

		// 入口函数
		init();

		function init(){

			// ajax审核通过
			$(el.J_pass).click(function(ev) {
				// 附加上点击此按钮的信息在数据库中的顺序
				var 
					path_url = _ajax.url.company.list.pass,
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
					path_url = _ajax.url.company.list.repulse,
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
							if(data.code == 1){
                                $('.table tr[data-id='+ id +'] > td.status-text').text('审核不通过');
							}
						},
						error: function(data,errorMsg) {
							console.log('error');
						}
					})
			});

			// ajax删除
			$(el.J_delete).click(function(ev) {
				// 获取序列
				var 
					id = $(this).attr('data-num'),
					path_url = _ajax.url.company.list.del;
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
							if(data.code == 1){
                                $('button[data-num='+ id +']').parents('tr').remove();
							}
							// 暂定
						},
						error: function(data,errorMsg) {
							console.log('error');
						}
					})
				}
			});
		}
});