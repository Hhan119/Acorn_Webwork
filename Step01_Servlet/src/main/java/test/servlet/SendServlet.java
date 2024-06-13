package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/* 
  		<form action="send" method="get">
			<input type="text", name="msg", placeholder="할말 입력..." />
			<button type="submit">전송</button>
		</form>
		
		위의 폼을 제출하면(전송 버튼) 
		get 방식 / send 요청이 된다.(form 방식에 post, get 방식이 있다.)
		요청이 되면서 msg 파라미터 명으로 input 요소에 입력한 문자열이 같이 전송된다.
		같이 전송되는 정보를 파라미터라고 한다.
		get 방식 요청 파라미터는 주소창으로 확인 할 수도 있다.
		예들들어 input 요소에 hello를 입력하고 전송하면 주소창에 
		/send?msg=hello가 나타난다.
		
		해당 요청을 처리하는 서블릿에서는 HttpServletRequest의 메소드를 이용해서 요청 파라미터를 추출 할 수도 있다.
 */

@WebServlet("/send")
public class SendServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// msg라는 파라미터 명으로 전달되는 요청 파라미터 문자열 추출하기
		String msg = req.getParameter("msg");
		System.out.println("msg:"+msg);
		
		PrintWriter pw = resp.getWriter();	
			//요청 컨텐트 설정
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
				pw.println("메세지 잘 받았음");
				pw.println("</body>");
				pw.println("</html>");
				pw.close();
	}
		
	

}