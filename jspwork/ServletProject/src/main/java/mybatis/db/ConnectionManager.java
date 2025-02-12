package mybatis.db;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ConnectionManager {
	private static ConnectionManager instance;
	public static ConnectionManager getInstance(){
		if(instance == null)
			instance = new ConnectionManager();
		return instance;
	}

	private SqlSessionFactory sqlSessionFactory;
	private ConnectionManager(){
		String resource = "mybatis/db/Configuration.xml";
		try{
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		}catch (IOException e) {
			e.printStackTrace();
		}
	}



	public SqlSession openSession()	{
			return sqlSessionFactory.openSession(true);
	}
}