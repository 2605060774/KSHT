package com.bgs;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@MapperScan("com.bgs.mapper")
@EnableAsync //开启异步
public class TxaminationLaterApplication {

    public static void main(String[] args) {
        SpringApplication.run(TxaminationLaterApplication.class, args);
    }

}
