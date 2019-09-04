package com.wjy.data.system.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * <p>Title: WebConfigurer</p>
 * <p>Description: </p>
 * <p>Company: www.leador.com.cn</p>
 * <p>Date: 2018年10月25日 下午3:12:13</p>
 *
 * @author XiaShenBao
 * @version 1.0
 */
@Component
class WebConfigurer extends WebMvcConfigurerAdapter {

    @Autowired
    BootdoConfig bootdoConfig;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/files/**").addResourceLocations("file:///" + bootdoConfig.getUploadPath());
    }

}