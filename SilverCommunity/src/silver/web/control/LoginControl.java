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
		m.put("s_tel", vo.getTell());
		m.put("s_pwd", vo.getPwd());

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
		
		String[] s_phone = request.getParameterValues("tell");
		String s_tel = makeString(s_phone);
		
		System.out.println(s_tel);
		System.out.println(vo.getName());
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/index");
		
		return mv;
		
	}
	
}
