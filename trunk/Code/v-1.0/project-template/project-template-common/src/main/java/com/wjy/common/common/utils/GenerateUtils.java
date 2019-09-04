package com.wjy.common.common.utils;

/**
 * @author ：shuquanliang
 * @date ：Created in 2019/3/26 15:30
 * @description：
 */
public class GenerateUtils {

    private static final SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);

    /**
     * 生成18位全局唯一ID
     *
     * @return
     */
    public static long generateGlobalUniqueId() {
        return idWorker.nextId();
    }

    /**
     * 生成15位全局唯一ID
     *
     * @return
     */
    public static long generateShortGlobalUniqueId() {
        return Long.parseLong(String.valueOf(idWorker.nextId()).substring(3));
    }
}
