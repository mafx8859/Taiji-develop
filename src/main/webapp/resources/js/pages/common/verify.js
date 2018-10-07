/*验证的js
吴晓阳*/
// 因为跨页面所以需要全局定义
var 
	ajax_arr1 = new Array, // 文本框ajax提交时判断是否可以提交的数组
	ajax_arr2 = new Array, // 下拉框ajax提交时判断是否可以提交的数组
	ajax_arr3 = new Array, // 多选下拉框ajax提交时判断是否可以提交的数组
	ajax_flag1,
	ajax_flag2,
	ajax_flag3,
	flag1,
	flag2,
	flag3;
// 入口函数
$(document).ready(function() {
	// 变量声明
	// 对象盒子
	var 
		el = {
			J_ajax_submit: '.J-ajax-submit', // ajax提交按钮
			J_submit: '.J-submit', // 表单提交按钮
			J_require_text: '.require-text', // 必填文本框
			J_require_option: '.require-option', // 必选下拉框
			J_require_options: '.require-options', // 必填多选下拉框
			J_a_require_text: '.a-require-text', // ajax必填文本框
			J_a_require_option: '.a-require-option', // ajax必选下拉框
			J_a_require_options: '.a-require-options', // ajax必填多选下拉框
			J_username: '.username', // 用户名判断
			J_id_number: '.id-number', // 身份证判断
		};
	// 消息盒子 暂时没什么用
	var 
		tip = {
			J_search_tip: '请输入18位的同意社会信用代码'
		}
	// 加载函数
	_verify();
	_upload();

	// 验证函数 (私有函数_)
	function _verify() {
		var 
			arr1 = new Array, // 必填文本框的数组
			arr2 = new Array, // 必填下拉框的数组
			arr3 = new Array; // 必填多选下拉框的数组
		
		// 普通提交
		$(el.J_submit).click(function(event) {
			// 必填文本框
			$(el.J_require_text).each(function() {
				var textVal = $(this).val();
				if (textVal == "") {
					$(this).parent().addClass('has-error');
					arr1.push(textVal); // 为空则存入数组中
				}
				else{
					$(this).parent().removeClass('has-error');
				}
				// 判断flag
				if (arr1.length) {
					flag1 = true;
				}
				else{
					flag1= false;
				}
			});
			$(el.J_require_text).change(function() {
				var textVal = $(this).val();
				if (textVal == "") {
					$(this).parent().addClass('has-error');
				} else{
					arr1.pop(); // 清除存入数组中的text为空的个数
					$(this).parent().removeClass('has-error');
				}
			});
			// 必填下拉框
			$(el.J_require_option).each(function() {
				var optionVal = $(this).val();
				if (optionVal == -1) {
					$(this).parent().addClass('has-error');
					arr2.push(optionVal); // 为空则存入数组中
				} 
				else{
					$(this).parent().removeClass('has-error');
				}
				// 判断flag
				if (arr2.length) {
					flag2 = true;
				}
				else{
					flag2= false;
				}
			});
			$(el.J_require_option).change(function() {
				var optionVal = $(this).children('option:selected').val();
				if (optionVal == -1) {
					$(this).parent().addClass('has-error');
					// console.log('error:下拉框未填写') // 调试提醒
				} else{
					arr2.pop(); // 清除存入数组中的text为空的个数
					$(this).parent().removeClass('has-error');
				}
			});
			// 多选下拉框
			$(el.J_require_options).each(function() {
				var optionsVal = $(this).next().find('.select2-selection__choice').length;
				if (optionsVal == 0) {
					$(this).parent().addClass('has-error');
					$(this).next().find('.select2-selection').css('border', '1px solid #dd4b39');
					arr3.push(optionsVal); // 为空则存入数组中
				} 
				else{
					$(this).parent().removeClass('has-error');
					$(this).next().find('.select2-selection').css('border','1px solid #ccc');
				}
				// 判断flag
				if (arr3.length) {
					flag3 = true;
				}
				else{
					flag3 = false;
				}
			});
			$(el.J_require_options).change(function() {
				var optionsVal = $(this).next().find('.select2-selection__choice').length;
				if (optionsVal == 0) {
					$(this).parent().addClass('has-error');
					$(this).next().find('.select2-selection').css('border', '1px solid #dd4b39');
				} else{
					arr3.pop(); // 清除存入数组中的text为空的个数
					$(this).parent().removeClass('has-error');
					$(this).next().find('.select2-selection').css('border','1px solid #ccc');
				}
			});
			// 阻止表单提交
			if (flag1 || flag2 || flag3) {
				// 如果有提示,则显示提示
				if ($(this).siblings('p').length) {
					$(this).siblings('p').removeClass('none');
					$("html,body").animate({scrollTop:0}, 500);
					return false;
				}
				// 如果没有提示,则显不示提示
				else{
					$("html,body").animate({scrollTop:0}, 500);
					return false;
				}
			}
		});
		// ajax提交
		$(el.J_ajax_submit).click(function(event) {
			// 必填文本框
			$(el.J_a_require_text).each(function() {
				var textVal = $(this).val();
				if (textVal == "") {
					$(this).parent().addClass('has-error');
					ajax_arr1.push(textVal); // 为空则存入数组中
				}
				else{
					$(this).parent().removeClass('has-error');
				}
				// 判断flag
				if (ajax_arr1.length) {
					ajax_flag1 = true;
				}
				else{
					ajax_flag1= false;
				}
			});
			$(el.J_a_require_text).change(function() {
				var textVal = $(this).val();
				if (textVal == "") {
					$(this).parent().addClass('has-error');
				} else{
					ajax_arr1.pop(); // 清除存入数组中的text为空的个数
					$(this).parent().removeClass('has-error');
				}
			});
			// 必填下拉框
			$(el.J_a_require_option).each(function() {
				var optionVal = $(this).val();
				if (optionVal == -1) {
					$(this).parent().addClass('has-error');
					ajax_arr2.push(optionVal); // 为空则存入数组中
				} 
				else{
					$(this).parent().removeClass('has-error');
				}
				// 判断flag
				if (ajax_arr2.length) {
					ajax_flag2 = true;
				}
				else{
					ajax_flag2= false;
				}
			});
			$(el.J_a_require_option).change(function() {
				var optionVal = $(this).children('option:selected').val();
				if (optionVal == -1) {
					$(this).parent().addClass('has-error');
					// console.log('error:下拉框未填写') // 调试提醒
				} else{
					ajax_arr2.pop(); // 清除存入数组中的text为空的个数
					$(this).parent().removeClass('has-error');
				}
			});
			// 多选下拉框
			$(el.J_a_require_options).each(function() {
				var optionsVal = $(this).next().find('.select2-selection__choice').length;
				if (optionsVal == 0) {
					$(this).parent().addClass('has-error');
					$(this).next().find('.select2-selection').css('border', '1px solid #dd4b39');
					ajax_arr3.push(optionsVal); // 为空则存入数组中
				} 
				else{
					$(this).parent().removeClass('has-error');
					$(this).next().find('.select2-selection').css('border','1px solid #ccc');
				}
				// 判断flag
				if (ajax_arr3.length) {
					ajax_flag3 = true;
				}
				else{
					ajax_flag3 = false;
				}
			});
			$(el.J_a_require_options).change(function() {
				var optionsVal = $(this).next().find('.select2-selection__choice').length;
				if (optionsVal == 0) {
					$(this).parent().addClass('has-error');
					$(this).next().find('.select2-selection').css('border', '1px solid #dd4b39');
				} else{
					ajax_arr3.pop(); // 清除存入数组中的text为空的个数
					$(this).parent().removeClass('has-error');
					$(this).next().find('.select2-selection').css('border','1px solid #ccc');
				}
			});
		});
		/*--重复密码判断--*/
		// $('.psw').blur(function(event) {
		// 	var psw1 = $('.psw').val(), // 新密码的值
		// 		 psw2 = $('.psw2').val(); // 重复密码的值
		// 	if (psw1 != psw2) {
		// 		$('.psw-tip').removeClass('none');
		// 	}
		// 	else{
		// 		$('.psw-tip').addClass('none');
		// 	}
		// });
		$('.psw2').blur(function(event) {
			var psw1 = $('.psw').val(), // 新密码的值
				psw2 = $('.psw2').val(); // 重复密码的值
			if (psw1 != psw2) {
				alert('两次密码不一致！');
				// $('.psw-tip').removeClass('none');
			}
			else{
				$('.psw-tip').addClass('none');
			}
		});
		/*--用户名判断--*/
		$(el.J_username).blur(function() {
				var username = $(el.J_username).val(),
					path_url = _ajax.url.username; // 路径
                $.ajax({
                	url: path_url,
                	type: 'get',
                	// cache: false, // 防止缓存 防止报302
                	// async: false, // 同步
                	dataType: 'json',
                	data: {
                		username: username,
                	},
                	success: function(data,msgCode) {
                		if (data.code == 1) {
							alert('您输入的用户名已存在请重新输入！'); // 显示提示
                			$(el.J_username).val(""); // 清空默认输入
                		}
                		else{
                			$('.username-tip').addClass('none'); // 隐藏提示
                		}
                	}
                })
			});
				/*--身份证判断--*/
			$(el.J_id_number).blur(function() {
				var idNumber = $(el.J_id_number).val(),
					path_url = _ajax.url.check_id; // 路径
			    $.ajax({
			       	url: path_url,
			       	type: 'get',
			       	// cache: false, // 防止缓存 防止报302
			       	// async: false, // 同步
			       	dataType: 'json',
			       	data: {
			       		idNumber: idNumber,
			       	},
			       	success: function(data,msgCode) {
			       		if (data.code == 1) {
							alert('您输入的身份证已注册请重新输入身份证！'); // 显示提示
			       			$(el.J_id_number).val(""); // 清空默认输入
			       		}
			     	}
			    })
			});
			
			
		/*// 企业注册认证信息正则验证
		// 固定电话
		$(el.J_telephone).blur(function() {
			var reg = /^\d{3}-\d{8}|\d{4}-\d{7}$/;
			if (!(reg.test($(el.J_telephone).val())) && ($(el.J_telephone).val().length!=0)){
				$(el.J_telephone).css('border','1px solid #F61E1E');
				$(el.J_telephone).next().removeClass('none');
			}else{
				$(el.J_telephone).css('border','1px solid #ccc');
				$(el.J_telephone).next().addClass('none');
			}
		});
		*/
	};
	// 上传
	function _upload() {
		// 照片样式
		$('#portrait').css({
			width: '120px',
			height: '155px',
			border: '1px solid #000'
		});
		$('#exampleInputFile').change(function(){
			var file = this.files[0],
			    val = document.getElementById('exampleInputFile').value; // 获取属性值
			if(window.FileReader && /\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(val)) {  
			    var fr = new FileReader();  
			    fr.onloadend = function(e) {  
			        document.getElementById("portrait").src = e.target.result;
			    };  
			    fr.readAsDataURL(file);  
			}else{
				alert("图片类型必须是.gif,jpeg,jpg,png中的一种");
				document.getElementById('exampleInputFile').value = ''; // 重置value，避免错误上传
          		return false;
			}
		});
		$('.photo-upload').click(function(){
			var val = document.getElementById('exampleInputFile').value; // 获取属性值
			if(val !== '') {
				return true;
			}else{
				alert("未上传照片，请选择照片！");
				return false;
			}
		});
	}
	
});
