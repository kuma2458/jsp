package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
//		String uri=request.getRequestURI();
//		int idx=request.getRequestURL().indexOf(uri);
//		int idx2=request.getRequestURI().indexOf('/',1);
//		System.out.println(idx);
//		System.out.println(idx2);
//		System.out.println(request.getRequestURL().delete(idx, idx+idx2));
		String[] arr= request.getRequestURI().split("/");
		System.out.println(arr[arr.length-1]);
		int idx =request.getRequestURL().indexOf("/",7);
		String url=request.getRequestURL().substring(0, idx);
		System.out.println(url);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] arr=request.getRequestURI().split("/");
		String command=arr[arr.length-1];
		
		//HalderMapping 에 coomadn를 보내어 작업할 컨트롤러를 받아와야 함
		
		//Contorller 실행, 실행 결과는 어느 페이지로 이동ㅎ ㅏㄹ 것인지
		
		//forward로 보낼지, redirect
	
	
	}

}
