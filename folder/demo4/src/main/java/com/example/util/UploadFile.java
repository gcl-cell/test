package com.example.util;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class UploadFile {
	
	
	public static String  getFilePath(HttpServletRequest request,@RequestParam("files") CommonsMultipartFile files) throws IllegalStateException, IOException{
		
	    //获取项目发布的绝对路径
        String realPath = request.getServletContext().getRealPath("/");
        String realpath=realPath+"files";
        //创建文件操作对象
        File f=new File(realpath);
        //判断文件夹是否存在
        if(!f.exists()){
      	  f.mkdirs();
        }
        //获取上传文件的名字
        String originalFilename = files.getOriginalFilename();
        //获取名字的后缀
        String suffix = originalFilename.substring(originalFilename.indexOf("."));
        //文件的新名字
        String newFileName=UUID.randomUUID().toString()+suffix;
        
        //使用file中的transferTo()将文件从临时位置剪切到指定的路径
        File tranf=new File(realpath+"/"+newFileName);
        //f.transferTo(new File(realPatht+"/"+newName));

        files.transferTo(tranf);
		
		String filepath="files/"+newFileName;
		
		return filepath;
	}

}
