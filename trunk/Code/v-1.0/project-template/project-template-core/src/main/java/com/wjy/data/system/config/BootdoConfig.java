package com.wjy.data.system.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * <p>Title: BootdoConfig</p>
 * <p>Description: </p>
 * <p>Company: www.leador.com.cn</p> 
 * <p>Date: 2018年10月25日 下午3:09:57</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@Component
@ConfigurationProperties(prefix="bootdo")
public class BootdoConfig {
	//上传路径
	private String uploadPath;

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
}
