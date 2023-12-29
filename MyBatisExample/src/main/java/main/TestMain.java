package main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import config.DBManager;
import dao.MemberMapper;
import dto.MemberDTO;

public class TestMain {

	public static void main(String[] args) {
		List<MemberDTO> list=MemberMapper.getInstance().selectAllMember();
		System.out.println(list.toString());
	
	
	}

}
