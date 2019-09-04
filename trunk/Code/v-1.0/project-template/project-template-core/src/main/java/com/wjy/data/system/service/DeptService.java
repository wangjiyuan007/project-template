package com.wjy.data.system.service;

import java.util.List;
import java.util.Map;

import com.wjy.common.system.domain.DeptDO;
import com.wjy.common.system.domain.Tree;
import org.springframework.stereotype.Service;

/**
 * <p>Title: DeptService</p>
 * <p>Description: 部门管理</p>
 * <p>Company: www.wjy.com.cn</p>
 * <p>Date: 2018年10月25日 上午10:47:50</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@Service
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
