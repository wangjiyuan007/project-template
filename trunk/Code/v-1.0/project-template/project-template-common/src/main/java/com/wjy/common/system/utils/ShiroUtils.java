package com.wjy.common.system.utils;

import com.wjy.common.system.domain.UserDO;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import java.lang.reflect.Field;
import java.security.Principal;
import java.util.Collection;
import java.util.List;
/**
 * <p>Title: ShiroUtils</p>
 * <p>Description: shiro工具类</p>
 * <p>Company: www.wjy.com.cn</p>
 * <p>Date: 2019年2月27日 上午10:48:26</p>
 * @author	XiaShenBao
 * @version 1.0
 */
public class ShiroUtils {
    @Autowired
    private static SessionDAO sessionDAO;

    public static Subject getSubjct() {
        return SecurityUtils.getSubject();
    }

    public static UserDO getUser() {
        Object object = getSubjct().getPrincipal();
        UserDO userDO = new UserDO();
        userDO.setUserId(getValueByKey(object, "userId")!=null && !"".equals(getValueByKey(object, "userId")) ? (Long) getValueByKey(object, "userId"):null);
        userDO.setUsername(getValueByKey(object, "username")!=null && !"".equals(getValueByKey(object, "username")) ? (String) getValueByKey(object, "username"):null);
        userDO.setName(getValueByKey(object, "name")!=null && !"".equals(getValueByKey(object, "name")) ? (String) getValueByKey(object, "name"):null);
        userDO.setPassword(getValueByKey(object, "password")!=null && !"".equals(getValueByKey(object, "password")) ? (String) getValueByKey(object, "password"):null);
        userDO.setDeptId(getValueByKey(object, "deptId")!=null && !"".equals(getValueByKey(object, "deptId")) ? (Long) getValueByKey(object, "deptId"):null);
        userDO.setDeptName(getValueByKey(object, "deptName")!=null && !"".equals(getValueByKey(object, "deptName")) ? (String) getValueByKey(object, "deptName"):null);
        userDO.setEmail(getValueByKey(object, "email")!=null && !"".equals(getValueByKey(object, "email")) ? (String) getValueByKey(object, "email"):null);
        userDO.setMobile(getValueByKey(object, "mobile")!=null && !"".equals(getValueByKey(object, "mobile")) ? (String) getValueByKey(object, "mobile"):null);
        userDO.setStatus(getValueByKey(object, "status")!=null && !"".equals(getValueByKey(object, "status")) ? (Integer) getValueByKey(object, "status"):null);
        userDO.setUserIdCreate(getValueByKey(object, "userIdCreate")!=null && !"".equals(getValueByKey(object, "userIdCreate")) ? (Long) getValueByKey(object, "userIdCreate"):null);
        userDO.setGmtCreate(getValueByKey(object, "gmtCreate")!=null && !"".equals(getValueByKey(object, "gmtCreate")) ? (java.util.Date) getValueByKey(object, "gmtCreate"):null);
        userDO.setGmtModified(getValueByKey(object, "gmtModified")!=null && !"".equals(getValueByKey(object, "gmtModified")) ? (java.util.Date) getValueByKey(object, "gmtModified"):null);
        //userDO.setRoleIds(getValueByKey(object, "userId")!=null && !"".equals(getValueByKey(object, "userId")) ? Long.valueOf(getValueByKey(object, "userId"):null);
        userDO.setSex(getValueByKey(object, "sex")!=null && !"".equals(getValueByKey(object, "sex")) ? (Long) getValueByKey(object, "sex"):null);
        userDO.setBirth(getValueByKey(object, "birth")!=null && !"".equals(getValueByKey(object, "birth")) ? (java.util.Date) getValueByKey(object, "birth"):null);
        userDO.setPicId(getValueByKey(object, "picId")!=null && !"".equals(getValueByKey(object, "picId")) ? (Long) (getValueByKey(object, "picId")):null);
        userDO.setLiveAddress(getValueByKey(object, "liveAddress")!=null && !"".equals(getValueByKey(object, "liveAddress")) ? (String) getValueByKey(object, "liveAddress"):null);
        userDO.setHobby(getValueByKey(object, "hobby")!=null && !"".equals(getValueByKey(object, "hobby")) ? (String) getValueByKey(object, "hobby"):null);
        userDO.setProvince(getValueByKey(object, "province")!=null && !"".equals(getValueByKey(object, "province")) ? (String) getValueByKey(object, "province"):null);
        userDO.setDistrict(getValueByKey(object, "district")!=null && !"".equals(getValueByKey(object, "district")) ? (String) getValueByKey(object, "district"):null);
        return userDO;
        //return (UserDO) object;
    }

    public static Long getUserId() {
        return getUser().getUserId();
    }

    public static void logout() {
        getSubjct().logout();
    }

    public static List<Principal> getPrinciples() {
        List<Principal> principals = null;
        Collection<Session> sessions = sessionDAO.getActiveSessions();
        return principals;
    }

    public static Object getValueByKey(Object obj, String key) {
    	if(null == obj)
    		return obj;
        Class userCla = (Class) obj.getClass();
        Field[] fs = userCla.getDeclaredFields();
        for (int i = 0; i < fs.length; i++) {
            Field f = fs[i];
            f.setAccessible(true);
            try {
                if (f.getName().endsWith(key)) {
                    return f.get(obj);
                }
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }

        return null;
    }
}
