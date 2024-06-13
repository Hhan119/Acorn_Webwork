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
import test.dto.MemberDto;

@WebServlet("/member/list")
public class MemberListServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		List<MemberDto> members = new ArrayList<>();
		members.add(new MemberDto(1, "첼시", "잉글랜드"));
		members.add(new MemberDto(2, "맨시티", "잉글랜드"));
		members.add(new MemberDto(3, "첼시", "잉글랜드"));
		PrintWriter pw = resp.getWriter();
		
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
		pw.println("<h3>회원 목록입니다.</h3>");
		pw.println("<table>");
			pw.println("<tr>");
				pw.println("<th>번호</th>");
				pw.println("<th>이름</th>");
				pw.println("<th>주소</th>");
			pw.println("</tr>");
		// 반복문 돌면서 실제 회원 목록을 출력
		for(MemberDto tmp : members) {
			pw.println("<tr>");
			pw.println("<td>" + tmp.getNum() +"</td>");
			pw.println("<td>" + tmp.getName() +"</td>");
			pw.println("<td>" + tmp.getAddr() +"</td>");
			pw.println("</tr>");
		}
		
		pw.println("</table>");
			
	}
}
