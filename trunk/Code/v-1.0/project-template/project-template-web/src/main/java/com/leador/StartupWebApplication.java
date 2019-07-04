package com.leador;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.transaction.annotation.EnableTransactionManagement;
@EnableAutoConfiguration(exclude = {
        org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class
})
@EnableTransactionManagement
@ServletComponentScan
@MapperScan(basePackages={"com.leador.**.dao"})
@SpringBootApplication
@EnableCaching
//@EnableDiscoveryClient
//@EnableFeignClients
public class StartupWebApplication {
    public static void main(String[] args) {
        SpringApplication.run(StartupWebApplication.class, args);
    }
}
