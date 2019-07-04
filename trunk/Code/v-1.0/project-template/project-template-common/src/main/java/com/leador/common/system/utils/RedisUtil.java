package com.leador.common.system.utils;


import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import redis.clients.jedis.BinaryClient;
import redis.clients.jedis.JedisCluster;
import redis.clients.util.SafeEncoder;

import java.util.List;
import java.util.Map;
import java.util.Set;

@Component
public class RedisUtil {

    @Autowired
    private JedisCluster jedisCluster;

    /**
     * 设置缓存
     *
     * @param key   缓存key
     * @param value 缓存value
     */
    public void set(String key, String value) {
        jedisCluster.set(key, value);
    }

    /**
     * 设置缓存
     *
     * @param key   缓存key
     * @param value 缓存value
     */
    public void set(byte[] key, byte[] value) {
        if (key != null && value != null) {
            try {
                String val = "";
                if (value != null && value.length > 0) {
                    for (byte b : value) {
                        val += b + "&";
                    }
                }
                if (!"".equals(val)) {
                    val = val.substring(0,val.length()-1);
                }
                jedisCluster.set(new String(key),val);
            } catch (Exception e) {
            }
        }
    }

    /**
     * 设置缓存对象
     *
     * @param key 缓存key
     * @param obj 缓存value
     */
    public <T> void setObject(String key, T obj, int expireTime) {
        jedisCluster.setex(key, expireTime, JSON.toJSONString(obj));
    }

    /**
     * 获取指定key的缓存
     *
     */
    public String getObject(String key) {
        return jedisCluster.get(key);
    }

    /**
     * 判断当前key值 是否存在
     *
     * @param key
     */
    public boolean hasKey(String key) {
        return jedisCluster.exists(key);
    }

    /**
     * 设置缓存，并且自己指定过期时间
     *
     * @param key
     * @param value
     * @param expireTime 过期时间
     */
    public void setWithExpireTime(String key, String value, int expireTime) {
        jedisCluster.setex(key, expireTime, value);

    }

    /**
     * 获取指定key的缓存
     *
     * @param key
     */
    public String get(String key) {
        String value = jedisCluster.get(key);
        return value;
    }

    /**
     * 获取指定key的缓存
     *
     * @param key
     */
    public byte[] get(byte[] key) {
        byte[] valueByte = new byte[]{};
        if (key != null) {
            String value = jedisCluster.get(new String(key));
            if ("".equals(value) || value == null) {
                return valueByte;
            }

            String[] arr = value.split("&");
            valueByte = new byte[arr.length];
            for (int i = 0; i < valueByte.length; i++) {
                if ("".equals(arr[i]) || arr[i] == null) {
                    continue;
                }
                valueByte[i] = Byte.parseByte(arr[i]);
            }
        }
        return valueByte;
    }

    public Set keys(String key) {
        return jedisCluster.hkeys(key);
    }

    /**
     * 删除指定key的缓存
     *
     * @param key
     */
    public void delete(String key) {
        jedisCluster.del(key);
    }

    /**
     * 删除指定key的缓存
     *
     * @param key
     */
    public void delete(byte[] key) {
        if (key != null) {
            jedisCluster.del(new String(key));
        }
    }

    public void flushDB() {
        jedisCluster.flushDB();
    }

    public Long dbSize() {
        return jedisCluster.dbSize();
    }

    /**
    * @Description:    判断key是否存在
    * @Author:         longli
    * @Param
    */
    public Boolean exists(String key) {
        return jedisCluster.exists(key);
    }

    /**
    * @Description:    给key设置过期时间
    * @Author:         longli
    * @Param
    */
    public Long expire(String key, int seconds) {
        return jedisCluster.expire(key, seconds);
    }

    /**
    * @Description:    返回key剩余的过期时间
    * @Author:         longli
    * @Param
    */
    public Long ttl(String key) {
        return jedisCluster.ttl(key);
    }

    /**
    * @Description:    递增指令（默认从开始）
    * @Author:         longli
    * @Param
    */
    public Long incr(String key) {
        return jedisCluster.incr(key);
    }

    //hash类操作
    /**
    * @Description:    获取所有键值对
    * @Author:         longli
    * @Param
    */
    public Map<String, String> hgetAll(){
        return jedisCluster.hgetAll("hash");
    }

    /**
     * @Description:    获取所有键
     * @Author:         longli
     * @Param
     */
    public Set<String> hkeys(){
        return jedisCluster.hkeys("hash");
    }


    /**
    * @Description:    为hash表中的字段赋值
    * @Author:         longli
    * @Param
    */
    public Long hset(String key, String field, String value) {
        return jedisCluster.hset(key, field, value);
    }

