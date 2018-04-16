package kr.co.bit.handler;

import javax.servlet.http.HttpServletRequest;

import kr.co.bit.dao.MemberDAO;
import kr.co.bit.vo.MemberVO;

public class Searchhandler implements Command {

	
	public String process(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.select(id);
		request.setAttribute("vo", vo);   
		String url = "./mvc/regist_member.jsp";
	    
		return url;
	
	}

}
