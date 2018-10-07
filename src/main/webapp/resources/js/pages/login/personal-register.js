// 吴晓阳
$(document).ready(function() {
	var
		el = {
			J_company_option: '.company-option', // 选择公司
			J_username: '.username', // 用户名判断
		};

		// 入口函数
		init();

		function init(){
			// 是否有单位选项
			$(el.J_company_option).change(function() {
				console.log($(this).val());
				if ($(this).val() == -2) {  // 如果是暂无则不需要填写
					$('.company').addClass('none');
				}
				else{
					$('.company').removeClass('none');
				}
			});
		}
});