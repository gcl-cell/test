package com.example.wangyiyun;

import com.alibaba.fastjson.JSON;
import com.example.util.CheckSumBuilder;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 短信发送工具类
 * @author Administrator
 *
 */
public class MobileMessageSend {
    //发送验证码的请求路径URL
    private static final String SERVER_URL="https://api.netease.im/sms/sendcode.action";
    //网易云信分配的账号，请替换你在管理后台应用下申请的Appkey
    private static final String APP_KEY="93247765124f3440506fcb641a58a0fd";
    //网易云信分配的密钥，请替换你在管理后台应用下申请的appSecret
    private static final String APP_SECRET="d0d631d885ce";
    //随机数
    private static final String NONCE="123456";
    //短信模板ID
    private static final String TEMPLATEID="14836138";
    //手机号
    private static final String MOBILE="15137102897";
    //验证码长度，范围4～10，默认为4
    private static final String CODELEN="6";

    public static void sendMsg(String phone) throws IOException {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpPost post = new HttpPost(SERVER_URL);

//      CheckSum的计算
        String curTime=String.valueOf((new Date().getTime()/1000L));
        String checkSum= CheckSumBuilder.getCheckSum(APP_SECRET,NONCE,curTime);

        //设置请求的header
        post.addHeader("AppKey",APP_KEY);
        post.addHeader("Nonce",NONCE);
        post.addHeader("CurTime",curTime);
        post.addHeader("CheckSum",checkSum);
        post.addHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");

        //设置请求参数
        List<NameValuePair> nameValuePairs =new ArrayList<>();
        nameValuePairs.add(new BasicNameValuePair("mobile",phone));
        nameValuePairs.add(new BasicNameValuePair("templateid", TEMPLATEID));
        nameValuePairs.add(new BasicNameValuePair("codeLen", CODELEN));

        post.setEntity(new UrlEncodedFormEntity(nameValuePairs,"utf-8"));

        //执行请求
        HttpResponse response=httpclient.execute(post);
        String responseEntity= EntityUtils.toString(response.getEntity(),"utf-8");
        //获取发送状态码
        String code= JSON.parseObject(responseEntity).getString("code");
        if (code.equals("200")){
            System.out.println("发送成功！");

            return;

        }
        System.out.println("发送失败！");
    }
}
