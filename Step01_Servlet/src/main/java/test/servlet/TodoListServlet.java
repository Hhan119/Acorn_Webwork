package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 *  	/todo/list 요청을 처리 할 TodoListServlet을 만들어 보세요.
 *  	List<String>에 할일을 3개 담아서 할 일을 ul, li를 활용해서 클라이언트에게 출력해보세요.
 *  
 *  	할일은 참고로 "html 공부하기", "css 공부하기", "javascript 공부하기"
 */		

@WebServlet("/todo/list")
public class TodoListServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter pw =resp.getWriter();
		List<String> works = new ArrayList<>();
		works.add("html 공부하기");
		works.add("css 공부하기");
		works.add("javascript 공부하기");
		
		//응답 인코딩 설정
			resp.setCharacterEncoding("utf-8");
		//응답 컨텐트 설정
			resp.setContentType("text/html; charset=utf-8");
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title></title>");
		pw.println("</head>");
		pw.println("<body>");
			pw.println("<h3>할일 목록입니다.</h3>");

			pw.println("<ul>");
			// 확장 for문을 활용하면?
				// for(Type 변수 : 배열의 타입/변수){}
			for(String tmp:works) {
				pw.println("<li>" + tmp +"</li>");
 			}
			pw.println("</ul>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}

