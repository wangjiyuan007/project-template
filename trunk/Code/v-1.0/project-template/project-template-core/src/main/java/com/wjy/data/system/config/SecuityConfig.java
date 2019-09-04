package com.wjy.data.system.config;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Configuration;

/**
 * <p>Title: SecuityConfig</p>
 * <p>Description: </p>
 * <p>Company: www.leador.com.cn</p> 
 * <p>Date: 2018年10月25日 下午3:10:38</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@EnableAutoConfiguration(exclude = {
        org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class
})
@Configuration
public class SecuityConfig {


}
