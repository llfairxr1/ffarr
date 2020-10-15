package com.ff.redis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

//redis 缓存配置类
@Configuration   //说明这个类是个配置文件
@EnableCaching   //指定这个类是配置缓存类  开启缓存管理功能
public class RedisCache extends CachingConfigurerSupport{
/**
 * volatile :弱同步机制 关键字之一。被其修饰的变量发生改变时会通知其他线程
 */
	@Autowired
	private volatile JedisConnectionFactory jedisConnectionFactory;
	@Autowired
	private volatile RedisTemplate<String, String> redisTemplate;
	@Autowired
	private volatile RedisCacheManager redisCacheManager;
	
	
	public RedisCache(JedisConnectionFactory jedisConnectionFactory, RedisTemplate<String, String> redisTemplate,
			RedisCacheManager redisCacheManager) {

		this.jedisConnectionFactory = jedisConnectionFactory;
		this.redisTemplate = redisTemplate;
		this.redisCacheManager = redisCacheManager;
	}

	public JedisConnectionFactory getJedisConnectionFactory() {
		return jedisConnectionFactory;
	}
	public RedisTemplate<String, String> getRedisTemplate() {
		return redisTemplate;
	}
	public RedisCacheManager getRedisCacheManager() {
		return redisCacheManager;
	}

	
	
	
}
