package service;

import java.util.ArrayList;

import dao.StudentDAO;
import dto.MajorDTO;
import dto.StudentDTO;

public class StudentService {
	private static StudentService instance=new StudentService();
	private StudentDAO studentDao;
	private StudentService() {
		studentDao=StudentDAO.getInstance();
	}
	public static StudentService getInstance() {
		if(instance==null)
			instance=new StudentService();
		return instance;
	}
	public ArrayList<StudentDTO> selectAllStudent() {
		return studentDao.Readstudentinfo();
	}
	public ArrayList<MajorDTO> selectAllMajor() {
		return studentDao.ReadMajor();
	}
	public int StudentRegister(StudentDTO stdto) {
		return studentDao.StudentRegister(stdto);
	}
	public int deleteStudent(String studentNo) {
		return studentDao.deleteStudent(studentNo);
	}
	public StudentDTO selectStudent(String studentNo) {
		if(studentNo.equals("")||studentNo==null)
			return null;
		return studentDao.selectStudent(studentNo);
	}
	public int StudentUpdate(StudentDTO studentDTO) {
		return studentDao.studentUpdate(studentDTO);
	}
	public int insertmajor(int majorNo, String majorName) {
		return studentDao.insertmajor(majorNo,majorName);
	}
	public int updatemajor(int majorNo, String majorName) {
		return studentDao.updatemajor(majorNo,majorName);
	}
	public int deletemajor(int majorNo) {
		return studentDao.deletemajor(majorNo);
	}

	
}
