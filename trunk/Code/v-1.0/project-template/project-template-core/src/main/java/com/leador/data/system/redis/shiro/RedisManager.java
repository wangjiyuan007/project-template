package com.leador.data.system.redis.shiro;

import java.util.Set;

import com.leador.common.system.utils.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * <p>Title: RedisManager</p>
 * <p>Description: </p>
 * <p>Company: www.leador.com.cn</p>
 * <p>Date: 2018年10月25日 下午3:14:29</p>
 *
 * @author XiaShenBao
 * @version 1.0
 */
public class RedisManager {

    private int expire = 0;

    private int timeout = 0;

    @Autowired
    private RedisUtil redisUtil;

    public RedisManager() {

    }

    /**
     * get value from redis
     *
     * @param key
     * @return
     */
    public byte[] get(byte[] key) {
        return redisUtil.get(key);
    }

    public String getString(byte[] key) {
        return redisUtil.get(new String(key));
    }

    /**
     * set
     *
     * @param key
     * @param value
     * @return
     */
    public byte[] set(byte[] key, byte[] value) {
        redisUtil.set(key, value);
        return value;
    }

    /**
     * set
     *
     * @param key
     * @param value
     * @param expire
     * @return
     */
    public void set(byte[] key, byte[] value, int expire) {
        redisUtil.set(key, value);
    }

    /**
     * del
     *
     * @param key
     */
    public void del(byte[] key) {
        redisUtil.delete(key);
    }

    /**
     * flush
     */
    public void flushDB() {
        redisUtil.flushDB();
    }

    /**
     * size
     */
    public Long dbSize() {
        return redisUtil.dbSize();
    }

    /**
     * keys
     *
     * @param pattern
     * @return
     */
    public Set<byte[]> keys(String pattern) {
        return redisUtil.keys(pattern);
    }

    public int getTimeout() {
        return timeout;
    }

    public void setTimeout(int timeout) {
        this.timeout = timeout;
    }

    public int getExpire() {
        return expire;
    }

    public void setExpire(int expire) {
        this.expire = expire;
    }


}
