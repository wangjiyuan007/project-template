package com.leador.data.system.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.leador.common.system.domain.DeptDO;
import com.leador.common.system.domain.Tree;
import com.leador.common.system.domain.UserDO;
import com.leador.common.system.vo.UserVO;

/**
 * <p>Title: UserService</p>
 * <p>Description: 用户管理</p>
 * <p>Company: www.leador.com.cn</p> 
 * <p>Date: 2018年10月25日 上午10:51:44</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@Service
public interface UserService {
	UserDO get(Long id);

	UserDO getByUserName(String userName);

	List<UserDO> getByName(String name);

	List<UserDO> list(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(UserDO user);

	int update(UserDO user);

	int remove(Long userId);

	int batchremove(Long[] userIds);

	boolean exit(Map<String, Object> params);

	Set<String> listRoles(Long userId);

	int resetPwd(UserVO userVO,UserDO userDO) throws Exception;
	int adminResetPwd(UserVO userVO) throws Exception;
	Tree<DeptDO> getTree();

	/**
	 * 更新个人信息
	 * @param userDO
	 * @return
	 */
	int updatePersonal(UserDO userDO);

	List<UserDO> listByUserIds(List<String> userIds);
}
