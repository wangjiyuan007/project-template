package com.wjy.data.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.wjy.common.system.domain.MenuDO;

/**
 * <p>Title: MenuDao</p>
 * <p>Description: 菜单管理</p>
 * <p>Company: www.wjy.com.cn</p>
 * <p>Date: 2018年10月25日 上午10:56:19</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@Mapper
public interface MenuDao {

	MenuDO get(Long menuId);
	
	List<MenuDO> list(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(MenuDO menu);
	
	int update(MenuDO menu);
	
	int remove(Long menuId);
	
	int batchRemove(Long[] menuIds);
	
	List<MenuDO> listMenuByUserId(Long id);
	
	List<String> listUserPerms(Long id);
}
