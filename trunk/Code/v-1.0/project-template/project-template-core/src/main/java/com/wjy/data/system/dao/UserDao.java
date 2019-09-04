package com.wjy.data.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.wjy.common.system.domain.UserDO;

/**
 * <p>Title: UserDao</p>
 * <p>Description: 用户管理</p>
 * <p>Company: www.leador.com.cn</p> 
 * <p>Date: 2018年10月25日 上午10:57:56</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@Mapper
public interface UserDao {

	UserDO get(Long userId);

	UserDO getByUserName(String userName);

	List<UserDO> getByName(String name);

	List<UserDO> list(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(UserDO user);
	
	int update(UserDO user);
	
	int remove(Long userId);
	
	int batchRemove(Long[] userIds);
	
	Long[] listAllDept();

	List<UserDO> listByUserIds(List<String> userIds);

	List<UserDO> listByUserNames(List<String> userNames);

}
