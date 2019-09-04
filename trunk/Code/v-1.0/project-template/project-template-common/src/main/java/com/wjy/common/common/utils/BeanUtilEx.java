package com.wjy.common.common.utils;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.SqlDateConverter;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author ：shuquanliang
 * @date ：Created in 2019/3/12 9:45
 * @description： 解决Date类型不能拷贝问题
 */
public class BeanUtilEx extends BeanUtils {
    private static Map cache = new HashMap();
    private static Log logger = LogFactory.getFactory().getInstance(BeanUtilEx.class);

    private BeanUtilEx() {
    }

    static {
        // 注册sql.date的转换器，即允许BeanUtils.copyProperties时的源目标的sql类型的值允许为空
        ConvertUtils.register(new SqlDateConverter(), java.util.Date.class);
        ConvertUtils.register(new DateConvert(), java.util.Date.class);
    }

    public static void copyProperties(Object target, Object source)
            throws InvocationTargetException, IllegalAccessException {
        org.apache.commons.beanutils.BeanUtils.copyProperties(target, source);

    }

}