    /**
    * @Description:    获取hash表中的字段值
    * @Author:         longli
    * @Param
    */
    public String hget(String key, String field) {
        return jedisCluster.hget(key, field);
    }

    /**
    * @Description:    删除hash表中的字段
    * @Author:         longli
    * @Param
    */
    public Long hdel(String key, String... field) {
        return jedisCluster.hdel(key, field);
    }

    /**
    * @Description:    判断hash表中的key是否存在
    * @Author:         longli
    * @Param
    */
    public Boolean hexists(String key, String field) {
        return jedisCluster.hexists(key, field);
    }

    /**
    * @Description:    散列hash的所有值
    * @Author:         longli
    * @Param
    */
    public List<String> hvals(String key) {
        return jedisCluster.hvals(key);
    }

    //*******************************************Set集合***************************************
    /**
    * @Description:    向set添加一条记录
    * @Author:         longli
    * @Param
    */
    public Long sadd(String key, String member){
        return jedisCluster.sadd(key,member);
    }

    public long sadd(byte[] key, byte[] member) {
        return jedisCluster.sadd(key, member);

    }

    /**
    * @Description:    获取给定key中元素个数
    * @Author:         longli
    * @Param
    */
    public long scard(String key){
        return jedisCluster.scard(key);
    }

    /**
     * 返回从第一组和所有的给定集合之间的差异的成员
     * @return 差异的成员集合
     * */
    public Set<String> sdiff(String... keys) {
         return jedisCluster.sdiff(keys);
    }

    /**
     * 确定一个给定的值是否存在
     * @param String  key
     * @param String member 要判断的值
     * @return 存在返回，不存在返回
     * **/
    public boolean sismember(String key, String member) {
        return jedisCluster.sismember(key, member);
    }

    /**
     * 返回集合中的所有成员
     *
     * @param String key
     * @return 成员集合
     */
    public Set<String> smembers(String key) {
        return jedisCluster.smembers(key);
    }

    public Set<byte[]> smembers(byte[] key) {
        return jedisCluster.smembers(key);
    }

    /**
     * 将成员从源集合移出放入目标集合 <br/>
     * 如果源集合不存在或不包哈指定成员，不进行任何操作，返回<br/>
     * 否则该成员从源集合上删除，并添加到目标集合，如果目标集合中成员已存在，则只在源集合进行删除
     *
     * @param String srckey 源集合
     * @param String dstkey 目标集合
     * @param String member 源集合中的成员
     * @return 状态码，成功，失败
     */
    public long smove(String srckey, String dstkey, String member) {
        return jedisCluster.smove(srckey, dstkey, member);
    }

    /**
     * 从集合中删除成员
     *
     * @param String key
     * @return 被删除的成员
     */
    public String spop(String key) {
        return jedisCluster.spop(key);
    }

    /**
     * 从集合中删除指定成员
     *
     * @param String key
     * @param String member 要删除的成员
     * @return 状态码，成功返回，成员不存在返回
     */
    public long srem(String key, String member) {
        return jedisCluster.srem(key, member);
    }

    /**
     * 合并多个集合并返回合并后的结果，合并后的结果集合并不保存<br/>
     *
     * @param String ... keys
     * @return 合并后的结果集合
     * @see sunionstore
     */
    public Set<String> sunion(String... keys) {
        return jedisCluster.sunion(keys);
    }

    /**
     * 合并多个集合并将合并后的结果集保存在指定的新集合中，如果新集合已经存在则覆盖
     *
     * @param String newkey 新集合的key
     * @param String ... keys 要合并的集合
     */
    public long sunionstore(String newkey, String... keys) {
        return jedisCluster.sunionstore(newkey, keys);
    }
    //*********************************************************************************************

    //****************************************SortSet**********************************************
    /**
     * 向集合中增加一条记录,如果这个值已存在，这个值对应的权重将被置为新的权重
     *
     * @param String key
     * @param double score 权重
     * @param String member 要加入的值，
     * @return 状态码 成功，已存在member的值
     */
    public long zadd(String key, double score, String member) {
        return  jedisCluster.zadd(key, score, member);
    }

       /*public long zadd(String key, Map<Double, String> scoreMembers) {
           return jedisCluster.zadd(key, scoreMembers);
       }*/

    /**
     * 获取集合中元素的数量
     *
     * @param String key
     * @return 如果返回则集合不存在
     */
    public long zcard(String key) {
        return jedisCluster.zcard(key);
    }

    /**
     * 获取指定权重区间内集合的数量
     *
     * @param String key
     * @param double min 最小排序位置
     * @param double max 最大排序位置
     */
    public long zcount(String key, double min, double max) {
        return jedisCluster.zcount(key, min, max);
    }

