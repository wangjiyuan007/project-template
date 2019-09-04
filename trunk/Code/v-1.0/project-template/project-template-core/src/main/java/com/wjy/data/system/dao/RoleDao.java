package com.wjy.data.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.wjy.common.system.domain.RoleDO;

/**
 * <p>Title: RoleDao</p>
 * <p>Description: 角色管理</p>
 * <p>Company: www.leador.com.cn</p>
 * <p>Date: 2018年10月25日 上午10:56:32</p>
 *
 * @version 1.0
 * @author XiaShenBao
 */
@Mapper
public interface RoleDao {

    RoleDO get(Long roleId);

    List<RoleDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(RoleDO role);

    int update(RoleDO role);

    int remove(Long roleId);

    int batchRemove(Long[] roleIds);

    /**
     * <p>Title: listByIds</p>
     * <p>Description: 根据角色ID集合批量获取角色信息</p>
     * <p>Date: 2019年2月27日 下午5:22:19</p>
     *
     * @param roleIds
     * @return
     */
    List<RoleDO> listByIds(List<Long> roleIds);

}
