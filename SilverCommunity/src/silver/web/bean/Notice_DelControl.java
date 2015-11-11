package silver.web.bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


import silver.web.dao.NoticeBoardDAO;
import silver.web.vo.NoticeBoardVO;

public class Notice_DelControl implements Controller  {

	NoticeBoardDAO dao;
	NoticeBoardVO vo;
	
	String b_idx;
		
	public void setDao(NoticeBoardDAO dao) {
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		b_idx=request.getParameter("b_idx");
		System.out.println(b_idx);
		vo = new NoticeBoardVO();
		vo.setB_idx(b_idx);
		ModelAndView mv = new ModelAndView();
		System.out.println(vo.getB_idx());
		dao.delBbs(vo);
		mv.setViewName("redirect:/notice.sc");
		
		return mv;
	}
}
