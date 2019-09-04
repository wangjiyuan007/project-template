package com.wjy.system.controller;

//import org.apache.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
/**
 * <p>Title: HealthController</p>
 * <p>Description: 健康检查</p>
 * <p>Company: www.wjy.com.cn</p>
 * <p>Date: 2019年1月8日 下午3:21:57</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@RestController
public class HealthController {
	
	@RequestMapping("/test")
	public int test(){
		return 200;//HttpStatus.SC_OK;
	}
}
