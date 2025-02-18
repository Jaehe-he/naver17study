package data.dto;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import lombok.Data;

@Configuration
@PropertySource("classpath:/navercloud.properties")
@ConfigurationProperties(prefix = "naver.cloud")
@Data
public class MyCloudProps {
	private String db;
	private String username;
	private String password;
	
}
