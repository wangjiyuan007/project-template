package com.wjy.data.system.redis.shiro;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;

/**
 * <p>Title: RedisCacheManager</p>
 * <p>Description: Redis缓存管理</p>
 * <p>Company: www.leador.com.cn</p> 
 * <p>Date: 2018年10月25日 下午3:14:12</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@Slf4j
public class RedisCacheManager implements CacheManager {

    // fast lookup by name map
    private final ConcurrentMap<String, Cache> caches = new ConcurrentHashMap<String, Cache>();

    private RedisManager redisManager;

    /**
     * The Redis key prefix for caches
     */
    private String keyPrefix = "shiro_redis_cache:";

    /**
     * Returns the Redis session keys
     * prefix.
     * @return The prefix
     */
    public String getKeyPrefix() {
        return keyPrefix;
    }

    /**
     * Sets the Redis sessions key
     * prefix.
     * @param keyPrefix The prefix
     */
    public void setKeyPrefix(String keyPrefix) {
        this.keyPrefix = keyPrefix;
    }

    @Override
    public <K, V> Cache<K, V> getCache(String name) throws CacheException {
        Cache c = caches.get(name);
        if (c == null) {
            // create a new cache instance
            c = new RedisCache<K, V>(redisManager, keyPrefix);

            // add it to the cache collection
            caches.put(name, c);
        }
        return c;
    }

    public RedisManager getRedisManager() {
        return redisManager;
    }

    public void setRedisManager(RedisManager redisManager) {
        this.redisManager = redisManager;
    }

}
