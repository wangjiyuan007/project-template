package com.wjy.data.system.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.ElementType;
import java.lang.annotation.Target;
import java.lang.annotation.RetentionPolicy;

/**
 * <p>Title: Log</p>
 * <p>Description: </p>
 * <p>Company: www.leador.com.cn</p> 
 * <p>Date: 2018年10月25日 下午3:09:28</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Log {
	String value() default "";
}
