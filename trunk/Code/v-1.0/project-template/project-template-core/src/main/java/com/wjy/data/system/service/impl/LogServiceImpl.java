package com.wjy.data.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.wjy.common.system.domain.LogDO;
import com.wjy.common.system.domain.PageDO;
import com.wjy.common.system.utils.Query;
import com.wjy.data.system.dao.LogDao;
import com.wjy.data.system.service.LogService;

@Service
public class LogServiceImpl implements LogService {

    @Autowired
    private LogDao logMapper;

    @Async
    @Override
    public void save(LogDO logDO) {
        logMapper.save(logDO);
    }

    @Override
    public PageDO<LogDO> queryList(Query query) {
        int total = logMapper.count(query);
        List<LogDO> logs = logMapper.list(query);
        PageDO<LogDO> page = new PageDO<>();
        page.setTotal(total);
        page.setRows(logs);
        return page;
    }

    @Override
    public int remove(Long id) {
        int count = logMapper.remove(id);
        return count;
    }

    @Override
    public int batchRemove(Long[] ids) {
        return logMapper.batchRemove(ids);
    }
}
