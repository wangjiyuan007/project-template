package com.wjy.data.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.wjy.common.system.domain.RoleMenuDO;

/**
 * <p>Title: RoleMenuDao</p>
 * <p>Description: 角色与菜单对应关系</p>
 * <p>Company: www.wjy.com.cn</p>
 * <p>Date: 2018年10月25日 上午10:57:15</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@Mapper
public interface RoleMenuDao {

	RoleMenuDO get(Long id);
	
	List<RoleMenuDO> list(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(RoleMenuDO roleMenu);
	
	int update(RoleMenuDO roleMenu);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);
	
	List<Long> listMenuIdByRoleId(Long roleId);
	
	int removeByRoleId(Long roleId);

	int removeByMenuId(Long menuId);
	
	int batchSave(List<RoleMenuDO> list);
}
