package com.leador.data.system.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.leador.common.system.domain.RoleDO;

/**
 * <p>Title: RoleService</p>
 * <p>Description: 角色管理</p>
 * <p>Company: www.leador.com.cn</p>
 * <p>Date: 2018年10月25日 上午10:49:37</p>
 *
 * @version 1.0
 * @author XiaShenBao
 */
@Service
public interface RoleService {

    RoleDO get(Long id);

    List<RoleDO> list();

    int save(RoleDO role);

    int update(RoleDO role);

    int remove(Long id);

    List<RoleDO> list(Long userId);

    int batchremove(Long[] ids);

    /**
     * <p>Title: listByIds</p>
     * <p>Description: 根据角色ID集合批量获取角色信息</p>
     * <p>Date: 2019年2月27日 下午5:22:19</p>
     *
     * @param ids
     * @return
     */
    List<RoleDO> listByIds(List<Long> ids);

    /**
     * <p>Title: listByUserId</p>
     * <p>Description: 根据用户ID获取角色信息</p>
     * <p>Date: 2019年2月28日 上午9:16:46</p>
     *
     * @param userId
     * @return
     */
    List<RoleDO> listByUserId(Long userId);
}
