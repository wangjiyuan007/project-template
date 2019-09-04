package com.wjy.data.system.service;

import java.util.List;
import java.util.Map;

import com.wjy.common.system.domain.DictDO;
import com.wjy.common.system.domain.UserDO;

/**
 * <p>Title: DictService</p>
 * <p>Description: 字典管理 </p>
 * <p>Company: www.leador.com.cn</p> 
 * <p>Date: 2018年10月25日 上午10:48:04</p>
 * @author	XiaShenBao
 * @version 1.0
 */
public interface DictService {
	
	DictDO get(Long id);
	
	List<DictDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(DictDO dict);
	
	int update(DictDO dict);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);

	List<DictDO> listType();
	
	String getName(String type,String value);

	/**
	 * 获取爱好列表
	 * @return
     * @param userDO
	 */
	List<DictDO> getHobbyList(UserDO userDO);

	/**
	 * 获取性别列表
 	 * @return
	 */
	List<DictDO> getSexList();

	/**
	 * 根据type获取数据
	 * @param map
	 * @return
	 */
	List<DictDO> listByType(String type);

}
