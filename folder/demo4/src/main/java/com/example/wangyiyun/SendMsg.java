package com.example.wangyiyun;

import java.io.IOException;

import org.apache.http.util.EntityUtils;

/**
 * Created by admin on 2017/9/22.
 */
public class SendMsg {
    public static void main(String[] args) throws IOException {
        String mobileNumber = "15137102897";
		MobileMessageSend.sendMsg(mobileNumber);
		System.out.println(mobileNumber);

		
	}
}
