package kr.co.sist.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisHandler {
	private static MyBatisHandler mbh;
	private static SqlSessionFactory ssf;
	
	private MyBatisHandler() {
		org.apache.ibatis.logging.LogFactory.useLog4J2Logging();
	}//MyBatis
	
	public static MyBatisHandler getInstance() {
		if(mbh == null) {
			mbh = new MyBatisHandler();
		}// end if
		return mbh;
	}//getInstance
	
	private static SqlSessionFactory createMybatis() {
		if(ssf == null) {
			String configPath = "kr/co/sist/dao/mybatis-config.xml";
			try {
				//1. 설정파일과 연결
				Reader reader = Resources.getResourceAsReader(configPath);
				//2. MyBatis Framework 생성
				ssf = new SqlSessionFactoryBuilder().build(reader);
				
				if(reader != null) {
					reader.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}//end if
		
		return ssf;
	}//createMybatis
	
	/**
	 * true - autoCommit으로 쿼리 수행, false - autoCommit으로 쿼리수행 X
	 * @param autoCommitFlag
	 * @return
	 */
	public SqlSession getHandler( boolean autoCommitFlag ) {
		return createMybatis().openSession(autoCommitFlag);
	}//getHandler
	
	/**
	 * autocommit으로 수행되지 않는다.
	 * @return
	 */
	public SqlSession getHandler() {
		return createMybatis().openSession();
	}//getHandler
	
	/**
	 * MyBatis Handler 닫기
	 * @param ss
	 */
	public void closeHandler(SqlSession ss) {
		if(ss != null) {
			ss.close();
		}//end if
	}//closeHandler
	
	
}//class
