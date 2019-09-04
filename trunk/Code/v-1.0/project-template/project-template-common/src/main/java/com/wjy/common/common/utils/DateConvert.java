package com.wjy.common.common.utils;

import org.apache.commons.beanutils.Converter;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author ：shuquanliang
 * @date ：Created in 2019/3/12 9:46
 * @description： 解决Date类型不能拷贝问题
 */
public class DateConvert implements Converter {

    public Object convert(Class arg0, Object arg1) {
        if (arg1 == null) {
            return null;
        }

        try {
            if (arg1 instanceof String) {
                String p = (String) arg1;
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                return df.parse(p.trim());
            }

            if (arg1 instanceof Date && (!arg0.getName().equals("java.util.Date"))) {
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                Date date = (Date) arg1;
                return df.format(date);
            }
            return arg1;
        } catch (Exception e) {

            return null;
        }
    }
}
