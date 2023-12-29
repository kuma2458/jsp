package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.HandlerMapping;
import views.ModelAndView;

/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DispatcherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] arr = request.getRequestURI().split("/");
		String command = arr[arr.length-1];
		ModelAndView view = null;
		
		//HandlerMapping에 command를 보내서 작업할 컨트롤러를 받아와야함
		Controller controller = HandlerMapping.getInstance().createController(command);
		//Controller 실행, 실행 결과는 어느 페이지로 이동할 것인지? 받아옴
		if(controller != null) 
			view = controller.execute(request, response);
		
		if(view == null) return;
		//페이지 이동 - 경로, forward? redirect?
		if(view.isRedirect())
			response.sendRedirect(view.getPath());
		else
			request.getRequestDispatcher(view.getPath()).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}