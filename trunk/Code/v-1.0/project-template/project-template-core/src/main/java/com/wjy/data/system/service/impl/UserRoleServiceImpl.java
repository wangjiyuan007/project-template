package com.wjy.data.system.service.impl;

import com.wjy.common.system.domain.UserRoleDO;
import com.wjy.data.system.dao.UserRoleDao;
import com.wjy.data.system.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    private UserRoleDao userRoleDao;

    @Override
    public UserRoleDO get(Long id) {
        return userRoleDao.get(id);
    }

    @Override
    public List<UserRoleDO> list(Map<String, Object> map) {
        return userRoleDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return userRoleDao.count(map);
    }

    @Override
    public int save(UserRoleDO userRole) {
        return userRoleDao.save(userRole);
    }

    @Override
    public int update(UserRoleDO userRole) {
        return userRoleDao.update(userRole);
    }

    @Override
    public int remove(Long id) {
        return userRoleDao.remove(id);
    }

    @Override
    public int batchRemove(Long[] ids) {
        return userRoleDao.batchRemove(ids);
    }

    @Override
    public List<Long> listRoleId(Long userId) {
        return userRoleDao.listRoleId(userId);
    }

    @Override
    public int removeByUserId(Long userId) {
        return userRoleDao.removeByUserId(userId);
    }

    @Override
    public int removeByRoleId(Long roleId) {
        return userRoleDao.removeByRoleId(roleId);
    }

    @Override
    public int batchSave(List<UserRoleDO> list) {
        return userRoleDao.batchSave(list);
    }

    @Override
    public int batchRemoveByUserId(Long[] ids) {
        return userRoleDao.batchRemoveByUserId(ids);
    }
}
