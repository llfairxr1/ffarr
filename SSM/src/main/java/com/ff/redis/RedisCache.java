package com.ff.redis;

import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import org.apache.ibatis.cache.Cache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;

public class RedisCache implements Cache {
	//定義一個ID
	private final String id;
	//创建读写锁
	private final ReadWriteLock rwl = new ReentrantReadWriteLock();
	//创建redis的；连接
	private static JedisConnectionFactory jedisConnectionFactory;
	
	public static void setJedisConnectionFactory(JedisConnectionFactory jedisConnectionFactory){
		RedisCache.jedisConnectionFactory=jedisConnectionFactory;
	}
	
	public RedisCache(String id) {
		super();
		this.id = id;
	}
	//緩存的key
	public String getId() {
		// TODO Auto-generated method stub
		return id;
	}

	//將數據寫入到緩存中
	public void putObject(Object key, Object value) {
		rwl.writeLock().lock(); //写数据的时候加入锁，防止自己写的时候，别人也写
		RedisConnection redis = jedisConnectionFactory.getConnection();//连接redis
		RedisSerializer<Object> ser = new JdkSerializationRedisSerializer();//用于序列化数据
		redis.set(ser.serialize(key), ser.serialize(value));//将参数key-value 序列化
		System.out.println("----------------添加二级缓存key"+key+"value "+value);
		redis.close();
		rwl.writeLock().unlock(); //方开锁
	}
	
	//從緩存中取數據
	public Object getObject(Object key) {
		rwl.readLock().lock(); //读锁
		RedisConnection redis = jedisConnectionFactory.getConnection();//连接redis
		RedisSerializer<Object> ser = new JdkSerializationRedisSerializer();//用于序列化数据
		byte[] bs = redis.get(ser.serialize(key));
		Object deserialize = ser.deserialize(bs);
		System.out.println("---------------------命中二级缓存"+deserialize);
		redis.close();
		rwl.readLock().unlock();
		return deserialize;
	}
	
	//从缓存中删除数据
	public Object removeObject(Object key) {
		rwl.writeLock().lock(); //读锁
		RedisConnection redis = jedisConnectionFactory.getConnection();//连接redis
		RedisSerializer<Object> ser = new JdkSerializationRedisSerializer();//用于序列化数据
		Boolean expire = redis.expire(ser.serialize(key), 0);
		
		
		redis.close();
		rwl.writeLock().unlock();
		
		return expire;
	}
	//清空缓存
	public void clear() {
		rwl.writeLock().lock();
		RedisConnection redis = jedisConnectionFactory.getConnection();//连接redis
		redis.flushDb();
		redis.flushAll();
		redis.close();
		rwl.writeLock().unlock();
	}
	//缓存中数据的数量
	public int getSize() {
		RedisConnection redis = jedisConnectionFactory.getConnection();//连接redis
		Integer size = Integer.valueOf(redis.dbSize().toString());
		redis.close();
		return size;
	}
	
	//
	public ReadWriteLock getReadWriteLock() {
		// TODO Auto-generated method stub
		return rwl;
	}

}
