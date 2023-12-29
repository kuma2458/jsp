package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.StudentDTO;
import service.StudentService;
import views.ModelAndView;

public class StudentRegisterController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String studentNo = request.getParameter("studentNo");
		String studentName = request.getParameter("studentName");
		double score = Double.parseDouble(request.getParameter("score"));
		String gender = request.getParameter("gender");
		int majorNo = Integer.parseInt(request.getParameter("major"));
		
		int result = StudentService.getInstance().StudentRegister(
				new StudentDTO(studentNo, studentName, score, gender, majorNo)); 
		
		ModelAndView view = null;
		
		if(result == 1) {
			view = new ModelAndView("main.do", true);
		}else {
			response.setContentType("text/html; charser=utf-8"); 
			PrintWriter pw = response.getWriter();
			pw.write("<script>alert('학생정보 등록에 실패했습니다.');history.back();</script>");
		}
		
		return view;
	}

}
