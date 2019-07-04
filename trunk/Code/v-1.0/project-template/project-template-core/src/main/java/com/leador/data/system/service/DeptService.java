package com.leador.data.system.service;

import java.util.List;
import java.util.Map;

import com.leador.common.system.domain.DeptDO;
import com.leador.common.system.domain.Tree;

/**
 * <p>Title: DeptService</p>
 * <p>Description: 部门管理</p>
 * <p>Company: www.leador.com.cn</p> 
 * <p>Date: 2018年10月25日 上午10:47:50</p>
 * @author	XiaShenBao
 * @version 1.0
 */
public interface DeptService {
	
	DeptDO get(Long deptId);
	
	List<DeptDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(DeptDO sysDept);
	
	int update(DeptDO sysDept);
	
	int remove(Long deptId);
	
	int batchRemove(Long[] deptIds);

	Tree<DeptDO> getTree();
	
	boolean checkDeptHasUser(Long deptId);
}
