package main;

import org.apache.ibatis.session.SqlSession;

import config.DBManager;

public class TestMain {

	public static void main(String[] args) {
		SqlSession  session=DBManager.getInstance().getSession();
		System.out.println("메인 종료");
	
	
	}

}
