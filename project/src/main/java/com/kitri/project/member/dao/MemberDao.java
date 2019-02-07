package com.kitri.project.member.dao;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kitri.project.member.Member;
import com.mchange.v2.c3p0.ComboPooledDataSource;

@Component
public class MemberDao implements IMemberDao{
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String id = "system";
	private String pw = "system";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	private ComboPooledDataSource datasource;
	
	private JdbcTemplate template;
	
//	private Connection conn = null;
//	private PreparedStatement pstmt = null;
//	private ResultSet rs = null;

	public MemberDao() {
		
		datasource = new ComboPooledDataSource();
		
		try {
			datasource.setDriverClass(driver);
			datasource.setUser(id);
			datasource.setPassword(pw);
			datasource.setJdbcUrl(url);
		} catch (PropertyVetoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		template = new JdbcTemplate(datasource);
		template.setDataSource(datasource);
		
	}
	
	@Override
	public Member memberSelect(final Member member) {
		List<Member> members = null;
		
		final String sql = "SELECT * FROM member WHERE memID = ? and memPW = ?";
		
		members = template.query(sql, new Object[]{member.getMemID(), member.getMemPW()}, new RowMapper<Member>() {
			
			@Override
			public Member mapRow(ResultSet rs, int rowNum) {
				Member mem = new Member();
				try {
					mem.setMemID(rs.getString("memID"));
					mem.setMemPW(rs.getString("memPW"));
					mem.setMemEMAIL(rs.getString("memEMAIL"));
					mem.setMemPHONE1(rs.getString("memPHONE1"));
					mem.setMemPHONE2(rs.getString("memPHONE2"));
					mem.setMemPHONE3(rs.getString("memPHONE3"));
				} catch (SQLException e) {
					e.printStackTrace();
				}

				return mem;
			}
			
		});
		
		if(members.isEmpty()) 
			return null;
		
		return members.get(0);
	}
	

	@Override
	public int memberInsert(final Member member) {
		
		int result = 0;
		
		final String sql = "insert into member(memID, memPW, memEMAIL, memPHONE1, memPHONE2, memPHONE3) "
				+ "values (?, ?, ?, ?, ?, ?)";
		
		result = template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				
				ps.setString(1, member.getMemID());
				ps.setString(2, member.getMemPW());
				ps.setString(3, member.getMemEMAIL());
				ps.setString(4, member.getMemPHONE1());
				ps.setString(5, member.getMemPHONE2());
				ps.setString(6, member.getMemPHONE3());
				
			}
			
		});
		
		return result;
		
	}

	@Override
	public int memberUpdate(final Member member) {
		
		int result = 0;
		
		final String sql = "UPDATE member SET memPW = ?, memEMAIL = ?, "
				+ "memPHONE1 = ?, memPHONE2 = ?, memPHONE3 = ? WHERE memID = ?";
		
		result = template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				
				ps.setString(1, member.getMemPW());
				ps.setString(2, member.getMemEMAIL());
				ps.setString(3, member.getMemPHONE1());
				ps.setString(4, member.getMemPHONE2());
				ps.setString(5, member.getMemPHONE3());
				
			}
			
		});
		
		return result;
	}

	@Override
	public int memberDelete(final Member member) {
		
		int result = 0;
		
		final String sql = "DELETE member WHERE memID = ? ";
		
		result = template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, member.getMemID());
			}
		});
		
		return result;
		
	}

}
