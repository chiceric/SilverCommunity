package silver.web.bean;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import silver.web.dao.NoticeBoardDAO;
import silver.web.vo.NoticeBoardVO;


@Controller
public class Notice_EditControl {

	@Autowired
	NoticeBoardDAO dao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ServletContext servletContext;
	//위는 아래의 첨부파일이 저장될 폴더명을
	//절대경로로 만들기 위해 필요하다.
	
	//view.jsp에서[수정]버튼을 선택했을 때 현재 control이 수행될 떄는 get방식으로 요청되었을 때다 이때 수행하는 메서드
	@RequestMapping(value="/notice_edit.sc", method=RequestMethod.GET)
	public ModelAndView test(NoticeBoardVO vo)throws Exception{
		// 현재 메서드가 수행될때는 vo가 미리 생성되어 준비된다. 이때 vo의 멤버변수와 파라미터의 이름이 같은 값들을 자동적으로 vo에 저장됨!
		
		NoticeBoardVO bvo = dao.getBoard(vo.getB_idx());
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", bvo);
		mv.addObject("nowPage",vo.getNowPage());
		mv.setViewName("/notice_edit");
		return mv;
	}
	
	//폼 화면에서 수정을 요할 때 db작업을 수행해야 한다. 이땐 요청방식이 post일떄이며 수행하는 메서드는 다음과 같다
	@RequestMapping(value="/notice_edit.sc", method=RequestMethod.POST)
	public ModelAndView edit(NoticeBoardVO vo)throws Exception{
		
		vo.setIp(request.getRemoteAddr());
		dao.editBbs(vo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/notice_view.sc?seq="+vo.getB_idx()+"&nowPage="+vo.getNowPage());
		
		return mv;
	}
	
}
