package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 * Servlet implementation class SessionSerlvet
 */
@WebServlet("/session_test")
public class SessionSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SessionSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//이름,나이 가져오기
		String name=request.getParameter("name");
		int age=Integer.parseInt(request.getParameter("age"));
		
		//session 영역
		HttpSession session= request.getSession(true);
		
		//session에 데이터 저장
		session.setAttribute("name", name);
		session.setAttribute("age", age);
		
		//session 만료시간 설정 -초단위
		session.setMaxInactiveInterval(60);
		
		//09_session_result.jsp로 이동,redirect
		response.sendRedirect("09_session_result.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
