package com.wjy.data.system.service.impl;

import com.wjy.common.system.domain.RoleDO;
import com.wjy.common.system.domain.RoleMenuDO;
import com.wjy.data.system.dao.RoleDao;
import com.wjy.data.system.dao.RoleMenuDao;
import com.wjy.data.system.dao.UserRoleDao;
import com.wjy.data.system.service.RoleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

/**
 * <p>Title: RoleServiceImpl</p>
 * <p>Description: 角色管理</p>
 * <p>Company: www.wjy.com.cn</p>
 * <p>Date: 2018年10月25日 上午11:08:34</p>
 *
 * @author XiaShenBao
 * @version 1.0
 */
@Service
@Slf4j
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleMapper;

    @Autowired
    private RoleMenuDao roleMenuMapper;

    @Autowired
    private UserRoleDao userRoleMapper;

    @Override
    public List<RoleDO> list() {
        List<RoleDO> roles = roleMapper.list(new HashMap<>(16));
        return roles;
    }


    @Override
    public List<RoleDO> list(Long userId) {
        List<Long> rolesIds = userRoleMapper.listRoleId(userId);
        List<RoleDO> roles = roleMapper.list(new HashMap<>(16));
        for (RoleDO roleDO : roles) {
            roleDO.setRoleSign("false");
            for (Long roleId : rolesIds) {
                if (Objects.equals(roleDO.getRoleId(), roleId)) {
                    roleDO.setRoleSign("true");
                    break;
                }
            }
        }
        return roles;
    }

    @Transactional
    @Override
    public int save(RoleDO role) {
        int count = roleMapper.save(role);
        List<Long> menuIds = role.getMenuIds();
        Long roleId = role.getRoleId();
        List<RoleMenuDO> rms = new ArrayList<>();
        for (Long menuId : menuIds) {
            RoleMenuDO rmDo = new RoleMenuDO();
            rmDo.setRoleId(roleId);
            rmDo.setMenuId(menuId);
            rms.add(rmDo);
        }
        roleMenuMapper.removeByRoleId(roleId);
        if (rms.size() > 0) {
            roleMenuMapper.batchSave(rms);
        }
        return count;
    }

    @Transactional
    @Override
    public int remove(Long id) {
        int count = roleMapper.remove(id);
        userRoleMapper.removeByRoleId(id);
        roleMenuMapper.removeByRoleId(id);
        return count;
    }

    @Override
    public RoleDO get(Long id) {
        RoleDO roleDO = roleMapper.get(id);
        return roleDO;
    }

    @Override
    public int update(RoleDO role) {
        int r = roleMapper.update(role);
        List<Long> menuIds = role.getMenuIds();
        Long roleId = role.getRoleId();
        roleMenuMapper.removeByRoleId(roleId);
        List<RoleMenuDO> rms = new ArrayList<>();
        for (Long menuId : menuIds) {
            RoleMenuDO rmDo = new RoleMenuDO();
            rmDo.setRoleId(roleId);
            rmDo.setMenuId(menuId);
            rms.add(rmDo);
        }
        if (rms.size() > 0) {
            roleMenuMapper.batchSave(rms);
        }
        return r;
    }

    @Override
    public int batchremove(Long[] ids) {
        int r = roleMapper.batchRemove(ids);
        return r;
    }

    @Override
    public List<RoleDO> listByIds(List<Long> ids) {
        return roleMapper.listByIds(ids);
    }


    /**
     * <p>Title: listByUserId</p>
     * <p>Description: 根据用户ID获取角色信息</p>
     * <p>Date: 2019年2月28日 上午9:16:46</p>
     *
     * @param userId
     * @return
     */
    @Override
    public List<RoleDO> listByUserId(Long userId) {
        List<Long> roleIds = userRoleMapper.listRoleId(userId);
        if (null != roleIds && roleIds.size() > 0) {
            return roleMapper.listByIds(roleIds);
        }

        return null;
    }


}
