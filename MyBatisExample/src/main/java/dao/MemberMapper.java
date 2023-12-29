package dao;

import java.util.List;

import config.DBManager;
import dto.MemberDTO;

public class MemberMapper {
	private static MemberMapper instance = new MemberMapper();
	private DBManager  manager;
	
	private MemberMapper() {
		manager=DBManager.getInstance();
	}

	public static MemberMapper getInstance() {
		if(instance==null)
			instance=new MemberMapper();
		return instance;
	}
	
	public List<MemberDTO> selectAllMember(){
		return manager.getSession().selectList("selectAllMember");
	}
	
}
