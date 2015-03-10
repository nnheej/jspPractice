package mvjsp.chap13.dao;

import mvjsp.chap13.dao.mysql.MYSQLMessageDao;

public class MessageDaoProvider {
	
	/*singleton pattern*/
	private static MessageDaoProvider instance = new MessageDaoProvider();
	public static MessageDaoProvider getInstance(){
		return instance;
	}
	private MessageDaoProvider(){};

	/*ebms */
	private MYSQLMessageDao mysqlDao = new MYSQLMessageDao();
	/*private OracleMessageDao oracleDao = new OracleMessageDao();
	private MSSQLMessageDao mssqlDao = new MSSQLMessageDao();
	*/
	private String dbms;
	
	void setDbms(String dbms){
		this.dbms = dbms;
	}
	
	public MessageDao getMessageDao(){
		if("mysql".equals(dbms)){
			return mysqlDao;
		}
		/*else if("oracle".equals(dbms)){
			return oracleDao;
		}
		else if("mssql".equals(dbms)){
			return mssqlDao;
		}*/
		
		return null;
	}
}
