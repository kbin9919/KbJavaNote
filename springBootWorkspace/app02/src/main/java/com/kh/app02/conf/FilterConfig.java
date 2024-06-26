package com.kh.app02.conf;

import com.kh.app02.filter.AdminFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
//설정을 위한 파일로 알기위하여
public class FilterConfig {

    @Bean
    public FilterRegistrationBean m01(){
        AdminFilter khf =new AdminFilter();
        FilterRegistrationBean x =new FilterRegistrationBean<>(khf);
        x.addUrlPatterns("/*");
        x.setOrder(2);
        return x;
    }
    @Bean
    public FilterRegistrationBean m02(){
        AdminFilter khf =new AdminFilter();
        FilterRegistrationBean x   =new FilterRegistrationBean<>(new AdminFilter());
        x.addUrlPatterns("/*");
        x.setOrder(1);
        return x;
    }

}
