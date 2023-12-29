package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.StudentDTO;
import service.StudentService;
import views.ModelAndView;

public class StudentDeleteController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String studentNo = request.getParameter("studentNo");
		
		int result = StudentService.getInstance().deleteStudent(studentNo); 
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pw = response.getWriter();
		if(result == 1) {
			pw.write("<script>alert('"+studentNo+"학번 데이터가 삭제되었습니다.');location.href='main.do';</script>");
		}else {
			pw.write("<script>alert('"+studentNo+"학번 데이터가 없습니다.');location.href='main.do';</script>");
		}
		
		return null;
	}

}
