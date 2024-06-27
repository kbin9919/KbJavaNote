package com.kh.app03.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class TimerAop {
    @Around("execution(public void com.kh.app03.board.dao.BoardDao.list() )")
    public void m01(ProceedingJoinPoint jp) throws Throwable{
        long start = System.nanoTime();
        jp.proceed();
        long end = System.nanoTime();
        long time = end - start;
        System.out.println("time : " + time);
    }
}
