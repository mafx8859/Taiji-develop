package com.taiji.jilin.service.impl;

import java.util.Random;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import com.taiji.jilin.service.MD5service;

public class MD5serviceImpl implements MD5service{

	private final static String[] strDigits = { "0", "1", "2", "3", "4", "5",
            "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };
    // 返回形式为数字跟字符串
	private static Random random =new Random();
    public String byteToArrayString(byte bByte) {
        int iRet = bByte;
        // System.out.println("iRet="+iRet);
        if (iRet < 0) {
            iRet += 256;
        }
        int iD1 = iRet / 16;
        int iD2 = iRet % 16;
        return strDigits[iD1] + strDigits[iD2];
    }

    // 返回形式只为数字
    public String byteToNum(byte bByte) {
        int iRet = bByte;
        System.out.println("iRet1=" + iRet);
        if (iRet < 0) {
            iRet += 256;
        }
        return String.valueOf(iRet);
    }

    // 转换字节数组为16进制字串
    public String byteToString(byte[] bByte) {
        StringBuffer sBuffer = new StringBuffer();
        for (int i = 0; i < bByte.length; i++) {
            sBuffer.append(byteToArrayString(bByte[i]));
        }
        return sBuffer.toString();
    }

    public String GetMD5Code(String strObj) {
        String resultString = null;
        try {
            resultString = new String(strObj);
            strObj=strObj+random.nextInt(10000); 
            MessageDigest md = MessageDigest.getInstance("MD5");//通过调用getInstance（）方法来初始化MessageDigest对象
            // md.digest() 该函数返回值为存放哈希值结果的byte数组
            resultString = byteToString(md.digest(strObj.getBytes()));
            //strObj.getBytes()字符串strObj通过调用getBytes()方法返回一个bytes【】
            //getBytes() 使用平台的默认字符集将此 String 编码为 byte 序列，并将结果存储到一个新的 byte 数组中。
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        }
        return resultString;
    }
}
