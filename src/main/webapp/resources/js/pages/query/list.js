// 吴晓阳
$(document).ready(function() {
	var
		el = {
			J_export: '.export', // ajax导出
			J_activity_id: '.activity-id', // 活动名称
			J_organization_id: '.organization-id', // 单位名称
			J_score: '.score', // 成绩
			J_export_activity_id: '.export-activity', // 导出活动的值
			J_export_organization_id: '.export-organization', // 导出单位的值
			J_export_score: '.export-score', // 导出成绩的值
		};

		// 入口函数
		init();

		function init(){
			/*传值*/
			function sendValue(beforeValue,targetValue) {
				var value = $(beforeValue).find('option:selected').val();
				$(targetValue).val(value);
			}
			$(el.J_activity_id).change(function() {
				sendValue(el.J_activity_id,el.J_export_activity_id);
			});
			$(el.J_organization_id).change(function() {
				sendValue(el.J_organization_id,el.J_export_organization_id);
			});
			$(el.J_score).change(function() {
				sendValue(el.J_score,el.J_export_score);
			});
		}
});