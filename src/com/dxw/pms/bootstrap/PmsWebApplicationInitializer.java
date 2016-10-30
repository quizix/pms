package com.dxw.pms.bootstrap;

import javax.servlet.ServletContext;
import javax.servlet.ServletRegistration;

import org.springframework.core.annotation.Order;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.servlet.DispatcherServlet;

@Order(1)  
public class PmsWebApplicationInitializer 
		implements WebApplicationInitializer {
	@Override
	public void onStartup(ServletContext container) {
		DispatcherServlet s = new DispatcherServlet();
		//动态注册DispatcherServlet
		ServletRegistration.Dynamic dynamic = container.addServlet("pms", s);
		dynamic.setLoadOnStartup(1);
		dynamic.addMapping("/");
	}
}
