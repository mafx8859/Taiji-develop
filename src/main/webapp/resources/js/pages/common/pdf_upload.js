// 上传
_upload();
function _upload() {
    // pdf格式 证书上传
    $('.sub-grade').click(function(){
        var val = document.getElementById('exampleInputFile').value; // 获取属性值
        if(window.FileReader && /\.(pdf)$/.test(val) && val !== '') {
            // 可以上传
        }else{
            alert("证书类型必须是.pdf格式，请重新选择");
            return false;
        }
    });
    // pdf格式 入场证上传
    $('.sub-grade2').click(function(){
        var val = document.getElementById('exampleInputFile2').value; // 获取属性值
        if(window.FileReader && /\.(pdf)$/.test(val) && val !== '') {
            // 可以上传
        }else{
            alert("证书类型必须是.pdf格式，请重新选择");
            return false;
        }
    });
}