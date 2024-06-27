package com.kh.app02.app07;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Myjob {
    @Scheduled(fixedRate = 5000)
    public void helloWorld(){
        System.out.println("Hello World");
    }
}
