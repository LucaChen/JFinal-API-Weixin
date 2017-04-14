package com.demo.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Lucas on 2017/4/4.
 */
public class FileUtils {
    public static final FileUtils instance = new FileUtils();

    // 随机一个文件名
//    public String randomFileName() {
//        Date dt = new Date(System.currentTimeMillis());
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyMMddHHmmssSSS");
//        String fileName = sdf.format(dt);
//        return fileName+".png";
//    }

    /**
     * 修改文件名
     * @param filePath
     *            eg:D:/gai.jpg
     * @return
     */
    public String changeFileName(String filePath, String orderNumber) {
        File file = new File(filePath);// 指定文件名及路径
        String name = orderNumber+".silk";
        //文件夹位置
        String path = filePath.substring(0, filePath.lastIndexOf("\\"));
        String newFilePath = path+"\\"+name;
        file.renameTo(new File(newFilePath)); // 改名
        file.delete();
        return name;
    }
}