package com.kh.app02.conf;

import com.kh.app02.interceptor.KhInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        registry
                .addInterceptor(new KhInterceptor()).
                addPathPatterns("/**");
    }
}
