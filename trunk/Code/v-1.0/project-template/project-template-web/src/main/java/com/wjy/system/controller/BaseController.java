package com.wjy.system.controller;

import org.springframework.stereotype.Controller;

import com.wjy.common.system.domain.UserDO;
import com.wjy.common.system.utils.ShiroUtils;

/**
 * <p>Title: BaseController</p>
 * <p>Description: </p>
 * <p>Company: www.wjy.com.cn</p>
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