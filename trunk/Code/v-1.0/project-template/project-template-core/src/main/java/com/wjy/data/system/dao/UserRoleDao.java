package com.wjy.data.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.wjy.common.system.domain.UserRoleDO;

/**
 * <p>Title: UserRoleDao</p>
 * <p>Description: 用户与角色对应关系</p>
 * <p>Company: www.wjy.com.cn</p>
 * <p>Date: 2018年10月25日 上午10:58:06</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@Mapper
public interface UserRoleDao {

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
