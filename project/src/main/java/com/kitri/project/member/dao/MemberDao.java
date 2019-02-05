package com.kitri.project.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.kitri.project.member.Member;

@Component
public class MemberDao implements IMemberDao{
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String id = "system";
	private String pw = "system";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private HashMap<String, Member> map;

	public MemberDao() {
		//map = new HashMap<String, Member>();
	}
	
	@Override
	public Member memberSelect(Member member) {
		
		map.get(member.getMemID());
		
		return member;
	}
	

	@Override
	public int memberInsert(Member member) {
		
		int result = 0;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pw);
			String sql = "insert into member(memID, memPW, memEMAIL, memPHONE1, memPHONE2, memPHONE3) "
					+ "values (?, ?, ?, ?, ?, ?)";
			pstmt.setString(1, member.getMemID());
			pstmt.setString(2, member.getMemPW());
			pstmt.setString(3, member.getMemEMAIL());
			pstmt.setString(4, member.getMemPHONE1());
			pstmt.setString(5, member.getMemPHONE2());
			pstmt.setString(6, member.getMemPHONE3());
			
			result = pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
		
		return 0;
		
	}

	@Override
	public Member memberUpdate(Member member) {
		
		map.put(member.getMemID(), member);
		
		return map.get(member.getMemID());
	}

	@Override
	public Map<String, Member> memberDelete(Member member) {

		map.remove(member.getMemID(), member);
		
		return map;
		
	}

}
