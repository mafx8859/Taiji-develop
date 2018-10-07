// 吴晓阳
$(document).ready(function() {
	var
		el = {
			J_delete: '.delete', // ajax删除
		};

		// 入口函数
		init();

		function init(){

			// ajax删除
			$(el.J_delete).click(function(ev) {
				// 获取序列
				var 
					id = $(this).attr('data-num'),
					path_url = _ajax.url.personnel.my_list.del;
				// 删除确认
				if (confirm("确认要删除？")) {
					$.ajax({
						url: path_url,
						type: 'get',
						dataType: 'json',
						data: {
							id: id
						},
						success: function(data) {
							$('button[data-num='+ id +']').parents('tr').remove();
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