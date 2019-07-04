package com.leador.data.system.service;

import java.io.PrintStream;
import java.security.Principal;
import java.util.Collection;
import java.util.List;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Service;

import com.leador.common.system.domain.UserDO;
import com.leador.common.system.domain.UserOnline;


/**
 * <p>Title: SessionService</p>
 * <p>Description: Session管理</p>
 * <p>Company: www.leador.com.cn</p> 
 * <p>Date: 2018年10月25日 上午10:49:46</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@Service
public interface SessionService {
	List<UserOnline> list();

	List<UserDO> listOnlineUser();

	Collection<Session> sessionList();
	
	boolean forceLogout(String sessionId);
}
