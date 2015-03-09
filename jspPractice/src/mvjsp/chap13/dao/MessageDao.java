package mvjsp.chap13.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.sql.PreparedStatement;

import mvjsp.chap13.model.Message;
import mvjsp.jdbc.jdbcUtil;

public abstract class MessageDao {
	public abstract int insert(Connection conn, Message message)
			throws SQLException;

	public Message select(Connection conn, int messageId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn
					.prepareStatement("select * from guestbook_message where message_id = ?");
			pstmt.setInt(1, messageId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return makeMessageFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
		}
	}

	protected Message makeMessageFromResultSet(ResultSet rs)
			throws SQLException {
		Message message = new Message();
		message.setId(rs.getInt("message_id"));
		message.setGuestName(rs.getString("guest_name"));
		message.setPassword(rs.getString("password"));
		message.setMessage(rs.getString("message"));
		return message;
	}

	public abstract List<Message> selectList(Connection conn, int firstRow,
			int endRow) throws SQLException;

	public int delete(Connection conn, int messageId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn
					.prepareStatement("delete from guestbook_message where message_id=?");
			pstmt.setInt(1, messageId);
			return pstmt.executeUpdate();

		} finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
		}
	}

}
