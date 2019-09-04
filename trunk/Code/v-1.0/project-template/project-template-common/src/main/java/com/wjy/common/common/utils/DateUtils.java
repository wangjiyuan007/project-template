package com.wjy.common.common.utils;

import lombok.extern.slf4j.Slf4j;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * @author ：shuquanliang
 * @date ：Created in 2019/3/14 17:37
 * @description：
 */
@Slf4j
public class DateUtils {

    public static final String YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";

    public static final String YYYY_MM_DD = "yyyy-MM-dd";

    private static final SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.US);

    /**
     * 字符串日期格式化日期
     *
     * @param date
     * @param format
     * @return
     */
    public static String dateFormater(Date date, String format) {
        SimpleDateFormat formater = new SimpleDateFormat(format);
        return formater.format(date);
    }

    /**
     * CST日期字符串转换字符串日期
     *
     * @param date
     * @param format
     * @return
     */
    public static String dateCSTFormater(String date, String format) {
        try {
            Date newDate = sdf.parse(date);
            SimpleDateFormat formater = new SimpleDateFormat(format);
            return formater.format(newDate);
        } catch (Exception e) {
            log.error(e.getMessage());
        }

        return "";
    }

    /**
     * CST日期转换字符串日期
     *
     * @param date
     * @param format
     * @return
     */
    public static String dateCSTFormater(Date date, String format) {
        try {
            SimpleDateFormat formater = new SimpleDateFormat(format);
            return formater.format(date);
        } catch (Exception e) {
            log.error(e.getMessage());
        }

        return "";
    }

}
