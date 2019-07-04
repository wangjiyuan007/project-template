package com.leador.data.system.service;

import org.springframework.stereotype.Service;

import com.leador.common.system.domain.LogDO;
import com.leador.common.system.domain.PageDO;
import com.leador.common.system.utils.Query;

/**
 * <p>Title: LogService</p>
 * <p>Description: 日志管理</p>
 * <p>Company: www.leador.com.cn</p> 
 * <p>Date: 2018年10月25日 上午10:49:04</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@Service
public interface LogService {
	void save(LogDO logDO);
	PageDO<LogDO> queryList(Query query);
	int remove(Long id);
	int batchRemove(Long[] ids);
}
