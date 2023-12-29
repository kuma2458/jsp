package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDTO;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/test.do")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//MemberDTO 하나 생성
		MemberDTO dto =new MemberDTO("A0001","12345","홍길동",20,"남",30000,"VIP");
		
		//session 생성
		HttpSession session=request.getSession();
		session.setAttribute("dto", dto);
		session.setAttribute("msg", "session message");
		
		//Arraylist<MemberDTO> 생성해서 데이터 3건이상 리스트에 저장
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		list.add(new MemberDTO("A0002", "12345", "박하나", 20, "여", 40000, "VIP"));
		list.add(new MemberDTO("A0003", "12345", "김철수", 20, "남", 5000, "SILVER"));
		list.add(new MemberDTO("A0004", "12345", "박대기", 20, "남", 9000, "GOLD"));
	
		request.setAttribute("list", list);
		request.setAttribute("age", 20);
		
		request.getRequestDispatcher("jstl_el.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
