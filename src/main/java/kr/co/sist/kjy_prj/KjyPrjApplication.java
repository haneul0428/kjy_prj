package kr.co.sist.kjy_prj;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class KjyPrjApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(KjyPrjApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(KjyPrjApplication.class, args);
	}

}
