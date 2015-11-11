package silver.web.bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import silver.web.dao.NoticeBoardDAO;
import silver.web.vo.NoticeBoardVO;

public class Notice_ViewControl implements Controller {

	NoticeBoardDAO dao; // 이름이 같은 경우 자동대입되도록 한다.
	// 검색된 게시물이 저장될 곳
	NoticeBoardVO vo;
	
	//파라미터 값
	String seq, nowPage;
	

	public void setDao(NoticeBoardDAO dao) {
		this.dao = dao;
	}


	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 파라미터 값들 받기
		seq = request.getParameter("seq");
		nowPage = request.getParameter("nowPage");
		
		vo = dao.getBoard(seq);
		
		//jsp에서 표현가기 위해 vo를 ModelAndView에 저장하여 보낸다.
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.addObject("nowPage", nowPage);
		mv.addObject("seq", seq);
		mv.setViewName("/notice_view");
		
		return mv;
	}

}
