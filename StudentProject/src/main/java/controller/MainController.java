package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.StudentDAO;
import dto.MajorDTO;
import dto.StudentDTO;
import service.StudentService;
import views.ModelAndView;

public class MainController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("main.jsp", false);
		//모든 학생 정보를 읽어와서 request 영역에 저장
		ArrayList<StudentDTO> studentList = 
				StudentService.getInstance().selectAllStudent();
		request.setAttribute("studentList", studentList);
		//모든 학과 정보를 읽어와서 session 영역에 저장
		ArrayList<MajorDTO> majorList = StudentService.getInstance().selectAllMajor();
		HttpSession session = request.getSession();
		session.setAttribute("majorList", majorList);
		
		return view;
	}

}
