package silver.web.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import silver.web.dao.LoginDAO;
import silver.web.vo.LoginVO;

@Controller
public class LoginControl {
	
	@Autowired
	LoginDAO dao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	public String makeString(
			String[] ar){
		StringBuffer buf = new StringBuffer();
		
		for(int i=0;i<ar.length; i++){
			// StringBuffer에 배열의 요소 중
			// 하나를 추가한다.
			buf.append(ar[i]);
		}
		return buf.toString();
	}

	@RequestMapping(value="/login.sc", method=RequestMethod.POST)
	public ModelAndView login(LoginVO vo) throws Exception{
		Map<String,String> m = new HashMap<>();
		m.put("s_tel", vo.getS_tel());
		m.put("s_pwd", vo.getS_pwd());

		LoginVO bvo = dao.login(m);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", bvo);
	
	if(bvo != null){
			session.setAttribute("login_ok", bvo);
			mv.setViewName("/index");
		}
		else
			mv.setViewName("/error");
		return mv;
	}
	
	
	@RequestMapping(value="/reg.sc", method=RequestMethod.POST)
	public ModelAndView reg(LoginVO vo) throws Exception{
		
		String[] s_phone = request.getParameterValues("s_tel");
		String s_tel = makeString(s_phone);
		
		System.out.println(s_tel);
		
		/*String s_name = request.getParameter("name");
		String s_pwd = request.getParameter("pwd");
		String s_gender = request.getParameter("gender");
		String s_birth = request.getParameter("birth");
		String s_nickname = request.getParameter("nickname");
		
		
		String s_addr = request.getParameter("addr");
		boolean check;
		*/
		
		System.out.println(vo.getS_name());
		/*
		vo.setS_tel(s_tel);
		vo.setS_name(s_name);
		vo.setS_addr(s_addr);
		vo.setS_birth(s_birth);
		vo.setS_gender(s_gender);
		vo.setS_pwd(s_pwd);
		vo.setS_nickname(s_nickname);
		*/
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/index");
		
		return mv;
		
	}
	
}
