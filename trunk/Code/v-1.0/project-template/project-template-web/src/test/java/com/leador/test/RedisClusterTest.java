//package com.leador.test;
//
//import com.leador.common.system.utils.RedisUtil;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringRunner;
//
///**
// * @author Long LI
// * @Despriction:
// * @date 2019/1/17 0017 上午 9:40
// */
//@RunWith(SpringRunner.class)
//@SpringBootTest
//public class RedisClusterTest {
//
//    @Autowired
//    private RedisUtil redisUtil;
//
//    /**
//    * @Description:    redisUtil操作String类型
//    * @Author:         longli
//    * @CreateDate:     2019/1/17 0017 上午 9:55
//    * @Param
//    */
//    @Test
//    public void testSetStr(){
//        redisUtil.set("str","demaxiya");
//        System.out.println(redisUtil.get("str"));
//    }
//
//    /**
//    * @Description:    判断key是否存在
//    * @Author:         longli
//    * @CreateDate:     2019/1/17 0017 上午 10:17
//    * @Param
//    */
//    @Test
//    public void hasKey(){
//        System.out.println(redisUtil.hasKey("str"));//存在
//        System.out.println(redisUtil.hasKey("pub"));//不存在
//    }
//}
