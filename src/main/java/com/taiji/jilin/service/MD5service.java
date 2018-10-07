package com.taiji.jilin.service;

public interface MD5service {
	
    public String byteToArrayString(byte bByte);

    // 返回形式只为数字
    public String byteToNum(byte bByte); 

    // 转换字节数组为16进制字串
    public String byteToString(byte[] bByte) ;

    public String GetMD5Code(String strObj) ;
}
