package dao;

import java.lang.reflect.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.spi.DirStateFactory.Result;

import config.DBManager;
import dto.MajorDTO;
import dto.StudentDTO;

public class StudentDAO {
	private static StudentDAO instance=new StudentDAO();
	private DBManager manager;
	
	
	
	private StudentDAO() {
		manager =DBManager.getInstance();
		
	}

	public static StudentDAO getInstance() {
		if(instance==null)
			instance=new StudentDAO();
		return instance;
	}

	public ArrayList<StudentDTO> Readstudentinfo() {
		ArrayList<StudentDTO> list =new ArrayList<StudentDTO>();
		String sql="select * from student";
		
		try {
			PreparedStatement pstmt=DBManager.getInstance().getConn().prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				String studentNo=rs.getString(1);
				String studentName=rs.getString(2);
				double score=rs.getDouble(3);
				String gender=rs.getString(4);
				int majorNO=rs.getInt(5);
				list.add(new StudentDTO(studentNo, studentName, score, gender, majorNO));
			}
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return list;
	}

	public ArrayList<MajorDTO> ReadMajor() {
		ArrayList<MajorDTO> list =new ArrayList<MajorDTO>();
		String sql="select * from Major";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=DBManager.getInstance().getConn().prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				int majorNo=rs.getInt(1);
				String majorname=rs.getString(2);
				list.add(new MajorDTO(majorNo, majorname));
			}
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			DBManager.getInstance().close(rs, pstmt);
		}
		
		return list;
	}

	public int StudentRegister(StudentDTO stdto) {
		String sql = "insert into student values(?,?,?,?,?)";
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = manager.getConn().prepareStatement(sql);
			pstmt.setString(1, stdto.getStudentNo());
			pstmt.setString(2, stdto.getStudentName());
			pstmt.setDouble(3, stdto.getScore());
			pstmt.setString(4, stdto.getGender());
			pstmt.setInt(5, stdto.getMajorNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			manager.close(null, pstmt);
		}
		return result;
	}

	public int deleteStudent(String studentNo) {
		String sql = "delete from student where std_no like ?";
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = manager.getConn().prepareStatement(sql);
			pstmt.setString(1, studentNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			manager.close(null, pstmt);
		}
		return result;
	}

	public StudentDTO selectStudent(String studentNo) {
		StudentDTO stdto=null;
		String sql="select * from student where std_no like ?";
		
		try {
			PreparedStatement pstmt=DBManager.getInstance().getConn().prepareStatement(sql);
			pstmt.setString(1, studentNo);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				String studentNo1=rs.getString(1);
				String studentName=rs.getString(2);
				double score=rs.getDouble(3);
				String gender=rs.getString(4);
				int majorNO=rs.getInt(5);
				stdto= new StudentDTO(studentNo1, studentName, score, gender, majorNO);
			}
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return stdto;
	}

	public int studentUpdate(StudentDTO studentDTO) {
		String sql = "update student set std_name =?,std_score=?,gender=?,major_No=? where std_no like ?";
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = manager.getConn().prepareStatement(sql);
			pstmt.setString(1, studentDTO.getStudentName());
			pstmt.setDouble(2, studentDTO.getScore());
			pstmt.setString(3, studentDTO.getGender());
			pstmt.setInt(4, studentDTO.getMajorNo());
			pstmt.setString(5, studentDTO.getStudentNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			manager.close(null, pstmt);
		}
		return result;
	}

	public int insertmajor(int majorNo, String majorName) {
		int result=0;
		String sql = "insert into major values(?,?)";
		PreparedStatement pstmt= null;
		try {
			pstmt=manager.getConn().prepareStatement(sql);
			pstmt.setInt(1, majorNo);
			pstmt.setString(2, majorName);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			manager.close(null, pstmt);
		}
		
		return result;
	}

	public int updatemajor(int majorNo, String majorName) {
		int result=0;
		String sql = "update major set major_name = ? where major_no = ? ";
		PreparedStatement pstmt= null;
		try {
			pstmt=manager.getConn().prepareStatement(sql);
			pstmt.setString(1, majorName);
			pstmt.setInt(2, majorNo);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			manager.close(null, pstmt);
		}
		
		return result;
	}

	public int deletemajor(int majorNo) {
		int result=0;
		String sql = "delete from major where major_no = ? ";
		PreparedStatement pstmt= null;
		try {
			pstmt=manager.getConn().prepareStatement(sql);
			pstmt.setInt(1, majorNo);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			manager.close(null, pstmt);
		}
		
		return result;
	}
	
}
