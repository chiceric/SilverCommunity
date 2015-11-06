package silver.web.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import silver.web.dao.LoginDAO;
import silver.web.vo.LoginVO;

@Controller
public class LoginControl {
	
	LoginDAO dao;
	
	public void setDao(LoginDAO dao) {
		this.dao = dao;
	}
	
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

	@RequestMapping("reg")
	public ModelAndView reg(HttpServletRequest request){
		
		String s_name = request.getParameter("name");
		String s_pwd = request.getParameter("pwd");
		String s_gender = request.getParameter("gender");
		String s_birth = request.getParameter("birth");
		String s_nickname = request.getParameter("nickname");
		String[] s_phone = request.getParameterValues("phone");
		String s_tel = makeString(s_phone);
		
		String s_addr = request.getParameter("addr");
		boolean check;
		
		LoginVO vo = new LoginVO();
		
		vo.setS_tel(s_tel);
		vo.setS_name(s_name);
		vo.setS_addr(s_addr);
		vo.setS_birth(s_birth);
		vo.setS_gender(s_gender);
		vo.setS_pwd(s_pwd);
		vo.setS_nickname(s_nickname);
		
		check = dao.add(vo);
		
		ModelAndView mv = new ModelAndView();
		
		if(check==true)
			mv.setViewName("hi");
		else
			mv.setViewName("error");
		
		return mv;
		
	}
	
}
