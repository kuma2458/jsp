package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import dto.MajorDTO;
import service.StudentService;
import views.ModelAndView;

public class MajorInsertController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//학과번호, 학과명 받아서 major 테이블에 저장하는 과정을 처리
		int majorNo=Integer.parseInt(request.getParameter("majorNo"));
		String majorName=request.getParameter("majorName");
		
		int result=StudentService.getInstance().insertmajor(majorNo,majorName);
		
		JSONObject obj=new JSONObject();
		
		if(result==0) {
			obj.put("msg", "학과정보 등록에 실패하였습니다. 데이터를 확인해보세요.");
		}
		else {
			obj.put("msg", "학과정보 등록에 성공하였습니다. ");
			
		}
		
		
		//전체 학과정보 받아옴
		ArrayList<MajorDTO> majorList = StudentService.getInstance().selectAllMajor();
		HttpSession session = request.getSession();
		session.setAttribute("majorList", majorList);
		JSONArray arr= new JSONArray(majorList);
		obj.put("list", arr);
		
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(obj.toString());
		return null;
	}

}
