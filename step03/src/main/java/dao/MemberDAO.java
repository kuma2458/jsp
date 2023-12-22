package dao;

import java.sql.*;
import java.util.ArrayList;

import config.DBManager;
import dto.MemberDTO;

public class MemberDAO {
	private static MemberDAO instance=new MemberDAO();
	
	private MemberDAO() {
		
	}

	public static MemberDAO getInstance() {
		if(instance==null)
			instance=new MemberDAO();
		return instance;
	}
	public ArrayList<MemberDTO> searchMember(String kind, String search) {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		
		String sql = "select * from member where " + kind + " like '%' || ? || '%'";
		
		try {
			PreparedStatement pstmt = 
					DBManager.getInstance().getConn().prepareStatement(sql);
			
			pstmt.setString(1, search);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString(1);
				String passwd = rs.getString(2);
				String name = rs.getString(3);
				int age = rs.getInt(4);
				String gender = rs.getString(5);
				list.add(new MemberDTO(id, passwd, name, age, gender));
			}
			
			DBManager.getInstance().close(rs, pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
}
