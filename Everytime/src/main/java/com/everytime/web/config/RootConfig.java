package com.everytime.web.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@ComponentScan(basePackages = { "com.everytime.web.service", "com.everytime.web.aspect" })
@EnableAspectJAutoProxy
@MapperScan(basePackages = { "com.everytime.web.persistence" })
@EnableTransactionManagement // 트랜잭션 관리 활성화
public class RootConfig {

	@Bean
	public DataSource dataSource() { // DataSource 빈 생성 메서드
		HikariConfig config = new HikariConfig(); // 설정 객체 생성
		config.setDriverClassName("oracle.jdbc.OracleDriver"); // JDBC 드라이버 클래스명 설정
		config.setJdbcUrl("jdbc:oracle:thin:@192.168.0.174:1521:xe"); // DB 접속 URL 설정
		config.setUsername("PROJECT"); // DB 계정 이름 설정
		config.setPassword("1234"); // DB 계정 비밀번호 설정

		config.setMaximumPoolSize(50); // 최대 커넥션 풀 크기 설정
		config.setConnectionTimeout(30000); // 커넥션 타임아웃 설정 (30초)
		HikariDataSource ds = new HikariDataSource(config); // 설정 객체를 사용하여 DataSource 빈 생성
		return ds; // DataSource 빈 반환
	}

	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource());
		return (SqlSessionFactory) sqlSessionFactoryBean.getObject();
	}

	// 트랜잭션 관리 빈을 생성하는 메서드
	@Bean
	public PlatformTransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}
	
	// mailSender
	@Bean
	public JavaMailSender mailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);
        mailSender.setUsername("soldeskedu@gmail.com");
        mailSender.setPassword("joogjvygvtnqalwc");
        mailSender.setDefaultEncoding("utf-8");

        Properties javaMailProperties = new Properties();
        javaMailProperties.put("mail.smtp.starttls.enable", "true");
        javaMailProperties.put("mail.smtp.auth", "true");
        javaMailProperties.put("mail.smtp.ssl.checkserveridentity", "true");
        javaMailProperties.put("mail.smtp.ssl.trust", "*");
        javaMailProperties.put("mail.debug", "true");
        javaMailProperties.put("mail.smtp.connectiontimeout", "5000");
        javaMailProperties.put("mail.smtp.timeout", "5000");
        javaMailProperties.put("mail.smtp.writetimeout", "5000");

        mailSender.setJavaMailProperties(javaMailProperties);

        return mailSender;
    }
} // end RootConfig

