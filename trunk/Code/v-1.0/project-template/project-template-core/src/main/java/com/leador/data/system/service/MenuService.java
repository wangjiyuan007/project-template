package com.leador.data.system.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.leador.common.system.domain.MenuDO;
import com.leador.common.system.domain.Tree;

/**
 * <p>Title: MenuService</p>
 * <p>Description: 菜单管理</p>
 * <p>Company: www.leador.com.cn</p> 
 * <p>Date: 2018年10月25日 上午10:49:23</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@Service
public interface MenuService {
	Tree<MenuDO> getSysMenuTree(Long id);

	List<Tree<MenuDO>> listMenuTree(Long id);

	Tree<MenuDO> getTree();

	Tree<MenuDO> getTree(Long id);

	List<MenuDO> list(Map<String, Object> params);

	int remove(Long id);

	int save(MenuDO menu);

	int update(MenuDO menu);

	MenuDO get(Long id);

	Set<String> listPerms(Long userId);
}
