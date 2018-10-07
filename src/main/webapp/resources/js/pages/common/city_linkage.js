/*省市联动的js
吴晓阳*/

// 入口函数
$(document).ready(function() {
	// 变量声明
	// 对象盒子
	var 
		el = {
			J_city: '.city', // 地区
			J_area: '.area', // 区县
		};
	// 加载函数
	_getArea();

	function _getArea() {
		var 
			path_url = _ajax.url.city_linkage; // 地区数据的json文件
		// 获取初始地区信息
		$.ajax({
			url: path_url,
			type: 'get',
			dataType: 'json',
			success: function (data) {
				var option = '';
				$.each(data.city,function(i, o) {
					option += "<option value=" + o.name + ">" + o.name + "</option>";
				});
				$(el.J_city).append(option);
			}
		})
		// 切换地区时
		$(el.J_city).change(function() {
			// 清除之前的选项然后重新添加默认项
			$(el.J_area).empty().append("<option value='-1' selected='selected'>请选择</option>");
			// 获取到选中的值
			var cityVal = $(this).find('option:selected').val();
			$.ajax({
			url: path_url,
			type: 'get',
			dataType: 'json',
			success: function (data) {
					var option = '';
					$.each(data.city,function(i, o) {
						// 如果选中值找到匹配项
						if (cityVal == o.name) {
							$.each(o.area,function(index, val) {
								option += "<option value=" + val + ">" + val + "</option>";
							});
						};
					});
					$(el.J_area).append(option);
				}
			})
		});
	}
	
});
