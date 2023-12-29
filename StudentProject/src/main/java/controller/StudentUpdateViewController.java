package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.StudentDTO;
import service.StudentService;
import views.ModelAndView;

public class StudentUpdateViewController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView view=null;
		String studentNo=request.getParameter("studentNo");
		
		StudentDTO dto =StudentService.getInstance().selectStudent(studentNo);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pw = response.getWriter();
		if(dto==null) {
			//수정할 학생정보가 없을때
			pw.write("<script>alert('"+studentNo+"학번 데이터가 없습니다.');location.href='main.do';</script>");
		}
		else {
			//수정할 학생정보가 있을때
			request.setAttribute("dto", dto);
			view= new ModelAndView("student_update.jsp", false);
		}
		
		return view;
	}

}
