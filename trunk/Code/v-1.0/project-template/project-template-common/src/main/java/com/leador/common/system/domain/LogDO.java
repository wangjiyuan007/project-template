package com.leador.common.system.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

import java.util.Date;
/**
 * <p>Title: LogDO</p>
 * <p>Description: 日志类</p>
 * <p>Company: www.leador.com.cn</p> 
 * <p>Date: 2018年10月24日 下午7:15:23</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@Data
public class LogDO {
	private Long id;
	private Long userId;
	private String username;
	private String operation;
	private Integer time;
	private String method;
	private String params;
	private String ip;
	@JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
	private Date gmtCreate;

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public void setOperation(String operation) {
		this.operation = operation == null ? null : operation.trim();
	}

	public void setMethod(String method) {
		this.method = method == null ? null : method.trim();
	}

	public void setParams(String params) {
		this.params = params == null ? null : params.trim();
	}

	public void setIp(String ip) {
		this.ip = ip == null ? null : ip.trim();
	}

}