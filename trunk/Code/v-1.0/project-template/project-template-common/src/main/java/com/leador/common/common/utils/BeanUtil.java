package com.leador.common.common.utils;

import lombok.extern.slf4j.Slf4j;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author ：shuquanliang
 * @date ：Created in 2019/3/12 9:44
 * @description：VO/DO对象处理工具类
 */
@Slf4j
public class BeanUtil {
    /**
     * @param o
     * @param c
     * @return
     */
    public static <T> T copyBean(Object o, Class<T> c) {

        try {
            Object target = c.newInstance();
            BeanUtilEx.copyProperties(target, o);
            return c.cast(target);
        } catch (Exception e) {
            log.error("[对象转换失败] = {%s}", e);
        }
        return null;
    }

    /**
     * @param list
     * @param c
     * @return
     */
    @SuppressWarnings("rawtypes")
    public static <T> List<T> copyBeanList(List list, Class<T> c) {
        List<T> returnList = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            Object o = list.get(i);
            T target = copyBean(o, c);
            if (target != null) {
                returnList.add(target);
            }
        }
        return returnList;
    }

    public static Object mapToObject(Map<String, Object> map, Class<?> beanClass) throws Exception {
        if (map == null)
            return null;
        Object obj = beanClass.newInstance();
        BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());
        PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
        for (PropertyDescriptor property : propertyDescriptors) {
            String key = property.getName();
            if (map.containsKey(key)) {
                Object value = map.get(key);
                Method setter = property.getWriteMethod();
                setter.invoke(obj, value);
            }
        }

        return obj;
    }

    public static Map<String, Object> objectToMap(Object obj) throws Exception {
        if (obj == null)
            return null;

        Map<String, Object> map = new HashMap<String, Object>();
        BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());
        PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
        for (PropertyDescriptor property : propertyDescriptors) {
            String key = property.getName();
            if (key.compareToIgnoreCase("class") == 0) {
                continue;
            }
            Method getter = property.getReadMethod();
            Object value = getter != null ? getter.invoke(obj) : null;
            map.put(key, value);
        }

        return map;
    }
}
