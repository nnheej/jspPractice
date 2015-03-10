package mvjsp.chap13.service;

import java.sql.Connection;
import java.sql.SQLException;

import mvjsp.chap13.dao.MessageDao;
import mvjsp.chap13.dao.MessageDaoProvider;
import mvjsp.chap13.model.Message;
import mvjsp.jdbc.jdbcUtil;
import mvjsp.jdbc.connection.ConnectionProvider;

public class DeleteMessageService {
	private static DeleteMessageService instance = new DeleteMessageService();
	public static DeleteMessageService getInstance(){
		return instance;
	}
	private DeleteMessageService(){
		
	}
	public void deleteMessage(int messageId,String password)
	throws ServiceException, InvalidMessagePasswordException, MessageNotFoundException{
		Connection conn = null;
		try{
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			MessageDao messageDao = MessageDaoProvider.getInstance().getMessageDao();
			Message message = messageDao.select(conn, messageId);
			if(message==null)
				throw new MessageNotFoundException("메시지가 없습니다:"
						+messageId);
			if(!message.hasPassword())
				throw new InvalidMessagePasswordException();
			if(!message.getPassword().equals(password))
				throw new InvalidMessagePasswordException();
			
			messageDao.delete(conn, messageId);
			
			conn.commit();
			
		}catch(SQLException ex){
			jdbcUtil.rollback(conn);
			throw new ServiceException("삭제 처리 중 에러가 발생:"
					+ex.getMessage(),ex);
		}catch(InvalidMessagePasswordException ex){
			jdbcUtil.rollback(conn);
			throw ex;
		}catch(MessageNotFoundException ex){
			jdbcUtil.rollback(conn);
			throw ex;
		}finally{
			if(conn!=null){
				try{
					conn.setAutoCommit(false);
				}catch(SQLException e){
					
				}
				jdbcUtil.close(conn);
			}
		}
		
		
	}
	

}
