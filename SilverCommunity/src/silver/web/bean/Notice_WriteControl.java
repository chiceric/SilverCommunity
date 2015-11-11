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
public class Notice_WriteControl {
/*
 * 앞서 생성된 빈객체들과 특정 빈 객체 내에
 * 있는 멤버변수와 이름이 같은 경우
 * 자동으로 참조하는 Autowire기능을
 * 어노테이션으로 지정이 가능하다.
 * 먼저
 * Controller-servlet.xml에서
 * <context:annotation-config />가
 * 설정되어 있어야 한다.
 */
	@Autowired
	NoticeBoardDAO ntdao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ServletContext servletContext;
	//위는 아래의 첨부파일이 저장될 폴더명을
	//절대경로로 만들기 위해 필요하다.
			
	@RequestMapping(value="/write.sc",method=RequestMethod.POST)
	public ModelAndView write(NoticeBoardVO vo)throws Exception{
		//현재 영역은 POST방식으로 write.inc로
		//요청될 때 수행되는 영역이다.
		//인자인 BbsVO가 자동으로 생성되어
		//파라미터들일 BbsVO에 있는 변수 명들과
		//동일한 곳에 찾아 저장된다.
		System.out.println(vo.getContent());
		vo.setIp(request.getRemoteAddr());
		//DB저장!
		ntdao.writeBbs(vo);
		
		//반환객체 생성
		ModelAndView mv = new ModelAndView();
		
		//Redirect로 list.inc를 호출
		mv.setViewName("redirect:/notice.sc");
		
		return mv;
	}
}










