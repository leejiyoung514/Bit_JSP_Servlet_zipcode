package kr.co.bit.handler;

import javax.servlet.http.HttpServletRequest;

import kr.co.bit.dao.MemberDAO;
import kr.co.bit.vo.MemberVO;

public interface Command {
    
	public String process(HttpServletRequest request); //추상메소드 만듬 

}
