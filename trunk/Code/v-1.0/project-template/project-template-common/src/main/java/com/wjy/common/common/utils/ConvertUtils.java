package com.wjy.common.common.utils;

import lombok.extern.slf4j.Slf4j;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

/**
 * @author ：shuquanliang
 * @date ：Created in 2019/3/20 13:59
 * @description：
 */
@Slf4j
public class ConvertUtils {

    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public static <T> T convert(Object val, Class<T> clazz) {
        T newVal = null;
        if (val == null) {
            return newVal;
        }

        try {
            String rVal = String.valueOf(val);
            if (clazz == Integer.class) {
                newVal = (T) Integer.valueOf(rVal);
            } else if (clazz == Long.class) {
                newVal = (T) Long.valueOf(rVal);
            } else if (clazz == Float.class) {
                newVal = (T) Float.valueOf(rVal);
            } else if (clazz == Double.class) {
                newVal = (T) Double.valueOf(rVal);
            } else if (clazz == Short.class) {
                newVal = (T) Short.valueOf(rVal);
            } else if (clazz == Date.class) {
                newVal = (T) sdf.parse(rVal);
            } else {
                newVal = (T) rVal;
            }
        } catch (Exception e) {
            log.error(e.getMessage());
        }

        return newVal;
    }

    public static void main(String[] args) {

    }
}
