package test.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import test.memberdto.MemberDto;


@WebServlet("/member/list")
public class MemberListServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse reps) throws ServletException, IOException {
		MemberDto mem1 = new MemberDto(1, "첼시", "잉글랜드");
		MemberDto mem2 = new MemberDto(2, "맨유", "잉글랜드");
		MemberDto mem3 = new MemberDto(3, "뮌헨", "독일");
		List<MemberDto> list = new ArrayList<>();
		list.add(mem1);
		list.add(mem2);
		list.add(mem3);
		
		// webapp/member/list.jsp 페이지에서 회원목록을 table 요소를 이용해서 출력하도록 하세요
		req.setAttribute("list", list);
		
		RequestDispatcher rd = req.getRequestDispatcher("/member/list.jsp");
		rd.forward(req, reps);
	
	}

}
