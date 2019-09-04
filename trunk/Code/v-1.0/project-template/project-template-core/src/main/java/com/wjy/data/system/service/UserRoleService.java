package com.wjy.data.system.service;

import com.wjy.common.system.domain.UserRoleDO;

import java.util.List;
import java.util.Map;

/**
 * <p>Title: UserRoleService</p>
 * <p>Description: 用户管理</p>
 * <p>Company: www.wjy.com.cn</p>
 * <p>Date: 2018年10月25日 上午10:51:44</p>
 *
 * @author XiaShenBao
 * @version 1.0
 */
public interface UserRoleService {
    UserRoleDO get(Long id);

    List<UserRoleDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(UserRoleDO userRole);

    int update(UserRoleDO userRole);

    int remove(Long id);

    int batchRemove(Long[] ids);

    List<Long> listRoleId(Long userId);

    int removeByUserId(Long userId);

    int removeByRoleId(Long roleId);

    int batchSave(List<UserRoleDO> list);

    int batchRemoveByUserId(Long[] ids);
}
