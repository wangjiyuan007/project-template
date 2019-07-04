package com.leador.system.controller;

import org.springframework.stereotype.Controller;

import com.leador.common.system.domain.UserDO;
import com.leador.common.system.utils.ShiroUtils;

/**
 * <p>Title: BaseController</p>
 * <p>Description: </p>
 * <p>Company: www.leador.com.cn</p> 
 * <p>Date: 2018年10月25日 下午4:51:57</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@Controller
public class BaseController {
	public UserDO getUser() {
		return ShiroUtils.getUser();
	}

	public Long getUserId() {
		return getUser().getUserId();
	}

	public String getUsername() {
		return getUser().getUsername();
	}
}