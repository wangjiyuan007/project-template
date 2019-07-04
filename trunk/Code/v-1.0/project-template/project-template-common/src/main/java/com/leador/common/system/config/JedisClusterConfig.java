package com.leador.common.system.config;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.JedisCluster;

import java.util.HashSet;
import java.util.Set;

@Configuration
public class JedisClusterConfig {

    @Value("${spring.redis.clusterNodes}")
    private String clusterNodes;

    @Value("${spring.redis.password}")
    private String password;

    @Value("${spring.redis.commandTimeout}")
    private int commandTimeout;

    /**
     * 注意：
     * 这里返回的JedisCluster是单例的，并且可以直接注入到其他类中去使用
     *
     * @return
     */
    @Bean
    public JedisCluster getJedisCluster() {
        //获取服务器数组(这里要相信自己的输入，所以没有考虑空指针问题)
        String[] serverArray = clusterNodes.split(",");
        Set<HostAndPort> nodes = new HashSet<>();

        for (String ipPort : serverArray) {
            String[] ipPortPair = ipPort.split(":");
            nodes.add(new HostAndPort(ipPortPair[0].trim(), Integer.valueOf(ipPortPair[1].trim())));
        }

        JedisCluster jedisCluster = null;
        if (StringUtils.isBlank(password)) {
            //不需要密码连接的创建对象方式
            jedisCluster = new JedisCluster(nodes, commandTimeout, 1000, 1, new GenericObjectPoolConfig());
        } else {
            //需要密码连接的创建对象方式
            jedisCluster = new JedisCluster(nodes, commandTimeout, 1000, 1, password, new GenericObjectPoolConfig());
        }

        return jedisCluster;
    }
}