    /**
     * 获得set的长度
     *
     * @param key
     * @return
     */
    public long zlength(String key) {
        long len = 0;
        Set<String> set = zrange(key, 0,-1 );
        len = set.size();
        return len;
    }

    /**
     * 权重增加给定值，如果给定的member已存在
     *
     * @param String key
     * @param double score 要增的权重
     * @param String member 要插入的值
     * @return 增后的权重
     */
    public double zincrby(String key, double score, String member) {
        return jedisCluster.zincrby(key, score, member);
    }

    /**
     * 返回指定位置的集合元素,为第一个元素，为最后一个元素
     *
     * @param String key
     * @param int    start 开始位置(包含)
     * @param int    end 结束位置(包含)
     * @return Set<String>
     */
    public Set<String> zrange(String key, int start, int end) {
        return jedisCluster.zrange(key, start, end);
    }

    /**
     * 返回指定权重区间的元素集合
     *
     * @param String key
     * @param double min 上限权重
     * @param double max 下限权重
     * @return Set<String>
     */
    public Set<String> zrangeByScore(String key, double min, double max) {
        return jedisCluster.zrangeByScore(key, min, max);
    }

    /**
     * 获取指定值在集合中的位置，集合排序从低到高
     *
     * @param String key
     * @param String member
     * @return long 位置
     * @see zrevrank
     */
    public long zrank(String key, String member) {
        return jedisCluster.zrank(key, member);
    }

    /**
     * 获取指定值在集合中的位置，集合排序从高到低
     *
     * @param String key
     * @param String member
     * @return long 位置
     * @see zrank
     */
    public long zrevrank(String key, String member) {
        return jedisCluster.zrevrank(key, member);
    }

    /**
     * 从集合中删除成员
     *
     * @param String key
     * @param String member
     * @return 返回成功
     */
    public long zrem(String key, String member) {
        return jedisCluster.zrem(key, member);
    }

    /**
     * 删除给定位置区间的元素
     *
     * @param String key
     * @param int    start 开始区间，从开始(包含)
     * @param int    end 结束区间,为最后一个元素(包含)
     * @return 删除的数量
     */
    public long zremrangeByRank(String key, int start, int end) {
        return jedisCluster.zremrangeByRank(key, start, end);
    }

    /**
     * 删除给定权重区间的元素
     *
     * @param String key
     * @param double min 下限权重(包含)
     * @param double max 上限权重(包含)
     * @return 删除的数量
     */
    public long zremrangeByScore(String key, double min, double max) {
        return jedisCluster.zremrangeByScore(key, min, max);
    }

    /**
     * 获取给定区间的元素，原始按照权重由高到低排序
     *
     * @param String key
     * @param int    start
     * @param int    end
     * @return Set<String>
     */
    public Set<String> zrevrange(String key, int start, int end) {
        return jedisCluster.zrevrange(key, start, end);
    }

    /**
     * 获取给定值在集合中的权重
     *
     * @param String  key
     * @param memeber
     * @return double 权重
     */
    public double zscore(String key, String memebr) {
        return jedisCluster.zscore(key, memebr);
    }
    //*********************************************************************************************

    //****************************************List*************************************************
    /**
     * List长度
     *
     * @param String key
     * @return 长度
     */
    public long llen(String key) {
        return llen(SafeEncoder.encode(key));
    }

    /**
     * List长度
     *
     * @param byte[] key
     * @return 长度
     */
    public long llen(byte[] key) {
        return jedisCluster.llen(key);
    }

    /**
     * 覆盖操作,将覆盖List中指定位置的值
     *
     * @param byte[] key
     * @param int    index 位置
     * @param byte[] value 值
     * @return 状态码
     */
    public String lset(byte[] key, int index, byte[] value) {
        return jedisCluster.lset(key, index, value);
    }

    /**
     * 覆盖操作,将覆盖List中指定位置的值
     *
     * @param key
     * @param int    index 位置
     * @param String value 值
     * @return 状态码
     */
    public String lset(String key, int index, String value) {
        return lset(SafeEncoder.encode(key), index,
                SafeEncoder.encode(value));
    }

    /**
     * 在value的相对位置插入记录
     *
     * @param key
     * @param LIST_POSITION 前面插入或后面插入
     * @param String        pivot 相对位置的内容
     * @param String        value 插入的内容
     * @return 记录总数
     */
    public long linsert(String key, BinaryClient.LIST_POSITION where, String pivot,
                        String value) {
        return linsert(SafeEncoder.encode(key), where,
                SafeEncoder.encode(pivot), SafeEncoder.encode(value));
    }

