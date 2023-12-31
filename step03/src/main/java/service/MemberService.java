package service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import config.DBManager;
import dao.MemberDAO;
import dto.MemberDTO;

public class MemberService {
	private static MemberService instance=new MemberService();

	private MemberService() {
	}

	public static MemberService getInstance() {
		if(instance == null)
			instance = new MemberService();
		return instance;
	}

	public ArrayList<MemberDTO> searchMember(String kind, String search) {
		return MemberDAO.getInstance().searchMember(kind,search);
	}
	
}
