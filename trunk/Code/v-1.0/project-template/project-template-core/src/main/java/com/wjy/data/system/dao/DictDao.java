package com.wjy.data.system.dao;

import java.util.List;
import java.util.Map;

import com.wjy.common.system.domain.DictDO;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>Title: DictDao</p>
 * <p>Description: 字典管理</p>
 * <p>Company: www.leador.com.cn</p> 
 * <p>Date: 2018年10月25日 上午10:55:33</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@Mapper
public interface DictDao {

	DictDO get(Long id);

	List<DictDO> list(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(DictDO dict);

	int update(DictDO dict);

	int remove(Long id);

	int batchRemove(Long[] ids);

	List<DictDO> listType();
}