    /**
     * 在指定位置插入记录
     *
     * @param String        key
     * @param LIST_POSITION 前面插入或后面插入
     * @param byte[]        pivot 相对位置的内容
     * @param byte[]        value 插入的内容
     * @return 记录总数
     */
    public long linsert(byte[] key, BinaryClient.LIST_POSITION where, byte[] pivot,
                        byte[] value) {
        return jedisCluster.linsert(key, where, pivot, value);
    }

    /**
     * 获取List中指定位置的值
     *
     * @param String key
     * @param int    index 位置
     * @return 值
     **/
    public String lindex(String key, int index) {
        return SafeEncoder.encode(lindex(SafeEncoder.encode(key), index));
    }

    /**
     * 获取List中指定位置的值
     *
     * @param byte[] key
     * @param int    index 位置
     * @return 值
     **/
    public byte[] lindex(byte[] key, int index) {
        return jedisCluster.lindex(key, index);
    }

    /**
     * 将List中的第一条记录移出List
     *
     * @param String key
     * @return 移出的记录
     */
    public String lpop(String key) {
        return SafeEncoder.encode(lpop(SafeEncoder.encode(key)));
    }

    /**
     * 将List中的第一条记录移出List
     *
     * @param byte[] key
     * @return 移出的记录
     */
    public byte[] lpop(byte[] key) {
        return jedisCluster.lpop(key);
    }

    /**
     * 将List中最后第一条记录移出List
     *
     * @param byte[] key
     * @return 移出的记录
     */
    public String rpop(String key) {
        return jedisCluster.rpop(key);
    }

    /**
     * 向List尾部追加记录
     *
     * @param String key
     * @param String value
     * @return 记录总数
     */
    public long lpush(String key, String value) {
        return lpush(SafeEncoder.encode(key), SafeEncoder.encode(value));
    }

    /**
     * 向List头部追加记录
     *
     * @param String key
     * @param String value
     * @return 记录总数
     */
    public long rpush(String key, String value) {
        return jedisCluster.rpush(key, value);
    }

    /**
     * 向List头部追加记录
     *
     * @param String key
     * @param String value
     * @return 记录总数
     */
    public long rpush(byte[] key, byte[] value) {
        return jedisCluster.rpush(key, value);
    }

    /**
     * 向List中追加记录
     *
     * @param byte[] key
     * @param byte[] value
     * @return 记录总数
     */
    public long lpush(byte[] key, byte[] value) {
        return jedisCluster.lpush(key, value);
    }

    /**
     * 获取指定范围的记录，可以做为分页使用
     *
     * @param String key
     * @param long   start
     * @param long   end
     * @return List
     */
    public List<String> lrange(String key, long start, long end) {
        return jedisCluster.lrange(key, start, end);
    }

    /**
     * 获取指定范围的记录，可以做为分页使用
     *
     * @param byte[] key
     * @param int    start
     * @param int    end 如果为负数，则尾部开始计算
     * @return List
     */
    public List<byte[]> lrange(byte[] key, int start, int end) {
        return jedisCluster.lrange(key, start, end);
    }

    /**
     * 删除List中c条记录，被删除的记录值为value
     *
     * @param byte[] key
     * @param int    c 要删除的数量，如果为负数则从List的尾部检查并删除符合的记录
     * @param byte[] value 要匹配的值
     * @return 删除后的List中的记录数
     */
    public long lrem(byte[] key, int c, byte[] value) {
        return jedisCluster.lrem(key, c, value);
    }

    /**
     * 删除List中c条记录，被删除的记录值为value
     *
     * @param String key
     * @param int    c 要删除的数量，如果为负数则从List的尾部检查并删除符合的记录
     * @param String value 要匹配的值
     * @return 删除后的List中的记录数
     */
    public long lrem(String key, int c, String value) {
        return lrem(SafeEncoder.encode(key), c, SafeEncoder.encode(value));
    }

    /**
     * 算是删除吧，只保留start与end之间的记录
     *
     * @param byte[] key
     * @param int    start 记录的开始位置(表示第一条记录)
     * @param int    end 记录的结束位置（如果为则表示最后一个，2，3以此类推）
     * @return 执行状态码
     */
    public String ltrim(byte[] key, int start, int end) {
        return jedisCluster.ltrim(key, start, end);
    }

    /**
     * 算是删除吧，只保留start与end之间的记录
     *
     * @param String key
     * @param int    start 记录的开始位置(表示第一条记录)
     * @param int    end 记录的结束位置（如果为则表示最后一个，2，3以此类推）
     * @return 执行状态码
     */
    public String ltrim(String key, int start, int end) {
        return ltrim(SafeEncoder.encode(key), start, end);
    }
    //*********************************************************************************************
}
