package com.zuikaku.servlets;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * 用于生成登录时的图片验证码
 */
public class ValidateServlet extends HttpServlet {

    public static final char[] chars={'2','3','4','5','6','7','8','9','A'};//自定义验证码池
    public static Random random=new Random();//随机数

    public static String getRandomString(){//获取6位随机数，放在图片里
        StringBuffer buffer=new StringBuffer();
        for(int i=0;i<6;i++){
            buffer.append(chars[random.nextInt(chars.length)]);
        }
        return buffer.toString();
    }

    public static Color getRandomColor(){//获取随机的颜色
        return new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
    }

    public static Color getReverseColor(Color c){//返回某颜色的反色
        return new Color(255 - c.getRed(), 255 - c.getGreen(), 255 - c.getBlue());
    }



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setHeader("Cache-Control","no-cache");
        resp.setContentType("image/jpeg");  //设置输出类型
        String randomString = getRandomString();//随机字符串
        req.getSession(true).setAttribute("randomString", randomString);//放到session里

        int width=100;//图片宽度
        int height=30;//图片高度

        Color color=getRandomColor();//随机颜色，用于背景色
        Color reverse=getReverseColor(color);//反色，用于前景色
        //创建一个彩色图片
        BufferedImage bi=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g=bi.createGraphics();  //绘图对象
        g.setFont(new Font(Font.SANS_SERIF,Font.BOLD,16));//设置字体
        g.setColor(color);//设置颜色
        g.fillRect(0, 0, width, height);//绘制背景
        g.setColor(reverse);
        g.drawString(randomString, 18, 20);//绘制随机字符
        for(int i=0,n=random.nextInt(100);i<n;i++){//画最多100个噪音点
            g.drawRect(random.nextInt(width), random.nextInt(height), 1, 1);
        }
        ServletOutputStream out= resp.getOutputStream();//转成JPEG格式
        JPEGImageEncoder encoder= JPEGCodec.createJPEGEncoder(out);//编码器
        encoder.encode(bi);//对图片进行编码
        out.flush();//输出到客户端

    }
}
